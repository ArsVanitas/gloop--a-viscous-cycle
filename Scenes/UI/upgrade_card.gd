extends Control
class_name UpgradeCard

@onready var upgrade_pool
@export var card : UpgradeCardResource


func _ready() -> void:
	%CardName.text = card.title
	%Texture.texture = card.texture
	%Description.text = card.description


func _on_card_button_pressed() -> void:
	pass # Replace with function body.
