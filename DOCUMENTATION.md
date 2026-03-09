# Godot_LevelUp-Stats-and-EXP-system API Reference
Generated on: 2026-03-09

A system for level ups, stats and exp for godot

---

## Class: StatsAndHealth
This class extends from Stats, so any value or function in stats will also be accessible here. What's new here is that it also adds methods for handling HP.

### Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **max_hp** | `int` | `100` | Sets the maximum HP of the unit |
| **hp** | `Variant` | `100` | Sets the start HP of the unit |

### Methods
| Method | Returns | Description |
| :--- | :--- | :--- |
| **gain_health()** | `void` | method that can be used by other nodes to increase the health of this unit |
| **fully_restore()** | `void` | method that can be used by other scripts to fully restore this unit |
| **receive_damage()** | `void` | method that can be used by other scripts to apply damage to this unit |
| **save_hp()** | `void` | method that can be used to save the current HP to a save file |
| **load_hp()** | `float` | method that can be used to load the current HP from a save file |

---

## Class: Stats
This resource is used to define stats. This can be any kind of stats. In principle can this be used to store and save any kind of series of values that may change during gameplay and need to be saved. 

### Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **stats** | `Dictionary` | `{extends Resourceclass_name Stats@export var stats : Dictionary = { "Attack" : 6, "Defense" : 8, "Speed" : 5, "Luck" : 7}` | Here you can define what stats your unit should have. IMPORTANT! Value needs to be a float! The key is the name of the stat |

### Methods
| Method | Returns | Description |
| :--- | :--- | :--- |
| **save_stats()** | `void` | This function can be used to save the stats into a save file |
| **load_stats()** | `void` | this function can be used load the stats from a save file. |

---

## Class: LevelUpResource
This class extends from the StatsAndHealth class and therefor has access to all the same functions and values. This class adds Level Up and EXP system, as well as methods for increasing stats per level up. This is recommended to be used for RPG's for playable characters. 

### Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **level** | `int` | `1` | sets the level that the unit starts out with |
| **exp** | `float` | `0` | sets the amount of exp that the unit starts out with |
| **max_exp** | `float` | `100` | sets the initial maximum amount of EXP that the unit needs for the next level up |
| **max_exp_growth** | `float` | `0.1` | How much the max_exp will grow by each level up (for example: 0.1 = 10% increase, 2 = 200% increase) |
| **increase_stats_randomly** | `bool` | `false` | if enabled, this will randomly choose stats to increase |
| **max_stat_growth** | `int` | `5` | sets the maximum for how much a stats can grow |
| **min_stat_growth** | `int` | `0` | sets the minimum for how much stats can grow |
| **increase_stats_by_stats** | `bool` | `false` | Increase stats based on how large the current stat is (the higher the stat, the more likely it is to increase) |
| **stat_points_allocated_per_level_up** | `int` | `5` | Decides how many stat points in total should be used when levelling up for upgrading the stats. |

---
