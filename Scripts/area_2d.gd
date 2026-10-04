extends Area2D

func _on_body_entered(body: Namer) -> void:
	$End.start()

func _on_end_timeout() -> void:
	$End.stop()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
