import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_rest_api_getx_flutter/controller/framework_controller.dart';
import 'package:real_rest_api_getx_flutter/model/framework.dart';
import 'package:real_rest_api_getx_flutter/widgets/custom_button.dart';

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
        title: const Text('CRUD Data Penjualan'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: namaBarangController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(label: Text('Nama Barang')),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: stokController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(label: Text('Stok')),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: jumlahTerjualController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(label: Text('Jumlah Terjual')),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: jenisBarangController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(label: Text('Jenis Barang')),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: tanggalTransaksiController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.datetime,
              decoration:
                  const InputDecoration(label: Text('Tanggal Transaksi')),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GetBuilder<FrameworkController>(
                  builder: (controller) => CustomButton(
                    onPressed: controller.selectedFramework == null
                        ? () => onAddPressed()
                        : null,
                    text: "Add",
                  ),
                ),
                GetBuilder<FrameworkController>(
                  builder: (controller) => CustomButton(
                    onPressed: controller.selectedFramework == null
                        ? null
                        : () =>
                            onUpdatePressed(controller.selectedFramework.id),
                    text: "Update",
                  ),
                ),
                CustomButton(
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
                                    Text('Nama Barang : ' +
                                            controller.frameworks[index]
                                                .nama_barang ??
                                        'default value'),
                                    const SizedBox(height: 4),
                                    Text('Stok : ' +
                                            controller.frameworks[index].stok
                                                .toString() ??
                                        'default value'),
                                    const SizedBox(height: 8),
                                    Text('Jumlah Terjual : ' +
                                            controller.frameworks[index]
                                                .jumlah_terjual
                                                .toString() ??
                                        'default value'),
                                    const SizedBox(height: 4),
                                    Text('Jenis Barang : ' +
                                            controller.frameworks[index]
                                                .jenis_barang ??
                                        'default value'),
                                    const SizedBox(height: 8),
                                    Text('Tanggal Transaksi : ' +
                                            DateFormat('dd-MM-yyyy')
                                                .format(controller
                                                    .frameworks[index]
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
