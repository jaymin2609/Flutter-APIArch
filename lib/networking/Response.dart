import 'ReturnType.dart';

enum STATUS { NONE, LOADING, SUCCESS, ERROR }

class ResponseData {
  ReturnType returnType;
  STATUS status;
  dynamic data;
  String msg;

  ResponseData({this.returnType, this.status, this.data, this.msg});
}
