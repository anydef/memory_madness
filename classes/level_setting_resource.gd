extends Resource

class_name LevelSettingResource


@export var level_number: int
@export var rows: int
@export var cols: int


func get_rows()->int:
	return rows

func get_cols()->int:
	return cols

func get_level_number()->int:
	return level_number

@warning_ignore("integer_division")
func get_level_target() -> int:
	return (rows * cols) / 2
