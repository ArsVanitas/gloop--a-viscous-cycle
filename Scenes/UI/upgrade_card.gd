extends Control
class_name UpgradeCard

@onready var upgrade_pool
@export var card_res : UpgradeCardResource
var stat

signal selected

func _ready() -> void:
	%CardName.text = card_res.title
	%Texture.texture = card_res.texture
	%Description.text = card_res.description
	stat = card_res.stat
	connect("pressed", add_upgrade)

func add_upgrade():
	GlobalUpgradeCards.upg_res.append(card_res)
	print(GlobalUpgradeCards.upg_res)
	GlobalUpgradeCards.upgrade.emit(card_res.icon)
