# You can give the class an icon like so:
@icon("res://class_icon.webp")
# This must be at the very top of the script, before extends and class_name
# This icon will show up in the editor

extends Node

# Each script is a class, but it's really awkward to reference them without registering them
# You can reference an unregistered class using it's path in res://.
# So like extends "res://myclass" would extend from the script in the root of res://

# However, to register a class, you use the following line:
class_name Classes

# IMPORTANT! Using class_name will load the script as a global variable!
# You should only be using class_name on objects you know you need to access from other scripts.

# Constructing a class is pretty simple
var my_class := Classes.new()

# It's a little bit backwards from what I'm used to, but it works.
# if you want to make a constructor for the class, you need to make an _init func:
var greeting: String
func _init(greeting := "Hello, world!"):
	self.greeting = greeting

# Overriding methods is C++ style. In other words, it's horribly hidden.
# All methods are overridable, and to override the method,
# you simply need a method in the extending class that has the same signature.
