extends Node3D

func _ready():
	for node in $Sketchfab_Scene.find_children("*", "MeshInstance3D"):
		node.create_trimesh_collision()
