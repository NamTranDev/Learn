import 'package:to_do_app/screens/base/model/error_state_process.dart';
import 'package:to_do_app/screens/base/model/loading_process.dart';
import 'package:to_do_app/screens/base/model/status_process.dart';

class StateProcess {
  StatusProcess _statusProcess = StatusProcess.LOADING;
  LoadingProcess _loadingProcess = LoadingProcess.LOADING_NORMAL;
  ErrorProcess? _errorProcess;
  Function? retry;

  StateProcess(this._statusProcess, this._loadingProcess, this._errorProcess,
      this.retry);

  StatusProcess get statusProcess => this._statusProcess;
  LoadingProcess get loadingProcess => this._loadingProcess;
  ErrorProcess? get errorProcess => this._errorProcess;

  get getRetry => this.retry;
  set setRetry(Function? retry) => this.retry = retry;

  static StateProcess success(
      {LoadingProcess loading = LoadingProcess.LOADING_NORMAL, Object? data}) {
    return StateProcess(StatusProcess.SUCCESS, loading, null, null);
  }

  static StateProcess error(
      {LoadingProcess loading = LoadingProcess.LOADING_NORMAL,
      ErrorProcess? error,
      Function? retry}) {
    return StateProcess(StatusProcess.ERROR, loading, error, retry);
  }

  static StateProcess loading(
      {LoadingProcess loading = LoadingProcess.LOADING_NORMAL}) {
    return StateProcess(StatusProcess.LOADING, loading, null, null);
  }
}
