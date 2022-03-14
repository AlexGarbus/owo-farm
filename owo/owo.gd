extends Area2D
class_name OwO

var bounds: Rect2
onready var label: Label = $Label


func set_text(text: String) -> void:
	label.text = text


func get_text() -> String:
	return label.text
