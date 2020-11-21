extends Control
func _process(delta):
	#Solo se llama a la funcion pausa cuando este en la posicion
	#-450 ó 100 con respecto al eje X.
	if Input.is_action_just_pressed("ui_cancel") && global_var.estadoJuego != "gameOver":
		if $Botons/CanvasLayer/TextureRect.rect_position.x == -450 or $Botons/CanvasLayer/TextureRect.rect_position.x == 100:
			pausa()

	#print(get_tree().paused)
	#print("Estado juego " + str(global_var.estadoJuego))


func pausa():
	if get_tree().paused == true:
		get_tree().paused = false
		$Efect.interpolate_property($Botons/CanvasLayer/TextureRect,"rect_position",$Botons/CanvasLayer/TextureRect.rect_position,$Botons/CanvasLayer/TextureRect.rect_position-Vector2(550,0),0.5,Tween.TRANS_BACK,Tween.EASE_IN)
		$Efect.start()
	else:
		get_tree().paused = true
		$Efect.interpolate_property($Botons/CanvasLayer/TextureRect,"rect_position",$Botons/CanvasLayer/TextureRect.rect_position,$Botons/CanvasLayer/TextureRect.rect_position+Vector2(550,0),0.5,Tween.TRANS_BACK,Tween.EASE_IN)
		$Efect.start()




func _on_Resume_pressed():
	pausa()

func _on_Exit_pressed():
	get_tree().quit()


func _on_Menu_pressed():
	#Reinicia valores del juego
	global_var.reiniciaDatos()
	get_tree().paused = false
	get_tree().change_scene("res://scenes/menu.tscn")
