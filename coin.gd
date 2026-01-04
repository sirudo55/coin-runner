extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		# 親(Main)の add_score を呼ぶ
		get_parent().add_score(1)
		queue_free()
