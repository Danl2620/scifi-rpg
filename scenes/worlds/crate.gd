extends RigidBody2D
class_name Crate

@onready var audio_player = $AudioStreamPlayer
@export var PICKUP_SCENE: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
	#pass

func destroy():
	var pickup: Node2D = PICKUP_SCENE.instantiate()
	pickup.set_global_position(global_position)
	get_tree().root.call_deferred("add_child", pickup)

	hide()
	audio_player.play()
	await audio_player.finished
	queue_free()
