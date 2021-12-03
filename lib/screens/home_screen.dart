import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_rest_api_getx_flutter/controller/framework_controller.dart';
import 'package:real_rest_api_getx_flutter/model/framework.dart';
import 'package:real_rest_api_getx_flutter/widgets/cheetah_button.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatelessWidget {
  final namaBarangController = TextEditingController();
  final stokController = TextEditingController();
  final jumlahTerjualController = TextEditingController();
  final jenisBarangController = TextEditingController();
  final tanggalTransaksiController = TextEditingController();

  final FrameworkController controller = FrameworkController.to;

  onItemPressed(Framework framework) {
    namaBarangController.text = framework.nama_barang;
    stokController.text = framework.stok.toString();
    jumlahTerjualController.text = framework.jumlah_terjual.toString();
    jenisBarangController.text = framework.jenis_barang;
    tanggalTransaksiController.text =
        framework.tanggal_transaksi.toIso8601String();
    controller.setSelected(framework);
  }

  onAddPressed() {
    Framework framework = Framework(
        nama_barang: namaBarangController.text,
        stok: int.parse(stokController.text),
        jumlah_terjual: int.parse(jumlahTerjualController.text),
        jenis_barang: jenisBarangController.text,
        tanggal_transaksi: DateTime.parse(tanggalTransaksiController.text));

    onClearPressed();
    controller.addFramework(framework);
  }

  onDeletePressed(int id) {
    onClearPressed();
    controller.deleteFramework(id);
  }

  onUpdatePressed(int id) {
    Framework framework = Framework(
        nama_barang: namaBarangController.text,
        stok: int.parse(stokController.text),
        jumlah_terjual: int.parse(jumlahTerjualController.text),
        jenis_barang: jenisBarangController.text,
        tanggal_transaksi: DateTime.parse(tanggalTransaksiController.text));
    onClearPressed();
    controller.updateFramework(id, framework);
  }

  onClearPressed() {
    namaBarangController.clear();
    stokController.clear();
    jumlahTerjualController.clear();
    jenisBarangController.clear();
    tanggalTransaksiController.clear();
    controller.clearSelected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('REST APIs with Dio GetX '),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GetBuilder<FrameworkController>(
              builder: (controller) => const Text(
                
                "Data Penjualan Warung Sederhana",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Nama Barang',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            TextField(
              controller: namaBarangController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Nama Barang',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    9,
                  ),
                  borderSide: const BorderSide(
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Stok',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            TextField(
              controller: stokController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Stok',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    9,
                  ),
                  borderSide: const BorderSide(
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Jumlah Terjual',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            TextField(
              controller: jumlahTerjualController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Jumlah Terjual',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    9,
                  ),
                  borderSide: const BorderSide(
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Jenis Barang',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            TextField(
              controller: jenisBarangController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Jenis Barang',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    9,
                  ),
                  borderSide: const BorderSide(
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Tanggal Transaksi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            TextField(
              controller: tanggalTransaksiController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Tanggal Transaksi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    9,
                  ),
                  borderSide: const BorderSide(
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GetBuilder<FrameworkController>(
                  builder: (controller) => CheetahButton(
                    onPressed: controller.selectedFramework == null
                        ? () => onAddPressed()
                        : null,
                    text: "Add",
                  ),
                ),
                GetBuilder<FrameworkController>(
                  builder: (controller) => CheetahButton(
                    onPressed: controller.selectedFramework == null
                        ? null
                        : () =>
                            onUpdatePressed(controller.selectedFramework.id),
                    text: "Update",
                  ),
                ),
                CheetahButton(
                  onPressed: () => onClearPressed(),
                  text: "Clear",
                ),
              ],
            ),
            const SizedBox(height: 16),
            GetBuilder<FrameworkController>(
              builder: (controller) => Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: InkWell(
                                onTap: () =>
                                    onItemPressed(controller.frameworks[index]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 8),
                                    Text(controller
                                            .frameworks[index].nama_barang ??
                                        'default value'),
                                    const SizedBox(height: 4),
                                    Text(controller.frameworks[index].stok
                                            .toString() ??
                                        'default value'),
                                    const SizedBox(height: 8),
                                    Text(controller
                                            .frameworks[index].jumlah_terjual
                                            .toString() ??
                                        'default value'),
                                    const SizedBox(height: 4),
                                    Text(controller
                                            .frameworks[index].jenis_barang ??
                                        'default value'),
                                    const SizedBox(height: 8),
                                    Text(DateFormat('dd-MM-yyyy')
                                            .format(controller.frameworks[index]
                                                .tanggal_transaksi)
                                            .toString() ??
                                        'default value'),
                                    const SizedBox(height: 4),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => onDeletePressed(
                                    controller.frameworks[index].id)),
                          ],
                        ),
                    separatorBuilder: (context, index) =>
                        const Divider(color: Colors.black),
                    itemCount: controller.frameworks.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
