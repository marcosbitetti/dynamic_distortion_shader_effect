#########################################################################
# distortion.gd                                                         #
#########################################################################
#                        This file is part of:                          #
#                         WILD WITCH PROJECT                            #
#                     http://www.wildwitchproject/                      #
#########################################################################
#                             CC-BY-SA                                  #
#   Wild Witch Project by Marcos Augusto Bitetti is licensed under a    #
#   Creative Commons Attribution-ShareAlike 4.0 International License.  #
#   Based on a work at http://www.wildwitchproject.com/.                #
#   Permissions beyond the scope of this license may be available at    #
#   http://www.wildwitchproject.com/p/direitos-da-obra.html.            #
#########################################################################

extends TextureFrame

############
# Elementos
############

const Rain = preload('res://effect01/chuva/Gota.scn')

class Element:
	var sprite
	var time_out
	var fade_pass
	
	func _init(sprite,time_out,fade_time):
		self.sprite = sprite
		self.time_out = time_out
		self.fade_pass = 1.0 / fade_time


class RainControl:
	var _tipo = 1 # rain
	var delay = 0.14
	var time = 0
	var main
	
	func _init(main):
		self.main = main
	
	func update(delta):
		time -= delta
		if time<=0:
			time = delay + rand_range(0.0, delay)
			main.add( Rain.instance() ,4,1, rand_range(-1.0,1.0),rand_range(-1.0,1.0))


# Size of texture if screen / ratio
# to improve performance
export(int) var ratio = 2

var texture
var background
var elements = Array()
var rec = Rect2()
var effects = Array()

# Alias to add element to array
func add(sprite,time_out,fade_time,x=0,y=0):
	if (x>1 or y>1) and (x==int(x)):
		sprite.set_pos(Vector2( x, y ))
	else:
		var size = rec.size * 0.5
		sprite.set_pos(Vector2( size.x + size.x*x, size.y + size.y*y ))
	elements.push_back( Element.new(sprite,time_out,fade_time) )
	background.add_child(sprite)

# Alias to remove element to array
# This function not destroy element
func remove(sprite):
	for item in elements:
		if item.sprite == sprite:
			elements.remove(item)
			pass
			

func add_effect(name):
	if name=='rain':
		effects.push_back( RainControl.new(self) )

func remove_effect(name):
	var tp = 0
	if name=='rain':
		tp = 1
		
	for ef in effects:
		if ef._tipo == tp:
			effects.erase(ef)
			pass

func _process(delta):
	# process effects
	for ef in effects:
		ef.update(delta)
		
	# process elements
	for item in elements:
		item.time_out -= delta
		if item.time_out<=0:
			var a = item.sprite.get_opacity()
			a -= item.fade_pass*delta
			item.sprite.set_opacity(a)
			if a<=0.01:
				elements.erase(item)
				item.sprite.queue_free()
			

func _ready():
	var viewport = get_node("Viewport")
	
	# adjust
	rec = get_viewport().get_rect()
	rec.size /= ratio
	viewport.set_rect( rec )
	get_node("Viewport/Control/Camera2D").set_pos( rec.size / 2 )
	
	# set texture base
	texture = viewport.get_render_target_texture()
	self.set_texture(texture)
	
	background = get_node("Viewport/Control/TextureFrame")
	background.set_size( self.get_size() )
	
	
	
	#add(get_node("Viewport/Control/TextureFrame/Sprite"),2,4)
	#add(get_node("Viewport/Control/TextureFrame/Sprite 2"),2,4, 0.8,-0.7)
	#add_effect('rain')

	set_process(true)
