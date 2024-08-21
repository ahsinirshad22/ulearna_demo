import 'package:flutter_template/utils/app_urls.dart';

import '../base_client/base_client.dart';
import '../model/bytes_data_model.dart';
import '../utils/export.dart';

class BytesController extends GetxController {

  var isGettingBytes = false.obs;
  var isPaginatingBytes = false.obs;
  var newsCurrentPageNo = 1;
  var bytes = BytesDataModel().obs;
  PageController pageController = PageController();



  Future getBytes({int pageNo = 1, int pageSize = 10}) async {
    if (pageNo > 1 && pageNo == newsCurrentPageNo) {
      customLog("Same Page Again");
      return;
    }

    if (pageNo == 1) {
      isGettingBytes.value = true;
    } else {
      isPaginatingBytes.value = true;
    }

    String url =
        '${AppUrls.bytesUrl}?page=$pageNo&limit=$pageSize&country=United+States';

    var response = await BaseClient().get(url);

    if (response != null) {
      newsCurrentPageNo = pageNo;

      var res = BytesDataModel.fromJson(response);
      if (pageNo == 1) {
        bytes.value = res;
        bytes.refresh();
      } else {
        if (bytes.value.data?.data == null) {
          bytes.value.data?.metaData = res.data?.metaData;
        } else {
          bytes.value.data?.metaData = res.data?.metaData;
          bytes.value.data?.data?.addAll(res.data?.data ?? []);
          bytes.refresh();
        }
      }
    }

    if (pageNo == 1) {
      isGettingBytes.value = false;
    } else {
      isPaginatingBytes.value = false;
    }
  }

}
