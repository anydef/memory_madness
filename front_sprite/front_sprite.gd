extends TextureRect

const SCALE_SMALL: Vector2 = Vector2(0.1, 0.1)
const SCALE_NORMAL: Vector2 = Vector2(1.0, 1.0)

const SCALE_TIME: float = 1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_rand_image()
	run_me()

func set_rand_image() -> void:
	texture = ImageManager.get_rnd_item_image()

func rnd_spin_time() -> float:
	return randf_range(1.0, 2.0)
	
func rnd_rotation() -> float:
	return deg_to_rad(randf_range(-360, 360))
	

func run_me() -> void:
	var tween: Tween = create_tween()
	#tween.set_loops()
	tween.tween_property(self, "scale", SCALE_SMALL, SCALE_TIME)
	tween.tween_callback(set_rand_image)
	tween.tween_property(self, "scale", SCALE_NORMAL, SCALE_TIME)
	tween.tween_property(self, "rotation", rnd_rotation(), rnd_spin_time())
	tween.tween_callback(run_me)
