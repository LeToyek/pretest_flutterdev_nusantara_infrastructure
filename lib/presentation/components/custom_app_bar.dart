import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/home/controllers/home.controller.dart';

class CustomAppBar extends GetView<HomeController>
    implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        // height: 200,
        decoration: BoxDecoration(
          color: controller.deleteListId.isEmpty
              ? colorScheme.primary
              : Colors.redAccent,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 4,
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Book List",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: Colors.white),
                ),
              ),
            ),
            if (controller.deleteListId.isNotEmpty)
              IconButton(
                  onPressed: () {
                    controller.deleteSelectedBook();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ))
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(200);
}
