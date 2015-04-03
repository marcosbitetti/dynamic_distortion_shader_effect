#########################################################################
# main.gd                                                               #
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

extends Node



func _ready():
	
	# add some effect sistem
	get_node('distortion').add_effect('rain')
	
	# add object with absolute coords using integers : x = 2~n    y = 2~n
	get_node("distortion").add( preload('suzane.scn').instance(), 5,2, 200,100)
	
	# add object with relative coords using floats : x = -1.0~1.0    y = -1.0~1.0
	get_node("distortion").add( preload('suzane.scn').instance(), 5,2, 0.75,0.7)
