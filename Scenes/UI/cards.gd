extends HBoxContainer

func hide_buttons():
	for x in get_child_count():
		get_child(x).hide()
