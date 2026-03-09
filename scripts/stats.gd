## This resource is used to define stats. This can be any kind of stats. In principle can this be used to store and save any kind of series of values that may change during gameplay and need to be saved. 
extends Resource
class_name Stats

@export var stats : Dictionary = { ## Here you can define what stats your unit should have. IMPORTANT! Value needs to be a float! The key is the name of the stat
	"Attack" : 6,
	"Defense" : 8,
	"Speed" : 5,
	"Luck" : 7
}

func save_stats(entity_name_or_ID : String): ## This function can be used to save the stats into a save file
	var save_file = FileAccess.open("user://" + entity_name_or_ID + "_stats.save", FileAccess.WRITE)
	save_file.store_var(stats)
	save_file.close();
	print("file saved to " + "user://" + entity_name_or_ID + "_stats.save")

func load_stats(entity_name_or_ID : String): ## this function can be used load the stats from a save file. 
	var save_file = FileAccess.open("user://" + entity_name_or_ID + "_stats.save", FileAccess.READ)
	if FileAccess.file_exists("user://" + entity_name_or_ID + "_stats.save"):
		var loaded_stats = save_file.get_var()
		save_file.close()
		print("file opened: " + "user://" + entity_name_or_ID + "_stats.save")
		stats = loaded_stats
		return loaded_stats
