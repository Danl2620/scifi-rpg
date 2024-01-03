extends Node2D
class_name Game

@export var tank: Tank
@export var ui: UI

# Called when the node enters the scene tree for the first time.
func _ready():
	if !tank.collected.is_connected(ui._on_collected):
		tank.collected.connect(ui._on_collected)
	if !tank.reload_progress.is_connected(ui._on_reload_progress):
		tank.reload_progress.connect(ui._on_reload_progress)
	if !tank.reloaded.is_connected(ui._on_reloaded):
		tank.reloaded.connect(ui._on_reloaded)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
