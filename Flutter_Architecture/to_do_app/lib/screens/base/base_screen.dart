import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/common/logger.dart';
import 'package:to_do_app/screens/base/model/error_state_process.dart';
import 'package:to_do_app/screens/base/model/status_process.dart';
import 'package:to_do_app/screens/base/viewmodel.dart';

abstract class BaseScreen<VM extends ViewModel> extends StatefulWidget {
  dynamic argument();

  VM initVM();

  void listenerVM(BuildContext context, VM? viewModel);

  void initState() {
    logger("Lifecycle - initState - ${this.runtimeType.toString()}",
        tag: TAG_CORE);
  }

  void didChangeDependencies(VM? viewModel) {
    logger("Lifecycle - didChangeDependencies - ${this.runtimeType.toString()}",
        tag: TAG_CORE);
  }

  void dispose() {
    logger("Lifecycle - dispose - ${this.runtimeType.toString()}",
        tag: TAG_CORE);
  }

  void didUpdateWidget(VM? viewModel) {
    logger("Lifecycle - didUpdateWidget - ${this.runtimeType.toString()}",
        tag: TAG_CORE);
  }

  void deactivate(VM? viewModel) {
    logger("Lifecycle - deactivate - ${this.runtimeType.toString()}",
        tag: TAG_CORE);
  }

  void reassemble(VM? viewModel) {
    logger("Lifecycle - reassemble - ${this.runtimeType.toString()}",
        tag: TAG_CORE);
  }

  Widget build(BuildContext context);

  @override
  _BaseScreenState<VM> createState() => _BaseScreenState<VM>();
}

class _BaseScreenState<VM extends ViewModel> extends State<BaseScreen<VM>> {
  VM? viewModel;

  @override
  void initState() {
    super.initState();
    widget.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      viewModel?.loadData(widget.argument());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.didChangeDependencies(viewModel);
  }

  @override
  void deactivate() {
    widget.deactivate(viewModel);
    super.deactivate();
  }

  @override
  void reassemble() {
    super.reassemble();
    widget.reassemble(viewModel);
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        viewModel = widget.initVM();
        listenLoadingDialog(viewModel);
        widget.listenerVM(context, viewModel);
        return viewModel;
      },
      child: widget.build(context),
    );
  }

  void listenLoadingDialog(VM? viewModel) {
    viewModel?.stateLoading.stream.listen((state) {
      switch (state.statusProcess) {
        case StatusProcess.LOADING:
          showLoading();
          break;
        case StatusProcess.ERROR:
          hideLoading();
          displayError(state.errorProcess);
          break;
        case StatusProcess.SUCCESS:
          EasyLoading.dismiss();
          logger("Dismiss loading Dialog");
          break;
      }
    });
  }

  void showLoading() {
    FocusScope.of(context).requestFocus(FocusNode());
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
  }

  void hideLoading() {
    EasyLoading.dismiss();
  }

  void displayError(ErrorProcess? errorProcess) {
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Error'),
        content: Text(errorProcess?.message ?? "Unknow Error"),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: new Text('OK'),
          ),
        ],
      ),
    );
  }
}
