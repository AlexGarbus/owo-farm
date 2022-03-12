extends State
class_name OwOState

var owo: OwO


func _ready() -> void:
	yield(owner, "ready")
	owo = owner as OwO
	assert(owo != null)
