/*
 * @Author: CUMT-Atom cnatom@foxmail.com
 * @Date: 2023-12-14 18:56:57
 * @LastEditors: CUMT-Atom cnatom@foxmail.com
 * @LastEditTime: 2023-12-14 19:02:58
 * @FilePath: /test_design_pattern/structural_pattern/adapter.dart
 * @Description: 
 * 
 * Copyright (c) 2023 by ${git_name_email}, All Rights Reserved. 
 */
// 第三方电子邮件服务
class ThirdPartyEmailService {
  void sendEmail(String to, String subject, String body) {
    print('Sending email to $to: $subject\n$body');
  }
}

// 你的应用中使用的电子邮件客户端接口
abstract class EmailClient {
  void compose(String recipient, String title, String message);
}

// 你的应用中的一个电子邮件客户端实现
class MyAppEmailClient implements EmailClient {
  @override
  void compose(String recipient, String title, String message) {
    print('Composing email to $recipient: $title\n$message');
  }
}

// 适配器
class ThirdPartyEmailServiceAdapter implements EmailClient {
  final ThirdPartyEmailService _thirdPartyEmailService = ThirdPartyEmailService();

  @override
  void compose(String recipient, String title, String message) {
    _thirdPartyEmailService.sendEmail(recipient, title, message);
  }
}

// 示例用法
void main() {
  // 你的应用代码...
  EmailClient emailClient = ThirdPartyEmailServiceAdapter();
  emailClient.compose('example@example.com', 'Hello', 'This is a test email.');
}
