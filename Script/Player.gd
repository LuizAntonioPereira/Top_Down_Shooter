extends CharacterBody3D

@export
var SPEED = 5.0
	
const JUMP_VELOCITY = 4.5

var is_live : bool = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	
	if !is_live:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	if Global.start_level == true:
		move_and_slide()	
	
	$Weapon/ShootPosition/Particles.emitting = Global.death_enemy
	
	if Global.death_enemy == true:
		await get_tree().create_timer(0.1).timeout
		Global.death_enemy = false
	
func _on_area_3d_body_entered(body):
	if body.is_in_group("Enemy"):
		is_live = false		
	
		if get_node_or_null("Weapon") != null:		
			$Weapon.queue_free()
		
		if get_node_or_null("MeshInstance3D") != null:
			$MeshInstance3D.queue_free()


