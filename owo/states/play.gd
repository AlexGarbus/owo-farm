extends OwOState

export var move_speed: float = 25
export var min_target_distance: float = 10
export var exit_chance: int = 500
onready var _owo_detector: Area2D = get_node("../../OwODetector")
onready var _play_smile_timer: Timer = get_node("../../PlaySmileTimer")
var _is_following: bool = false
var _target: OwO


func enter() -> void:
	var owos := _filter_self(_owo_detector.get_overlapping_areas())
	_target = owos[randi() % owos.size()]
	_target.connect("tree_exited", self, "_on_target_tree_exited")


func exit() -> void:
	_target.disconnect("tree_exited", self, "_on_target_tree_exited")
	_play_smile_timer.stop()


func update(delta: float) -> void:
	_follow_target(delta)
	if randi() % exit_chance == 0:
		emit_signal("finished", "idle")


func _filter_self(array: Array) -> Array:
	var filtered_array := []
	for element in array:
		if not element == owo:
			filtered_array.append(element)
	return filtered_array


func _on_target_tree_exited() -> void:
	emit_signal("finished", "idle")


func _follow_target(delta: float) -> void:
	var target_distance := owo.position.distance_to(_target.position)
	if _is_following:
		owo.position = owo.position.move_toward(_target.position, move_speed * delta)
		if target_distance <= min_target_distance:
			_is_following = false
			owo.set_text("^w^")
			_play_smile_timer.stop()
			owo.play_sound()
	elif target_distance > min_target_distance:
		_is_following = true
		_play_smile_timer.start()


func _on_PlaySmileTimer_timeout() -> void:
	owo.set_text("OwO")
