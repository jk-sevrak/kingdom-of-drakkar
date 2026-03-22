# Glossary & Quick Reference

## Common Abbreviations

| Term | Meaning |
|------|---------|
| AB | Autobalm (Barbarian's auto-heal at 30% HP) |
| ABS | Absorption (Mentalist discipline) |
| Baskie | Basilisk shield (trade basilisk scales in VT) |
| BD | Black Dragon |
| BNR | Black Ninja Robe (found on M-3/M-4, +2 agility) |
| Bresh | Breshard (monster and his shield) |
| CC | CritCure (resurrection discipline) |
| Chip/Chipper | Lair boss Chipuda / Chipper Staff |
| Cob | Cobrahn (expert area) |
| Crit | Character in game (monster, player, or NPC) |
| Dex | Death Express (kill and revive someone at a new location to move them) |
| DP | Death Pile / Drop Point |
| DT | Dark Tower (in Frore) |
| Eat | Lose stats, XP, or skill from a lair creature death |
| EC | EarthCrush |
| EN | Evil Nork |
| EP | Energy Points (mana for psionic classes) |
| ES | EnergyShield |
| FF | FindFriendly (Mentalist summon discipline) |
| FG | Fire Giant |
| FP | Full Plate (armor) |
| FS | FireStorm |
| GD | Gold Dragon |
| HP | Health Points / Hit Points |
| IH | Instant Health (healing potion) |
| KM | King Minotaur (KM-1 through KM-5 dungeons in SE Frore) |
| KQ | King's Quest (needed for P-gear house key) |
| MA | Martial Artist |
| ML | MultiLair |
| MR | Minor Restore (stripping prevention, Mentalist discipline) |
| MS | Multistriking (Paladin Focus ability) |
| MT | Mass Teleport |
| Muzi | Mini Uzi amulet (+2 EP regen) |
| N-# | Nork dungeon level (e.g., N-7 = Nork level 7) |
| NPC | Non-Player Character |
| Overmax | Bring HP past class maximum using Mino Blood, Dion Bottle, or Cornbread |
| P-weapon | Power weapon (capable of killing Snowbeast) |
| PK | Player Kill (forbidden!) |
| Prot | Protection (ProtFire, ProtIce, etc.) |
| PWD | PowerWord Death |
| PWH | PowerWord Heal |
| PWS | PowerWord Stun |
| RB | Ratburrow |
| RD | Red Dragon |
| SD | Silver Dragon |
| SF | Steel Flower (Inn/Pub in Nork Town) |
| SoB | Snowbeast |
| SNR | Silver Ninja Robe (200 pts fire/ice prot, from M-4) |
| Stick | Melee fighter class (Fighter, Barbarian, Paladin) |
| Twig | Succor teleport item |
| Uzi | Uzi amulet (+5 EP regen) |
| VT | Volcano Town |
| Zap | Potion for restoring EP to max |
| Zerk | Barbarian berserk ability |
| Zoo | Group of monsters clustered in one location |

## Weapon Skill Level Names

| Level | Title | | Level | Title |
|-------|-------|-|-------|-------|
| 0 | Unskilled | | 16 | High Master |
| 1 | Clumsy | | 17 | Grand Master |
| 2 | Familiar | | 18 | Warrior |
| 3 | Student | | 19 | High Warrior |
| 4 | Practiced | | 20 | Specialist |
| 5 | Dedicated | | 21 | Beholder of the Art |
| 6 | Skilled | | 22 | Initiate of Stance |
| 7 | Experienced | | 23 | Student of Stance |
| 8 | Proficient | | 24 | Master of Stance |
| 9 | Practitioner | | 25 | Initiate of Form |
| 10 | Expert | | 26 | Student of Form |
| 11 | Prodigy | | 27 | Master of Form |
| 12 | Brilliant | | 28 | Initiate of Style |
| 13 | Incredible | | 29 | Student of Style |
| 14 | Astounding | | 30 | Master of Style |
| 15 | Master | | | |

## Weapon Skill Categories

| Category | Range | Includes |
|----------|-------|----------|
| Axe | Close | Battle axes, great axes |
| Bow | Long | Longbows, shortbows |
| Crossbow | Long | Crossbows |
| Dagger | Close + Long | Daggers (magical ones return when thrown) |
| Longsword | Close | Longswords, broadswords |
| Mace | Close | Maces, flails, hammers |
| Martial Arts | Close | Gauntlets, bare hands |
| Polearm | Extended (1 hex) | Halberds (need empty left hand for max damage, can't be belted) |
| Shortsword | Close | Short swords |
| Staff | Close | Staves, spears |
| Thrown | Long | Grenades, throwing daggers |
| Two-handed | Close | Greatswords, bisentos |

**Range types**: Close = same hex, Extended = 1 hex away, Long = anywhere on screen.

All weapons may be thrown; only magical daggers return.

## Race Stat Caps

| Race | Can Roll 19 In | Max Limitation |
|------|---------------|----------------|
| City Dweller | (none, but 18 in all) | Can roll 18 in all stats. Best overall luck. |
| Forest Dweller | Charisma (19) | Luck max 17 |
| Mountain Dweller | Strength (19) | Charisma max 17 |
| Outcast | Constitution (19), Agility (19) | Charisma max 16 |
| Underground Dweller | (high AGI/CON) | Hard to get high Luck |
| Woodlands Dweller | Intelligence (19) | Strength max 17 |

## Equipment Slots

From the MoY guild character worksheet and gear request form:

- Armor Slot 1 (body)
- Armor Slot 2 (cloak 1)
- Armor Slot 3 (cloak 2)
- Weapon (right hand)
- Shield (left hand)
- Sash
- Helm
- Gauntlets
- Boots
- Ring 1
- Ring 2
- Amulet
- Bracers (2 slots)
- Belt (5 item slots)
- Sack/Pouch (coins and small items)

## Key Formulas

### Hit Doctor Cost
```
For each HP from (current+1) to max:
  cost_per_hit = cost_per_hit + counter + counter + 25
  total += cost_per_hit

Total adjusted = total * (1 - ((Charisma - 18) * 0.05))
```
Each point of Charisma above 18 reduces total cost by 5%.

### Damage Formulas (approximate)
- **Enmiss**: ~8 damage per skill level
- **Fireball/Icestorm**: ~12 damage per skill level (30'x30' area)
- **Firebreath/Icebreath**: ~18 damage per skill level (90'x90' area)
- **Assault**: ~12 damage per skill level
- **PowerWord Death**: 30 damage per skill level to ALL visible hostiles
- **ELance**: Up to ~1400 damage
- **Backstab (skill 17)**: 10x normal weapon damage
