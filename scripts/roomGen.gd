extends Node

var rng = RandomNumberGenerator.new()
var randomNum = -1
var randomPath = -1

var availableRooms = [0,1,2,3,4,5,6,101,104,201,202,203,204,301,302,303,304,999]
var steps = 0
var goal = 99999
var popped
var z = 0

var newGame = true
var currentRoom = 0
var lastProgress = 0

var path0
var path1 = -1
var path2 = -1
var path3 = -1
var path4 = -1

var persistentRooms = []

var rooms = {
# tileID 	: paths
0			:	[1,2,3,4],
1			:	[-1,-1],
2			:	[-1,-1,-1],
3			:	[-1,-1],
4			:	[-1,-1,-1,-1],
5			:	[-1,-1,-1,-1],
6			:	[-1,-1,-1,-1],
101			:	[-1,-1],
102			:	[-1,-1,-1],
103			:	[-1,-1],
104			:	[-1,-1,-1,-1],
201			:	[-1],
202			:	[-1],
203			:	[-1],
204			:	[-1],
301			:	[-1,-1],
302			:	[-1,-1,-1],
303			:	[-1,-1],
304			:	[-1,-1,-1,-1],
999			:	[-1]
}

var foundRooms = {}
	
# Rooms:
# 0 = Start Room
# 1-99 = Corridor Rooms
# 100-199 = Progress Rooms
# 200-299 = Loop Rooms
# 300-399 = Dead Ends
# 999 = Exit/Victory Room

# roomGen is called when you click to enter a new room
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		print("Current Room: ",currentRoom)
		print("Options: ",rooms[currentRoom])

func roomGen(x,y): #roomGen(x,y) takes x: last room ID, and y: new room ID
	if !(rooms[y].has(-1)):
		"been here!"
		currentRoom = y
		return
	
	z = rooms.get(y).size() # Get the number of exits to a room given its ID
	path0 = x # path0 will ALWAYS take you back where you came
	

	
	# Start room
	if y <= 0:
		rooms[0] = [1,2,3,4]
	
	# Check for victory
	if getRoomType(y) == "victory":
		pass
		# Go to Win Screen!
	
	# Loop Logic
	if getRoomType(y) == "loop":
		lastProgress 
		var randomRoomChoice = (getRoom(y).pick_random())
		var theIndex = getRoom(y).find(randomRoomChoice)
		getRoom(y)[theIndex] = lastProgress
		for a in range(len(getRoom(y))):
				var tempVar = -1
				if getRoom(y)[a] != 0:
					tempVar = randomNonProgress(z)
					getRoom(y)[a] = tempVar
					popper(tempVar)
				
	# Dead End? Turn Back!
	if getRoomType(y) == "deadEnd":
		for a in range(len(getRoom(y))):
				getRoom(y)[a] = x

	
	# Progress Logic
	if getRoomType(y) == "progress":
		lastProgress = y
		# randomly assign non-progress rooms
		for a in getRoom(y):
			if a != 0:
				a = randomNonProgress(z) 
				popper(a)
	
	# Corridor logic
	if getRoomType(y) == "corridor":
		#for a in getRoom(y):
			#a = -1
		if steps == goal:
			var randRoom = randomProgressRoom(z)
			var assignMe = pickRandomPath(z)
			# randomly assign a progress room
			getRoom(y).set(assignMe,randRoom)
			popper(randRoom)
		else:
			# randomly assign non-progress rooms
			for a in range(len(getRoom(y))):
				var tempVar = -1
				if getRoom(y)[a] != 0:
					tempVar = randomNonProgress(z)
					getRoom(y)[a] = tempVar
					popper(tempVar)
					
	currentRoom = y				






### HELPER FUNCTIONS ###

func getRoom(roomId):
	return rooms.get(roomId)

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
	if roomId >= 300 and roomId <= 399:
		return "deadEnd"
	if roomId == 999:
		return "victory"
	else: 
		return "broken"

func getPathsFromId(y):
	return (rooms.get(y))

func popper(removeMe):
	availableRooms.erase(removeMe)
	foundRooms[removeMe] = rooms[removeMe]
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
	randomPath = -1
	while !availableRooms.has(randomPath):
		randomPath = rng.randi_range(100,199)
	return randomPath
	
func randomNonProgress(max):
	var path = max
	var tempArray = []
	for tempPath in availableRooms:
		if getRoomType(tempPath) != "progress" and tempPath != 999:
			tempArray.append(tempPath)
	path = tempArray.pick_random()

	return path

func randomProgressRoom(max): # return once path is in available rooms and path is a progress
	var path = max
	var tempArray = []
	for tempPath in availableRooms:
		if getRoomType(tempPath) == "progress" or tempPath==999:
			tempArray.append(tempPath)
	path = tempArray.pick_random()
	return path
