/* getters/setters are special methods that provides access to read/write the value of a private field without going through the property itself */

class Rectangle {
  double _width;
  double _height;

  Rectangle(this._width, this._height);

  // getters
  double get height => _height;
  double get width => _width;

  // setters
  set setHeight(double newHeight) {
    int minHeight = 10;
    if (newHeight < minHeight) {
      print("All heights must be greater than $minHeight");
      return;
    }
    _height = newHeight;
  }

  set setWidth(double newWidth) {
    int minWidth = 20;
    if (newWidth < minWidth) {
      print("All widths must be greater than $minWidth");
      return;
    }
    _width = newWidth;
  }

  void calculate() {
    double result = _width * _height;
    print(
      "\nThe area of the triangle of height($_height) and width($_width) = $result",
    );
  }
}

void main() {
  Rectangle rect = Rectangle(15, 10);
  rect.calculate();

  print("The height is ${rect.height}");
  print("The width is ${rect.width}");

  rect.setHeight = 6;
  rect.setWidth = 10;
  rect.calculate();

  rect.setHeight = 30;
  rect.setWidth = 50;
  rect.calculate();
}
