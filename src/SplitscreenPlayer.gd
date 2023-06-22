extends Sprite2D

@export var controller_index := 0

func action_name(act_name: String) -> String:
	return act_name + str(controller_index)

func _physics_process(delta):
	position.x += delta * 500 * Input.get_action_strength(action_name("right"))

	if Input.is_action_pressed(action_name("up")) or Input.is_action_pressed(action_name("down")):
		print("vibrate "+str(controller_index))
		Input.start_joy_vibration(
			controller_index,
			Input.get_action_strength(action_name("down")),
			Input.get_action_strength(action_name("up")),
			delta
		)
