

abstract class Command{
  void execute();
}

class AddTextCommand implements Command{
  final TextEditor _editor; // Receiver
  final String _addedText;

  AddTextCommand(this._editor, this._addedText);

  @override
  void execute() {
    _editor.addText(_addedText);
  }
}

class DeleteTextCommand implements Command{
  final TextEditor _editor; // Receiver
  final int _length;
  DeleteTextCommand(this._editor,this._length);

  @override
  void execute() {
    _editor.deleteText(_length);
  }
}

class Invoker{
  final List<Command> commands = [];

  void addCommand(Command command){
    commands.add(command);
  }

  void executeCommands(){
    commands.forEach((command) => command.execute());
  }
}

class TextEditor {
  String _text = '';

  void showText(){
    print(_text);
  }

  void addText(String text) {
    _text += text;
  }

  void deleteText(int length) {
    _text = _text.substring(0, _text.length - length);
  }

  void copyText() {
    // 实现复制文本的逻辑
  }

  // 其他编辑器相关的方法
}


void main(List<String> args) {
  final editor = TextEditor();
  final invoker = Invoker();

  invoker.addCommand(AddTextCommand(editor, "Hello,命令模式!滴滴滴"));
  invoker.addCommand(DeleteTextCommand(editor, 3));
  invoker.executeCommands();

  editor.showText();

  invoker.addCommand(DeleteTextCommand(editor, 4));
  
}