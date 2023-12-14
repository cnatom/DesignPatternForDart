abstract class ButtonFactory{
  Button createButton();
}

class TextButtonFactory implements ButtonFactory{
  @override
  Button createButton() {
    return TextButton();
  }
}

class IconButtonFactory implements ButtonFactory{
  @override
  Button createButton() {
    return IconButton();
  }
}

class FloatingActionButtonFactory implements ButtonFactory{
  @override
  Button createButton() {
    return FloatingActionButton();
  }
}

abstract class Button {
  void render();
}

class TextButton implements Button {
  @override
  void render() {
    // 实现文本按钮的渲染逻辑
    print("Rendering TextButton");
  }
}

class IconButton implements Button {
  @override
  void render() {
    // 实现图标按钮的渲染逻辑
    print("Rendering IconButton");
  }
}

class FloatingActionButton implements Button {
  @override
  void render() {
    // 实现浮动操作按钮的渲染逻辑
    print("Rendering FloatingActionButton");
  }
}

// 示例用法
void main() {
  // old
  // var textButton = TextButton();
  // var iconButton = IconButton();
  // var floatingActionButton = FloatingActionButton();

  // textButton.render();
  // iconButton.render();
  // floatingActionButton.render();

  // new
  late ButtonFactory buttonFactory = FloatingActionButtonFactory(); // 只需要修改右边的工厂类即可
  Button button = buttonFactory.createButton();
  button.render();
}
