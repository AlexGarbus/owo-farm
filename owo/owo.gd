extends Area2D
class_name OwO

export(Array, AudioStream) var sounds
var bounds: Rect2
onready var label: Label = $Label
onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	audio_stream_player.stream = sounds[randi() % sounds.size() - 1]
	play_sound()


func set_text(text: String) -> void:
	label.text = text


func get_text() -> String:
	return label.text


func play_sound() -> void:
	if not audio_stream_player.playing:
		audio_stream_player.play()
