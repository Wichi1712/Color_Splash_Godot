extends Node


func _ready():
	OS.center_window()
	OS.window_fullscreen = true
	global_var.estadoJuego = "menu"
	#print("Estado juego " + str(global_var.estadoJuego))


func _on_PlayBtn_pressed():
	get_tree().change_scene("res://scenes/main.tscn")
	global_var.estadoJuego = "juego"


func _on_ExitBtn_pressed():
	get_tree().quit()
