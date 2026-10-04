extends Area2D
@onready var player = $"../Player"

func _on_body_entered(body: Namer) -> void:
	print("fall2")
	$Timer2.start()

func _on_timer_2_timeout() -> void:
	player.set_position($Marker2.global_position)
	$Timer2.stop()
