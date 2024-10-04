import 'dart:typed_data';

import 'package:dart_tars_protocol/tars_encode_exception.dart';
import 'package:dart_tars_protocol/tars_struct.dart';

class TarsDisplayer {
  StringBuffer sb;
  int _level = 0;

  TarsDisplayer(this.sb, {level = 0}) {
    _level = level;
  }

  void ps(String? fieldName) {
    for (var i = 0; i < _level; ++i) {
      sb.write('\t');
    }

    if (fieldName != null) {
      sb
        ..write(fieldName)
        ..write(': ');
    }
  }

  TarsDisplayer? Display(dynamic value, String? fieldName) {
    if (value is bool) {
      return DisplayBool(value, fieldName);
    } else if (value is int) {
      return DisplayInt(value, fieldName);
    } else if (value is double) {
      return DisplayDouble(value, fieldName);
    } else if (value is String) {
      return DisplayString(value, fieldName);
    } else if (value is Uint8List) {
      return DisplayUint8List(value, fieldName);
    } else if (value is List) {
      return DisplayArray(value, fieldName);
    } else if (value is Map) {
      return DisplayMap(value, fieldName);
    } else if (value is TarsStruct) {
      return DisplayTarsStruct(value, fieldName);
    } else {
      throw TarsEncodeException('write object error: unsupported type.');
    }
  }

  TarsDisplayer DisplayBool(bool b, String? fieldName) {
    ps(fieldName);
    sb.writeln(b ? 'T' : 'F');
    return this;
  }

  TarsDisplayer DisplayInt(int n, String? fieldName) {
    ps(fieldName);
    sb.writeln(n);
    return this;
  }

  TarsDisplayer DisplayDouble(double n, String? fieldName) {
    ps(fieldName);
    sb.writeln(n);
    return this;
  }

  TarsDisplayer DisplayString(String? s, String? fieldName) {
    ps(fieldName);
      sb.writeln(s ?? 'null');

    return this;
  }

  TarsDisplayer DisplayUint8List(Uint8List? v, String? fieldName) {
    ps(fieldName);
    if (null == v) {
      sb.writeln('null');
      return this;
    }
    if (v.isEmpty) {
      sb.write(v.length);
      sb.writeln(', []');
      return this;
    }
    sb.write(v.length);
    sb.writeln(', []');
    var jd = TarsDisplayer(sb, level: _level + 1);
    for (var o in v) {
      jd.Display(o, null);
    }

    Display(']', null);
    return this;
  }

  TarsDisplayer DisplayMap<K, V>(Map<K, V>? m, String? fieldName) {
    ps(fieldName);
    if (null == m) {
      sb.writeln('null');
      return this;
    }
    if (m.isEmpty) {
      sb.write(m.length);
      sb.writeln(', {}');
      return this;
    }
    sb.write(m.length);
    sb.writeln(', {');
    var jd1 = TarsDisplayer(sb, level: _level + 1);
    var jd = TarsDisplayer(sb, level: _level + 2);
    for (var key in m.keys) {
      jd1.Display('(', null);
      jd.Display(key, null);
      jd.Display(m[key], null);
      jd1.Display(')', null);
    }
    Display('}', null);
    return this;
  }

  TarsDisplayer DisplayArray<T>(List<T>? v, String? fieldName) {
    ps(fieldName);
    if (null == v) {
      sb.writeln('null');
      return this;
    }
    if (v.isEmpty) {
      sb.write(v.length);
      sb.writeln(', []');
      return this;
    }
    sb.write(v.length);
    sb.writeln(', [');
    var jd = TarsDisplayer(sb, level: _level + 1);
    for (var o in v) {
      jd.Display(o, null);
    }
    Display(']', null);
    return this;
  }

  TarsDisplayer DisplayList<T>(List<T>? v, String? fieldName) {
    if (null == v) {
      ps(fieldName);
      sb.writeln('null');
      return this;
    } else {
      for (var item in v) {
        Display(item, fieldName);
      }

      return this;
    }
  }

  TarsDisplayer DisplayTarsStruct(TarsStruct? v, String? fieldName) {
    Display('{', fieldName);
    if (null == v) {
      sb.write('\t');
      sb.write('null');
    } else {
      v.display(sb, _level + 1);
    }

    Display('}', null);
    return this;
  }
}
