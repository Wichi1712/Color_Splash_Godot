extends Node

var life = preload("res://scenes/player/Life.tscn")
var listaVidas = []
#var diccionario = {"ColorPlayer":"Blanco", "Nivel":"Facil", "Velocidad":"1"}
var reloj = 0
var scoreBlack = 0
var scoreWhite = 0
var scoreBlue = 0
var scoreRed = 0
var scoreYellow = 0
var scoreColorTotal = 0

var colorSplash = 0
var numLifes = 3
var estadoJuego = ""
var levelGame = 1
var gameOverMove = true

func reiniciaDatos():
	reloj = 0
	scoreBlack = 0
	scoreWhite = 0
	scoreBlue = 0
	scoreRed = 0
	scoreYellow = 0
	numLifes = 3
	scoreColorTotal = 0
	levelGame = 1


func dibujaCorazones():
	var distancia = 33
	for i in numLifes:
		var Lifes = life.instance()
		get_parent().add_child(Lifes)
		Lifes.global_position.y = 605
		Lifes.position.x = 670 + distancia * i
		listaVidas.append(Lifes)
		

func restaVida():
	numLifes -=1
	var vidasAnteriores = get_tree().get_nodes_in_group("vidas")
	for a in vidasAnteriores:
		a.queue_free()
