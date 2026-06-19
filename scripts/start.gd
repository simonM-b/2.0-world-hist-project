extends Control

var ic = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in GLOBAL.citations:
		var l = Label.new()
		l.text = str(i)
		l.label_settings = LabelSettings.new()
		l.label_settings.font_size = 10
		$citations/ScrollContainer/VBoxContainer.add_child(l)


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
	


func _on_img_cit_pressed() -> void:
	ic += 1
	if ic%2 == 0:
		$citations.show()
	else:
		$citations.hide()
	print(ic%2)


func _on_citations_confirmed() -> void:
	ic += 1
