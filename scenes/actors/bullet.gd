extends Area2D

const SPEED = 500

var direction: Vector2 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += direction.normalized() * SPEED * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_body_entered(body):
	if body is Crate:
		body.destroy()
	queue_free()

