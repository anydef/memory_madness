extends Control

@onready var tile_grid: GridContainer = $HB/TileGrid
@onready var sound: AudioStreamPlayer = $Sound
@onready var scorer: Scorer = $Scorer

@onready var moves_value_label: Label = $HB/MC/VB/HB/MovesValueLabel
@onready var pairs_value_label: Label = $HB/MC/VB/HB2/PairsValueLabel

const MEMORY_TILE = preload("res://scenes/tile/memory_tile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for t in tile_grid.get_children():
		t.queue_free()

	SignalHub.on_level_selected_pressed.connect(_on_level_selected_pressed)
 
func _process(delta: float) -> void:
	moves_value_label.text  = scorer.get_moves_made()
	pairs_value_label.text = scorer.get_pairs_made()

func _on_level_selected_pressed(level: int) -> void:
	var lds: LevelDataSelector = LevelDataSelector.get_level_selection(level)
	var frame: Texture2D = ImageManager.get_rnd_frame_image()
	
	tile_grid.columns = lds.get_num_cols()
	for image in lds.get_selected_images():
		var mt: MemoryTile = MEMORY_TILE.instantiate()
		tile_grid.add_child(mt)
		mt.setup(image, frame)
	
	scorer.clear_new_game(lds.get_targe_pairs())
	
	
func _on_exit_button_pressed() -> void:
	for t in tile_grid.get_children():
		t.queue_free()
	SoundManager.play_button_click(sound)
	SignalHub.emit_on_game_exit_pressed()
