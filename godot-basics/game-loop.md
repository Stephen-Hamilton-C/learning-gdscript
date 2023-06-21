# The Game Loop
The game loop is usually limited to the framerate - usually 60 FPS.
The game loop usually does the following steps:
1. Update physics
2. Update scene (update object positions, rotations, etc.)
3. Pass inputs to scripts (player movement)
4. Performance updates (memory management, culling, etc.)
5. Check if user has quit game or if a crash has occurred
