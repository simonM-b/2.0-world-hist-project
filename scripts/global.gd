extends Node

var startPath = null

var firstTimeStartPath = "res://timelines/planeToNewZeland.dtl"
var citationTextPreload = preload("res://scenes/citation_text.tscn")
var moneyLabelPreload = preload("res://scenes/money_counter.tscn")

var money = 0

var citations = [
	"Johnes, S. (2024).  Interior of a Wizz Air Airbus A321neo . Retrieved June 13, 2026, from https://www.flickr.com/photos/197077715@N03/53519875812/.",
	"颐园居. (2024). Inside Tokyo International Airport Terminal 3. wikimedia commons. Retrieved June 13, 2026, from https://commons.wikimedia.org/wiki/File:Inside_Tokyo_International_Airport_Terminal_3_20240604.jpg.",
	"MrSeabody. (2024). The entrance to Bay of Islands Airport, in Northland, New Zealand . wikimedia. Retrieved June 13, 2026, from https://commons.wikimedia.org/wiki/File:Bay_of_Islands_Airport_outside_2024.jpg.",
	"Ifenomenal, CC BY-SA 4.0 <https://creativecommons.org/licenses/by-sa/4.0>, via Wikimedia Commons",
	"Everyone Sinks Starco, CC BY-SA 2.0 <https://creativecommons.org/licenses/by-sa/2.0>, via Wikimedia Commons",
	"Michal Klajban, CC BY-SA 4.0 <https://creativecommons.org/licenses/by-sa/4.0>, via Wikimedia Commons"
]

func spawnMoney():
	var container = get_tree().root
	var moneyLabel = moneyLabelPreload.instantiate()
	container.add_child(moneyLabel)

func showCitationText(textID: int):
	var citation = citationTextPreload.instantiate()
	var container = get_tree().root
	
	if container:
		killAllCitationText(container)
		container.add_child(citation)
		if textID <= len(citations):
			citation.text = citations[textID]
			return
	print("something went wrong with the path of the text container. ", textID)

func killAllCitationText(r):
	for i in r.get_children():
		if i.is_in_group("citation-text"):
			i.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
