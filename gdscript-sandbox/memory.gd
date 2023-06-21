extends Node

# Memory in GDScript is handled in one of two ways:
# - Reference counting
# - Manually

# When a class extends from the Reference class, it uses reference counting.
# This class will automatically keep track of how many references to itself exist.
# When this counter hits 0, the object will automatically be freed from memory.

# However, when a class extends from the Object class, it uses manual memory management.
# This means that we have to manually call `.free()` on the object.
# The Node class extends from Object, so we have to manually free our nodes.
# This is done using the `.queue_free()` method on Nodes,
# which will free that Node and all its child Nodes.

# If a Node is removed from a scene,
# it will automatically queue itself and its children for memory release
