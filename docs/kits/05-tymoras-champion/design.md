# Tymora's Champion

*Every halfling knows a lucky one: the cousin who fell off the roof onto a haycart, the uncle who won the farm at cards. Tymora's Champion is that cousin, grown up and sworn to the Lady. Arrows miss by a whisker, blades turn on a buckle, and when death finally comes calling, Tymora rolls the dice one more time.*

**Base class:** Fighter. **Race:** Halfling only.

A halfling-only fighter kit for Baldur's Gate 1 and 2 that relies on luck. Tymora's chosen hits often, rolls near-maximum damage, shrugs off spells and survives what should have killed it. Target tier: a solid all-rounder rated 8 overall, alongside the Barbarian and Cavalier, and the most flexible of the halfling fighters.

## At a glance

What Tymora's Champion gains at each level. Full details are under Advantages and High Level Abilities below.

| Level | Luck | Gains |
| --- | --- | --- |
| 1 | 1 | Luck 1 (Lucky Dodge +1 AC, Fortune's Path +1 movement, +1 saves)<br>Lady's Favour (1 use) |
| 6 | 1 | Lady's Favour (2 uses) |
| 10 | 2 | Luck 2 (+2 AC, +2 movement, saves stay +1)<br>Tymora Smiles |
| 11 | 2 | Lady's Favour (3 uses) |
| 16 | 2 | Lady's Favour (4 uses) |
| 20 | 3 | Luck 3 (+3 AC, +3 movement, +2 saves)<br>High Level Abilities open (Throne of Bhaal) |
| 21 | 3 | Lady's Favour (5 uses) |
| 26 | 3 | Lady's Favour (6 uses) |
| 30 | 4 | Luck 4 (+4 AC, +4 movement, saves stay +2) |
| 31 | 4 | Lady's Favour (7 uses) |
| 36 | 4 | Lady's Favour (8 uses) |
| 40 | 5 | Luck 5 (+5 AC, +5 movement, +3 saves) |

## Advantages

- **Lucky Dodge (AC bonus):** +1 AC for every point of the kit's own Luck (its level-based Luck plus Lady's Favour), so its AC rises as it levels and spikes while Lady's Favour is active. Luck from other sources, such as Tymora's Blessing or items, doesn't raise this or the other Luck-linked bonuses.
- **Fortune's Path (movement):** +1 movement for every point of the kit's own Luck it has.
- **Luck:** +1 at levels 1, 10, 20, 30 and 40.
- **Saves:** +1 to saves at kit Luck 1 and 2, +2 at kit Luck 3 and 4, +3 at kit Luck 5 (+3 is the maximum).
- **Lady's Favour:** 1 use per day at level 1, plus 1 more at levels 6, 11, 16 and every 5 levels after. Gives +3 Luck for 1 turn, and with it the matching Lucky Dodge, Fortune's Path and save bonuses.
- **Tymora Smiles (from level 10):** once per day, if reduced below 10% HP, the Champion is instantly healed to 50%.
- **Weapon skill:** grandmastery allowed in all its weapons.

## Disadvantages

- Can only wear armour up to splint mail.
- Can only use bucklers and small shields.
- Weapons limited to short swords, flails, maces, slings, short bows, clubs, daggers and darts.
- Must be a chaotic good halfling.

## High Level Abilities

Full HLA list. Tymora's Champion abilities are listed first, then the standard fighter HLAs it keeps. HLAs open at 3,000,000 XP, which is level 20 for a fighter.

| HLA | Effect | Picks |
| --- | --- | --- |
| Fortune's Turn | For 1 turn, +2 to all saves and enemies get -2 Luck | Up to 3 |
| Fortune's Wheel | For 1 turn, +4 to all saves and enemies get -3 Luck | Once |
| Tymora's Blessing | The whole party gains +3 Luck for 1 turn | Up to 3 |
| Lady's Grace | Passive: each pick gives +1 use of Lady's Favour per day | Up to 4 |
| Second Chance | Once per day, for 1 turn: any ally within 30 feet who drops below 10% HP is instantly healed to 50% (once per ally) | Once |
| Lucky Break | Passive: each pick gives +5% physical damage resistance, +5% resistance to magic damage and +5% magic resistance (up to 25% of each) | Up to 5 |
| Critical Strike | Tymora's moment: all attacks in the next round are critical hits, even against targets normally immune. No Power Attack prerequisite for this kit | Standard |
| Lucky Blow | Passive: the dice favour the Champion's strikes. Critical hits on 19–20 with one pick, and 18–20 with two | Up to 2 |
| Resist Magic | Sets magic resistance to 50% for 4 rounds | Standard |

**Dropped standard fighter HLAs:** Whirlwind Attack, Greater Whirlwind Attack, Deathblow, War Cry, Hardiness and Greater Deathblow (replaced by Tymora's Champion abilities above), and Power Attack and Smite (removed as off-theme).

Fortune's Turn and Fortune's Wheel do not stack; only the stronger applies.

## Balance notes

Luck shifts the Champion's attack and damage rolls in its favour. Most of its weapons use small damage dice, so a few points of Luck push nearly every damage roll to the maximum, making its damage very consistent. Grandmastery in eight weapons, three of them ranged, makes it the most flexible of the halfling fighters. Its HLAs are defensive and party-focused rather than adding burst damage. Overall it is a solid all-rounder rated 8, alongside the Barbarian and Cavalier. It is mid-table on Strength, high on Survivability and middling on Party value: Tymora's Blessing and Second Chance let the Champion protect the whole party, but only through the hardest fight of the day.

## Implementation notes

For anyone building this kit as a mod (for example with WeiDU):

- **Easy:** Luck and the Luck-linked AC, movement and save bonuses (granted alongside each Luck increase and with Lady's Favour, so no scripting is needed), Lady's Favour, Fortune's Turn and Fortune's Wheel, Tymora's Blessing, Lucky Break (standard resistance effects), Lucky Blow (a wider critical-hit range), Lady's Grace (extra uses of Lady's Favour).
- **Moderate:** Tymora Smiles and Second Chance. Healing at below 10% HP works like a Contingency, which can trigger on low hit points; Second Chance applies that trigger to each ally within 30 feet for 1 turn.
- **Hard:** Critical Strike ignoring critical-hit immunity (helmets block criticals in the engine, so this probably needs EEex).

### As built (not yet tested in game)

Code: `mod/halflingkits/kits/05-tymoras-champion/`. Where the build differs from the design, or relies on something to check in game:

- **Tymora Smiles** recovers one game day after it fires, not on rest. The heal is 45% of maximum HP, which lands at about half from below 10%.
- **Second Chance** and **Tymora's Blessing** reuse Bless's party-only area, so their radius is Bless's, not exactly 30 feet.
- **Fortune's Turn and Fortune's Wheel** take their enemy-only area from War Cry, found by name in the fighter HLA table. If War Cry isn't found, they still give the save bonus but skip the enemy Luck penalty.
- **Critical Strike** is the standard one without the Power Attack prerequisite. It does not get past critical-hit immunity (needs EEex).
- **Lucky Blow's** second pick needs game version 2.5 or later, where critical-hit bonuses stack.
- **Equipment limits:** weapons are checked by proficiency, so flails and morning stars come together. Armour is checked by base AC (plate and full plate are blocked; splint mail is allowed), and shields by their paperdoll size (bucklers and small shields only).

