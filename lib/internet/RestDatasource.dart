import 'package:flutter/cupertino.dart';

import 'NetworkUtil.dart';
import 'model/ListProductModel.dart';
import 'model/UserModel.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://piousecommerce.000webhostapp.com/ecom/ecom/";

  static final LOGIN_URL = BASE_URL + "";
  static final GtListProduct = BASE_URL + "services/listProduct";
  static final Imageuploads = BASE_URL + "uploads/product/";

  static final KEY = "8V06LupAaMBLtQqyq";

  // body header part
  static final CACHE = "Cache-Control: max-age=0";
  static final AGENT = "User-Agent: Pious";
  static final SECURITY = "Security: " + KEY;

  Map<String, String> requestHeaders = {
    'Cache-Control': 'amax-age=0',
    'User-Agent': 'Pious',
  };

  Future<GetListProductModel> getListProduct(
      int page, int count, int category_id) {
    return _netUtil
        .get("$GtListProduct?page=$page&count=$count&category_id=$category_id",
            requestHeaders)
        .then((dynamic res) {
      print(res.toString());
      if (res["status"] != "success") throw new Exception(res["error_msg"]);
      return new GetListProductModel.fromJson(res);
    });
  }


}
