extends Node

# Unfortunately, in GDScript, there's no such thing as truly "private" variables or functions
# The standard is to prefix "private" functions and variables with an underscore `_`
# However, we can cheese it with getters and setters

func protected_set(_value):
    push_error("Attempt to externally set private field!")

func protected_get():
    push_error("Attempt to externally get private field!")

var _isGrounded := false : get = protected_get, set = protected_set

func _ready():
    # Works fine
    print(_isGrounded)

    # Should push an error to debug tab
    print(self._isGrounded)
