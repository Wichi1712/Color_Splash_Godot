extends Control

func actualizaScoreTotal(nuevoValor):
	$LabelScoreTotal.text = str(nuevoValor)

func actualizaTime(nuevoValor):
	$LabelTimer.text = str(nuevoValor)


#func actualizaLevel():
#	$Level.text = "Level" + str(global_var.levelGame)
##func actualizaScoreBlack(nuevoValor):
##	$labelScoreBlack.text = str(nuevoValor)


func _on_Exit_button_down():
	get_tree().quit()
