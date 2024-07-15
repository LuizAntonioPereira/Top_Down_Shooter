extends Node3D

@export
var Sensitive = 2000
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.death_enemy_count = 0
	Global.level = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.start_level == true:
	
		var mouse_pos = get_viewport().get_mouse_position()
		var ray_origin = $SpringArm3D/Camera3D.project_ray_origin(mouse_pos)
		var ray_direction = ray_origin + $SpringArm3D/Camera3D.project_ray_normal(mouse_pos) * Sensitive
		var ray_query = PhysicsRayQueryParameters3D.create(ray_origin, ray_direction)	
		
		var space_state = get_world_3d().direct_space_state
		var ray_result = space_state.intersect_ray(ray_query)
		
		ray_query.collide_with_bodies = true
		
		if not ray_result.is_empty():		
			var look_at_me = Vector3(ray_result.position.x,$Player.position.y,ray_result.position.z)
			$Player.look_at(look_at_me,Vector3.UP)
