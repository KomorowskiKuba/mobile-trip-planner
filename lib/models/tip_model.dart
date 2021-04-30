import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Tip {
  String content;

  Tip(this.content);

  @override
  String toString() {
    return content.substring("Content{  ".length, content.length - 1);
  }
}