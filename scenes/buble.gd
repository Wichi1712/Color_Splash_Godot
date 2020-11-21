extends Area2D

#export (Texture) var imagenBurbuja
var velocidad = 200
var cambiaDireccion = false
var randColor
var colorBlack = preload("res://sprites/spr_colorNegro_0.png")
var colorWhite = preload("res://sprites/spr_colorWhite_0.png")
var colorBlue = preload("res://sprites/spr_colorBlue_0.png")
var colorRed = preload("res://sprites/spr_colorRed_0.png")
var colorYellow = preload("res://sprites/spr_colorYellow_0.png")
var arrColor = [colorBlack,colorWhite,colorBlue,colorRed,colorYellow]
var splash = preload("res://scenes/splash.tscn")#.instance()

func _ready():
	randomize()
	randColor = randi() % 5
	#$Sprite.texture = imagenBurbuja
	$Sprite.texture = arrColor[randColor]

func _process(delta):
	position.y += velocidad * delta
	
	#Elimina burbuja si estado de juego es diferente de "juego"
	if global_var.estadoJuego != "juego":
		queue_free()

#Se elimina si esta fuera de escena y ademas su posicion Y es mayor al ancho de la pantalla
#Resta un vida a player
func _on_VisibilityNotifier2D_screen_exited():
	if position.y > get_viewport_rect().size.y:
		#global_var.numLifes -=1
		global_var.restaVida()
		global_var.dibujaCorazones()
		queue_free()
		#print("numLifes", global_var.numLifes)

func _on_buble_area_entered(area):
	if area.is_in_group("bulletPlayer"):
		match randColor:
			0:
				global_var.scoreBlack +=1
				global_var.colorSplash = 0
			1:
				global_var.scoreWhite +=1
				global_var.colorSplash = 1
			2:
				global_var.scoreBlue +=1
				global_var.colorSplash = 2
			3:
				global_var.scoreRed +=1
				global_var.colorSplash = 3
			4:
				global_var.scoreYellow +=1
				global_var.colorSplash = 4
				
		#var splash = spl.instance()
		var spl = splash.instance()
		get_parent().add_child(spl)
		spl.position = self.position


