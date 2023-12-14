abstract class ImageService{
  String getImage(String url);
}

class RemoteImageService implements ImageService{
  @override
  String getImage(String url) {
    // 从远程服务器获取图像
    return 'Image data from $url';
  }
}

// 代理类
// 代理类和被代理类都实现了相同的接口
class ImageProxy implements ImageService{
  RemoteImageService _remoteImageService = RemoteImageService();
  Map<String, String> _cache = {};

  @override
  String getImage(String url) {
    if (_cache.containsKey(url)) {
      return "缓存："+_cache[url]!;
    }else{
      _cache[url] = _remoteImageService.getImage(url);
      return _cache[url]!;
    }
  }
}


void main(List<String> args) {
  final imageProxy = ImageProxy();
  print(imageProxy.getImage('https://www.baidu.com'));
  print(imageProxy.getImage('https://www.baidu.com'));
}