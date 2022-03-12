extends OwOState

export var wake_chance: int = 1000


func enter() -> void:
	owo.set_text("UwU")


func update(delta: float) -> void:
	if randi() % wake_chance == 0:
		emit_signal("finished", "idle")
