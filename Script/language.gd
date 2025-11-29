extends HBoxContainer

var data = ""
var save_path = SAVE_DIR + "idioma.dat"
const SAVE_DIR = "user://idioma/"

func pt_pressed():
	$SonsMenu.play()
	await $SonsMenu.finished
	data = "pt_BR"
	TranslationServer.set_locale(data)	
	save(data)
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func en_pressed():
	$SonsMenu.play()
	await $SonsMenu.finished
	data = "en_US"
	TranslationServer.set_locale(data)
	save(data)
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")	

func es_pressed():
	$SonsMenu.play()
	await $SonsMenu.finished
	data = "es_ES"
	TranslationServer.set_locale(data)
	save(data)
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")	
	
func save(d):
	
	var dir = DirAccess
	var file = FileAccess
	
	if !file.file_exists(SAVE_DIR):
		dir.make_dir_recursive_absolute(SAVE_DIR)
	
	var error = file.open_encrypted_with_pass(save_path, FileAccess.WRITE, "P@paB3ar7169")
	error.store_var(d)
	error.close()
