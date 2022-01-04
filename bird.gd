extends RigidBody2D

func _ready():
	self.linear_velocity.x = 120.0

func _process(delta):
	self.linear_velocity.x += 10.0 * delta
	self.linear_velocity.y += 800.0 * delta
	
	if self.position.y > $Camera2D.limit_bottom or self.position.y < $Camera2D.limit_top:
		get_hit()
	
	if $NoMoveTimer.is_stopped():
		move_player(delta)
	pass

func move_player(delta):
	if Input.is_action_pressed('ui_select'):
		self.linear_velocity.y = -400.0
		$NoMoveTimer.start()
		
func get_hit():
	get_tree().paused = true
