import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/base/model/status_process.dart';
import 'package:to_do_app/screens/base/viewmodel.dart';
import 'package:to_do_app/screens/base/widget/base_error_widget.dart';
import 'package:to_do_app/screens/base/widget/base_loading_widger.dart';

abstract class WidgetLoadingStateless<VM extends ViewModel>
    extends StatelessWidget {
  Widget widget(VM viewModel);

  @override
  Widget build(BuildContext context) {
    return Consumer<VM>(builder: (context, viewModel, child) {
      switch (viewModel.state?.statusProcess) {
        case StatusProcess.LOADING:
          return BaseLoading();
        case StatusProcess.ERROR:
          return BaseError(viewModel.state?.errorProcess);
        default:
          return widget(viewModel);
      }
    });
  }
}
