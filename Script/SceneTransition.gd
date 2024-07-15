extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready():
	fade_in()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func scene():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func destroy_transition():
	queue_free()
	
func fade_in():
	$Animation.play("FadeOut")

