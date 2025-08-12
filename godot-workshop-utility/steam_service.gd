extends Node

signal log_message(message)
signal tags_set(tags)

const STEAM_WORKSHOP_AGREEMENT_URL: String = "https://steamcommunity.com/sharedfiles/workshoplegalagreement"

@export var steam_app_id: int = -1
@export var steam_workshop_tags: Array[String] = []


func initialize() -> void:
	var INIT: Dictionary = Steam.steamInitEx()
	if (INIT): emit_signal("log_message", "Steam initialization OK!") 
	else: emit_signal("log_message", "Steam could not initialize: %s" % str(INIT))
	
	var game_install_directory := get_game_dir()
	
	var file := FileAccess.open(game_install_directory + "steam_data.json", FileAccess.READ)
	
	if file:
		var test_json_conv = JSON.new()
		test_json_conv.parse(file.get_as_text())
		var file_content: Dictionary = test_json_conv.get_data()
		file.close()
		
		if !file_content.has("app_id") and steam_app_id == -1:
			emit_signal("log_message", "The steam_data file does not contain an app ID, mod uploading will may not work.")
			return
		
		if file_content.has("tags"):
			steam_workshop_tags = file_content.tags as Array
			emit_signal("tags_set", steam_workshop_tags)
		
		steam_app_id = file_content.app_id as int
	elif steam_app_id == -1:
		emit_signal("log_message", "Can't open steam_data file %s. Please make sure the file exists and is valid." % (game_install_directory + "steam_data.json"))
	if steam_workshop_tags != []:
		emit_signal("tags_set", steam_workshop_tags)


func get_game_dir() -> String:
	var game_install_directory := OS.get_executable_path().get_base_dir()
	
	if OS.get_name() == "OSX":
		game_install_directory = game_install_directory.get_base_dir().get_base_dir()
	
	if OS.has_feature("editor"):
		game_install_directory = "res://"
	
	return game_install_directory


func _process(_delta: float) -> void:
	Steam.run_callbacks()
