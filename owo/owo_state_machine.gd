extends StateMachine

onready var idle = $Idle
onready var move = $Move
onready var sleep = $Sleep
onready var pet = $Pet

func _ready() -> void:
	states_map = {
		"idle": idle,
		"move": move,
		"sleep": sleep,
		"pet": pet
	}


func _change_state(state_name: String) -> void:
	if not _active:
		return
	if state_name == "pet":
		states_stack.push_front(states_map[state_name])
	._change_state(state_name)


func _on_OwO_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if current_state != states_map["pet"] and event is InputEventMouseButton and event.is_pressed():
		_change_state("pet")
