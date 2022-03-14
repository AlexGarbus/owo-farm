extends OwOState

onready var _timer: Timer = get_node("../../PetTimer")
var _active: bool = false
var _previous_text: String


func enter() -> void:
	_active = true
	_previous_text = owo.get_text()
	owo.set_text("UwU")


func exit() -> void:
	_active = false
	owo.set_text(_previous_text)
	_timer.stop()


func _on_OwO_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not _active:
		return
	if event is InputEventMouseButton:
		if event.is_pressed():
			_timer.stop()
		else:
			_timer.start()


func _on_OwO_mouse_exited() -> void:
	if not _active:
		return
	_timer.start()


func _on_PetTimer_timeout() -> void:
	emit_signal("finished", "previous")
