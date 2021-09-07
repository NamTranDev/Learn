import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/base/viewmodel.dart';
import 'package:to_do_app/screens/base/widget/base_error_widget.dart';
import 'package:to_do_app/screens/base/widget/base_loading_widger.dart';

import 'model/status_process.dart';

abstract class WidgetLoadingStateful<VM extends ViewModel>
    extends StatefulWidget {
  Widget widget(VM viewModel);

  Widget _consumerWiget(Function childWidger) {
    return Consumer<VM>(builder: (context, viewModel, child) {
      return childWidger.call(viewModel);
    });
  }

  @override
  _WidgetLoadingStateful createState() => _WidgetLoadingStateful();
}

class _WidgetLoadingStateful<VM extends ViewModel>
    extends State<WidgetLoadingStateful<VM>> {
  @override
  Widget build(BuildContext context) {
    return widget._consumerWiget((viewModel) {
      switch (viewModel.state?.statusProcess) {
        case StatusProcess.LOADING:
          return BaseLoading();
        case StatusProcess.ERROR:
          return BaseError(viewModel.state?.errorProcess);
        default:
          return widget.widget(viewModel);
      }
    });
  }
}
