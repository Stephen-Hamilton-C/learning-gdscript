# Delta Time
Delta Time is the change in time.
Usually in game programming, this is the time since the last frame.

If our game is running at 4 FPS,
then our delta time would be 0.25 seconds.

Delta time is excellent for ensuring consistent behavior across all computers.
For example, if trying to move an object 1 unit per frame,
this will be wildly inconsistent across computers and even gameplay as the computer chugs.
However, if we want to move an object 1 unit per second,
we can use Delta Time to calculate this,
and the movement will be consistent across computers.
