import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:to_do_app/common/logger.dart';
import 'package:to_do_app/screens/base/model/error_data.dart';
import 'package:to_do_app/screens/base/model/error_state_process.dart';
import 'package:to_do_app/screens/base/model/loading_process.dart';
import 'package:to_do_app/screens/base/model/state_process.dart';
import 'package:to_do_app/screens/base/model/status_process.dart';

abstract class ViewModel extends ChangeNotifier {
  StreamController<StateProcess> _stateLoading = StreamController();
  StreamController<StateProcess> get stateLoading => this._stateLoading;

  CompositeSubscription compositeSubscription = CompositeSubscription();

  addSubscription(StreamSubscription subscription) {
    compositeSubscription.add(subscription);
  }

  StateProcess? _stateProcess;
  StateProcess? get state => this._stateProcess;
  set state(StateProcess? value) {
    _stateProcess = value;
    notifyListeners();
  }

  void loadData(dynamic);

  void excute(
    dynamic task,
    Function onSuccess, {
    LoadingProcess loading = LoadingProcess.LOADING_DIALOG,
  }) {
    Stream taskRun;
    if (task is Future) {
      taskRun = task.asStream();
    } else if (task is Stream) {
      taskRun = task;
    } else {
      return;
    }
    handleProcess(loading, StatusProcess.LOADING);
    addSubscription(taskRun.handleError((e) {
      logger(e);
      handleProcess(loading, StatusProcess.ERROR, error: getError(e),
          retry: () {
        excute(taskRun, onSuccess, loading: loading);
      });
    }).listen((event) {
      onSuccess.call(event);
      handleProcess(loading, StatusProcess.SUCCESS);
    }));
  }

  ErrorProcess getError(dynamic e) {
    if (e is ErrorData) {
      if (e.exception == null) {
        return ErrorProcess(
            message: e.message, code: e.code, error: e.errorValue);
      } else {
        return ErrorProcess.getError(e.exception);
      }
    } else {
      return ErrorProcess.getError(e);
    }
  }

  void handleProcess(LoadingProcess loading, StatusProcess status,
      {ErrorProcess? error, Function? retry}) {
    switch (loading) {
      case LoadingProcess.LOADING_NONE:
        if (status == StatusProcess.ERROR) {
          _stateLoading.sink.add(
              StateProcess.error(loading: loading, error: error, retry: retry));
        }
        break;
      case LoadingProcess.LOADING_DIALOG:
        switch (status) {
          case StatusProcess.LOADING:
            _stateLoading.sink.add(StateProcess.loading(loading: loading));

            break;
          case StatusProcess.SUCCESS:
            _stateLoading.sink.add(StateProcess.success(loading: loading));
            state = StateProcess.success(loading: loading);
            break;
          case StatusProcess.ERROR:
            _stateLoading.sink.add(StateProcess.error(
                loading: loading, error: error, retry: retry));
            break;
        }
        break;
      case LoadingProcess.LOADING_NORMAL:
        switch (status) {
          case StatusProcess.LOADING:
            state = StateProcess.loading(loading: loading);
            break;
          case StatusProcess.SUCCESS:
            state = StateProcess.success(loading: loading);
            break;
          case StatusProcess.ERROR:
            state = StateProcess.error(
                loading: loading, error: error, retry: retry);
            break;
        }
        break;
    }
  }

  successState(){
    
  }

  @override
  void dispose() {
    _stateLoading.close();
    if (!compositeSubscription.isDisposed) {
      compositeSubscription.dispose();
    }
    super.dispose();
  }
}
