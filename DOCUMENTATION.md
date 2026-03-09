# Godot_LevelUp-Stats-and-EXP-system API Reference
Generated: 2026-03-09

A system for level ups, stats and exp for godot

## Class: StatsAndHealth

This class extends from Stats, so any value or function in stats will also be accessible here. What's new here is that it also adds methods for handling HP.

### 🔔 Signals
| Signal | Arguments | Description |
| :--- | :--- | :--- |
| **took_damage ## emitted whenever the unit took damage** | - | This class extends from Stats, so any value or function in stats will also be accessible here. What's new here is that it also adds methods for handling HP. |

---

## Class: Stats

This resource is used to define stats. This can be any kind of stats. In principle can this be used to store and save any kind of series of values that may change during gameplay and need to be saved. 

### ⚙️ Inspector Variables
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **stats** | `` | `{ ## Here you can define what stats your unit should have. IMPORTANT! Value needs to be a float! The key is the name of the stat` | This resource is used to define stats. This can be any kind of stats. In principle can this be used to store and save any kind of series of values that may change during gameplay and need to be saved.  |

---

## Class: LevelUpResource

This class extends from the StatsAndHealth class and therefor has access to all the same functions and values. This class adds Level Up and EXP system, as well as methods for increasing stats per level up. This is recommended to be used for RPG's for playable characters. 

---

