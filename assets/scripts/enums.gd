extends Node

#global enums, to be used anywhere

enum Char { NICK, NOUR, SUWAN }
enum Mode { WALK, TALK }
enum World { REAL, DREAM }          #can't be named 'plane' b/c Plane is an existing type 
enum WalkDir { LEFT, RIGHT, UP, DOWN }
enum Animation { WALK, IDLE }   #todo. do we want each combo ex walk_left idle_right or use with WalkDir