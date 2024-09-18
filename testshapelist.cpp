#include "arrayListType.h"  // Include the arrayListType header
#include "circle.h"         // Include Shape subclasses
#include "triangle.h"
#include "rectangle.h"

int main() {
    // Create an arrayListType of shapes
    arrayListType<Shape*> shapeList(10);  // Assuming size 10

    // Create various shapes
    Circle* c1 = new Circle(5.0);         // Circle with radius 5.0
    Rectangle* r1 = new Rectangle(4.0, 6.0);  // Rectangle with width 4.0 and height 6.0
    Triangle* t1 = new Triangle(3.0, 4.0); // Triangle with sides 3.0, 4.0

    // Add shapes to the arrayListType
    shapeList.insert(c1);
    shapeList.insert(r1);
    shapeList.insert(t1);

    // Display the shapes in the list
    for (int i = 0; i < shapeList.listSize(); i++) {
        shapeList[i]->describe();  // Assuming print is a method for Shape objects
    }

    // Test other operations: remove a shape, search for a shape, etc.
    shapeList.remove(c1);  // Remove the second shape (r1)

    // Display the shapes in the list
    cout << "After removing circle\n";
    for (int i = 0; i < shapeList.listSize(); i++) {
        shapeList[i]->describe();  // Assuming print is a method for Shape objects
    }

    // Clean up memory
    delete c1;
    delete r1;
    delete t1;

    return 0;
}
