// 定义 AppConfig 类
class AppConfig {

  // 静态私有成员，保存唯一实例
  static AppConfig? _instance;

  // 私有构造函数
  AppConfig._internal(this.themeColor, this.fontSize);

  // 懒加载单例
  // 获取 AppConfig 实例
  static AppConfig? get instance {
    if (_instance == null) {
      _instance = AppConfig._internal("red", 18.0);
    }
    return _instance;
  }

  // 主题颜色，可选
  String? themeColor;

  // 字体大小，可选
  double? fontSize;
  
}

// 主函数
void main(List<String> args) {
  // 获取 AppConfig 实例
  final appConfig = AppConfig.instance;
  // 打印主题颜色
  print(appConfig?.themeColor);
  // 打印字体大小
  print(appConfig?.fontSize);

  // 再次获取 AppConfig 实例
  final appConfig2 = AppConfig.instance;
  // 打印主题颜色
  print(appConfig2?.themeColor);
  // 打印字体大小
  print(appConfig2?.fontSize);

  // 判断两个 AppConfig 实例是否相同
  print(identical(appConfig, appConfig2));
}