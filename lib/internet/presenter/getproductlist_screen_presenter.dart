import 'package:sampleapp/internet/model/ListProductModel.dart';
import 'package:sampleapp/ui/home/HomeScreen.dart';

import '../RestDatasource.dart';

abstract class ProductListContract {
  ProductListContract(HomeScreenState homeScreenState);

  void onSuccess(GetListProductModel model);

  void onError(String errorTxt);
}

class GetProductList {
  ProductListContract _view;
  RestDatasource api = new RestDatasource();

  GetProductList(this._view);

  doGetProductList(int page,int count,int category_id) {
    api.getListProduct(page,count,category_id).then((GetListProductModel model) {
      _view.onSuccess(model);
    }).catchError((Object error) => _view.onError(error.toString()));
  }
}
