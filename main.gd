extends Node2D

var score: int = 0
var time_left: int = 30 # 制限時間（秒）
const MAX_SCORE := 3    # コインの総数（今置いている数に合わせる）

func _ready() -> void:
	$ScoreLabel.text = "Score: %d" % score
	$TimeLabel.text = "Time: %d" % time_left

func add_score(amount: int) -> void:
	score += amount
	$ScoreLabel.text = "Score: %d" % score

	if score >= MAX_SCORE:
		_game_clear()

func _on_game_timer_timeout() -> void:
	time_left -= 1
	if time_left < 0:
		time_left = 0
	$TimeLabel.text = "Time: %d" % time_left

	if time_left == 0:
		_game_over()

func _game_over() -> void:
	get_tree().paused = true
	$GameOverLabel.visible = true
	$RetryButton.visible = true

func _game_clear() -> void:
	get_tree().paused = true
	$ClearLabel.visible = true
	$RetryButton.visible = true
	$GameTimer.stop()


func _on_retry_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
