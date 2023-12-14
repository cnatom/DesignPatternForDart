abstract class Subject {
  List<Listener> listeners = []; // 监听器列表

  // 添加监听器
  void addListener(Listener listener) {
    listeners.add(listener);
  }

  // 移除监听器
  void removeListener(Listener listener) {
    listeners.remove(listener);
  }

  // 通知所有监听器
  void notifyListeners();
}

class User extends Subject {
  String name; // 用户姓名
  int age; // 用户年龄

  User(this.name, this.age); // 构造函数，初始化用户姓名和年龄

  @override
  void notifyListeners() {
    for (var listener in listeners) {
      listener.update(this); // 通知所有监听器更新数据
    }
  }

  // 更新用户信息
  void updateUserInfo(String newName, int newAge) {
    name = newName;
    age = newAge;
    notifyListeners(); // 通知所有监听器更新数据
  }
}

abstract class Listener {
  // 更新用户数据
  void update(User user);
}

class UserProfileWidget implements Listener {
  @override
  void update(User user) {
    print("用户信息更新：姓名：${user.name}，年龄：${user.age}"); // 打印用户信息更新结果
  }
}

class UserSettingsWidget implements Listener {
  @override
  void update(User user) {
    print("用户设置更新：姓名：${user.name}，年龄：${user.age}"); // 打印用户设置更新结果
  }
}

void main(List<String> args) {
  final user = User("John", 30); // 创建一个用户对象
  final userProfileWidget = UserProfileWidget(); // 创建一个用户信息展示组件
  final userSettingsWidget = UserSettingsWidget(); // 创建一个用户设置展示组件

  user.addListener(userProfileWidget); // 添加用户信息展示组件为监听器
  user.addListener(userSettingsWidget); // 添加用户设置展示组件为监听器

  user.updateUserInfo("John Doe", 35); // 更新用户信息
}
