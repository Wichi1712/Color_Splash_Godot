extends Area2D

var splashBlack = preload("res://sprites/spr_splashBlack_0.png")
var splashWhite = preload("res://sprites/spr_splashWhite_0.png")
var splashBlue = preload("res://sprites/spr_splashBlue_0.png")
var splashRed = preload("res://sprites/spr_splashRed_0.png")
var splashYellow = preload("res://sprites/spr_splashYellow_0.png")
var randSplash = [splashBlack,splashWhite,splashBlue,splashRed,splashYellow]

func _ready():
	$Sprite.texture = randSplash[global_var.colorSplash]
	randomize()
	rotation  = randi() % 10
	$AudioSplash.play()


func _on_Timer_timeout():
	queue_free()
