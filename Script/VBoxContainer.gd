extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():	
	fade_in()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$HBoxContainer/Label4.text = str(Global.death_enemy_count)
	#$HBoxContainer2/Label.text += str(Global.level)
	#$HBoxContainer2/Label3.text += str(Global.value_mission)
	if Global.next_mission == true:
		fade_in()
	
func fade_in():
	$"../AnimationPlayer".play("mission")
	await get_tree().create_timer(2.6).timeout
	$"../AnimationPlayer".play_backwards("mission")
	await get_tree().create_timer(2.3).timeout
	Global.next_mission = false
	Global.start_level = true
