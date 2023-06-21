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
