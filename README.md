# Halfling Kits for Baldur's Gate

Eleven halfling-only character kits for Baldur's Gate: Enhanced Edition and Baldur's Gate II: Enhanced Edition (including Siege of Dragonspear and Throne of Bhaal). Each kit is built around one idea and tuned to be strong but not overpowered.

**Status:** design complete for all eleven kits. Three are coded as a WeiDU mod: the Fleet Foot Fighter, the Hearthsinger and Tymora's Champion. None has been installed or playtested yet.

## Start here

- [Handover](docs/HANDOVER.md): status, design conventions, the game rules the design relies on, open questions and next steps. Read this first.
- [Overview](docs/01%20-%20Overview.md): kit summaries, power, solo and theme ratings, and the playtest checklist.
- [Party Design](docs/02%20-%20Party%20Design.md): what each kit brings to a party, and suggested line-ups.
- [Strength Rankings](docs/03%20-%20Strength%20Rankings.md): damage, survivability and party value compared with the standard classes and kits.

## The kits

| Kit | Base class | Role | Coded |
| --- | --- | --- | --- |
| [Fleet Foot Fighter](docs/kits/01-fleet-foot-fighter/design.md) | Fighter | Melee damage, mobility | Yes |
| [True Heart](docs/kits/02-true-heart/design.md) | Fighter | Front-line healer and protector | |
| [Surefoot Fighter](docs/kits/03-surefoot-fighter/design.md) | Fighter | Tank | |
| [Hearthsinger](docs/kits/04-hearthsinger/design.md) | Cleric | Party support (songs) | Yes |
| [Tymora's Champion](docs/kits/05-tymoras-champion/design.md) | Fighter | Lucky all-rounder | Yes |
| [Slinger](docs/kits/06-slinger/design.md) | Fighter | Ranged damage | |
| [Magpie](docs/kits/07-magpie/design.md) | Thief | Scrolls, wands and loot | |
| [Unbeguiled](docs/kits/08-unbeguiled/design.md) | Fighter | Mage-hunter | |
| [Nettle](docs/kits/09-nettle/design.md) | Thief | Anti-caster opener | |
| [Greenhand](docs/kits/10-greenhand/design.md) | Cleric | Nature priest and summoner | |
| [Briarguard](docs/kits/11-briarguard/design.md) | Fighter | Nature warrior, elemental tank | |

Each coded kit's design file ends with an "As built" section listing where the code differs from the design.

## Repository layout

```
docs/                    design documents (one folder per kit under docs/kits/)
mod/halflingkits/        the WeiDU mod
  halflingkits.tp2       installer: one component per kit
  lib/hk_lib.tpa         shared library used by every kit
  kits/<nn>-<kit>/       each kit's code and tables
  tra/english/           all player-facing text
utils/check-mod.sh       syntax-checks every WeiDU file in the mod
tools/                   local only, ignored by git: WeiDU and a stub game folder
```

## Checking the mod

The mod can be syntax-checked without a game install. Put the WeiDU binary at `tools/weidu/weidu` (from the [WeiDU releases](https://github.com/WeiDUorg/weidu/releases)) and an empty stub game folder at `tools/stubgame/`, then run:

```
utils/check-mod.sh
```

The stub game folder needs two files, `chitin.key` and `lang/en_US/dialog.tlk`, each an empty file of its type.

A full install needs a real game. Copy `mod/halflingkits/` into the game folder and run WeiDU on `halflingkits/halflingkits.tp2`.

## Dependencies

- [WeiDU](https://github.com/WeiDUorg/weidu) to install the mod.
- [IWDification](https://www.gibberlings3.net/mods/spells/iwdification/) for some of the Greenhand's spells (not yet coded).
- [EEex](https://github.com/Bubb13/EEex) only for the abilities marked Hard in the [Handover](docs/HANDOVER.md#implementation-difficulty).
