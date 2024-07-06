import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../../common/model/failure_model.dart';
import 'task_fail_mapper.dart';

extension TaskExcuter<T> on Future<T> {
  //TODO add execute multiple futures
  Future<void> execute({
    bool onlyIfConnected = false,
    Function(FailureModel failed)? onFailed,
    Function(T value)? onSuccess,
  }) async {
    return await Task(() => this).attempt().mapFailure().run().then((o) {
      return o.fold(
        (f) async {
          try {
            if (onFailed != null) await onFailed(f);
          } catch (e) {
            Logger().e(e);
          }
        },
        (s) async {
          try {
            if (onSuccess != null) await onSuccess(s);
          } catch (e) {
            Logger().e(e);
          }
        },
      );
    });
  }
}
