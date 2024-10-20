class_name Enemy
extends CharacterBody2D

@export var movement_stats: MovementStats
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var hitbox: Hitbox = $Hitbox
@onready var hurtbox: Hurtbox = $Hurtbox
@onready var flip_anchor: Node2D = $FlipAnchor

func _ready() -> void:
	motion_mode = MOTION_MODE_FLOATING
	assert(movement_stats is MovementStats, "ERROR: enemy movement stats null: " + str(name))
