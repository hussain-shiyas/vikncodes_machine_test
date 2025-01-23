
import 'dart:convert';

SalesListResModel patientListResModelFromJson(String str) => SalesListResModel.fromJson(json.decode(str));

String patientListResModelToJson(SalesListResModel data) => json.encode(data.toJson());

class SalesListResModel {
  final int? statusCode;
  final List<SalesData>? data;
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

class SalesData {
  final int? index;
  final String? id;
  final String? voucherNo;
  final DateTime? date;
  final String? ledgerName;
  final double? totalGrossAmtRounded;
  final double? totalTaxRounded;
  final int? grandTotalRounded;
  final String? customerName;
  final double? totalTax;
  final String? status;
  final int? grandTotal;
  final bool? isBillWised;
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
    grandTotalRounded: json["GrandTotal_Rounded"],
    customerName: json["CustomerName"],
    totalTax: json["TotalTax"]?.toDouble(),
    status: json["Status"],
    grandTotal: json["GrandTotal"],
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
