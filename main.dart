import 'dart:isolate';

void main() async{

  /*
   print("main message1");
  Isolate.spawn(startIsolate, "isolate 1");
  Isolate.spawn(startIsolate, "isolate 2");
  Isolate.spawn(startIsolate, "isolate 3");
  Isolate.spawn(startIsolate, "isolate 4");
  print("main message2");
  print("main message3");
*/

  ReceivePort receivePort = new ReceivePort();

  await Isolate.spawn(startIso, receivePort.sendPort);

  Stream receiveStream = receivePort.asBroadcastStream();

  receiveStream.listen((event) {
    print(event);
  });
  
}
startIso(SendPort sendPort) async {
  sendPort.send("Hello from new Isolate");

  await Future.delayed(Duration(seconds: 5));
  sendPort.send("After 5 secs......");
}
/*
void startIsolate(String message) {
  print("Messase from new Isolete $message");
}
*/

