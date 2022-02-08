import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/modules/product_detail/product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(),
      body: LayoutBuilder(
        builder: (_, contraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: contraints.maxHeight,
                minWidth: contraints.maxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(reducedBy: 60),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://dartweek.academiadoflutter.com.br/images${controller.product.image}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      controller.product.description,
                      style: context.textTheme.bodyText2!,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return PlusMinusBox(
                      price: controller.product.price,
                      minusCallback: () => controller.removeProduct(),
                      plusCallback: () => controller.addProduct(),
                      quantity: controller.quantity,
                    );
                  }),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Total',
                      style: VakinhaUI.textBold,
                    ),
                    trailing: Obx(() {
                      return Text(
                        FormatterHelper.formatCurrency(controller.totalPrice),
                        style: VakinhaUI.textBold,
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: SizedBox(
                          width: context.widthTransformer(reducedBy: 10),
                          child: VakinhaButton(
                              onPressed: controller.addProductInShoppingCard,
                              label: controller.alreadyAdded
                                  ? 'ATUALIZAR'
                                  : 'ADICIONAR'))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
