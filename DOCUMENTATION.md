# Godot_LevelUp-Stats-and-EXP-system API Reference
Generated: 2026-03-09

A system for level ups, stats and exp for godot

## Class: StatsAndHealth

This class extends from Stats, so any value or function in stats will also be accessible here. What's new here is that it also adds methods for handling HP.

### ⚙️ Inspector Variables
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **max_hp** | `int` | `100` | Sets the maximum HP of the unit |
| **hp** | `Variant` | `100` | Sets the start HP of the unit |

---

## Class: Stats

This resource is used to define stats. This can be any kind of stats. In principle can this be used to store and save any kind of series of values that may change during gameplay and need to be saved. 

### ⚙️ Inspector Variables
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **stats** | `Dictionary` | `{ ` | Here you can define what stats your unit should have. IMPORTANT! Value needs to be a float! The key is the name of the stat |

### 🛠️ Methods
| Method | Arguments | Returns | Description |
| :--- | :--- | :--- | :--- |
| **save_stats()** | <code><font color="#56b6c2">entity_name_or_ID : String</font></code> | `void` |  This function can be used to save the stats into a save file |
| **load_stats()** | <code><font color="#56b6c2">entity_name_or_ID : String</font></code> | `void` |  this function can be used load the stats from a save file.  |

---

## Class: LevelUpResource

This class extends from the StatsAndHealth class and therefor has access to all the same functions and values. This class adds Level Up and EXP system, as well as methods for increasing stats per level up. This is recommended to be used for RPG's for playable characters. 

### ⚙️ Inspector Variables
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **level** | `int` | `1` | sets the level that the unit starts out with |
| **exp** | `float` | `0` | sets the amount of exp that the unit starts out with  |
| **max_exp** | `float` | `100` | sets the initial maximum amount of EXP that the unit needs for the next level up |
| **max_exp_growth** | `float` | `0.1 ` | How much the max_exp will grow by each level up (for example: 0.1 = 10% increase, 2 = 200% increase) |
| **--- STAT INCREASE ---** | | | |
| **increase_stats_randomly** | `bool` | `false ` | if enabled, this will randomly choose stats to increase |
| **max_stat_growth** | `int` | `5` | sets the maximum for how much a stats can grow |
| **min_stat_growth** | `int` | `0` | sets the minimum for how much stats can grow |
| **increase_stats_by_stats** | `bool` | `false` | Increase stats based on how large the current stat is (the higher the stat, the more likely it is to increase) |
| **stat_points_allocated_per_level_up** | `int` | `5` | Decides how many stat points in total should be used when levelling up for upgrading the stats.  |

### 🔔 Signals
| Signal | Arguments | Description |
| :--- | :--- | :--- |
| **level_up** | - |  emitted when the unit levels up |

### 🛠️ Methods
| Method | Arguments | Returns | Description |
| :--- | :--- | :--- | :--- |
| **()** | - | `void` |  This class extends from the StatsAndHealth class and therefor has access to all the same functions and values. This class adds Level Up and EXP system, as well as methods for increasing stats per level up. This is recommended to be used for RPG's for playable characters.  |
| **()** | - | `void` |  You can use this function to let nodes increase the exp of the unit. |
| **()** | - | `void` |  this function is used to save the current level onto a save file |
| **()** | - | `void` |  this function is used to load the current level from the save file into the game |
| **()** | - | `void` |  this function is used to save the current amount of exp onto a save file |
| **()** | - | `void` |  this function is used to load the exp from the save file.  |
| **()** | - | `void` |  this function is used to save the current max exp onto a save file |
| **()** | - | `void` |  this function is used to load the current max exp from a save file. In most cases it is recommended to use "load_level_health_and_stats()" instead.  |

---

