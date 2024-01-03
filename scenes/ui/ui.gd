extends CanvasLayer
class_name UI

@onready var score_label = %Score
@onready var reload_progress = %ReloadProgress
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_score_label()

func set_score(new_score):
	score = new_score
	_update_score_label()

func _update_score_label():
	score_label.text = str(score)

func _on_collected(collectable) -> void:
	if collectable:
		set_score(score + 100)

func _on_reload_progress(progress) -> void:
	reload_progress.value = clampf(progress,0,1)
	
func _on_reloaded() -> void:
	reload_progress.value = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
