extends Resource
class_name Transition

enum TransitionOption { FLIP_X = 1, FLIP_Y = 2, INVERT = 4 }

# warning-ignore:unused_class_variable
export(float) var duration : float = 1
# warning-ignore:unused_class_variable
export(Color, RGBA) var transition_color : Color
# warning-ignore:unused_class_variable
export(Texture) var transition_map : Texture
# warning-ignore:unused_class_variable
export(TransitionOption,FLAGS) var transition_in_option 
# warning-ignore:unused_class_variable
export(TransitionOption,FLAGS) var transition_out_option 

