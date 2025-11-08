extends Node

signal on_game_exit_pressed
signal on_level_selected_pressed(int)
signal on_tile_selected(MemoryTile)
signal on_game_over(moves_taken: int)

func emit_on_game_exit_pressed() -> void:
	on_game_exit_pressed.emit()
	
func emit_on_level_selected_pressed(level: int) -> void:
	on_level_selected_pressed.emit(level)

func emit_on_tile_selected(tile: MemoryTile) -> void:
	on_tile_selected.emit(tile)

func emit_on_game_over(moves_taken: int):
	on_game_over.emit(moves_taken)
