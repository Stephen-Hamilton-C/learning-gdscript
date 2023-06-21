# Script Lifecycle
The lifecycle of any game object is always the following:
- Start
- Exist
- End

This is no different in Godot:
1. Enter Tree
2. Ready
3. Input
4. Physics Processing
5. Process
6. Exit Tree

Only scripts that extend from `Node` (or any class that extends from `Node`)
have access to these lifecycle methods.

## Enter Tree
```gd
func _enter_tree():
    pass
```

This is always called when a scene enters the Scene Tree
`_enter_tree` calls are in order of the Node's children.

For example:
```
root
- Parent
    - Child1
        - GrandChild1
    - Child2
```
will get their `_enter_tree` calls in this order:
1. Parent
2. Child1
3. GrandChild1
4. Child2

If you need property values reset or some action to happen immediately when the Node is activated,
`_enter_tree` is good for this.
This is great for scenes that will be active and inactive, and never released from memory.
This means `_enter_tree` can be called several times when a Node is activated and deactivated.

If you don't know if you should be using it, then you probably don't need it.
Always prioritize `_ready` over `_enter_tree` when setting initial property values.

## Ready
```gd
func _ready():
    pass
```

The `_ready` method is only called once,
and will not be called a second time.
This means deactivating a Node and then activating it again will not invoke `_ready`.

Assume the following scene tree:
```
root
- Parent
    - Child1
        - GrandChild1
            - GreatGrandChild1
        - AnotherGrandChild1
    - Child2
        - GrandChild2
```

`_ready` will be called in this order:
1. GreatGrandChild1
2. GrandChild1
3. AnotherGrandChild1
4. Child1
5. GrandChild2
6. Child2

So, `_ready` is called on the children of each Node before it is called on the Node itself.

## Process
```gd
func _process(delta: float):
    pass
```

`_process` runs at every frame possible, which is most of them.
The `delta` parameter passed into `_process` is the delta time,
or the time since last frame.
This helps with keeping calculations frame independent.

Default settings for Godot projects sometimes has `_process` run slower than `_physics_process`
If you turn off VSync, `_process` will run faster.
However, this should be something that can be changed by the user, so you shouldn't depend on this method.

## Physics Process
```gd
func _physics_process(delta: float):
    pass
```

`_physics_process` is capped at 1/60, or 60 FPS.
This is analogous to Unity's FixedUpdate.
`delta` is consistently 0.016667, or 0.1 per 6 frames.

This is ideal for Game Logic like path finding and updating positions.
You may not get the smoothest visual animations with this.

Good rule of thumb is start out with `_physics_process`.
If it feels weird, use `_process`.
If the game is too slow and the bottleneck is `_process`,
then move the code to `_physics_process`.
