extends Node
class_name StateMachine

signal state_changed(current_state)

export(NodePath) var start_state

var states_map: Dictionary = {}
var states_stack: Array = []
var current_state: State = null
var _active = false setget set_active


func _ready() -> void:
	yield(owner, "ready")
	if not start_state:
		start_state = get_child(0).get_path()
	for child in get_children():
		var err = child.connect("finished", self, "_change_state")
		if err:
			printerr(err)
	initialize(start_state)


func initialize(initial_state: String) -> void:
	set_active(true)
	states_stack.push_front(get_node(initial_state))
	current_state = states_stack[0]
	current_state.enter()


func set_active(value: bool) -> void:
	_active = value
	set_physics_process(value)
	set_process_input(value)
	if not _active:
		states_stack = []
		current_state = null


func _unhandled_input(event: InputEvent) -> void:
	current_state.handle_input(event)


func _process(delta: float) -> void:
	current_state.update(delta)


func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)


func _change_state(state_name: String) -> void:
	if not _active:
		return
	current_state.exit()
	
	if state_name == "previous":
		states_stack.pop_front()
	else:
		states_stack[0] = states_map[state_name]
	
	current_state = states_stack[0]
	emit_signal("state_changed", current_state)
	
	if state_name != "previous":
		current_state.enter()
