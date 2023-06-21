extends Node

# Lambda functions. They're exactly what you expect
var my_function = func():
    print("Hello, world!")

var my_one_line_function = func(num): return num + 1

func _ready():
    # You have to activate lambdas with `.call(args)`
    my_function.call()
    var sum = my_one_line_function.call(10)
    print("10 + 1 is "+sum)
