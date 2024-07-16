extends CharacterBody3D

@export
var move_speed : float

@onready var agent := $NavigationAgent3D as NavigationAgent3D

var player : Node3D

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var material_red = preload("res://Assets/Material/red.tres")
var material_white = preload("res://Assets/Material/white.tres")

@export
var initial_health : float

var current_health : float

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = initial_health
	$UI/TextureProgressBar.max_value = current_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	name(delta)

func _on_area_3d_area_entered(area):
	
	if area.is_in_group("Bullet"):
		current_health -= 10
		$MeshInstance3D.set_surface_override_material(0,material_white)
		await get_tree().create_timer(0.1).timeout
		$MeshInstance3D.set_surface_override_material(0,material_red)
		$UI/TextureProgressBar.value = current_health
			
func name(delta):
	
	if current_health <= 0:		
		Global.death_enemy_count += 1						
		queue_free()
		
	if current_health < 4:		
		Global.death_enemy = true

				
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if player == null:
		player = get_tree().get_first_node_in_group("Player")
		
	if player != null and Global.start_level == true:
		agent.set_target_position(player.global_position)		
		velocity = global_position.direction_to(agent.get_next_path_position()) * move_speed		
		move_and_slide()
