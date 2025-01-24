// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_list_res_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalesListResModelAdapter extends TypeAdapter<SalesListResModel> {
  @override
  final int typeId = 1;

  @override
  SalesListResModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalesListResModel(
      statusCode: fields[0] as int?,
      data: (fields[1] as List?)?.cast<SalesData>(),
      totalCount: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SalesListResModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.statusCode)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.totalCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalesListResModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SalesDataAdapter extends TypeAdapter<SalesData> {
  @override
  final int typeId = 2;

  @override
  SalesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalesData(
      index: fields[0] as int?,
      id: fields[2] as String?,
      voucherNo: fields[3] as String?,
      date: fields[4] as DateTime?,
      ledgerName: fields[5] as String?,
      totalGrossAmtRounded: fields[6] as double?,
      totalTaxRounded: fields[7] as double?,
      grandTotalRounded: fields[8] as double?,
      customerName: fields[9] as String?,
      totalTax: fields[10] as double?,
      status: fields[11] as String?,
      grandTotal: fields[12] as double?,
      isBillWised: fields[13] as bool?,
      billWiseStatus: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SalesData obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.voucherNo)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.ledgerName)
      ..writeByte(6)
      ..write(obj.totalGrossAmtRounded)
      ..writeByte(7)
      ..write(obj.totalTaxRounded)
      ..writeByte(8)
      ..write(obj.grandTotalRounded)
      ..writeByte(9)
      ..write(obj.customerName)
      ..writeByte(10)
      ..write(obj.totalTax)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.grandTotal)
      ..writeByte(13)
      ..write(obj.isBillWised)
      ..writeByte(14)
      ..write(obj.billWiseStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
