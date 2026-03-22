# Combat & Game Mechanics

## Combat System

Kingdom of Drakkar uses a **real-time combat system**. Players and creatures act in rounds, with actions happening simultaneously rather than turn-by-turn.

### Attack Mechanics
- Characters attack creatures (and potentially other players) in real time
- Damage is based on weapon stats, character attributes, skill level, and enchantment bonuses
- "Sticks" (melee fighter classes) engage in close combat on the same hex
- Psionic classes (Mentalists, Healers) can target any visible creature from range
- Fighters gain extra attacks per round as they level up
- Healers gain extra weapon attacks every 8th experience level (2 attacks at 8, 3 at 16, etc.)
- Mentalists get only **1 physical attack per round** regardless of level
- Barbarians in Berserk mode get "fury rounds" (extra attacks) but lose control

### Hit Points & Damage
- Hit points (HP) represent health
- When HP reaches 0, the character dies
- Damage is dealt based on weapon/spell damage, modified by armor and protection spells
- **Armor Class** (AC) - higher defensive value means less damage taken
- Rings provide offensive/defensive combat "adds" (e.g., a 3/3 ring gives +3 offense and +3 defense)

## Death & Penalties

### Normal Death
- Experience loss
- Possible item loss
- Character respawns at a designated restoration point
- With Constitution below 17 (or 16), there's a chance of permanent HP loss on normal death

### Lair Creature Death
- **Lair creatures can permanently take hit points** - this applies even outside the lair itself
- Lair-type creatures that roam (like big crossbow guys and auto strippers in Evil Nork) also take HP
- Being "eaten" by certain creatures (e.g., VT Griffin) could cause loss of ALL purchased hit points
- Skill loss is possible on death to powerful creatures
- This is why lairs are dangerous: "What is the point in making a skill level, only to be eaten by a lair crit and dropped down TWO skill levels?"

