extends Node

# In most languages, we have switch statements to reduce huge if branching
# In GDScript, this is replaced with match, sorta like Rust
func _ready():
    var mode := 1
    match mode:
        0:
            print("Mode is 0")
        1:
            print("Mode is 1")
        _:
            print("Mode is not 0 or 1")

    # But match has some really powerful capabilities with arrays:
    var isHappy := true
    var isGlad := true
    var isChipper := true
    match [isHappy, isGlad, isChipper]:
        [true, true, true]:
            print("Having a good day?")
        _:
            print("Having a pretty OK day still.")
