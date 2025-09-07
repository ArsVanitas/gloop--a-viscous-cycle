extends GridContainer

func _ready() -> void:
	GlobalUpgradeCards.upgrade.connect(add_icon)

func add_icon(icon):
	var new_icon = TextureRect.new()
	new_icon.texture = icon
	new_icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	new_icon.custom_minimum_size = Vector2(20, 20)
	add_child(new_icon)
