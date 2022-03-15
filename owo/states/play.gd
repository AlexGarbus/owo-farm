extends OwOState

export var move_speed: float = 25
export var min_target_distance: float = 10
export var exit_chance: int = 500
onready var _owo_detector: Area2D = get_node("../../OwODetector")
var _is_following: bool = false
var _target: OwO


func enter() -> void:
	var owos := _filter_self(_owo_detector.get_overlapping_areas())
	_target = owos[randi() % owos.size()]
	_target.connect("tree_exited", self, "_on_target_tree_exited")


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
	if _is_following:
		owo.position = owo.position.move_toward(_target.position, move_speed * delta)
		if owo.position.distance_to(_target.position) <= min_target_distance:
			_is_following = false
			owo.set_text("^w^")
	elif owo.position.distance_to(_target.position) > min_target_distance:
		_is_following = true
		owo.set_text("OwO")
