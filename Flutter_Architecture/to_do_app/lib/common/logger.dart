const TAG_CORE = 'NamTranDev';

void logger(Object? object, {String? tag}) {
  StringBuffer log = StringBuffer(tag == null ? '' : '$tag : ');
  log.write(object);
  log.write(" ");
  log.write(StackTrace.fromString(getLine(StackTrace.current)));
  print(log);
  getLine(StackTrace.current).split("(");
}

String getLine(StackTrace trace) {
  return trace.toString().split("\n")[1].split("(")[1].split(")")[0];
}
