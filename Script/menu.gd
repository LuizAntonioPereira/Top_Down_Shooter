extends HBoxContainer

const SAVE_DIR = "user://saves/"
var data = ""
var save_path = SAVE_DIR + "sava.dat"

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess
	if file.file_exists(save_path):		
		var error = FileAccess.open_encrypted_with_pass(save_path, FileAccess.READ, "P@paB3ar6969")
		if error == OK:
			var player_data = error.get_var(false)
			error.close()
			TranslationServer.set_locale(player_data)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func language():
	get_tree().change_scene_to_file("res://Scenes/language.tscn")
