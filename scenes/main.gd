extends Node2D

var tamanoPantalla
var bub = preload("res://scenes/buble.tscn")

var bg1 = preload("res://backgrounds/bg_1.png")
var bg2 = preload("res://backgrounds/bg_2.png")
var bg3 = preload("res://backgrounds/bg_3.png")
var bgGameOver = preload("res://sprites/spr_gameOver_0.png")

#export (PackedScene) var congratulation
#export (Texture) var congrat
#var congrat = preload("res://sprites/spr_congratulation_0.png")

func _ready():
	#OS.window_size.x = 500
	OS.center_window()
	OS.window_fullscreen = true#pantalla completa
	tamanoPantalla = get_viewport_rect().size
	randomize()
	
	#Reproduce audio de fondo
	AudioGame()
	
	$HUD.actualizaTime("   " + str(global_var.reloj))
	global_var.dibujaCorazones()
	
	#Score total
#	global_var.scoreColorTotal = 0
#	$HUD.actualizaScoreTotal("Total: "+str(global_var.scoreColorTotal))

func _process(delta):
	levelControl()
	
	if global_var.numLifes <= 0 && global_var.estadoJuego == "juego":
		gameOver()
		#global_var.gameOverMove = true
		#print("Ejecutando func game over")
	
	#SCORE DE COLORES
	#Score total de colores es la suma de todos los colores
	global_var.scoreColorTotal =\
		global_var.scoreBlack + global_var.scoreBlue +\
		global_var.scoreRed + global_var.scoreWhite +\
		global_var.scoreYellow
		
	$HUD.actualizaScoreTotal("Total: "+str(global_var.scoreColorTotal))#Total colores
	$HUD/labelScoreBlack.text = "Black: " + str(global_var.scoreBlack)
	$HUD/labelScoreWhite.text = "White: " + str(global_var.scoreWhite)
	$HUD/labelScoreBlue.text = "Blue: " + str(global_var.scoreBlue)
	$HUD/labelScoreRed.text = "Red: " + str(global_var.scoreRed)
	$HUD/labelScoreYellow.text = "Yellow: " + str(global_var.scoreYellow)
	$HUD/Level.text = "Level: " + str(global_var.levelGame)

func AudioGame():
	var AudioScene = AudioStreamPlayer.new()
	AudioScene.stream = load("res://sound/Buble.ogg")
	add_child(AudioScene)
	AudioScene.volume_db = -5
	AudioScene.play()

func crearBurbuja():
	var buble = bub.instance()
	get_parent().add_child(buble)#Agregamos intancia a la escena
	#limites de posicion de burbuja
	buble.position.x = rand_range(90, tamanoPantalla.x-275)
	buble.position.y = 0

#Crea burbujas cada cierto tiempo y solo si
#el estado de juego es "juego".
func _on_Timer_timeout():
	if global_var.estadoJuego == "juego":
		crearBurbuja()


func _on_gameTimer_timeout():
	global_var.reloj += 1#Sumamos 1 a reloj
	$HUD.actualizaTime("   " + str(global_var.reloj))#Actualizamos tiempo


func gameOver():
#	var game_over = gOver.instance()
#	get_parent().add_child(game_over)
	#game_over.rect_position.y = 150
	
	#$TextureRect.texture = bgGameOver#Cambia fondo
	#$TextureRect.rect_position.x = 90
	#$TextureRect.rect_position.y = 150
	$gameTimer.stop()#Timer para actualizar reloj
	global_var.estadoJuego = "gameOver"
	#print("Game Over")

func levelControl():
	if (global_var.levelGame == 1 && global_var.scoreColorTotal >= 10):
		global_var.levelGame +=1
		#congratulation()#Solo para prueba
	elif (global_var.levelGame == 2 && global_var.scoreColorTotal >= 20):
		global_var.levelGame +=1
	elif (global_var.levelGame == 3 && global_var.scoreColorTotal >= 30):
		global_var.levelGame +=1
		$TextureRect.texture = bg1#Cambia fondo
		$Timer.wait_time = 2#Incrementa la velocidad para crear burbujas
	elif (global_var.levelGame == 4 && global_var.scoreColorTotal >= 40):
		global_var.levelGame +=1
	elif (global_var.levelGame == 5 && global_var.scoreColorTotal >= 50):
		global_var.levelGame +=1
	elif (global_var.levelGame == 6 && global_var.scoreColorTotal >= 60):
		global_var.levelGame +=1
		$TextureRect.texture = bg2
		$Timer.wait_time = 1#Incrementa la velocidad para crear burbujas
	elif (global_var.levelGame == 7 && global_var.scoreColorTotal >= 70):
		global_var.levelGame +=1
	elif (global_var.levelGame == 8 && global_var.scoreColorTotal >= 50):
		global_var.levelGame +=1
	elif (global_var.levelGame == 9 && global_var.scoreColorTotal >= 90):
		global_var.levelGame +=1
		$TextureRect.texture = bg3
		$Timer.wait_time = 0.5#Incrementa la velocidad para crear burbujas
	elif (global_var.levelGame == 10 && global_var.scoreColorTotal >= 100):
		global_var.levelGame +=1
		congratulation()


func congratulation():
	global_var.estadoJuego = "congratulation"
	
	#Muestra texto
	var TextCongratulation = Label.new()
	TextCongratulation.text = "Gracias por Jugar".to_upper()
	#$TextureRect.add_child(TextCongratulation)
	TextCongratulation.rect_position = Vector2(150,200)
	#TextCongratulation.set_global_position(Vector2(250,400), true)
	
	#Cambia fondo
	var congrat = load("res://sprites/spr_congratulation_0.png")
	$TextureRect.texture = congrat
	$TextureRect.rect_position = Vector2(100,200)
	$TextureRect.add_child(TextCongratulation)
	
	#Detiene reloj
	$gameTimer.stop()
	
	#Creacion de un timer para cerrar el juego
	var finalTimer = Timer.new()
	add_child(finalTimer)
	finalTimer.set_autostart(true)
	finalTimer.set_one_shot(true)
	finalTimer.set_wait_time(6)
	finalTimer.start()
	finalTimer.connect("timeout", get_tree(), "quit")

#func exitGame():
#	get_tree().quit()
