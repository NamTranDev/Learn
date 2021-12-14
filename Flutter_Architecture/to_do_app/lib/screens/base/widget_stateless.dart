import 'package:flutter/cupertino.dart';
import 'package:to_do_app/screens/base/viewmodel.dart';
import 'package:provider/provider.dart';

abstract class WidgetStateless<VM extends ViewModel> extends StatelessWidget {
  Widget widget(VM viewModel);

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<VM>();
    return widget(viewModel);
  }
}
