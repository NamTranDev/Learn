const TAG = "NamTranDev";

void logger(Object? object) {
  print("------------------------------- $TAG -------------------------------");
  print("Line : ${getLine(StackTrace.current)}}");
  print("Value : ${object.toString()}");
  print("------------------------------- ---- -------------------------------");
}

String getLine(StackTrace trace) {
  return trace.toString().split("\n")[1];
}
