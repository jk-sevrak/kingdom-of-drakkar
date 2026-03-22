#!/usr/bin/env bash
# Kingdom of Drakkar — Internet Archive CDX Sweep & Download Script
#
# Run this locally where archive.org is not network-blocked.
# Prerequisites: curl, jq, ia CLI (pip install internetarchive)
#
# Usage: ./archive-crawl.sh [--download]
#   Without --download: CDX sweep only (generates URL lists)
#   With --download: Also downloads archived pages into sites/

set -euo pipefail

OUTDIR="$(cd "$(dirname "$0")" && pwd)"
SITES_DIR="$OUTDIR/sites"
CDX_DIR="$OUTDIR/cdx-results"
DOWNLOAD="${1:-}"

mkdir -p "$CDX_DIR" "$SITES_DIR"

CDX_BASE="https://web.archive.org/cdx/search/cdx"
DELAY=2  # seconds between CDX requests to be polite

log() { echo "[$(date '+%H:%M:%S')] $*"; }

# ── CDX API Sweep ──────────────────────────────────────────────────────────

cdx_sweep() {
    local label="$1"
    local url="$2"
    local outfile="$CDX_DIR/${label}.txt"
    log "CDX sweep: $label ($url)"
    curl -sf --max-time 120 "${CDX_BASE}?url=${url}&output=text&fl=timestamp,original,mimetype,statuscode&collapse=urlkey&limit=10000" \
        -o "$outfile" 2>/dev/null || { log "  WARN: CDX query failed for $label (skipping)"; return 0; }
    local count
    count=$(wc -l < "$outfile")
    log "  Found $count unique URLs for $label"
    sleep "$DELAY"
}

log "=== Phase 1: CDX API Sweep ==="
log ""
log "--- Priority 1: Core Sites ---"

cdx_sweep "mpgn.com"              "mpgn.com/*"
# mpgn.com/games/* returned 0 results in prior runs — skipped
cdx_sweep "drakkarzone.com"       "drakkarzone.com/*"
cdx_sweep "kingdomofdrakkar.com"  "kingdomofdrakkar.com/*"
# imagic.com/* is too broad (domain reused by unrelated companies); scope to Drakkar-era paths
cdx_sweep "imagic.com-drakkar"   "imagic.com/drakkar*"
cdx_sweep "imagic.com-mpgnet"    "imagic.com/mpg*"

log ""
log "--- Priority 2: GeoCities Fan Sites ---"

cdx_sweep "geocities-drakkarice"    "geocities.com/drakkarice*"
cdx_sweep "geocities-telletran"     "geocities.com/telletran*"
cdx_sweep "geocities-purgury"       "geocities.com/purgury*"
cdx_sweep "geocities-roarguild"     "geocities.com/roarguild*"
cdx_sweep "geocities-roarguilditems" "geocities.com/roarguilditems*"
cdx_sweep "geocities-drakdude"      "geocities.com/drakdude*"
cdx_sweep "geocities-TimesSquare5993" "geocities.com/TimesSquare/5993*"

log ""
log "--- Priority 2: Angelfire Fan Sites ---"

cdx_sweep "angelfire-ok4-Drakkar"    "angelfire.com/ok4/Drakkar/*"
cdx_sweep "angelfire-rpg-ZOE"        "angelfire.com/rpg/ZOE/*"
cdx_sweep "angelfire-rpg2-fhmguild"  "angelfire.com/rpg2/fhmguild/*"
cdx_sweep "angelfire-dragon2-drakvision" "angelfire.com/dragon2/drakvision/*"
cdx_sweep "angelfire-dragon3-warguild"   "angelfire.com/dragon3/warguild/*"
cdx_sweep "angelfire-on4-firewolfsden"   "angelfire.com/on4/firewolfsden/*"

log ""
log "--- Priority 2: Tripod Fan Sites ---"

cdx_sweep "tripod-edge_guild"       "edge_guild.tripod.com/*"
cdx_sweep "tripod-stormwinds"       "members.tripod.com/stormwinds_archive/*"

log ""
log "--- Priority 2: Other Fan Sites ---"

cdx_sweep "northernwebs-drakkar"    "northernwebs.com/drakkar*"
cdx_sweep "drakkarmoy.com"          "drakkarmoy.com/*"
cdx_sweep "tantheus-drakkar"        "tantheus.com/Drakkar/*"

log ""
log "--- Priority 3: Misc Sites ---"

