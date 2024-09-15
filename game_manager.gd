extends Node

@onready var points_label: Label = %PointsLabel
@onready var collect: AudioStreamPlayer = $collect

var points = 0

func add_point():
	collect.play()
	points += 1
	print(points)
	points_label.text = "Piñas: " + str(points)
