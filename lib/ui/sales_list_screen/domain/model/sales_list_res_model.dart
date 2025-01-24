import 'package:hive_flutter/hive_flutter.dart';

part 'sales_list_res_model.g.dart';

@HiveType(typeId: 1)
class SalesListResModel {
  @HiveField(0)
  final int? statusCode;
  @HiveField(1)
  final List<SalesData>? data;
  @HiveField(2)
  final int? totalCount;

  SalesListResModel({
    this.statusCode,
    this.data,
    this.totalCount,
  });

  factory SalesListResModel.fromJson(Map<String, dynamic> json) => SalesListResModel(
    statusCode: json["StatusCode"],
    data: json["data"] == null ? [] : List<SalesData>.from(json["data"]!.map((x) => SalesData.fromJson(x))),
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": statusCode,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "total_count": totalCount,
  };
}

@HiveType(typeId: 2)
class SalesData {
  @HiveField(0)
  final int? index;
  @HiveField(2)
  final String? id;
  @HiveField(3)
  final String? voucherNo;
  @HiveField(4)
  final DateTime? date;
  @HiveField(5)
  final String? ledgerName;
  @HiveField(6)
  final double? totalGrossAmtRounded;
  @HiveField(7)
  final double? totalTaxRounded;
  @HiveField(8)
  final double? grandTotalRounded;
  @HiveField(9)
  final String? customerName;
  @HiveField(10)
  final double? totalTax;
  @HiveField(11)
  final String? status;
  @HiveField(12)
  final double? grandTotal;
  @HiveField(13)
  final bool? isBillWised;
  @HiveField(14)
  final String? billWiseStatus;

  SalesData({
    this.index,
    this.id,
    this.voucherNo,
    this.date,
    this.ledgerName,
    this.totalGrossAmtRounded,
    this.totalTaxRounded,
    this.grandTotalRounded,
    this.customerName,
    this.totalTax,
    this.status,
    this.grandTotal,
    this.isBillWised,
    this.billWiseStatus,
  });

  factory SalesData.fromJson(Map<String, dynamic> json) => SalesData(
    index: json["index"],
    id: json["id"],
    voucherNo: json["VoucherNo"],
    date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
    ledgerName: json["LedgerName"],
    totalGrossAmtRounded: json["TotalGrossAmt_rounded"]?.toDouble(),
    totalTaxRounded: json["TotalTax_rounded"]?.toDouble(),
    grandTotalRounded: json["GrandTotal_Rounded"]?.toDouble(),
    customerName: json["CustomerName"],
    totalTax: json["TotalTax"]?.toDouble(),
    status: json["Status"],
    grandTotal: json["GrandTotal"]?.toDouble(),
    isBillWised: json["is_billwised"],
    billWiseStatus: json["billwise_status"],
  );

  Map<String, dynamic> toJson() => {
    "index": index,
    "id": id,
    "VoucherNo": voucherNo,
    "Date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "LedgerName": ledgerName,
    "TotalGrossAmt_rounded": totalGrossAmtRounded,
    "TotalTax_rounded": totalTaxRounded,
    "GrandTotal_Rounded": grandTotalRounded,
    "CustomerName": customerName,
    "TotalTax": totalTax,
    "Status": status,
    "GrandTotal": grandTotal,
    "is_billwised": isBillWised,
    "billwise_status": billWiseStatus,
  };
}
