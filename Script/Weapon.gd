extends Node3D

@export
var bullet_prefab : PackedScene

@export
var shoot_position : Node3D

@export
var shoot_rate : float

var shoot_timer : float

const particule_scene = preload("res://Scenes/particles.tscn")

func _process(delta):
	
	if shoot_timer < shoot_rate:
		shoot_timer += delta
	
	if Input.is_action_pressed("shoot") and shoot_timer >= shoot_rate:		
		shoot_timer = 0		
		var bullet = bullet_prefab.instantiate()
		bullet.position = shoot_position.global_position
		get_node("/root").add_child(bullet)
		bullet.bullet_direction = -get_global_transform().basis.z

