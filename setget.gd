extends Node

# You can define setter and getter functions. Similar to C#'s Properties and Kotlin's set/get functions
# You can define a setter and getter like so:
var health := 100 : set = set_health, get = get_health

func set_health(value: int):
	if value <= 0:
		print("We died!")
	health = value

func get_health() -> int:
	return health

# Note that internally, calling `self.health` will call the setter/getter.
# However, just calling `health` will bypass the setter/getter.

# Defining *just* a getter:
var my_bool := true : get = get_my_bool

func get_my_bool() -> bool:
	print("my_bool has been retrieved")
	return my_bool

# Defining *just* a setter:
var volume := 33 : set = set_volume

func set_volume(value: int):
	# Limit volume 0 - 100
	if value <= 0:
		volume = 0
	elif value >= 100:
		volume = 100
	else:
		volume = value
