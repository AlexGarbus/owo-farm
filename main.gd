extends Node

export(PackedScene) var owo_scene
export var owo_area: Rect2
export var max_owos: int = 25
onready var _addButton = $Menu/HBoxContainer/AddButton
onready var _removeButton = $Menu/HBoxContainer/RemoveButton
var _owos = []


func add_owo() -> void:
	if _owos.size() == max_owos:
		return
	
	var owo: OwO = owo_scene.instance()
	add_child(owo)
	_owos.push_back(owo)
	owo.bounds = owo_area
	set_random_owo_position(owo)


func remove_owo() -> void:
	if _owos.size() == 0:
		return
	
	var owo: OwO = _owos.pop_front()
	owo.queue_free()


func set_random_owo_position(owo: OwO) -> void:
	var owo_spawn_x = rand_range(owo_area.position.x, owo_area.end.x)
	var owo_spawn_y = rand_range(owo_area.position.y, owo_area.end.y)
	owo.position = Vector2(owo_spawn_x, owo_spawn_y)


func _on_AddButton_button_up() -> void:
	add_owo()
	_removeButton.disabled = false
	if _owos.size() == max_owos:
		_addButton.disabled = true


func _on_RemoveButton_button_up() -> void:
	remove_owo()
	_addButton.disabled = false
	if _owos.size() == 0:
		_removeButton.disabled = true
