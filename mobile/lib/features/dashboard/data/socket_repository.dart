import 'package:baio/features/dashboard/domain/healthrecord.dart';
import 'package:baio/utils/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';

final channelProvider = Provider<IOWebSocketChannel>((ref) {
  return IOWebSocketChannel.connect("");
});
