extends Area2D

const VELOCIDAD = 500
var direccion = Vector2.ZERO

#Señales
#signal aumentarTiempo

func _ready():
	pass

func inicio(pos, dir):
	rotation = dir
	position = pos
	direccion = Vector2(VELOCIDAD, 0).rotated(rotation)

func _process(delta):
	#position.y -= velocidad * delta
	translate(direccion * delta)



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_bulletPlayer_area_entered(area):
	if area.is_in_group("solido"):
		queue_free()
		
	if area.is_in_group("burbuja"):
		#emit_signal("aumentarTiempo")
		#global_var.reloj +=5#Aumenta el tiempo
		area.queue_free()
		queue_free()
