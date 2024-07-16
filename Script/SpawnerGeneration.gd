extends Node3D

@export
var enemy_prefab : PackedScene

@export
var root_node : Node3D

@export
var shoot_rate : float = 2.25 - (Global.rate_current * Global.level)

var shoot_timer : float


func _process(delta):
	spawner(delta)
		
func spawner(delta):
	
	if shoot_timer < shoot_rate:
		shoot_timer += delta
	
	if shoot_timer >= shoot_rate and Global.start_level == true:
		shoot_timer = 0
	
		var enemy = enemy_prefab.instantiate()
		var rand_angle = randf_range(0, PI * 2)
		enemy.position = global_position + (Vector3.RIGHT * (sin(rand_angle)/1.5) + Vector3.FORWARD * (cos(rand_angle))/1.5) * 20
		root_node.add_child(enemy)
