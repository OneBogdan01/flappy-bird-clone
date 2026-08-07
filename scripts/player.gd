extends RigidBody2D

signal hit_enviroment
@export var force_on_tap := 400.0

@export var desired_rotation_tap_deg := -65.0
@export var desired_rotation_falling := 70.0
@export var rotation_speed := 50.0
@export var dive_rotation_speed := 1.0


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("tap"):
		linear_velocity.y = -force_on_tap
		var torque = angle_difference(rotation, deg_to_rad(desired_rotation_tap_deg))
		angular_velocity = torque * rotation_speed
	else:
		var torque = angle_difference(rotation, deg_to_rad(desired_rotation_falling))
		angular_velocity = torque * dive_rotation_speed


func _on_body_entered(body: Node) -> void:
	hit_enviroment.emit()
	print("Player hit something" + body.name)
