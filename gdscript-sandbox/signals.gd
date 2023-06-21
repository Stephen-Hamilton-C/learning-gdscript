extends Node

# GDScript basically has the Observable pattern built-in to the language
# These "Observables" are known as Signals in GDScript
# For example, here's how to declare a signal:
signal health_changed(health: int)

# To emit a signal, use `emit(args)`.
# To programatically connect to a signal, use `connect(func)`
# You can also connect signals via the editor
func _ready():
    health_changed.connect(
        func(health: int):
            print("Health changed: "+str(health))
    )
    health_changed.emit(10) # This should cause the function above to run

# You can also close connections to signal using `signal.disconnect(ref_to_func)`
# Disconnecting in this way means you need to have either a function or lambda function defined
