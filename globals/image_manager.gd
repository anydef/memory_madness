extends Node

const FRAME_IMAGES: Array[Texture2D]  = [
	preload("res://assets/frames/blue_frame.png"),
	preload("res://assets/frames/green_frame.png"),
	preload("res://assets/frames/red_frame.png"),
	preload("res://assets/frames/yellow_frame.png"),
]

var _image_list: Array[Texture2D]

func _enter_tree() -> void:
	var ifl: ImageFileListResource = load("res://resources/image_files_list.tres")
	for file in ifl.file_names:
		_image_list.append(load(file))
	var tx = get_image(0)
	print(tx.resource_path)
	shuffle_images()
	tx = get_image(0)
	print(tx.resource_path)
	
	
func get_rnd_item_image() -> Texture2D:
	return _image_list.pick_random()


func get_rnd_frame_image() -> Texture2D:
	return FRAME_IMAGES.pick_random()

func shuffle_images() -> void:
	_image_list.shuffle()
	
func get_image(idx: int) -> Texture2D:
	return _image_list[idx]
