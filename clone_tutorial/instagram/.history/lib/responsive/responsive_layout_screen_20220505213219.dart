import 'package:flutter/cupertino.dart';
import 'package:instagram/utils/dimens.dart';

class ResponsiveLayout extends StatelessWidget {

final Widget webLayout;
final Widget mobileLayout;

  const ResponsiveLayout({Key? key,required this.webLayout,required this.mobileLayout}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains){
      if(constrains.maxWidth > webScreenSize){
return webLayout;
      }
      return mobileLayout
    })
  }
}