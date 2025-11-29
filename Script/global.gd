extends Node

var reset : bool = false
var death_enemy : bool = false
var death_enemy_count = 0
var level : int = 1
var next_mission : bool = false
var start_level : bool = false
var rate_current : float = 0.25
var value_mission : int = 10
var death_player : bool = false

func _process(delta):
	if reset == true:
		death_enemy = false
		death_enemy_count = 0
		level = 1
		next_mission = false
		start_level = false
		rate_current = 0.25
		value_mission = 10
		death_player = false
