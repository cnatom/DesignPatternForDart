abstract class Graphic {
  // 将add和remove添加默认实现，这样所有的子类都可以使用它们
  void add(Graphic graphic) {
    throw UnimplementedError();
  }

  // 移除图形
  void remove(Graphic graphic) {
    throw UnimplementedError();
  }

  // 渲染图形
  void render();
}

class Circle extends Graphic {
  @override
  // 渲染圆形
  void render() {
    print("Render: Circle");
  }
}

class Rectangle extends Graphic {
  @override
  // 渲染矩形
  void render() {
    print("Render: Rectangle");
  }
}

// Group 可以包含任意的 Graphic 对象，包括 Circle, Rectangle 或者其他 Group
class Group extends Graphic {
  List<Graphic> graphics = [];

  @override
  // 添加图形到组中
  void add(Graphic graphic) {
    graphics.add(graphic);
  }

  @override
  // 从组中移除图形
  void remove(Graphic graphic) {
    graphics.remove(graphic);
  }

  @override
  // 渲染组中的所有图形
  void render() {
    for (var graphic in graphics) {
      graphic.render();
    }
  }
}

void main(List<String> args) {
  final circle = Circle();
  final rectangle = Rectangle();
  final group = Group();
  group.add(circle);
  group.add(rectangle);
  group.render();
}