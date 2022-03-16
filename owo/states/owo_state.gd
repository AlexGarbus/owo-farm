extends State
class_name OwOState

var owo: OwO


func _ready() -> void:
	yield(owner, "ready")
	owo = owner as OwO
	assert(owo != null)


func on_OwO_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass


func on_OwO_mouse_exited() -> void:
	pass
