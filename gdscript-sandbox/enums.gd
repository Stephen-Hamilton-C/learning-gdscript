extends Node

# There are C-like globally named enums that are defined like so:
enum {
    UP,
    DOWN,
    LEFT,
    RIGHT,
}

# These are simply declarations of an integer.
# UP = 0
# DOWN = 1
# LEFT = 2
# RIGHT = 3

# if we did this for example:
enum {
    NORTH = 0,
    SOUTH,
    EAST = 10,
    WEST,
}
# The integer values would be
# NORTH = 0
# SOUTH = 1
# EAST = 10
# WEST = 11

# To reference them, you just use its name like so:
var direction := UP
func _ready():
    match direction:
        UP:
            print("Going up")
        DOWN:
            print("Going down")
        _:
            print("Not going up")
            direction = RIGHT

# This is dangerous, of course, since you can't have another enum with the same value name.
# So we can create named enums, like so:
enum Suit {
    CLUBS,
    SPADES,
    DIAMONDS,
    HEARTS,
}
var cardSuit := Suit.SPADES
