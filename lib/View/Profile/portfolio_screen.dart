import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../API/add_portfolio_API.dart';
import '../../Controller/portfolio_controller.dart';
import '../../Model/portfolio_model.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/inter_text_style.dart';
import '../Widgets/pdf_tile.dart';
import '../Widgets/upload_pdf.dart';

class PortfolioPage extends StatelessWidget {
  PortfolioPage({Key? key}) : super(key: key);

  final PortfolioController controller = Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    final portfolio = GetStorage().read('portfolio') ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Portfolio"),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        onPressed: () async {
          await addPortfolio();
          await controller.fetchPortfolios();
        },
        text: "Submit Portfolio",
        isButtonEnabled: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterTextStyle.getTextWidget(
                text: 'Upload CV',
              ),
              FileUploadContainer(
                initialFileName: portfolio,
                storageKey: 'portfolio',
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 4),
                    itemCount: controller.portfolios.length,
                    itemBuilder: (context, index) {
                      final portfolio = controller.portfolios[index];
                      return PdfTile(
                        fileName: portfolio.cvFile,
                        onCancel: () {
                          controller.deletePortfolio(portfolio.id);
                        },
                        onEdit: () {},
                      );
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
