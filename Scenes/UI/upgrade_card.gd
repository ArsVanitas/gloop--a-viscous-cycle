extends Control
class_name UpgradeCard

@onready var upgrade_pool
@export var card_res : UpgradeCardResource


func _ready() -> void:
	%CardName.text = card_res.title
	%Texture.texture = card_res.texture
	%Description.text = card_res.description
