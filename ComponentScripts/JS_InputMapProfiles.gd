extends Node
class_name JS_InputMapProfiles
# Script to be Used as a component under JoypadSupport to store differente mapping profiles.
# Each profile should be an array of JS_InputMapAction, which is a custom resource of JoypadSupport
# that stores an action name, a type of input and an event_code so that events can be easily
# added/removed from InputMap. Check the JS_InputMapAction.gd for more.

var default_keyboard: Array = [
	JS_InputMapAction.new("boost", JS_InputMapAction.Types.KEY, KEY_UP),
	JS_InputMapAction.new("dash", JS_InputMapAction.Types.KEY, KEY_RIGHT),
	JS_InputMapAction.new("shoot", JS_InputMapAction.Types.KEY, KEY_SPACE),
]

var default_joypad = [
	JS_InputMapAction.new("boost", JS_InputMapAction.Types.JOYPAD_BUTTON, JOY_DPAD_UP),
	JS_InputMapAction.new("dash", JS_InputMapAction.Types.JOYPAD_BUTTON, JOY_DPAD_RIGHT),
	JS_InputMapAction.new("shoot", JS_InputMapAction.Types.JOYPAD_BUTTON, JOY_SONY_X),
]


func has_profile(profile_name : String) -> bool:
	var profile_found: = false
	
	if profile_name in self:
		profile_found = true
	else:
		push_error("Undefined input profile of name: %s"%[profile_name])
		assert(false)
	
	if self.get(profile_name).size() == 0:
		push_warning("Profile %s is empty! Is that intentional?"%[profile_name])
	
	return profile_found