### Resurrection
- Healers can cast **CritCure** to resurrect dead players (costs 30 EP, drains half the healer's HP)
- CritCure twigs can also resurrect (found on floors, especially in Timmy at level 20)
- Dead characters must be picked up (their corpse carried) before resurrection

## Party System

### Formation
- Players form parties for group content
- Party has a **creator/leader** who initiates the group
- If the party creator "nodes" (disconnects), ownership should transfer to another member (Brad planned this fix)
- The person with the "kill shot" determines loot access to the corpse

### Party Mechanics
- Experience is shared among party members
- **Skill gain in parties is significantly better** than solo - Brad described it as "not penalizing people for partying, by giving them the skill of every kill"
- Creature regeneration could be an issue in large parties ("Many in a party tends to kill the regen and we end up standing around")
- Party-based dynamic regen was a "long term goal" for the developer

### Party Roles
- **Sticks** (Fighters, Barbarians, Paladins, MAs): Front-line melee damage
- **Healers**: Keep party alive, resurrect dead, cure ailments, kill ranged attackers with Assault
- **Mentalists**: Protection spells, Infravision, kill ranged attackers, Transmute loot, Enchant/Imbue

## Skill System

### Skill vs. Experience Level
- Characters have both an **experience level** (from XP) and a **skill level** (from kills/actions)
- Expressed as "Level/Skill" (e.g., "18/15" = level 18, skill 15)
- **Skill is far more important than level** - it determines spell power, combat effectiveness, and access to new abilities
- Area-effect spells gain experience quickly but skill slowly, leading to imbalanced characters

### Skill Gain
- Gained from killing creatures (single-target kills give more skill than AoE kills)
- Healers also gain skill from healing and curing party members
- **Paying skill** (training) matters but "kind of flattens out" near the gain cap
- Brad's target: 1% per hour minimum at higher skill levels, 3% at skill 15
- Solo players could get 3% at skill 20; partied players much higher
- Skill training costs escalate dramatically (450 million at skill 23+, 900 million at 29+)

### Skill Cap
- As of 2002, there was a skill cap around level 30
- Brad had a "35% chance" of removing the cap in the Grimoire expansion
- "There is a lot of coding to be done for skills above 30"

## Hit Doctor System

The Hit Doctor allows characters to purchase additional HP up to their class maximum.

### How It Works
- Available at **level 13** (south of Volcano Town in Nork)
- Costs gold based on current HP, desired HP, and **Charisma**
- Formula from the MoY Hit Doc Calculator:
  ```
  For each HP from current to max:
    cost_per_hit += (counter + counter + 25)
  Total cost = sum of all costs * (1 - ((Charisma - 18) * 0.05))
  ```
- Higher Charisma reduces total cost by 5% per point above 18
- Borrowing Charisma rings (+3 CHA adds) can save millions of gold

### Class HP Maximums (Hit Doc)
| Class | Max HP |
|-------|--------|
| Mentalist | 350 |
| Healer | 380 |
| Thief | 380 |
| Martial Artist | 480 |
| Fighter | 480 |
| Paladin | 480 |
| Barbarian | 580 |

### Maxxing Strategy
1. Reach level 13
2. **Stop resting** (don't level up)
3. Coin enough gold for Hit Doc (15-30+ million)
4. Buy HP to class max
5. Then rest - you'll gain HP beyond the Hit Doc cap through normal leveling

## Energy Points (EP)

- EP fuels spell casting for psionic classes
- Maximum EP in Nork: 250
- EP regenerates over time, enhanced by equipment:
  - **Muzi** amulet: +2 EP per round
  - **Uzi** amulet: +5 EP per round
  - **Lori Staff**: +6 EP regen
  - Combined Uzi + Lori = 11 EP per round regen
- **EP Pots**: Purchasable at the Funhouse for 500,000 gold each. Give 1-5 EP (average ~3).
- Maxxing EP without resting costs ~40 million gold (80+ pots)

## Aging

Certain powerful spells cause character aging:
- **Earthcrush** (Mentalist, skill 16) - "Serious aging spell"
- **Haste** (Mentalist, skill 20) - "Very stressful"
- **ELance** (Mentalist, skill 24) - Ages caster
- **Youth Pots** can reverse aging - stockpile before using aging spells
- The Rat Burrow strength fountain was rumored to cause faster aging (unconfirmed)
- Age categories: "Very Young" was mentioned as the starting state

## Player Killing (PK)

### Rules
- Players should **NEVER kill other players** - they should ask a sysop and report the attacker
- Players can always **DEFEND themselves** if attacked
- **Thief stealing** is an intentional hostile act - victim can legally kill the thief
- **Accidental spell deaths** (area spells hitting hidden thieves) are treated as accidents, not grounds for retaliation
- Sysops handle PK incidents

### Atoning
- Characters who commit PK offenses may need to be "atoned"
- Players asked for easier atonement options for lower-level characters
- Brad found the suggestion "interesting"

## Items & Equipment

### Appraising
- Items can be appraised at vendors to learn their value
- Try to buy hits "with no money down" to learn the cost per hit point
- "Look at" items to see descriptions - glowing items are usually HP or EP enchanted

### Item Properties
- **Combat adds** (offensive/defensive bonuses, e.g., 3/3 ring)
- **Stat bonuses** (e.g., Slith Staff +4 Wisdom, Chipper Staff +2 skill)
- **EP regen** (Muzi +2, Uzi +5, Lori +6)
- **Skill bonuses** (e.g., Lori Staff +6 skill)
- **Protection** (ProtFire, ProtIce, ProtAssault, etc.)
- **Special abilities** (CritCure on Ratburrow sash, Ratburrow teleport)
- **Tying** - Some items "tie" to the character (Curvy LS, etc.)

### Scroll Vendors
- Sell magical scrolls containing spells or abilities
- Located in Nork

### The `ARG` Command
Brad revealed the syntax: `ARG <repeat>` - likely a repeat/macro command for combat.
