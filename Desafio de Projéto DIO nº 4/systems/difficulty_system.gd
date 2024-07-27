extends Node

@export var mob_spawner: MobSpawner

var initial_spawn_rate = 30.0
var spawn_rate_per_minute = 30.0
var wave_duration = 20.0
var break_intensity = 0.25
var time = 0.0

func _process(delta):
	if GameManager.is_game_over:
		return
	time += delta
	var spawn_rate = initial_spawn_rate + spawn_rate_per_minute * (time / 60.0)
	var sin_wave = sin((time * TAU) / wave_duration)
	var wave_factor = remap(sin_wave, -1.0, 1.0, break_intensity, 1)
	spawn_rate *= wave_factor
	mob_spawner.mobs_per_minute = spawn_rate

