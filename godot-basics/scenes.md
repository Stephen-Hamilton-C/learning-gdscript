# Scenes
Scenes are trees of Nodes that can be loaded and unloaded.
Scenes can be analogous to Unity's Scenes, but also analogous to Unity's prefabs,
since you can load entire levels with a Scene, or you can load in specific objects,
such as enemies, with Scenes

The `Scene Tree` itself is not a Scene. It's a class.
The Scene Tree is given to the OS game loop.
The Scene Tree has a Root Node, otherwise known as the Viewport
