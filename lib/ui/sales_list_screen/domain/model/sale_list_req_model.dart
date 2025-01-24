
class SaleListRequest {
  final int? branchId;
  final String? companyId;
  final int? createdUserId;
  final int? priceRounding;
  final int? pageNo;
  final int? itemsPerPage;
  final String? type;
  final int? warehouseId;

  SaleListRequest({
    this.branchId,
    this.companyId,
    this.createdUserId,
    this.priceRounding,
    this.pageNo,
    this.itemsPerPage,
    this.type,
    this.warehouseId,
  });


  Map<String, dynamic> toJson() => {
    "BranchID": branchId,
    "CompanyID": companyId,
    "CreatedUserID": createdUserId,
    "PriceRounding": priceRounding,
    "page_no": pageNo,
    "items_per_page": itemsPerPage,
    "type": type,
    "WarehouseID": warehouseId,
  };
}
