import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sales_report_screen_controller.dart';

class SalesReportScreenView extends GetView<SalesReportScreenController> {
  const SalesReportScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesReportScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SalesReportScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
