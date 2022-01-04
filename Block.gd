extends Area2D

func _on_Block_body_entered(body):
	if (body as Node2D).has_method('get_hit'):
		(body as Node2D).call('get_hit')


func _on_LifeTimer_timeout():
	queue_free()
