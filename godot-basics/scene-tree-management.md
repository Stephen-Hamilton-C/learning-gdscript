# Adding to the Scene Tree
A Node in the Scene Tree is known as an *Active Node*.
You can add Nodes using the `add_child(Node)` method, like so:
```gd
func add_timer_node():
    var timer := Timer.new()
    self.add_child(timer)
```

# Removing from the Scene Tree
**Remember**! Removing Nodes from the Scene Tree does not remove it from memory.
To do this, call `queue_free()` on the Node.
If you wish to remove the Node from memory rather than just remove it from the Scene Tree,
call `queue_free()` instead, as this will handle exactly that before destroying the Node.

A Node removed from the Scene Tree that has not been destroyed is an *Orphaned* or *Inactive Node*.

You can remove Nodes using the `remove_child(Node)` method, like so:
```gd
func add_and_remove_timer_node():
    var timer := Timer.new()
    self.add_child(timer)
    # Side note: you can add scripts to Nodes like this:
    var script = load("res://path/to/script.gd")
    timer.set_script(script)

    self.remove_child(timer)
    # The timer is now an Inactive Node.
    # If we aren't using it anymore, we should queue_free:
    timer.queue_free()

    # Alternatively, we could have just run `timer.queue.free()`
    # to remove it from the Scene Tree and memory at the same time
```

You can keep track of Orphaned Nodes in the Monitors tab under Object.
