extends Node

# Exports are like public or SerializeField variables in Unity
# They allow you to change their values from the editor

@export var speed := 10

# Similar to Unity's [Header()] attribute, you can group your exports:
@export_group("Health")
@export var current_health := 25
@export var max_health := 100

# To create subgroups within a group:
@export_subgroup("Damage")
@export var meleeDmg := 10
@export var rangedDmg := 7

# Or you can create categories. Not sure what these do yet - my guess is a spoiler
@export_category("State")
@export var walking := false
@export var running := false

# To limit the variable to a specific range, use export_range:
# In this example, 20 is min, 100 is max, and 0.1 is the step
@export_range(20, 100, 0.1) var runSpeed := 20

# For colors, you can just export normally, or export with no alpha:
@export var plrColor: Color
@export_color_no_alpha var effectColor: Color

# NodePaths aren't necessary to export in Godot 4. Just export Nodes directly.

# If you need to drop a resource file from the FileSystem dock into the variable, use Resource:
@export var bulletTemplate: Resource

# Integers used as flags can be exported as so:
@export_flags("Auto", "Semi-Auto", "3-Round-Burst") var fireModes := 0

# To export enums instead of flags:
@export_enum("UP", "DOWN", "LEFT", "RIGHT") var direction := 0



# Export annotations are also provided for all of these:
@export_flags_2d_physics var layers_2d_physics
@export_flags_2d_render var layers_2d_render
@export_flags_2d_navigation var layers_2d_navigation
@export_flags_3d_physics var layers_3d_physics
@export_flags_3d_render var layers_3d_render
@export_flags_3d_navigation var layers_3d_navigation
