CXX = clang++
CXXFLAGS = -std=c++11 -Wall
TARGET = testshapelist

OBJS = ShapeList.o shape.o circle.o triangle.o rectangle.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

ShapeList.o: testshapelist.cpp shapes/shape.h shapes/circle.h shapes/triangle.h shapes/rectangle.h
	$(CXX) $(CXXFLAGS) -c ShapeList.cpp

shape.o: shapes/shape.cpp shapes/shape.h
	$(CXX) $(CXXFLAGS) -c shapes/shape.cpp

circle.o: shapes/circle.cpp shapes/circle.h shapes/shape.h
	$(CXX) $(CXXFLAGS) -c shapes/circle.cpp

triangle.o: shapes/triangle.cpp shapes/triangle.h shapes/shape.h
	$(CXX) $(CXXFLAGS) -c shapes/triangle.cpp

rectangle.o: shapes/rectangle.cpp shapes/rectangle.h shapes/shape.h
	$(CXX) $(CXXFLAGS) -c shapes/rectangle.cpp

clean:
	rm -f $(OBJS) $(TARGET)
