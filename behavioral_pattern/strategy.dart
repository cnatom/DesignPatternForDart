/*
 * @Author: CUMT-Atom cnatom@foxmail.com
 * @Date: 2023-12-14 20:24:44
 * @LastEditors: CUMT-Atom cnatom@foxmail.com
 * @LastEditTime: 2023-12-14 20:44:56
 * @FilePath: /test_design_pattern/behavioral_pattern/strategy.dart
 * @Description: 
 * 
 * Copyright (c) 2023 by ${git_name_email}, All Rights Reserved. 
 */
abstract class DataProcessorStrategy {
  void solve(List<dynamic> data); // 解决数据处理策略
}

class SortStrategy implements DataProcessorStrategy {
  @override
  void solve(List data) {
    data.sort(); // 对数据进行排序
  }
}

class FilterStrategy implements DataProcessorStrategy {
  @override
  void solve(List data) {
    data.removeWhere((element) => element == 1); // 移除数据中的元素值为1的元素
  }
}

class TransformStrategy implements DataProcessorStrategy {
  @override
  void solve(List data) {
    for (var i = 0; i < data.length; i++) {
      data[i] += 1; // 将数据中的每个元素值加1
    }
  }
}

// 上下文
class DataProcessor {
  DataProcessorStrategy strategy; // 数据处理策略
  List<dynamic> data; // 数据列表

  DataProcessor(this.data, this.strategy);

  setStrategy(DataProcessorStrategy strategy) {
    this.strategy = strategy; // 设置数据处理策略
  }

  void processData() {
    strategy.solve(data); // 处理数据
  }
}

void main(List<String> args) {
  final data = [5, 3, 4, 1, 2];
  print(data);

  final dataProcessor = DataProcessor(data, SortStrategy());
  dataProcessor.processData();
  print(data);

  dataProcessor.setStrategy(FilterStrategy());
  dataProcessor.processData();
  print(data);

  dataProcessor.setStrategy(TransformStrategy());
  dataProcessor.processData();
  print(data);
}
