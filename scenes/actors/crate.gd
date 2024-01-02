extends RigidBody2D
class_name Crate

@export var PICKUP_SCENE: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func destroy():
	var pickup: Node2D = PICKUP_SCENE.instantiate()
	pickup.set_global_position(global_position)
	get_tree().root.add_child(pickup)
	queue_free()
