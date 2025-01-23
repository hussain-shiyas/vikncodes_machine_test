import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/presentation/provider/sales_list_notifier_provider.dart';

class SalesListScreen extends ConsumerStatefulWidget {
  const SalesListScreen({super.key});

  @override
  ConsumerState<SalesListScreen> createState() => _SalesListScreenState();
}

class _SalesListScreenState extends ConsumerState<SalesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      ref.read(salesListNotifierProvider.notifier).getSalesListResData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final salesList = ref.watch(salesListNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text("Invoice"),
      ),
      body: Container(
        child: Column(
          children: [
            Divider(),
            Row(
              children: [
                TextField(),
                Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
                      Icon(Icons.filter_list_sharp),
                      Text("Add Filters"),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("invoice no"),
                            Text("Pending"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("customer name"),
                            Container(
                              child: Row(
                                children: [Text("Sar"), Text("10,000.00")],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// child:
