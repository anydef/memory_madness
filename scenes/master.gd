extends Control

@onready var music: AudioStreamPlayer = $Music
@onready var main: Control = $Main
@onready var game: Control = $Game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_game_exit_pressed.connect(on_game_exit_pressed)
	SignalHub.on_level_selected_pressed.connect(_on_level_selected_pressed)
	on_game_exit_pressed()

func on_game_exit_pressed() -> void:
	SoundManager.play_sound(music, SoundManager.SOUND_MAIN_MENU)
	show_game(false)

func _on_level_selected_pressed(_level: int) -> void:
	SoundManager.play_sound(music, SoundManager.SOUND_IN_GAME)
	show_game(true)

func show_game(s: bool) -> void:
	game.visible = s
	main.visible = !s
