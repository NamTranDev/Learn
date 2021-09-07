import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/base/viewmodel.dart';

abstract class WidgetStateFul<VM extends ViewModel> extends StatefulWidget {
  Widget widget(VM viewModel);

  VM _viewModel(BuildContext context){
    return context.watch<VM>();
  }

  @override
  _WidgetStateFul createState() => _WidgetStateFul();
}

class _WidgetStateFul<VM extends ViewModel> extends State<WidgetStateFul<VM>> {
  @override
  Widget build(BuildContext context) {
    return widget.widget(widget._viewModel(context));
  }
}
