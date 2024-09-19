CXX = g++
CXXFLAGS = -std=c++11 -I./shapes -I./arrayListType

# Directories
SHAPE_DIR = shapes
ARRAYLIST_DIR = arrayListType
OBJ_DIR = obj

# Files
SHAPE_FILES = $(SHAPE_DIR)/circle.cpp $(SHAPE_DIR)/triangle.cpp $(SHAPE_DIR)/rectangle.cpp
TEST_FILES = testshapelist.cpp

OBJECTS = $(OBJ_DIR)/circle.o $(OBJ_DIR)/triangle.o $(OBJ_DIR)/rectangle.o $(OBJ_DIR)/testshapelist.o

all: $(OBJ_DIR) testshapelist

# Create object directory if it doesn't exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Rules to compile individual object files
obj/circle.o: $(SHAPE_DIR)/circle.cpp
	$(CXX) $(CXXFLAGS) -c $(SHAPE_DIR)/circle.cpp -o obj/circle.o

obj/rectangle.o: $(SHAPE_DIR)/rectangle.cpp
	$(CXX) $(CXXFLAGS) -c $(SHAPE_DIR)/rectangle.cpp -o obj/rectangle.o

obj/triangle.o: $(SHAPE_DIR)/triangle.cpp
	$(CXX) $(CXXFLAGS) -c $(SHAPE_DIR)/triangle.cpp -o obj/triangle.o


$(OBJ_DIR)/%.o: %.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Linking all objects to create the executable
testshapelist: $(OBJECTS)
	$(CXX) $(OBJECTS) -o testshapelist

# Clean command
clean:
	rm -rf $(OBJ_DIR) testshapelist
