import 'package:flutter_template/controller/bytes_controller.dart';
import 'package:flutter_template/view/bytes/video_reel_item.dart';
import 'package:video_player/video_player.dart';

import '../../model/bytes_data_model.dart';
import '../../utils/export.dart';

class BytesScreen extends StatefulWidget {
  BytesScreen({super.key});

  @override
  State<BytesScreen> createState() => _BytesScreenState();
}

class _BytesScreenState extends State<BytesScreen> {
var bytesController = Get.find<BytesController>();


@override
void dispose() {
  super.dispose();
}

@override
  void initState() {
    super.initState();
    bytesController.pageController.addListener(() {
      if (bytesController.pageController.page == (bytesController.bytes.value.data?.data?.length??1) - 1 && !bytesController.isPaginatingBytes.value) {
        bytesController.getBytes(pageNo: (bytesController.bytes.value.data?.metaData?.page??0) + 1);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(()=>
        bytesController.isGettingBytes.value?loadingWidget():
        (bytesController.bytes.value.data?.data?.isEmpty??true)?
            Center(
              child: Text("no_data".tr,),
            ): PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: (bytesController.bytes.value.data?.data?.length??0) + 1, // One extra item for loading indicator
          onPageChanged: (index) {
            
            customLog("Current Index : -- $index");
            
            if (index == (bytesController.bytes.value.data?.data?.length??0) - 1) {
              bytesController.getBytes(pageNo: (bytesController.bytes.value.data?.metaData?.page??0)+1);
            }
          },
          itemBuilder: (context, index) {
            if (index == (bytesController.bytes.value.data?.data?.length??0)) {
              return Obx(() => Center(
                child: bytesController.isPaginatingBytes.value
                    ?  loadingWidget()
                    : const Text('No more videos', style: TextStyle(color: Colors.white)),
              ));
            }

            return VideoReelItem(video: bytesController.bytes.value.data?.data?[index]);
          },
        ),
        ),
      ),
    );
  }
}

