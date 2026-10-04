extends Area2D
@onready var player = $"../Player"

func _on_body_entered(body: Namer) -> void:
	$Timer1.start()
	
func _on_timer_1_timeout() -> void:
	player.set_position($Marker1.global_position)
	$Timer1.stop()
