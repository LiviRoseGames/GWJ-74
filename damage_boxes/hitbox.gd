class_name Hitbox
extends Area2D

@export var damage: = 1.0
@export var is_storing_target: bool = false

var knockback: = Vector2.ZERO
var stored_targets: = []

signal hit_hurtbox(hurtbox: Hurtbox)

func _ready() -> void:
	area_entered.connect(_on_hurtbox_entered)

func clear_stored_targets() -> void:
	stored_targets.clear()

func _on_hurtbox_entered(hurtbox: Hurtbox) -> void:
	assert(hurtbox is Hurtbox, "A hitbox is colliding with something other than a hurtbox.")
	
	if hurtbox.is_invincible: return
	if is_storing_target:
		if hurtbox in stored_targets:
			return
		else:
			stored_targets.append(hurtbox)
	
	hit_hurtbox.emit(hurtbox)
	hurtbox.hurt.emit(self)
