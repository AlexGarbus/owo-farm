extends OwOState

export var move_chance: int = 100
export var sleep_chance: int = 1000
export var play_chance: int = 50
onready var _owo_detector: Area2D = get_node("../../OwODetector")


func enter() -> void:
	owo.set_text("OwO")


func update(delta: float) -> void:
	if randi() % move_chance == 0:
		emit_signal("finished", "wander")
	elif randi() % sleep_chance == 0:
		emit_signal("finished", "sleep")
	elif _owo_detector.get_overlapping_areas().size() > 1 and randi() % play_chance == 0:
		emit_signal("finished", "play")
