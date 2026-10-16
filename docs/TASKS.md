# Halfling Kits for Baldur's Gate: Tasks

The working record for the halfling-only kit set for Baldur's Gate: Enhanced Edition and Baldur's Gate II: Enhanced Edition: what's done, what's left, the constraints the work follows, and the decisions and assumptions behind it. Read this first, then the Overview, then the kit you are working on. Add to the log when something is finished, and keep the To do list current.

## Status

- **Design:** complete for eleven kits, with several review and balance passes. A twelfth, the Ghostwise Rogue (fighter/thief with barbarian qualities and wilderness bonuses; no Open Locks or Pick Pockets), is a placeholder still to be designed (`docs/kits/12-ghostwise-rogue/design.md`).
- **Implementation:** started. `mod/halflingkits/` holds the WeiDU mod: the shared library (`lib/hk_lib.tpa`), the Fleet Foot Fighter (`kits/01-fleet-foot-fighter/`), the Hearthsinger (`kits/04-hearthsinger/`), Tymora's Champion (`kits/05-tymoras-champion/`), the Nettle (`kits/09-nettle/`), the Surefoot Fighter (`kits/03-surefoot-fighter/`), the Slinger (`kits/06-slinger/`), the Briarguard (`kits/11-briarguard/`), the True Heart (`kits/02-true-heart/`) and the Unbeguiled (`kits/08-unbeguiled/`). All nine pass WeiDU's syntax check (`utils/check-mod.sh`) but have not been installed in a game yet. Each kit's design file ends with an "As built" section listing where the code differs from the design.
- **Playtesting:** none yet. Every rating is an estimate.
- **Source of truth:** these Markdown files, from the point they are committed. They were exported from the design document on 15 October 2026. Make further changes here, not in the original document, so git history stays the record.

## To do

In priority order. Each kit's "As built" notes list its own smaller check-in-game items.

