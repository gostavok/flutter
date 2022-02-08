import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/bindings/application_binding.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/routes/auth_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/home_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/orders_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/product_detail_routers.dart';

import 'app/routes/splash_routers.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatefulWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  _VakinhaBurgerMainAppState createState() => _VakinhaBurgerMainAppState();
}

class _VakinhaBurgerMainAppState extends State<VakinhaBurgerMainApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burger',
      theme: VakinhaUI.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductDetailRouters.routers,
        ...OrdersRouters.routers
      ],
    );
  }
}
