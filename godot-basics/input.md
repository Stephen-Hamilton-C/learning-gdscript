# Player Input
Godot provides 4 virtual methods to handle input:
```gd
func _input(event: InputEvent):
    pass

# NOTE: I don't actually know if the rest of these use InputEvent for their type
func _gui_input(event: InputEvent):
    pass

func _unhandled_input(event: InputEvent):
    pass

func _unhandled_key_input(event: InputEvent):
    pass
```

Input events happen like this:
1. User presses input
2. OS class receives input and passes it to the Scene Tree
3. Scene Tree then passes input to the Root ViewPort
4. The Root ViewPort then runs `_input` on each child, bottom-to-top
5. If `_input` did not catch then input, then the Root ViewPort activates `_gui_input` on each Control Node.
6. Finally, if no Control Node caught the input, then the Root ViewPort activates the `_unhandled_input` and `_unhandled_key_input` methods.
7. The input is then passed to Collision Detection.

Oddly enough, you typically want your player movement code to be in `_unhandled_input`.
This is so that if the player interacts with GUI in any way,
it doesn't get ignored or also activate player movement.
This is much less painful than how Unity handles ignoring inputs when interacting with GUI.

`_unhandled_key_input` is only called on keyboard inputs, no mouse inputs.

CollisionObjects have access to `_input_event()` which is step 7 of the input event cycle

## InputEvent
InputEvents are the base class of all input data.
Godot converts user inputs into a class that holds the relevant data.
This is typically a subclass of InputEvent.

Here's a list of InputEvent subclasses:
- InputEventAction
- InputEventFromWindow
    - InputEventScreenDrag
    - InputEventScreenTouch
    - **InputEventWithModifiers**
        - InputEventGesture
            - InputEventMagnifyGesture
            - InputEventPanGesture
        - **InputEventKey**
        - **InputEventMouse**
            - InputEventMouseButton
            - InputEventMouseMotion
- InputEventJoypadButton
- InputEventJoypadMotion
- InputEventMIDI
- InputEventShortcut

### InputEventWithModifiers
The most common InputEvents will be from *InputEventWithModifiers*.
*InputEventKey* is for keyboard presses,
and *InputEventMouse* is for mouse movement/buttons

To get a key from an *InputEventKey*, we call `get_scancode()`, or use `scancode`.
This returns an `int`, which corresponds to a scancode from the `KeyList` constants.

Example: `KEY_A` is the number 65. This corresponds to the A key on the keyboard.

Here's how we would handle the input in code:
```gd
func _input(event: InputEvent):
    if event is InputEventKey:
        if event.scancode == KEY_RIGHT:
            print("Right arrow key pressed")
```

### InputEventJoypadButton & InputEventJoypadMotion
JoypadButton handles button presses, while JoypadMotion handles thumbsticks.

To get if a joypad button is pressed,
we use `button_index` and compare it against a `JoyButton` enum.
We can then check the `pressed` property to see if the button is pressed or not.
For controllers with analog buttons (e.g. PS3 controller),
we can use `pressure` to see how hard the player is pressing the button.

To get a joypad axis, we check `axis` and compare it against a `JoyAxis` enum.
We can then check the `axis_value` property.

## Input Actions
A more Unity-like and versatile way to handle input is with Actions.
In Godot, go to Project -> Project Settings... -> Input Map tab.
You can add Actions which will activate for a certain set of inputs.
For example, you can have a "move_right" action
which will activate when the player presses D, the right arrow, or moves a thumbstick.

Use `Input.is_action_pressed(action_name)` to determine if an action is currently being activated.
Use `Input.is_action_just_pressed(action_name)` to determine if this is the frame that the action was activated.
To get the axis of an action, use `Input.get_action_strength(action_name)`.
To convert a pair of 0 - 1 axes to -1 - 1, you can do this:
```gd
var horizontal = Input.get_action_strength("right") - Input.get_action_strength("left")
```
`horizontal` will then be -1 when `left` is 1, and 1 when `right` is 1.

Also, a really helpful method is `Input.get_vector()`, which takes in four actions and a deadzone.
`get_vector()` will automagically limit the vector to a magnitude of 1 and has a circular deadzone.
Example:
```gd
func _physics_process(delta):
    val movementVector = Input.get_vector("left", "right", "up", "down")
    position += movementVector * delta
```
