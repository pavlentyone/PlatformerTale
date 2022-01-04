extends Node2D

#export(String, FILE, '*.tscn') var bird
#export(String, FILE, '*.tscn') var box
var bird = preload("res://bird.tscn")
var box = preload("res://Block.tscn")
var box_pos : Array
var x_diff = 600
var x_counter = 0
var label : Label = Label.new()

func _ready():
	for pos in range(0, 640, 70):
		box_pos.append(pos)
	label.rect_scale = Vector2(1, 1)
	label.visible = true
	get_tree().root.add_child(label)
	
func _process(delta):
	
	if $Bird != null:
		label.text = 'Your score is ' + str(x_counter)
		label.rect_global_position = Vector2($Bird.position.x + 300.0, 300.0)
	
	if int($Bird.position.x / x_diff) >= x_counter:
		var new_box_pos = Array()
		for i in box_pos:
			new_box_pos.append(i)
		var new_box : Array = Array()
		for i in range(0, 4):
			var i_rand = rand_range(0, new_box_pos.size())
			new_box.append(box.instance() as Node2D)
			new_box[i].position.y = new_box_pos[i_rand]
			new_box_pos.remove(i_rand)
			new_box[i].position.x = $Bird.position.x + 900
			get_tree().root.add_child(new_box[i])
		
		x_counter += 1

func _on_StartTimer_timeout():
	$SpamTimer.start()
