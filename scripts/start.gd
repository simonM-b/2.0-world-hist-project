extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startGame(setPath):
	GLOBAL.startPath = setPath
	get_tree().change_scene_to_file("res://scenes/the_story_path.tscn")


func _on_new_save_pressed() -> void:
	GLOBAL.shouldStartFromSave = false
	startGame(GLOBAL.firstTimeStartPath)


func _on_load_pressed() -> void:
	$AcceptDialog.show()


func _on_load_from_save_pressed() -> void:
	GLOBAL.shouldStartFromSave = true
	get_tree().change_scene_to_file("res://scenes/the_story_path.tscn")
	
