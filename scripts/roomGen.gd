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
201			:	[-1,-1],
202			:	[-1,-1,-1],
203			:	[-1,-1],
204			:	[-1,-1,-1,-1],
301			:	[-1,-1],
302			:	[-1,-1,-1],
303			:	[-1,-1],
304			:	[-1,-1,-1,-1],
999			:	[-1]
}
	
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
		
		if newGame:
			#print(currentRoom)
			roomGen(-1,currentRoom)
			#print(currentRoom,", ",getRoom(currentRoom)[0])
			#currentRoom = rooms[currentRoom][0] #take the first path out of start
			newGame = false
		else:
			#print("---")
			#print(currentRoom,", ",getRoom(currentRoom)[0])
			#print("ROOM GENERATION")
			roomGen(currentRoom,getRoom(currentRoom)[0]) #take the first path out of your room
			#print(getRoom(currentRoom)[0])
			currentRoom = getRoom(currentRoom)[0] 
			print(currentRoom,", ",getRoom(currentRoom)[0])
			print(rooms.get(getRoom(currentRoom)[0]))
func roomGen(x,y): #roomGen(x,y) takes x: last room ID, and y: new room ID
	print("Left room ",x,"! Now in room ",y,".")
	
	z = rooms.get(y).size() # Get the number of exits to a room given its ID
	path0 = x # path0 will ALWAYS take you back where you came
	print("z = ",z)
	# Check for resource
	if Game.resource < 1:
		pass
		# Lose 1 life
	
	if y == 0:
		rooms[0] = [1,2,3,4]
		
	
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
		#for a in getRoom(y):
			#a = -1
		if steps == goal:
			var randRoom = randomProgressRoom(z)
			var assignMe = pickRandomPath(z)
			# randomly assign a progress room
			getRoom(y).set(assignMe,randRoom)
			popper(randRoom)
		else:
			print(getRoom(y))
			# randomly assign non-progress rooms
			for a in range(len(getRoom(y))):
				
				if getRoom(y)[a] != 0:
					
					getRoom(y)[a] = randomNonProgress(z)
					#print("lol ",a)
					
					popper(a)
					
					
		print(getRoom(y))
	print("Left room ",x,"! Now in room ",y,".")




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
	if roomId >= 200 and roomId <= 299:
		return "deadEnd"
	if roomId == 999:
		return "victory"
	else: 
		return "broken"

func getPathsFromId(y):
	return (rooms.get(y))

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
	randomPath = -1
	while !availableRooms.has(randomPath):
		randomPath = rng.randi_range(100,199)
	return randomPath
	
func randomNonProgress(max):
	var path = max
	# If room is not available and progress, pick a new random
	while !availableRooms.has(path) and getRoomType(path) != "progress":
		path = rng.randi_range(0,500)
		print("path: ",path)
	return path

func randomProgressRoom(max):
	var path = -1
	# If room is not available and not progress, pick a new random
	while !availableRooms.has(path) and getRoomType(path) != "progress":
		path = pickRandomPath(max)
		print("path: ",path)
	return path
