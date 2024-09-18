CXX = g++
CXXFLAGS = -std=c++11 -I./shapes -I./arrayListType

# Directories
SHAPE_DIR = shapes
ARRAYLIST_DIR = arrayListType
OBJ_DIR = obj

# Files
SHAPE_FILES = $(SHAPE_DIR)/Circle.cpp $(SHAPE_DIR)/Triangle.cpp $(SHAPE_DIR)/Rectangle.cpp
TEST_FILES = testshapelist.cpp

OBJECTS = $(OBJ_DIR)/Circle.o $(OBJ_DIR)/Triangle.o $(OBJ_DIR)/Rectangle.o $(OBJ_DIR)/testshapelist.o

# Create object directory if it doesn't exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Rules to compile individual object files
obj/Circle.o: $(SHAPE_DIR)/circle.cpp
	$(CXX) $(CXXFLAGS) -c $(SHAPE_DIR)/circle.cpp -o obj/Circle.o

$(OBJ_DIR)/%.o: $(SHAPE_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: $(ARRAYLIST_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: %.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Linking all objects to create the executable
testshapelist: $(OBJECTS)
	$(CXX) $(OBJECTS) -o testshapelist

# Clean command
clean:
	rm -rf $(OBJ_DIR) testshapelist
