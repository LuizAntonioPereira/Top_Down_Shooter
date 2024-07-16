extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():	
	fade_in()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.next_mission == true:
		fade_in()
	
	$HBoxContainer/Label4.text = str(Global.death_enemy_count)
	$HBoxContainer2/Label.text = tr("l_level") + str(Global.level)
	$HBoxContainer2/Label3.text = tr("l_mission") + str(Global.value_mission) + tr("complete")
	$HBoxContainer/Label5.text = str(Global.value_mission)
	
func fade_in():
	Global.next_mission = false
	await get_tree().create_timer(1.0).timeout
	$"../AnimationPlayer".play("mission")
	await get_tree().create_timer(2.6).timeout
	$"../AnimationPlayer".play_backwards("mission")
	await get_tree().create_timer(2.3).timeout	
	Global.start_level = true
