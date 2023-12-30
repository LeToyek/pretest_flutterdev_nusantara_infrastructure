import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/custom_app_bar.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/home/views/book_card_view.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.goToBookAdd,
        label: const Text("Tambah Buku"),
        icon: const Icon(Icons.add),
      ),
      body: controller.obx(
        (state) => _refreshWrapper(
          isScroll: state != null && state.isEmpty,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: state != null && state.isEmpty
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          "Anda belum memiliki buku, silahkan tambahkan buku anda dengan cara tekan tombol di pojok kanan bawah."),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Berikut adalah daftar buku anda:",
                        style: textTheme.bodyLarge,
                      ),
                      Text(
                          "Anda dapat menghapus buku anda dengan cara menekan dan menahan kartu buku yang ingin dihapus.",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 12,
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = state[index];
                            return BookCardView(book: item);
                          },
                          itemCount: state!.length),
                      const SizedBox(
                        height: 64,
                      )
                    ],
                  ),
          ),
        ),
        onError: (error) => _refreshWrapper(
          child: Center(
            child: Text("Error $error"),
          ),
        ),
        onEmpty: _refreshWrapper(
          child: const Center(
            child: Text("No Data"),
          ),
        ),
        onLoading: _refreshWrapper(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget _refreshWrapper({required Widget child, bool isScroll = true}) {
    return RefreshIndicator(
        onRefresh: controller.getAllBooks,
        child: isScroll
            ? LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                            minWidth: constraints.maxWidth),
                        child: IntrinsicHeight(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [const Spacer(), child, const Spacer()],
                        )),
                      ),
                    ))
            : child);
  }
}
