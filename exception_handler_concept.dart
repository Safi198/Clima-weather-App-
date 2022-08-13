import 'dart:io';

void main() {
  String s = '15';
  //if s = 'abc' then Unhandled exception:
  // FormatException: Invalid double without try and caught
  double d = double.parse(s);
  print(d + 5);


  String ss = 'abc';
  try {
    print('\n\n\n');
    double dd = double.parse(ss);
    print(dd + 5);
  }
  catch(exception)
  {
    print(exception);
  }
}
