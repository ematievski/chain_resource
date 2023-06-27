// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chain.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChainAdapter extends TypeAdapter<Chain> {
  @override
  final int typeId = 1;

  @override
  Chain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chain(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Chain obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
