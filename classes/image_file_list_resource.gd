extends Resource

class_name ImageFileListResource

@export var file_names: Array[String]

func add_file(fn: String) -> void:
	if fn.ends_with(".import"):
		return
	file_names.append(fn)
