## This class extends from Stats, so any value or function in stats will also be accessible here. What's new here is that it also adds methods for handling HP.
extends Stats
class_name StatsAndHealth

signal took_damage ## emitted whenever the unit took damage
signal gained_health ## emitted whenever the unit gains health
signal fully_restored ## emitted whenever the health is restored to max
signal died ## emitted when the units HP goes to 0

@export var max_hp : int = 100: ## Sets the maximum HP of the unit
	set(new_value):
		stats["max_hp"] = new_value;
		max_hp = new_value;
@export var hp = 100; ## Sets the start HP of the unit

func gain_health(amount : float): ## method that can be used by other nodes to increase the health of this unit
	emit_signal("gained_health", amount)
	hp += amount;
	if hp > max_hp:
		emit_signal("fully_restored")
		hp =  stats["max_hp"];

func fully_restore(): ## method that can be used by other scripts to fully restore this unit
	emit_signal("fully_restored")
	hp = stats["max_hp"];

func receive_damage(amount : float): ## method that can be used by other scripts to apply damage to this unit
	emit_signal("took_damage", amount)
	hp -= amount
	if hp <= 0:
		emit_signal("died")

func save_hp(entity_name_or_ID : String): ## method that can be used to save the current HP to a save file
	var save_file = FileAccess.open("user://" + entity_name_or_ID + "_hp.save", FileAccess.WRITE)
	save_file.store_var(hp)
	save_file.close();
	print("file saved to " + "user://" + entity_name_or_ID + "_hp.save")

func load_hp(entity_name_or_ID : String) -> float: ## method that can be used to load the current HP from a save file
	var save_file = FileAccess.open("user://" + entity_name_or_ID + "_hp.save", FileAccess.READ)
	if FileAccess.file_exists("user://" + entity_name_or_ID + "_hp.save"):
		var loaded_hp = save_file.get_var()
		save_file.close()
		print("file opened: " + "user://" + entity_name_or_ID + "_hp.save")
		stats = loaded_hp
		return loaded_hp
	return stats["max_hp"]
