extends Node2D
class_name Weapon

signal reloaded()
signal reload_progress(progress)

enum STATE { READY, FIRING, RELOADING }

var state : STATE = STATE.READY

@onready var reload_timer = $ReloadTimer
@onready var audio_player = $AudioStreamPlayer
@export var BULLET_SCENE: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func change_state(new_state: STATE):
	state = new_state

func fire():
	if state == STATE.FIRING || state == STATE.RELOADING:
		return

	## sfx
	audio_player.play()

	## spawn the bullet
	var bullet = BULLET_SCENE.instantiate()
	bullet.direction = Vector2.from_angle(global_rotation)
	bullet.set_global_position(global_position)
	get_tree().root.add_child(bullet)

	reload_timer.start()
	change_state(STATE.FIRING)
	
func _on_reload_timer_timeout():
	change_state(STATE.READY)
	reloaded.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var timer:Timer = reload_timer
	if !timer.is_stopped():
		##reload_progress.emit(1-(timer.time_left/timer.wait_time))
		reload_progress.emit(remap(timer.time_left,timer.wait_time,0,0,1))

