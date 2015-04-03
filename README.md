# dynamic_distortion_shader_effect
A dynamic shader to use from Godot Engine projects

## Usage
Put the /effect01 on your project, and append to distortion.scn to you 2D or 3D nodes.

### Commands:
#### add( sprite,time_out,fade_time,[x=0],[y=0])
Add a sprite to life for time_out and after it, fade to die in fade_time. All in secconds.
x,y cordinates are optional. Using float values (-1.0 ~1.0) result in a proportional posiotion. Using integers is absolute position

#### remove(sprite)
Remove a sprite, without call queue_free()

#### add_effect(name)
Add an effect from list:
. "rain" - rain effect

#### remove_effect(name)
Remove an effect from previus list.

## Effect in action
The effect can be view at [Youtube](http://youtu.be/Z0_eCBK7EqI)

## Legal
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Wild Witch Project</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.wildwitchproject.com/" property="cc:attributionName" rel="cc:attributionURL">Marcos Augusto Bitetti</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="http://www.wildwitchproject.com/" rel="dct:source">http://www.wildwitchproject.com/</a>.<br />Permissions beyond the scope of this license may be available at <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.wildwitchproject.com/p/direitos-da-obra.html" rel="cc:morePermissions">http://www.wildwitchproject.com/p/direitos-da-obra.html</a>.


