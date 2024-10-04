import 'dart:typed_data';

class BinaryWriter {
  List<int> buffer;
  int position = 0;

  BinaryWriter(this.buffer);

  int get length => buffer.length;

  void writeBytes(List<int> list) {
    buffer.addAll(list);
    position += list.length;
  }

  void writeInt(int value, int len, {Endian endian = Endian.big}) {
    var b = Uint8List(len).buffer;
    var bytes = ByteData.view(b);
    if (len == 1) {
      //写入byte
      bytes.setUint8(0, value.toUnsigned(8));
    }
    if (len == 2) {
      bytes.setInt16(0, value, endian);
    }
    if (len == 4) {
      bytes.setInt32(0, value, endian);
    }
    if (len == 8) {
      bytes.setInt64(0, value, endian);
    }

    buffer.addAll(bytes.buffer.asUint8List());
    position += len;
  }

  void writeDouble(double value, int len, {Endian endian = Endian.big}) {
    var b = Uint8List(len).buffer;
    var bytes = ByteData.view(b);

    if (len == 4) {
      bytes.setFloat32(0, value, endian);
    }
    if (len == 8) {
      bytes.setFloat64(0, value, endian);
    }

    buffer.addAll(bytes.buffer.asUint8List());
    position += len;
  }
}

class BinaryReader {
  final ByteData byteData;
  int position = 0;

  BinaryReader(Uint8List buffer)
      : byteData = ByteData.view(buffer.buffer),
        length = buffer.length;

  final int length;

  /// 从当前流中读取下一个字节，并使流的当前位置提升 1 个字节
  /// 返回下一个字节(0-255)
  int read() {
    var byte = byteData.getUint8(position);
    position += 1;
    return byte;
  }

  /// 从当前流中读取指定长度的字节整数，并使流的当前位置提升指定长度。
  /// [len] 指定长度
  /// len=1为int8,2为int16,4为int32,8为int64。dart中统一为int类型
  /// 返回整数
  int readInt(int len, {Endian endian = Endian.big}) {
    int result = 0;
    if (len == 1) {
      result = byteData.getUint8(position);
    } else if (len == 2) {
      result = byteData.getInt16(position, endian);
    } else if (len == 4) {
      result = byteData.getInt32(position, endian);
    } else if (len == 8) {
      result = byteData.getInt64(position, endian);
    }
    position += len;
    return result;
  }

  /// 读取字节
  /// int长度=1
  int readByte({Endian endian = Endian.big}) {
    return readInt(1, endian: endian);
  }

  /// 读取
  /// int长度=2
  int readShort({Endian endian = Endian.big}) {
    return readInt(2, endian: endian);
  }

  /// 读取字节
  /// int长度=4
  int readInt32({Endian endian = Endian.big}) {
    return readInt(4, endian: endian);
  }

  /// 读取字节
  /// int长度=8
  int readLong({Endian endian = Endian.big}) {
    return readInt(8, endian: endian);
  }

  /// 从当前流中读取指定长度的字节数组，并使流的当前位置提升指定长度。
  /// [len] 指定长度
  /// 返回字节数组
  Uint8List readBytes(int len) {
    var bytes = byteData.buffer.asUint8List(position, len);
    position += len;
    return bytes;
  }

  /// 从当前流中读取指定长度的字节浮点数，并使流的当前位置提升指定长度。
  /// [len] 指定长度
  /// len=4为float,8为double。dart中统一为double类型
  /// 返回浮点数
  double readFloat(int len, {Endian endian = Endian.big}) {
    var result = 0.0;

    if (len == 4) {
      result = byteData.getFloat32(position, endian);
    } else if (len == 8) {
      result = byteData.getFloat64(position, endian);
    }
    position += len;
    return result;
  }
}
