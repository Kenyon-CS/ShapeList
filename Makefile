# Compiler
CXX = g++
CXXFLAGS = -std=c++11 -Wall

# Directories
SHAPES_DIR = ./shapes
ARRAYLIST_DIR = ./arrayListType

# Output target
TARGET = testshapelist

# Source files
SOURCES = testshapelist.cpp \
          $(ARRAYLIST_DIR)/arrayListType.cpp \
          $(SHAPES_DIR)/shape.cpp \
          $(SHAPES_DIR)/circle.cpp \
          $(SHAPES_DIR)/triangle.cpp \
          $(SHAPES_DIR)/rectangle.cpp

# Object files
OBJS = $(SOURCES:.cpp=.o)

# Header file directories
INCLUDES = -I$(ARRAYLIST_DIR) -I$(SHAPES_DIR)

# Default rule
all: $(TARGET)

# Linking
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET)

# Compilation rules for each source file
%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Clean up object files and the binary
clean:
	rm -f $(OBJS) $(TARGET)

