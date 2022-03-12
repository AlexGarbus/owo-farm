extends Node
class_name State

signal finished(next_state_name)


func enter() -> void:
	pass


func exit() -> void:
	pass


func handle_input(event: InputEvent) -> void:
	pass


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	pass
