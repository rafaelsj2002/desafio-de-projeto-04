extends Node

signal game_over

var player: Player
var player_position: Vector2
var time_elapsed_string: String
var is_game_over = false
var time_elapsed = 0.0
var meat_counter = 0
var monsters_defeated_counter = 0

func _process(delta):
	time_elapsed += delta
	var time_elapsed_in_seconds = floori(time_elapsed)
	var seconds = time_elapsed_in_seconds % 60
	var minutes = time_elapsed_in_seconds / 60
	time_elapsed_string = "%02d:%02d" % [minutes, seconds]

func end_game():
	if is_game_over:
		return
	is_game_over = true
	game_over.emit()

func reset():
	player = null
	player_position = Vector2.ZERO
	is_game_over = false
	time_elapsed = 0.0
	time_elapsed_string = "00:00"
	meat_counter = 0
	monsters_defeated_counter = 0
	for connection in game_over.get_connections():
		game_over.disconnect(connection.callable)

