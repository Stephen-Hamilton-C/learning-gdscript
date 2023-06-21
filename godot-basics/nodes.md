# Nodes & Resources
Nodes represent behavior.
Resources are Data Containers.
Nodes rely on data contained in resources.
Scenes are resources.

The Godot editor shows the properties of each inherited Class in the Inspector.
If you create a Node2D, it first shows the properties for Node2D;
then it shows the properties for CanvasItem, Node2D's base class;
then it shows the properties for Node, CanvasItem's base class.

GDScript files are Resources.
PackedScenes are Resources.
You can change the root node in a scene by deleting it,
and then selecting a new node from the Scene window
