extends CharacterBody2D
var count = 0
func _ready():
	$CanvasLayer/CounterLabel.modulate = Color.BLACK

func _physics_process(delta):
		var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = input_direction * 400
		move_and_slide()
func _on_pickup_area_area_entered(area):
	if area.is_in_group("Virat") and not $Holdingleaf.visible:
		area.queue_free()
		$Holdingleaf.visible = true

	if area.is_in_group("Basket") and $Holdingleaf.visible:
		$Holdingleaf.visible = false
		count += 1
		$CanvasLayer/CounterLabel.text = "Rats: " + str(count)
