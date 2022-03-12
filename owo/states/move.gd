extends OwOState

export var walk_speed: float = 25
var target: Vector2


func enter() -> void:
	var target_x := rand_range(owo.bounds.position.x, owo.bounds.end.x)
	var target_y := rand_range(owo.bounds.position.y, owo.bounds.end.y)
	target = Vector2(target_x, target_y)


func update(delta: float) -> void:
	owo.position = owo.position.move_toward(target, walk_speed * delta)
	if owo.position == target:
		emit_signal("finished", "idle")
