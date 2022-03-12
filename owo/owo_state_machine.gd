extends StateMachine

onready var idle = $Idle
onready var move = $Move
onready var sleep = $Sleep

func _ready() -> void:
	states_map = {
		"idle": idle,
		"move": move,
		"sleep": sleep
	}
