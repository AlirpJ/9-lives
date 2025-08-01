extends Node

var rng = RandomNumberGenerator.new()
var randomNum = -1
var randomPath = -1

var availableRooms = []
var steps = 0
var goal = 99999
var popped
var z = 0

var path0
var path1 = -1
var path2 = -1
var path3 = -1
var path4 = -1

var persistentRooms = []

var rooms = {
# tileID 	: paths
0			:	[-1,-1,-1,-1],
1			:	[-1,-1],
2			:	[-1,-1,-1],
201			:	[-1,-1]
}

# roomGen is called when you click to enter a new room
func roomGen(x,y): #roomGen(x,y) takes x: last room ID, and y: new room ID
	
	z = getPathsFromId(y).length() # Get the number of exits to a room given its ID
	path0 = x # path0 will ALWAYS take you back where you came
	
	# Check for resource
	if Game.resource < 1:
		pass
		# Lose 1 life
	
	# Check for victory
	if getRoomType(y) == "victory":
		pass
		# Go to Win Screen!
	
	# Loop Logic
	if getRoomType(y) == "loop":
		for a in getRoom(y):
			a=-1
		getRoom(y).set(z,0)
		# randomly assign non-progress rooms
		for a in getRoom(y):
			if a != 0:
				a = randomNonProgress(z)
				popper(a)
				
	# Dead End? Turn Back!
	if getRoomType(y) == "deadEnd":
		path0 = x
	
	# Progress Logic
	if getRoomType(y) == "progress":
		# randomly assign non-progress rooms
		for a in getRoom(y):
			if a != 0:
				a = randomNonProgress(z) 
				popper(a)
	
	# Corridor logic
	if getRoomType(y) == "corridor":
		for a in getRoom(y):
			a = -1
		if steps == goal:
			var randRoom = randomProgressRoom(z)
			var assignMe = pickRandomPath(z)
			# randomly assign a progress room
			getRoom(y).set(assignMe,randRoom)
			popper(randRoom)
		else:
			# randomly assign non-progress rooms
			for a in getRoom(y):
				if a != 0:
					a = randomNonProgress(z)
					popper(a)




### HELPER FUNCTIONS ###

func getRoom(roomId):
	return get(rooms)

func getRoomType(roomId):
	# Rooms:
	# 0 = Start Room
	# 1-99 = Corridor Rooms
	# 100-199 = Progress Rooms
	# 200-299 = Loop Rooms
	# 300-399 = Dead Ends
	# 999 = Exit/Victory Room
	if roomId == 0:
		return "start"
	if roomId > 0 and roomId <= 99:
		return "corridor"
	if roomId >= 100 and roomId <= 199:
		return "progress"
	if roomId >= 200 and roomId <= 299:
		return "loop"
	if roomId >= 200 and roomId <= 299:
		return "deadEnd"
	if roomId == 999:
		return "victory"
	else: 
		return "broken"

func getPathsFromId(y):
	return get(rooms.get(y))

func popper(removeMe):
	popped = removeMe
	if availableRooms.has(removeMe):
		availableRooms.erase(removeMe)
	return popped




# Step Helper Functions

func incrementSteps():
	steps += 1

func getSteps():
	return steps




# Random number pickers

func randomProgress():
	randomize()
	randomNum = rng.randi_range(0,9)
	return randomNum

func pickRandomPath(max):
	randomize()
	randomPath = rng.randi_range(0,max)
	return randomPath
	
func randomNonProgress(max):
	var path = -1
	# If room is not available and progress, try again
	while !availableRooms.has(path) and getRoomType(path) == "progress":
		path = pickRandomPath(max)
	return path

func randomProgressRoom(max):
	var path = -1
	# If room is not available and progress, try again
	while !availableRooms.has(path) and getRoomType(path) != "progress":
		path = pickRandomPath(max)
	return path
