extends Node

var points = 0
var victory: bool = false

@onready var point_label = %PointLabel


func add_point():
	points += 1
	print(points)
	point_label.text = "POINTS: " + str(points)

func goal_achived():
	victory = true
	print("You won $points points ")

