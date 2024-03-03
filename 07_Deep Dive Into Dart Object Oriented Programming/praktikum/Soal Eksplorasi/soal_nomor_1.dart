void main() {
  Circle circle = Circle(28);
  Square square = Square(4);
  Rectangle rectangle = Rectangle(5, 4);

  print('Luas bangun datar lingkaran = ${circle.getArea()}');
  print('Keliling bangun datar lingkaran = ${circle.getPerimeter()}');
  print('Luas bangun datar persegi = ${square.getArea()}');
  print('Keliling bangun datar persegi = ${square.getPerimeter()}');
  print('Luas bangun datar persegi panjang = ${rectangle.getArea()}');
  print('Keliling bangun datar persegi panjang = ${rectangle.getPerimeter()}');
}

class Shape {
  int getArea() {
    return 0;
  }

  int getPerimeter() {
    return 0;
  }
}

class Circle implements Shape {
  int radius;

  Circle(this.radius);

  @override
  int getArea() {
    return (3.14 * radius * radius).toInt();
  }

  @override
  int getPerimeter() {
    return (2 * 3.14 * radius).toInt();
  }
}

class Square implements Shape {
  int side;

  Square(this.side);

  @override
  int getArea() {
    return side * side;
  }

  @override
  int getPerimeter() {
    return 4 * side;
  }
}

class Rectangle implements Shape {
  int width;
  int height;

  Rectangle(
    this.width,
    this.height,
  );

  @override
  int getArea() {
    return width * height;
  }

  @override
  int getPerimeter() {
    return 2 * (width + height);
  }
}
