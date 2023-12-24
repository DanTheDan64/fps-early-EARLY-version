extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var wait_time = randf_range(1, 4)
var walk = randi_range(1, 2)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	$Timer.start(wait_time)


func _process(delta):
	pass

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	$main_mesh.look_at (Vector3($"../CharacterBody3D".position.x, 0 , $"../CharacterBody3D".position.z))
	
	
	move_and_slide()


func _on_timer_timeout():
	walk = randi_range(1, 2)
	if walk == 1:
		
		rotation_degrees.y += randi_range(-180, 180)
		velocity = -global_transform.basis.z * 1.5
	else:
		velocity.z = 0
	
	$Timer.stop()
	wait_time = randf_range(1, 4)
	$Timer.start(wait_time)



func _on_area_3d_area_entered(area):
	if area.is_in_group("bullets"):
		queue_free()







