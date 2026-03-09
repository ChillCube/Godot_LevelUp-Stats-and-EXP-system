## This class extends from the StatsAndHealth class and therefor has access to all the same functions and values. This class adds Level Up and EXP system, as well as methods for increasing stats per level up. This is recommended to be used for RPG's for playable characters. 
extends StatsAndHealth
class_name LevelUpResource

@export var level = 1; ## sets the level that the unit starts out with
@export var exp = 0; ## sets the amount of exp that the unit starts out with 
@export var max_exp = 100; ## sets the initial maximum amount of EXP that the unit needs for the next level up

@export var max_exp_growth : float = 0.1 ## How much the max_exp will grow by each level up (for example: 0.1 = 10% increase, 2 = 200% increase)

@export_group("stat increase")
@export_subgroup("random stat growth")
@export var increase_stats_randomly : bool = false ## if enabled, this will randomly choose stats to increase
@export var max_stat_growth : int = 5; ## sets the maximum for how much a stats can grow
@export var min_stat_growth : int = 0; ## sets the minimum for how much stats can grow
@export_subgroup("base stat growth")
@export var increase_stats_by_stats : bool = false; ## Increase stats based on how large the current stat is (the higher the stat, the more likely it is to increase)
@export var stat_points_allocated_per_level_up = 5; ## Decides how many stat points in total should be used when levelling up for upgrading the stats. 

signal level_up ## emitted when the unit levels up

## You can use this function to let nodes increase the exp of the unit.
func gain_exp(amount) -> void:
	exp += amount;
	while exp > max_exp:
		exp -= max_exp;
		level += 1;
		max_exp *= max_exp_growth
		
		if increase_stats_randomly:
			for stat in stats:
				stat += randi_range(min_stat_growth, max_stat_growth);
		
		if increase_stats_by_stats:
			for i in stat_points_allocated_per_level_up:
				var total_stats = 0;
				for stat in stats:
					total_stats += stat;
				var stat_to_increase = randi_range(0, total_stats)
				var stat_marker = 0;
				for stat in stats:
					stat_marker += stat
					if stat_marker > stat:
						stat += 1;
						break;
		
		emit_signal("level_up", level, stats)

#region SAVE

## this function is used to save the current level onto a save file
func save_level(entity_name_or_ID : String):
	var save_file = FileAccess.open("user://" + entity_name_or_ID + "_level.save", FileAccess.WRITE)
	save_file.store_var(level)
	save_file.close();
	print("file saved to " + "user://" + entity_name_or_ID + "_level_and_exp.save")

## this function is used to load the current level from the save file into the game
func load_level(entity_name_or_ID : String) -> int:
	var save_file = FileAccess.open("user://" + entity_name_or_ID + "_level.save", FileAccess.READ)
	if FileAccess.file_exists("user://" + entity_name_or_ID + "_level.save"):
		var loaded_level = save_file.get_var()
		save_file.close()
		print("file opened: " + "user://" + entity_name_or_ID + "_level.save")
		level = loaded_level
		return loaded_level
	return 1

## this function is used to save the current amount of exp onto a save file
func save_exp(entity_name_or_ID : String):
	var save_file = FileAccess.open("user://" + entity_name_or_ID + "_exp.save", FileAccess.WRITE)
	save_file.store_var(exp)
	save_file.close();
	print("file saved to " + "user://" + entity_name_or_ID + "_exp.save")

## this function is used to load the exp from the save file. 
func load_exp(entity_name_or_ID : String) -> int:
	var save_file = FileAccess.open("user://" + entity_name_or_ID + "_exp.save", FileAccess.READ)
	if FileAccess.file_exists("user://" + entity_name_or_ID + "_exp.save"):
		var loaded_exp = save_file.get_var()
		save_file.close()
		print("file opened: " + "user://" + entity_name_or_ID + "_exp.save")
		exp = loaded_exp
		return loaded_exp
	return 0

## this function is used to save the current max exp onto a save file
func save_max_exp(entity_name_or_ID : String):
	var save_file = FileAccess.open("user://" + entity_name_or_ID + "_max_exp.save", FileAccess.WRITE)
	save_file.store_var(max_exp)
	save_file.close();
	print("file saved to " + "user://" + entity_name_or_ID + "_max_exp.save")

## this function is used to load the current max exp from a save file. In most cases it is recommended to use "load_level_health_and_stats()" instead. 
func load_max_exp(entity_name_or_ID : String) -> int:
	var save_file = FileAccess.open("user://" + entity_name_or_ID + "_max_exp.save", FileAccess.READ)
	if FileAccess.file_exists("user://" + entity_name_or_ID + "_max_exp.save"):
		var loaded_max_exp = save_file.get_var()
		save_file.close()
		print("file opened: " + "user://" + entity_name_or_ID + "_max_exp.save")
		max_exp = loaded_max_exp
		return loaded_max_exp
	return max_exp

## used to load level, health and stats as well as exp and max exp all at the same time from their respective save files.
func load_level_health_and_stats(entity_name_or_ID : String) -> void:
	load_max_exp(entity_name_or_ID)
	load_hp(entity_name_or_ID)
	load_level(entity_name_or_ID)
	load_exp(entity_name_or_ID)
	load_stats(entity_name_or_ID)
#endregion
