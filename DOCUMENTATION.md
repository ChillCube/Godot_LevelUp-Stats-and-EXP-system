# Godot_LevelUp-Stats-and-EXP-system API Reference
Generated on: 2026-03-09

A system for level ups, stats and exp for godot

### 📦 Dependencies
| Addon | Repository |
| :--- | :--- |
| Godot_SmoothMovement | [Link](https://github.com/ChillCube/Godot_SmoothMovement) |

---

## Class: StatsAndHealth
**Inherits:** [`Stats`](#class-Stats)

This class extends from Stats, so any value or function in stats will also be accessible here. What's new here is that it also adds methods for handling HP.

### Signals
| Signal | Description |
| :--- | :--- |
| **took_damage** | emitted whenever the unit took damage |
| **gained_health** | emitted whenever the unit gains health |
| **fully_restored** | emitted whenever the health is restored to max |
| **died** | emitted when the units HP goes to 0 |

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
**Inherits:** [`Resource`](https://docs.godotengine.org/en/stable/classes/class_resource.html)

This resource is used to define stats. This can be any kind of stats. In principle can this be used to store and save any kind of series of values that may change during gameplay and need to be saved. 

### Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **stats** | `Dictionary` | `{ "Attack" : 6, "Defense" : 8, "Speed" : 5, "Luck" : 7 }` | Here you can define what stats your unit should have. IMPORTANT! Value needs to be a float! The key is the name of the stat |

### Methods
| Method | Returns | Description |
| :--- | :--- | :--- |
| **save_stats()** | `void` | This function can be used to save the stats into a save file |
| **load_stats()** | `void` | this function can be used load the stats from a save file. |

---

## Class: LevelUpResource
**Inherits:** [`StatsAndHealth`](#class-StatsAndHealth)

This class extends from the StatsAndHealth class and therefor has access to all the same functions and values. This class adds Level Up and EXP system, as well as methods for increasing stats per level up. This is recommended to be used for RPG's for playable characters. 

### Signals
| Signal | Description |
| :--- | :--- |
| **level_up** | emitted when the unit levels up |

---

