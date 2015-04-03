
extends Node2D

func _ready():
	pass


func _on_AnimationPlayer_finished():
	self.queue_free()