cdx_sweep "8m-king-drak"            "king-drak.8m.com/*"
cdx_sweep "8m-iceguild"             "iceguild.8m.com/*"
cdx_sweep "iwarp-webmagic-drakkar"  "webmagic.iwarp.com/drakkar/*"
cdx_sweep "bravepages-relm"         "relm.bravepages.com/*"
cdx_sweep "guildhappy-relm"         "relm.guildhappy.com/*"
cdx_sweep "earthlink-zgwortz"       "home.earthlink.net/~zgwortz/*"
# freewebs-drakkar returned 0 results — skipped
cdx_sweep "bigstargraphics-drak"    "bigstargraphics.com/drak/*"
cdx_sweep "ashguild"                "ashguild.com/*"
cdx_sweep "jinx-ashguild"           "jinx.ashguild.com/*"
cdx_sweep "klrz-guild"              "klrz-guild.com/*"
cdx_sweep "shadow-wood"             "shadow-wood.net/*"
cdx_sweep "lords-of-entropy"        "lords-of-entropy.de/*"
cdx_sweep "gamechatter-sas"         "gamechatter.com/sas*"

log ""
log "--- Priority 2b: GeoCities Mirrors ---"

cdx_sweep "geocities-billythebarb"  "geocities.com/billythebarb*"

log ""
log "--- Priority 4: Press & Third-Party ---"

cdx_sweep "thinkquest-C002414"      "library.thinkquest.org/C002414/*"
cdx_sweep "csoon-mpgn"             "csoon.com/issue30/p_mpgn*"
cdx_sweep "csoon-e3"               "csoon.com/issue27/e3*"
# gamespot articles returned 0 results — skipped

log ""
log "=== Phase 1 Complete ==="
log "CDX results saved to: $CDX_DIR/"
log ""

