/*
 * @Author: CUMT-Atom cnatom@foxmail.com
 * @Date: 2023-12-14 17:39:37
 * @LastEditors: CUMT-Atom cnatom@foxmail.com
 * @LastEditTime: 2023-12-14 21:13:03
 * @FilePath: /test_design_pattern/behavioral_pattern/command.dart
 * @Description: 
 * 
 * Copyright (c) 2023 by ${git_name_email}, All Rights Reserved. 
 */

abstract class Command {
  void execute();
  void undo();
}

class AddTextCommand implements Command {
  final TextEditor _editor; // Receiver
  final String _addedText;

  AddTextCommand(this._editor, this._addedText);

  @override
  void execute() {
    _editor.addText(_addedText);
  }

  @override
  void undo() {
    _editor.deleteText(_addedText.length);
  }
}

class DeleteTextCommand implements Command {
  final TextEditor _editor; // Receiver
  final int _length;
  String _deletedText = "";
  DeleteTextCommand(this._editor, this._length);

  @override
  void execute() {
    _deletedText =
        _editor.getText().substring(_editor.getText().length - _length);
    _editor.deleteText(_length);
  }

  @override
  void undo() {
    _editor.addText(_deletedText);
  }
}

class Invoker {
  final List<Command> _commands = [];
  final List<Command> _undoCommands = [];

  void executeAndAddCommands(Command command) {
    _commands.add(command);
    command.execute();
  }

  void undo() {
    if (_commands.isNotEmpty) {
      final command = _commands.removeLast();
      command.undo();
      _undoCommands.add(command);
    }
  }
}

class TextEditor {
  String _text = '';

  String getText() {
    return _text;
  }

  void showText() {
    print(_text);
  }

  void addText(String text) {
    _text += text;
  }

  void deleteText(int length) {
    _text = _text.substring(0, _text.length - length);
  }
}

void main() {
  final editor = TextEditor();
  final invoker = Invoker();

  invoker.executeAndAddCommands(AddTextCommand(editor, "Hello, 命令模式!"));
  editor.showText();

  invoker.executeAndAddCommands(DeleteTextCommand(editor, 3));
  editor.showText();

  invoker.undo();
  editor.showText();
}
