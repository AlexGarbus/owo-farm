extends OwOState

export var walk_chance: int = 100
export var sleep_chance: int = 1000


func enter() -> void:
	owo.set_text("OwO")


func update(delta: float) -> void:
	if randi() % walk_chance == 0:
		emit_signal("finished", "move")
	elif randi() % sleep_chance == 0:
		emit_signal("finished", "sleep")
