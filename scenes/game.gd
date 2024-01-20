extends Node2D
class_name Game

@export var TankScene: PackedScene
@export var WorldScene: PackedScene
@export var ui: UI

var tank: Tank
var world: Node

func start_game():
	## create world
	world = WorldScene.instantiate()
	add_child(world)
	move_child(world, 0)
	
	var start_node = world.find_child("Start-0")
	
	## create tank
	tank = TankScene.instantiate()
	world.add_child(tank)
	if start_node != null:
		tank.position = start_node.position
	else:
		tank.position = Vector2(922,623)
	tank.collected.connect(ui._on_collected)
	tank.reload_progress.connect(ui._on_reload_progress)
	tank.reloaded.connect(ui._on_reloaded)
	##tank.has_control = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_ui_start_game():
	start_game()
