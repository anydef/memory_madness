extends Object

class_name LevelDataSelector

const LEVELS_DATA: LevelsDataResource = preload("res://resources/levels_data.tres")

#region statics
static func get_level_setting(level: int) -> LevelSettingResource:
	return LEVELS_DATA.get_level_data(level)

static func get_level_selection(level_num: int) -> LevelDataSelector:
	var l_setting: LevelSettingResource = get_level_setting(level_num)
	if not l_setting:
		return null
	ImageManager.shuffle_images()
	
	var selected_images: Array[Texture2D]
	
	for i in range(0, l_setting.get_level_target()):
		selected_images.append(ImageManager.get_image(i))
		selected_images.append(ImageManager.get_image(i))
		
	selected_images.shuffle()
	
	return LevelDataSelector.new(l_setting, selected_images)

#endregion statics

var _selected_images: Array[Texture2D]
var _level_setting: LevelSettingResource

func _init(level_setting: LevelSettingResource, selected_images: Array[Texture2D]) -> void:
	_selected_images = selected_images
	_level_setting = level_setting

func get_selected_images() -> Array[Texture2D]:
	return _selected_images

func get_targe_pairs() -> int:
	return _level_setting.get_level_target()
	
func get_num_cols() -> int:
	return _level_setting.get_cols()

func get_num_rows() -> int:
	return _level_setting.get_rows()
