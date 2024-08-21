import 'package:flutter_template/view/bytes/bytes_screen.dart';

import '../../controller/bytes_controller.dart';
import '../../utils/export.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final BytesController controller = Get.find<BytesController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([
      controller.getBytes(),
      Future.delayed(const Duration(seconds: 2),(){
        Get.offAll(()=> BytesScreen());
      })
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.gc(AppColor.whiteBlack),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: Center(child: Image.asset(AppImages.logo),),),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: loadingWidget(),
          ),
        ],
      ),
    );
  }
}