1. **Remaining kits** (The Bold is fully coded):
   - **Magpie** completes Hearth and Home, once open question 8 (Magpie's Knack) is decided.
   - **Greenhand** (The Wild Wood). It needs open questions 1 and 2 decided; its rabbit familiar reuses the Briarguard's simple-summon approach.
2. **Design the Ghostwise Rogue** (placeholder: `docs/kits/12-ghostwise-rogue/design.md`). Check the multiclass kit workaround first. Then add it to the Overview, Party Design and Strength Rankings.
3. **EEex components** (optional, Windows only; see the EEex plan under Dependencies). Current TODOs:
   - Fleet Foot: Halfling Evasion's half damage on a failed save.
   - Fleet Foot and Tymora's Champion: Critical Strike ignoring critical-hit immunity.
   - Hearthsinger: casting a spell ending the song; Kin's Shield's immunity to critical hits.
   - Nettle: Spoiling Backstab draining priest spells.
   - Unbeguiled: Stand Behind Me's redirect; ignoring Mirror Image and Blur; Spoiling Strike's non-magical hits; Critical Strike ignoring critical-hit immunity.
   - Surefoot: Unmoving Stride's immunity to Time Stop.
   - Slinger: Eagle Eye ignoring Mirror Image and Blur; Called Shot affecting only the next hit; Critical Strike ignoring critical-hit immunity.
4. **First install on a game** (Windows): install every component, read WeiDU's log for warnings, check the "Game rules the design relies on" assumptions and each kit's "As built" check-in-game items, and fill in the README's Tested column.
5. **Playtest** the three playtest parties through BG1, SoA and ToB against the playtest checklist, starting with The Bold. Record changes as commits with the reason in the message.
6. **Resolve the remaining open questions.**
7. **Commit** the baseline (Tim makes the commits).

## Done

Newest first.

**16 October 2026**
- Coded the **Slinger**: sling-only scaling and Rapid Sling, the Called Shot ladder, its HLAs, and crafted bullets made by a rest script from gems the Slinger carries. Added `HK_FIND_ITEM_BY_NAME` to the library.
- Coded the **Surefoot Fighter**: strides, Stand Fast with its three stance upgrades, Hold the Line and all its HLAs. Hold the Line's physical resistance goes to allies only, which keeps the Surefoot at the 90% cap. Unmoving Stride's Time Stop immunity is an EEex TODO.
- Reworked the **playtest parties** to keep the Nettle and the Unbeguiled apart. The Wild Wood is unchanged; the other two are now **The Bold** (True Heart, Fleet Foot, Tymora's Champion, Nettle), which is fully coded and goes first, and **Hearth and Home** (Surefoot, Unbeguiled, Hearthsinger, Magpie). Mage-Breakers is retired.
- Built the **Briarguard's badger** as a simple scripted summon (open question 9 decided): five forms by level, bonus hit points to the Briarguard while it lives, and Badger's Fury reaching it. The script pass is done.
- Built the **True Heart's fall**: a global-script check per party slot removes its passives and innate abilities at reputation 8 or lower, and restores them by level when reputation recovers.
- Coded the **Unbeguiled**, completing the **Mage-Breakers** playtest party. Stand Behind Me's base version is shared resistance (open question 7 decided).
- Added a **Playtest parties** section to Party Design: each party's positions, how it plays, what it tests and its difficulty.
- Renamed the Handover to Tasks, with this log, the To do list and Constraints.
- Coded the **True Heart** (everything except the reputation fall, left for the script pass).
- Coded the **Briarguard** (everything except Find Familiar and the badger's part of Badger's Fury). Natural armour is decided by item name, with an override table (`hkbgarm.2da`).
- Set up the three **playtest parties** (Hearth and Home, The Wild Wood, Mage-Breakers), one rogue each.
- Added the **Ghostwise Rogue** placeholder as the twelfth kit (fighter/thief, barbarian qualities, wilderness bonuses, no Open Locks or Pick Pockets).
- Added a **Tested** column to the README's kit table.
- Set **alignments** for every kit (good, with neutral flex for four; the True Heart lawful good only) and coded them for the built kits.
- Added one themed **ability requirement** to every kit (two for the Magpie), coded for the built kits. Ability and alignment lines now stop the install if a name doesn't match the game's table.
- Changed the **Nettle's backstab** to a fixed x2 that never scales.
- Coded the **Nettle** (Spoiling Backstab, Spoiling Traps, all HLAs; priest spell drain is an EEex TODO).
- Coded the **Hearthsinger** (songs, Stop Singing as the fallback for "casting ends the song", all HLAs including the Hearth Guardians creature).
- Fixed a WeiDU bug affecting every kit: string arguments to functions weren't being expanded, which shortened files and broke name lookups.

**15 October 2026**
- Decided the **EEex plan**: base kits work everywhere; EEex features become optional Windows-only components.
- Renamed the Fleet Foot's Evasion to **Halfling Evasion** (standard Evasion until EEex).
- Coded the **Fleet Foot Fighter** (Rapid Strike, Razor's Edge, all HLAs).
- Added the top-level **README**.
- Downloaded **WeiDU** v251 into `tools/` (git-ignored) with a stub game folder, and added `utils/check-mod.sh`.
- Set up the **WeiDU mod** (`mod/halflingkits/`) and its **shared library**, and coded **Tymora's Champion**.
- Exported the design document to Markdown under `docs/`.

## Constraints

- **Every platform.** The base kits must stay fully playable on Windows, macOS and Linux: no base component may depend on EEex or anything Windows-only. EEex features are separate optional components (see the EEex plan under Dependencies).
- **No game install yet.** Development happens on a Mac without the game. Code is syntax-checked with `utils/check-mod.sh` and test-built against stub game data in `tools/stubgame/`, but nothing has been tried in game. Anything that reads real game files (tables, vanilla spells and creatures found by name, item restrictions) is unverified until the first install.
- **Never guess game data.** Read it from the game at install: proficiency, ability and alignment columns by name; vanilla spells, creatures and HLAs by their English name; areas from existing spells. Stop the install, or warn and leave the ability out, rather than fall back to a guess.
- **Naming.** Resources use the prefix `HK` plus a two-letter kit code (`HKTC`, `HKFF`, `HKHS`, `HKNT`, `HKBG`, `HKTH`). Keep resrefs to 7 characters where the engine appends a letter (trap spells get "F").
- **WeiDU gotchas.** Pass variables to functions as `STR_VAR x = EVAL ~%var%~` (without EVAL the function gets the literal text). In the tp2, `ALWAYS` comes before `LANGUAGE`.
- **Docs are the source of truth.** The design files lead; each coded kit's "As built" section records where the code differs, and why.
- **Git.** `tools/` is git-ignored. Tim makes the commits.

## Files

All design files live under `docs/`, with one folder per kit.

| File | What it holds |
| --- | --- |
| `docs/TASKS.md` | This file: status, to do, done log, constraints, conventions, assumptions, open questions |
| `docs/01 - Overview.md` | Kit summaries, power, solo and theme ratings, playtest checklist |
| `docs/02 - Party Design.md` | What each kit brings to a party; six, four, three and two-person line-ups; Snow White and the Five and Three Shorties (elf Sorcerer plus five or three halflings); swaps |
| `docs/03 - Strength Rankings.md` | Damage, survivability and party-value rankings against the standard classes and kits |
| `docs/kits/<nn>-<kit>/design.md` | One folder per kit (`01-fleet-foot-fighter` to `12-ghostwise-rogue`); `design.md` holds the spec, at-a-glance level table, HLAs, balance notes, implementation notes and, once coded, an "As built" section |

Repository layout:

```
docs/                  shared design files (overview, party design, rankings, tasks)
docs/kits/<nn>-<kit>/  design.md; per-kit playtest notes and save-game checklists later
mod/halflingkits/      WeiDU mod: halflingkits.tp2, lib/ (shared library), kits/<nn>-<kit>/, tra/
utils/check-mod.sh     syntax-checks the mod
tools/                 local only, git-ignored: WeiDU and a stub game folder
```

## The kits

Ratings are out of 10, scored against the standard classes on the same scale (Sorcerer 10, Fighter/Cleric 9, Berserker 8.5, Kensai 8, Skald 6).

| Kit | Base class | Role | Damage | Survivability | Party value | Overall |
| --- | --- | --- | --- | --- | --- | --- |
| Fleet Foot Fighter | Fighter | Melee damage, mobility | 10 | 7 | 3 | 9 |
| True Heart | Fighter | Front-line healer and protector | 5.5 | 9 | 9 | 8.5 |
| Surefoot Fighter | Fighter | Tank | 4 | 10 | 7.5 | 8 |
| Hearthsinger | Cleric | Party support (songs) | 3.5 | 8 | 9.5 | 8 |
| Tymora's Champion | Fighter | Lucky all-rounder | 6.5 | 8 | 7.5 | 8 |
| Slinger | Fighter | Ranged damage | 9 | 4.5 | 7 | 8 |
| Unbeguiled | Fighter | Mage-hunter, party shield against magic | 6.5 | 7.5 | 9 | 8 |
| Greenhand | Cleric | Nature priest and summoner | 7 | 6.5 | 8.5 | 8 |
| Briarguard | Fighter | Nature warrior, elemental tank | 7.5 | 8.5 | 6.5 | 8 |
| Magpie | Thief | Scrolls, wands and loot | 7 | 6 | 8 | 7.5 |
| Nettle | Thief | Anti-caster opener | 4.5 | 6.5 | 8 | 7.5 |
| Ghostwise Rogue | Fighter/Thief | Wild rogue (to be designed) | | | | |

Design intent: strong but not overpowered. Every kit sits between 7.5 and 9 overall, with the Fleet Foot the only 9.

## Design conventions

- **Halfling only.** Every kit is restricted to halflings. Most share **Small and Nimble** (+2 AC from level 1).
- **One ability requirement.** On top of its base class minimum, each kit needs one themed ability score (the Magpie needs two), shown on the **Requires:** line at the top of its design file.
- **Alignment.** Halflings lean good. Every kit allows only good alignments, except where the theme or the kit's god calls for neutral flex (Surefoot, Magpie, Greenhand, Briarguard). No kit allows evil. Each kit's Disadvantages list gives its alignments; the True Heart is lawful good only, Tymora's Champion chaotic good only.
- **One idea per kit.** Each kit is built around a single theme. Standard HLAs are kept only where they fit; the Theme rating tracks how many generic "leftovers" remain.
- **At-a-glance table.** Every kit file opens with a level table, one row per level that gains something and one line per gain. Keep it in sync with the detailed sections when editing.
- **Ratings live in three places:** the kit file's "Rough ratings" line, the Overview tables, and the Strength Rankings tables. Change all three together, and re-rank the Strength Rankings rows when a score moves.
- **HLA lists** show each kit's own HLAs first, then the standard HLAs it keeps, then a "Dropped" line.
- **Writing style:** British spelling, plain language, no jargon in player-facing text.

## Game rules the design relies on

These are assumptions. Verify each in game before building on it.

- **Target games:** BG:EE and BG2:EE (Siege of Dragonspear and Throne of Bhaal included).
- **HLAs open at 3,000,000 XP:** about level 20 for fighters, 24 for thieves and 22 for clerics. The cleric figure has been questioned (21 vs 22); check it.
- **HLA screen size:** about 24 unique HLAs fit. More picks than a character can take is fine. Fighters need about 21 picks, thieves 17, clerics 20.
- **Grandmastery's extra attack applies to missile weapons** (slings, bows) in the Enhanced Editions. Confirmed in game by Tim.
- **Summon limit:** 5. Creatures created as allies (Greenhand's Summon Horde rabbits) and familiars don't count.
- **Mirror Image absorbs a hit before any on-hit effect.** Abilities that must ignore it probably need EEex.
- **Critical Strike ignoring critical-hit immunity** (helmets) probably needs EEex.
- **Per-kit spell exclusion** works in the Enhanced Editions. Adding druid-only spells to a cleric does not: it needs cleric-usable copies or EEex.
- **Find Familiar** is limited to the main character and picks the familiar by alignment. The Greenhand's rabbit and the Briarguard's badger need a custom innate copy.
- **The standard Free Action effect** can block speed bonuses (Boots of Speed, Haste's movement). The Briarguard's Wild Stride is specified as separate immunities to avoid this.
- **Death Spell** kills summoned creatures. The Greenhand's natural summons and the Briarguard's plant guardians are specified as immune.
- **Armour material isn't tracked by the game.** The Briarguard's natural-armour rule needs each armour item flagged for the kit.

## Dependencies

- **IWDification (Gibberlings Three):** provides the spells marked (IWD) in the Greenhand's spell list. Without it the Greenhand simply doesn't get them. https://www.gibberlings3.net/mods/spells/iwdification/
- **EEex:** needed only for the items marked Hard below. EEex runs on Windows only; the target play platform is Windows, so EEex features will be built.

**EEex plan (decided 15 October 2026):** every kit's base component works without EEex, using the nearest plain-engine fallback for each Hard item (marked TODO in the code and in the kit's "As built" notes). Each EEex feature then becomes its own optional install component that requires EEex and its base kit, and replaces only that fallback. Players without EEex lose nothing that works. The base kits must stay fully playable on every platform (Windows, macOS and Linux), so no base component may depend on EEex or on anything Windows-only. EEex components need testing on a Windows install.

## Implementation difficulty

Each kit file has Easy, Moderate and Hard notes. The Hard items:

| Kit | Hard items |
| --- | --- |
| True Heart | Reputation-based fall condition (paladin falling is hard-coded). Built as a global-script check |
| Surefoot | Unmoving Stride's Time Stop immunity (probably EEex) |
| Tymora's Champion | Critical Strike ignoring critical-hit immunity (probably EEex) |
| Slinger | Eagle Eye ignoring Mirror Image; Critical Strike ignoring critical-hit immunity (both probably EEex) |
| Unbeguiled | Stand Behind Me redirecting spells; ignoring Mirror Image and Blur; Spoiling Strike's hits counting as non-magical; Critical Strike ignoring critical-hit immunity (all probably EEex). Coded with fallbacks: see the TODOs in its design file |
| Greenhand | Druid spells on a cleric (cleric-usable copies or EEex) |
| Fleet Foot | Halfling Evasion's half damage on a failed save (probably EEex). Coded for now as the standard Evasion: see the TODO in its design file |
| Hearthsinger | Casting a spell ending the song; Kin's Shield's immunity to critical hits (both probably EEex). Coded with fallbacks: see the TODOs in its design file |
| Nettle | Spoiling Backstab draining priest spells (the engine only drains wizard spells; probably EEex). Coded with a wizard-only fallback: see the TODO in its design file |
| Magpie, Briarguard | None |

**Build order:** now set by the playtest parties: see the To do list.

**Largest single pieces of work:**
- The Magpie's rest script (Brandobaris's Gift and Forger's Hand).
- The Slinger's custom bullets.
- The two familiars (five creature files each).
- The Briarguard's armour flagging.
- The Greenhand's spell-list surgery.

## Open questions

Decisions that were deferred or need checking in game:

1. **Greenhand:** confirm which added spells are truly druid-only in the Enhanced Editions (Barkskin turned out not to be), and the exact spell level of each druid and IWD addition.
2. **Greenhand:** cleric HLA level (21 or 22).
3. **Briarguard:** list the armour items that count as natural, especially for BG2 (Ankheg Plate, the dragon-scale armours, hide and leather armours). Early AC may be thin without studded leather. Now coded as a name-based rule (leather, hide, Ankheg, dragon; not studded) with an override table, `hkbgarm.2da`; the item list still needs checking in game.
4. **Briarguard:** check whether losing Strength of the Oak's +2 Constitution when it ends can drop a badly hurt character to dangerously low HP. If so, swap the Constitution for +1 AC or a flat HP bonus.
5. **Briarguard:** shields are allowed as bucklers and small shields, even though most are metal. This is a deliberate exception to the natural theme.
6. **Surefoot and Briarguard:** both gain elemental resistance. Consider trimming the Surefoot's so the Briarguard owns that niche.
7. **Unbeguiled:** ~~whether Stand Behind Me can be built at all without EEex.~~ Decided 16 October 2026: the base version is shared resistance (+25% magic resistance for the Unbeguiled and allies nearby for 1 round); the redirect becomes an EEex component.
8. **Magpie:** Magpie's Knack lets a thief kit use mage, bard and cleric scrolls, wands and items, unlocked by level. The engine's per-kit item rule (opcode 319) can only take items away from a kit, not add a kit to an item's users, and it can't check level. It probably needs item usability changes plus a level check by script, or EEex. Decide how to build it, or reshape it, before coding the Magpie.
9. **Familiars (Briarguard, Greenhand):** ~~how much of the familiar design to keep.~~ Decided 16 October 2026: a simple scripted summon. Once a day, the form for the master's level, lasting a day, with the bonus hit points while it lives. No following between areas, no pack and no Constitution loss; it can grow into the full familiar later.

## Playtest checklist

The main things to watch, with the first trim to try if each feels too strong.

| Kit | Watch for | First trim |
| --- | --- | --- |
| True Heart | Charm and sleep immunity at level 10 making SoA's mind flayer and vampire fights too easy | Move charm and sleep immunity to level 15 |
| Fleet Foot | Rapid Strike with Time Pause and Time Slow killing bosses before they act | Limit Time Slow to 1 pick |
| Tymora's Champion | Second Chance making the hardest fight of the day feel safe | Cut its radius to 20 feet or its heal to 30% |
| Slinger | Improved Haste at level 36 (about 10 sling attacks per round), and Eagle Eye stun-locking single targets | Limit Eagle Eye to 2 picks or 5 rounds |
| Slinger | Breaching Shot and Dispelling Shot making enemy mages too easy | Cut each Breaching batch from 5 bullets to 3, or use a rarer gem |
| Hearthsinger | Homeward Hymn's party-wide extra attack, and Kin's Shield covering every hard fight | Remove the Hymn's extra attack; limit Kin's Shield to 1 pick |
| Surefoot | Near-invulnerability late in ToB | Lower Stand Fast's maximum from 40% to 30% |
| Surefoot and Hearthsinger | Feeling too weak early in BG1 | Surefoot +1 to hit at level 1; Hearthsinger an extra Hearthsong use at level 1 |
| Magpie | Scrolls and wands winning BG1 fights despite the fumble chance | Raise the starting fumble chance to 35% |
| Unbeguiled | Stand Behind Me soaking redirected spells; Spoiling Strike's Breach landing often enough | Cap Stand Behind Me at 90% magic resistance |
| Nettle | Assassination's once-per-target limiter; Unravelling Trap's area Remove Magic | Shrink Unravelling Trap's area, or make it single-target |
| Greenhand | Druid spells on a cleric with no XP wall; Green Thumb's summon bonuses | Move Creeping Doom to an HLA |
| Briarguard | Iron Skins plus 80% elemental resistance making ToB dragons and area spells too easy | Lower Heartwood Hide's maximum to 60% |

### Playtest parties

Every kit is playtested once, in one of three themed parties of four, each with one of the three rogue kits. The Nettle and the Unbeguiled are kept in different parties. The full write-up (positions, how each plays, what it tests, difficulty) is under Playtest parties in Party Design.

| Party | Kits | Rogue |
| --- | --- | --- |
| **The Bold** | True Heart, Fleet Foot Fighter, Tymora's Champion | Nettle |
| **Hearth and Home** | Surefoot Fighter, Unbeguiled, Hearthsinger | Magpie |
| **The Wild Wood** | Briarguard, Slinger, Greenhand | Ghostwise Rogue |

- **The Bold:** the adventurers. Fast and aggressive: the Nettle opens on the caster, the Fleet Foot runs it down, the True Heart and Tymora's luck keep everyone standing. No priest.
- **Hearth and Home:** the stubborn homebodies. The Surefoot and Unbeguiled are nearly impossible to shift or charm, the Hearthsinger sings and heals, the Magpie scouts and supplies scrolls and wands.
- **The Wild Wood:** a nature party. The Briarguard and the Greenhand's summons hold the front, the Slinger shoots from behind them, and the Ghostwise Rogue's wilderness bonuses fit the theme. No Open Locks.

No party has an arcane caster: every kit is a fighter, cleric or thief, so the Magpie's scrolls and wands are the only arcane magic in any of them.

**Readiness** (coded kits, out of 4):

| Party | Coded | Still needed |
| --- | --- | --- |
| The Bold | 4 (True Heart, Fleet Foot, Tymora's Champion, Nettle) | Nothing |
| Hearth and Home | 3 (Surefoot, Unbeguiled, Hearthsinger) | Magpie (open question 8, Magpie's Knack) |
| The Wild Wood | 2 (Briarguard, Slinger) | Greenhand (open questions 1 and 2); the Ghostwise Rogue is still to be designed and may need the multiclass kit workaround |

The Bold is fully coded, so it is the first playtest party.

## Recent design decisions

Kept here so they don't get undone by accident:

- **Greenhand:**
  - Gets grandmastery in slings, but only proficiency in clubs and quarterstaffs.
  - Can put 2 pips in Sword and Shield Style.
  - Negative Plane Protection is restored; Charm Person or Mammal is cut along with the other mind control.
  - Its 1st-level spell was renamed from Goodberry to Sheela's Berries to avoid a clash.
  - The rabbit familiar does divination, not damage.
- **Briarguard:**
  - Natural weapons only: club, quarterstaff, sling and short bow.
  - Elemental resistance stops at 80%, with no immunity.
  - Only one innate summon (Wake the Hedge), so the Greenhand stays the summoner.
  - Strength of the Oak is capped at 3 uses a day.
  - Badger's Fury is capped at 2 picks, and the badger familiar rages too.
  - Its weakness to magic is intentional.
- **Unbeguiled and Nettle:** Lore 0 at all levels.
- **Ratings:** the Fleet Foot is the only 9, and the True Heart sits at 8.5.
