extends Control

func _process(delta):
	if global_var.estadoJuego == "gameOver":
		if global_var.gameOverMove:
			move()
			print("gameOver " + str(global_var.gameOverMove))

func move():
	if global_var.gameOverMove:
		$Efect.interpolate_property($Botons/CanvasLayer/TextureRect,"rect_position",$Botons/CanvasLayer/TextureRect.rect_position,$Botons/CanvasLayer/TextureRect.rect_position+Vector2(550,0),0.5,Tween.TRANS_BACK,Tween.EASE_IN)
		$Efect.start()
		global_var.gameOverMove = false
		print("opcion 1")
	else:
	#if global_var.gameOverMove == false:
		#if $Botons/CanvasLayer/TextureRect.rect_position.x >= 100:
		#$Efect.stop_all()
		#global_var.gameOverMove = true
		$Efect.interpolate_property($Botons/CanvasLayer/TextureRect,"rect_position",$Botons/CanvasLayer/TextureRect.rect_position,$Botons/CanvasLayer/TextureRect.rect_position-Vector2(550,0),0.5,Tween.TRANS_BACK,Tween.EASE_IN)
		$Efect.start()
		global_var.gameOverMove = true
		print("opcion 2")
	print("Ejecutando move")


#-------------BUTTONS------------------------------------
func _on_Reload_pressed():
	global_var.reiniciaDatos()
	move()
	get_tree().reload_current_scene()
	#get_tree().change_scene("res://scenes/main.tscn")
	global_var.estadoJuego = "juego"
	#get_parent().get_node("Timer").wait_time = 3#Estado inicial de Timer
	#queue_free()#Elimina instancia de game over

func _on_Exit_pressed():
	get_tree().quit()

func _on_Menu_pressed():
	#Reinicia valores del juego
	global_var.reiniciaDatos()
	get_tree().paused = false
	get_tree().change_scene("res://scenes/menu.tscn")
	#global_var.scoreColorTotal = 0
