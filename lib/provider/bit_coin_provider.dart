import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


// websoct provider

final webSocketProvider = Provider<WebSocketChannel>((ref){
  final webSocket = IOWebSocketChannel.connect("wss://ws.coincap.io/prices?assets=ethereum");
  return webSocket;
});

// stream provider

final bitCoinPriceProvider = StreamProvider<Map<String,dynamic>>((ref){
final webSocket = ref.watch(webSocketProvider);
return webSocket.stream.map((event) {
final Map<String,dynamic> data = json.decode(event);
return data.map((key, value) => MapEntry(key, double.parse(value.toString())));

});

});