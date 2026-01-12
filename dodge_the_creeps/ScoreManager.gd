extends Node

const SAVE_PATH = "user://scores.csv"

func save_score(player_name: String, score: float, enemy_speed: float):
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ_WRITE)
	
	# If file doesnt exist or is empty, create it
	if file == null:
		file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
		file.store_line("Player,Score, EnemySpeed")
	else:
		# Move to end of file to append
		file.seek_end()
	
	# Append new score as CSV row
	var csv_line = "%s,%d,%.1f" % [player_name, int(score), enemy_speed]
	file.store_line(csv_line)
	file.close()
	
	print("Score saved: %s" % csv_line)
