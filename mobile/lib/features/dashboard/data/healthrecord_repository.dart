import 'package:baio/features/dashboard/data/socket_repository.dart';
import 'package:baio/features/dashboard/domain/healthrecord.dart';
import 'package:baio/utils/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HealthRecordRepository {
  final _healthRecordState = InMemoryStore<HealthRecord?>(null);

  void dispose() {}
}

final healthRecordRepositoryProvider = Provider<HealthRecordRepository>((ref) {
  final healthRecord = HealthRecordRepository();
  ref.onDispose(() => healthRecord.dispose());
  return healthRecord;
});

final healthRecordStreamProvider =
    StreamProvider.autoDispose<HealthRecord?>((ref) {
  final channel = ref.watch(channelProvider);

  final stream = channel.stream
      .cast<HealthRecord>()
      .asBroadcastStream(onCancel: (subscription) => subscription.cancel());

  var isSubControlError = false;

  final subscription = stream.listen(
    (msg) {},
    onError: (_, stack) => null,
    onDone: () async {
      isSubControlError = true;
      await Future.delayed(const Duration(seconds: 10));
      ref.container.refresh(channelProvider);
    },
  );

  ref.onDispose(() {
    if (!isSubControlError) {
      // dispose channel sink
    }
    subscription.cancel();
  });

  return stream;
});
