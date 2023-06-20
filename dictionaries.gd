extends Node

# Dictionaries are almost exactly like Lua's tables.
# Another way to think of them is just JSON
# They map any key to a certain value
# Note that dictionaries are not type safe.
# Any type of key can map to any type of value

var dictionary := {
    "one": 1,
    2: "two",
    true: "I always tell the truth",
    false: "I always lie",
}

# Random note: Arrays can be typed:
var safeArray: Array[int] = [0, 1, 2]

# Accessing or setting keys is the same as Maps in other languages:
func _ready():
    print(dictionary[2])
    # You can also do dot notation for string keys
    print(dictionary.one)
    dictionary[2] = "too"
    dictionary["foo"] = "bar"

# You can use the `hash()` method to compare two dictionaries to each other
func areDictsEqual(dict1: Dictionary, dict2: Dictionary) -> bool:
    # returns true if both dictionaries have the same keys mapped to the same values
    return dict1.hash() == dict2.hash()

# To remove a key, just use `erase(key)`:
func removeKey():
    dictionary.erase("foo")
