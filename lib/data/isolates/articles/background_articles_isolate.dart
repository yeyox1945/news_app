import 'dart:async';
import 'dart:isolate';

@pragma('vm:entry-point')
void getNewArticlesBackground(SendPort sendPort) {
  Timer.periodic(const Duration(minutes: 15), (timer) async {
    sendPort.send('refresh-articles');
  });
}
