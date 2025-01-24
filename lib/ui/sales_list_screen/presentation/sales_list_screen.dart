import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikncodes_machine_test/core/themes/vikn_colors.dart';
import 'package:vikncodes_machine_test/ui/filter_screen/filter_screen.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/model/sales_list_res_model.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/presentation/provider/sales_list_notifier_provider.dart';

class SalesListScreen extends ConsumerStatefulWidget {
  const SalesListScreen({super.key});

  @override
  ConsumerState<SalesListScreen> createState() => _SalesListScreenState();
}

class _SalesListScreenState extends ConsumerState<SalesListScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(salesListNotifierProvider.notifier).getSalesListResData();
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final salesList = ref.watch(salesListNotifierProvider);

    return Scaffold(
      backgroundColor: ViknColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ViknColors.backgroundColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text(
          "Invoices",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          const Divider(color: Colors.white24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: const TextStyle(color: Colors.white60),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white24),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.white60),
                      filled: true,
                      fillColor: Colors.black26,
                    ),
                    style: const TextStyle(color: Colors.white),
                    onChanged: (searchData){
                      ref.read(salesListNotifierProvider.notifier).searchSalesData(searchData);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FilterScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.filter_list_sharp, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          "Add Filters",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: salesList.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
              failure: (error) => Center(
                child: Text(
                  error.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              success: (saleData) {
                return ListView.separated(
                  itemCount: saleData.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    SalesData sale = saleData.data?[index] ?? SalesData();
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: Container(
                        decoration: BoxDecoration(

                        color: Colors.black54,),

                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "#${sale.voucherNo ?? ""}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    sale.status ?? "",
                                    style: TextStyle(
                                      color: sale.status == "Pending"
                                          ? Colors.red
                                          : sale.status == "Cancelled"
                                          ? Colors.orange
                                          : Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    sale.customerName ?? "",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "SAR ${sale.grandTotal?.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context,index){
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width/3.5),
                      child: Divider(color: Color(0xff1D1E05),height: 1,),
                    );
                  },
                );
              },
              orElse: () => const Center(
                child: Text(
                  'No data available',
                  style: TextStyle(color: Colors.white60),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
