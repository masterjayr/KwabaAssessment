import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kwaba_test/core/constants/app_colors.dart';
import 'package:kwaba_test/features/savings_plan/presentation/savings_info_1.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const KwabaApp());
}

class KwabaApp extends StatelessWidget {
  const KwabaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
          child: SpinKitWave(
            color: primaryColor,
            size: 50.0,
          ),
        ),
        overlayOpacity: 1.0,
        overlayColor: const Color.fromRGBO(0, 0, 0, 100),
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kwaba Mobile App',
            theme: ThemeData(
                primarySwatch: Colors.purple, primaryColor: Colors.purple),
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            // initialBinding: BindingsBuilder(() => {Get.put(AuthController())}),

            home: SavingsInfo1()));
  }
}
