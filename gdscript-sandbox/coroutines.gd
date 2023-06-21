extends Node

# Anything can be a coroutine.
# Just use `await signal` to pause execution until the signal is emitted
# For example, to wait 1 second:

func _ready():
    print("Hello")
    await get_tree().create_timer(1.0).timeout
    print("...world!")

# You can also use await on functions:
func delay(time: float):
    await get_tree().create_timer(time).timeout

func _process(_delta):
    delay(3)
    # Because we did not use await, the above code won't wait 3 seconds.
    # However, this code will:
    await delay(3)
    print("3 seconds later...")
