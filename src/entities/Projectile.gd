extends KinematicBody2D

export var speed : float  #Speed in pixels/sec
var velocity #Projectile's velocity vector
var direction #Direction the projectile is moving
var damage #Amount of damage the projectile does
export var rotates : bool #Whether or not the projectile rotates

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(_delta):
	#Sets projectile direction
	if(rotates):
		if(direction == "right"):
			$SpritePivot/Sprite.set_flip_h(true)
		elif(direction == "up"):
			$SpritePivot.rotation_degrees = 90
		elif(direction == "down"):
			$SpritePivot.rotation_degrees = 270
	
	#Moves projectile
	velocity = Vector2.ZERO
	if(direction == "right"):
		velocity = Vector2(1, 0)
	elif(direction == "left"):
		velocity = Vector2(-1, 0)
	elif(direction == "down"):
		velocity = Vector2(0, 1)
	elif(direction == "up"):
		velocity = Vector2(0, -1)
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)

#if the projectile hits anything it disappears
func _on_Hitbox_area_shape_entered(area_id, area, area_shape, self_shape):
	queue_free()
	
func _on_ProjectileHitbox_area_shape_entered(area_id, area, area_shape, self_shape):
	queue_free()
