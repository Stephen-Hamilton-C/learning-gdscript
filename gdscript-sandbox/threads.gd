extends Node

# Threads follow this lifecycle, similar to Java:
# - Declare the thread
# - Start the thread
# - Exit the thread

# Threads extend from Reference, so they are reference counted

var thread = Thread.new()

func _ready():
    # PRIORITY_LOW = 0
    # PRIORITY_NORMAL = 1
    # PRIORITY_HIGH = 2
    thread.start(thread_function, Thread.PRIORITY_NORMAL)
    assert(thread.is_active())
    thread.wait_to_finish()
    assert(not thread.is_active())

func thread_function():
    await get_tree().create_timer(1.0).timeout