# Count total URLs found
total=0
for f in "$CDX_DIR"/*.txt; do
    [ -f "$f" ] && total=$((total + $(wc -l < "$f")))
done
log "Total archived URLs found: $total"

# ── Download Phase ─────────────────────────────────────────────────────────

if [ "$DOWNLOAD" = "--download" ]; then
    log ""
    log "=== Phase 2: Downloading Archived Pages ==="
    log ""

    # URL-level filter: returns 0 (pass) or 1 (skip) for a given label + URL
    should_skip_url() {
        local label="$1"
        local url="$2"

        case "$label" in
            kingdomofdrakkar.com)
                # Skip forum pages (5000+ session-heavy phpBB/draknews pages)
                [[ "$url" == */forums/* ]] && return 0
                [[ "$url" == */draknews/* ]] && return 0
                # Skip dynamic session params, WP feeds, well-known crawls, JS probes
                [[ "$url" == *"?DZW="* ]] && return 0
                [[ "$url" == *"?sccss="* ]] && return 0
                [[ "$url" == *"?window."* ]] && return 0
                [[ "$url" == *".well-known/"* ]] && return 0
                [[ "$url" == */feed/* ]] && return 0
                [[ "$url" == *"/wp-json/"* ]] && return 0
                [[ "$url" == *"/xmlrpc.php"* ]] && return 0
                [[ "$url" == *"%"* ]] && return 0
                [[ "$url" == *"..."* ]] && return 0
                [[ "$url" == *"+snowsrc+"* ]] && return 0
                [[ "$url" == *"(para"* ]] && return 0
                # Skip WP pagination/taxonomy listing pages (not unique content)
                [[ "$url" == */page/[0-9]* ]] && return 0
                [[ "$url" == */author/* ]] && return 0
                [[ "$url" == */category/* ]] && return 0
                [[ "$url" == */tag/* ]] && return 0
                [[ "$url" == *"?et_blog"* ]] && return 0
                # Skip WP date archives (YYYY/MM/)
                [[ "$url" =~ /20[0-9][0-9]/[0-9] ]] && return 0
                ;;
            drakkarzone.com)
                # Skip entire phpBB forums (4000+ session-heavy pages)
                [[ "$url" == */forums/* ]] && return 0
                # Skip session-dependent DZW/SID params
                [[ "$url" == *"?DZW="* ]] && return 0
                [[ "$url" == *"&SID="* ]] && return 0
                # Skip goto.php redirects (spam/external links)
                [[ "$url" == */goto.php* ]] && return 0
                [[ "$url" == *".well-known/"* ]] && return 0
                [[ "$url" == *"/ads.txt"* ]] && return 0
                ;;
            mpgn.com)
                # Skip ad-redirect reward pages
                [[ "$url" == *"draklive_reward"* ]] && return 0
                # Skip percent-encoded junk URLs
                [[ "$url" == *"%22"* ]] && return 0
                [[ "$url" == *"%20onmousedown"* ]] && return 0
                [[ "$url" == *"%20\\"* ]] && return 0
                ;;
            lords-of-entropy*)
                # Skip external link redirects and session-only diffs
                [[ "$url" == *"link=go"* ]] && return 0
                ;;
            imagic.com*)
                # Only keep early pages (the domain was reused later by unrelated companies)
                # Skip .well-known, ads.txt, and modern crawl artifacts
                [[ "$url" == *".well-known/"* ]] && return 0
                [[ "$url" == *"/ads.txt"* ]] && return 0
                [[ "$url" == *"/app-ads.txt"* ]] && return 0
                [[ "$url" == *"/atom.xml"* ]] && return 0
                [[ "$url" == *"/css/"* ]] && return 0
                [[ "$url" == *"reqp="* ]] && return 0
                ;;
        esac
        return 1  # don't skip
    }

    download_wayback() {
        local label="$1"
        local cdxfile="$CDX_DIR/${label}.txt"
        [ ! -f "$cdxfile" ] && return
        local total
        total=$(wc -l < "$cdxfile")
        [ "$total" -eq 0 ] && return

        local sitedir="$SITES_DIR/$label"
        mkdir -p "$sitedir"

        local downloaded=0
        local skipped=0

        while read -r timestamp original mimetype statuscode; do
            # Only download HTML pages with 200 status
            if [[ "$statuscode" == "200" ]] && [[ "$mimetype" == "text/html" ]]; then
                # Apply URL-level filters
                if should_skip_url "$label" "$original"; then
                    skipped=$((skipped + 1))
                    continue
                fi

                local safe_name
                safe_name=$(echo "$original" | sed 's|https\?://||; s|[^a-zA-Z0-9._/-]|_|g; s|/$|/index.html|')
                local outpath="$sitedir/$safe_name"
                mkdir -p "$(dirname "$outpath")"
                if [ ! -f "$outpath" ]; then
                    curl -sf "https://web.archive.org/web/${timestamp}id_/${original}" \
                        -o "$outpath" 2>/dev/null || true
                    downloaded=$((downloaded + 1))
                    sleep 1
                fi
            fi
        done < "$cdxfile"
        log "  $label: downloaded $downloaded, skipped $skipped (of $total CDX entries)"
    }

    # Sites to skip entirely (not Drakkar-related or empty)
    SKIP_LABELS="ien.com gamehub.com freewebs-drakkar gamespot-imagic-launch gamespot-mpgnet-free mpgn.com-games"

    for cdxfile in "$CDX_DIR"/*.txt; do
        label=$(basename "$cdxfile" .txt)

        # Skip non-Drakkar sites
        if echo "$SKIP_LABELS" | grep -qw "$label"; then
            log "Skipping $label (not Drakkar-relevant)"
            continue
        fi

        download_wayback "$label"
    done

    log ""
    log "=== Download Complete ==="
    log "Sites saved to: $SITES_DIR/"
fi

# ── Archive.org Collection Search ──────────────────────────────────────────

log ""
log "=== Phase 3: Archive.org General Collection Searches ==="

if command -v ia &>/dev/null; then
    for query in '"Kingdom of Drakkar"' '"mpg-net" drakkar' '"Brad Lineberger" drakkar' 'drakkarzone' '"Kingdom of Drakkar" mediatype:software'; do
        log "Searching: $query"
        ia search "$query" --field=identifier --field=title --field=mediatype --field=date \
            2>/dev/null | tee -a "$CDX_DIR/ia-search-results.json" || true
        sleep "$DELAY"
    done

    # Archive-It ThinkQuest collection
    log "Searching Archive-It ThinkQuest collection..."
    curl -sf "https://archive.org/advancedsearch.php?q=collection%3Athinkquest+drakkar&fl%5B%5D=identifier&fl%5B%5D=title&rows=50&output=json" \
        -o "$CDX_DIR/thinkquest-search.json" 2>/dev/null || log "  ThinkQuest search failed"
else
    log "ia CLI not installed — skipping collection searches"
    log "Install with: pip install internetarchive && ia configure"
fi

log ""
log "=== All Phases Complete ==="
log "Run 'cat $CDX_DIR/*.txt | wc -l' to see total archived URLs"
log "Review CDX results, then re-run with --download to fetch pages"
