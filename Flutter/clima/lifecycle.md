Flutter is a mobile UI framework that helps us to create modern mobile apps for iOS and Android using a single(almost) codebase. A Flutter application is just a combination of **Stateful** and  **Stateless** Widgets. In this post, we going to explain basic behavior of the Flutter widget and it's lifecycle.  

  

Stateless Widget
================

A stateless widget can only be drawn once when the Widget is loaded/built. A stateless widget cannot be redrawn based on any events or user actions. We create a Stateless widget by extending our class from StatelessWidge.  
  

```
class DeveloperLibs extends StatelessWidget {
   const DeveloperLibs ({ Key key }) : super(key: key);
    @override
    Widget build(BuildContext context) {
      return Container(color: const Color(0xFF2DBD3A));
    }
}
```

  
here, **DeveloperLibs** is a Stateless widget and it has overridden the function called **Widget build(BuildContet context)** which returns one widget. So, whenever DeveloperLibs is instantiated, it will call the build(...) function and draw the widgets returned by this function.  
  

Stateful Widget
===============

The Stateful widget is mutable that's why it can be drawn multiple times within its lifetime. It is useful when we dynamically update screen of app on user actions. The build(...) method of state can be called multiple times during its lifetime and every build may return new or different widgets based on various parameters:  

```
class DeveloperLibsWidget extends StatefulWidget {
     DeveloperLibsWidget({
  Key key,
  this.parameter,
 }): super(key: key);
 final parameter;
     @override
    _DeveloperLibsWidgetState createState() => _DeveloperLibsWidgetState();
}
class _DeveloperLibsWidgetState extends State<DeveloperLibsWidget > {
 @override
 void initState(){
  super.initState();
  // Additional initialization of the State
 }
 @override
 void didChangeDependencies(){
  super.didChangeDependencies();
  // Additional code
 }
 @override
 void dispose(){
  // Additional disposal code
  super.dispose();
 }
 @override
 Widget build(BuildContext context){
  return  return Container(color: const Color(0xFF2DBD3A));
     }
}
```
  
When a Flutter framework builds a StatefulWidget, it creates an object State. In this object, all the mutable state for that widget is held. Some other Widgets will handle some inner data that will change during the Widget’s lifetime.   
  

**The life cycle of the StatefulWidget.**  
A stateful widget has the following lifecycle stages:  
  

[![Flutter widget lifecycle defination](https://1.bp.blogspot.com/-q3QIpsS_kK4/Xe0iZtwshKI/AAAAAAAAA8k/_tWHPDf8JOI93IYSo8WP_6D_sIKXy_xSACLcBGAsYHQ/s640/flutter-stateful-widget-life-cycle.png "Flutter widget lifecycle")](https://1.bp.blogspot.com/-q3QIpsS_kK4/Xe0iZtwshKI/AAAAAAAAA8k/_tWHPDf8JOI93IYSo8WP_6D_sIKXy_xSACLcBGAsYHQ/s1600/flutter-stateful-widget-life-cycle.png)

  
**1\. createState()**: When we create a stateful widget, the Flutter framework instruct to createState() method. The createState() method returns an instance of their associated state as shown above.  

```
@override
_DeveloperLibsWidgetState createState() => _DeveloperLibsWidgetState();
```
  
  
**2\. mounted(true/false)**: Once we create a State object, the framework **mounted** the State object by associating it with a **BuildContext** before calling initState() method. All widgets have a bool **mounted** property. It is turned true when the buildContext is assigned.  
  
```
bool get mounted => _element != null;
```

*   You can use this property when a method in your state calls setState(). But it isn't clear when or how the method will be called. Let say, it will call in response to a stream. You can use if (mounted) { ... } to make sure the State exists before calling setState().

  
**3\. initState()**: This is the first method called when a stateful widget is created after the class constructor. The initState() is called only once. It must called super.initState(). Here, you can initialize data, properties and subscribe to Streams or any other object that could change the data on this widget.  

```
@override
initState() {
  super.initState();
    // TO DO
}
```

  
**4\. didChangeDependencies()**: This method is called immediately after initState() method on the first time the widget is built.  
  
```
@protected
@mustCallSuper
void didChangeDependencies() { 

}
```

*   It will also be called whenever an object that this widget depends on data from is called. For example, if it relies on an InheritedWidget, which updates. 
*   The build method is always called after didChangeDependencies is called, so this is rarely needed.

  
**5\. build()**: it shows the part of the user interface represented by the widget. The framework calls this method in several different situations:  

*   After calling initState() method.
*   The framework always calls build() method after calling didUpdateWidget
*   After receiving a call for setState to update the screen.

```
@override
Widget build(BuildContext context, MyButtonState state) {
      return Container(color: const Color(0xFF2DBD3A));     
}
```

**6\. didUpdateWidget(Widget oldWidget)**: If the parent widget change configuration and has to rebuild this widget. But it's being rebuilt with the same runtimeType, then didUpdateWidget() method is called. The framework updates the widget property of this state object to refer to the new widget and then call this method with the previous widget as an argument.  

```
@mustCallSuper
@protected
void didUpdateWidget(covariant T oldWidget) {

}
```
  
**7\. setState()**: This method is called from the framework and the developer. We can change the internal state of a State object and make the change in a function that you pass to setState(). The setState notifies the framework that the internal state of current object has changed in a way that might impact the user interface, which causes the framework to call the build method for this State object.  

```
@override
_DeveloperLibsWidgetState createState() => _DeveloperLibsWidgetState();
```
  
**8\. deactivate()**: This is called when State is removed from the widgets tree, but it might be reinserted before the current frame change is finished. This method exists because State objects can be moved from one point in a tree to another.  

```
@protected
@mustCallSuper
void deactivate() { }
```
  
**9\. dispose()**: This is called when the State object is removed permanently. Here you can unsubscribe and cancel all animations, streams, etc.  

```
@protected
@mustCallSuper
void dispose() {
  assert(_debugLifecycleState == _StateLifecycle.ready);
  assert(() { _debugLifecycleState = _StateLifecycle.defunct; return true; }());
}
```