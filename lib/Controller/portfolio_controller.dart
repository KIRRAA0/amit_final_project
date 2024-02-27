import 'package:get/get.dart';


import '../API/delete_portfolio_API.dart';
import '../API/show_portfolios_API.dart';
import '../Model/portfolio_model.dart';

class PortfolioController extends GetxController {
  var portfolios = <Portfolio>[].obs;
  var isLoading = true.obs;
  var hasLoadedData = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPortfolios();
  }

  Future<void> fetchPortfolios() async {
    try {
      isLoading.value = true;
      var fetchedUserData = await fetchPortfoliosAPI();
      var fetchedPortfolios = fetchedUserData.portfolio;
      if (fetchedPortfolios.isNotEmpty) {
        portfolios.assignAll(fetchedPortfolios);
        hasLoadedData.value = true;
      }
        } catch (e) {
      print('Error fetching portfolios: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deletePortfolio(int id) async {
    try {
      await deletePortfolioAPI(id);
      portfolios.removeWhere((portfolio) => portfolio.id == id);
    } catch (e) {
      print('Error deleting portfolio: $e');
    }
  }
}
