import 'package:flutter/material.dart';
import '../Model/list_item.dart';
import 'package:nanoid/nanoid.dart';

class NovElement extends StatefulWidget {
  final Function addItem;
  NovElement(this.addItem);
  @override
  State<StatefulWidget> createState() => _NovElementState();
}

class _NovElementState extends State<NovElement> {
  final _predmetController = TextEditingController();
  final _datumIVremeController = TextEditingController();
  late String predmet;
  late String datumIVreme;
  void _submitData() {
    if (_datumIVremeController.text.isEmpty) {
      return;
    }
    final vnesenPredmet = _predmetController.text;
    final vnesenDatumIVreme = _datumIVremeController.text;
    if (vnesenPredmet.isEmpty || vnesenDatumIVreme.isEmpty) {
      return;
    }
    final newItem = ListItem(
        id: nanoid(5), predmet: vnesenPredmet, datumIVreme: vnesenDatumIVreme);
    widget.addItem(newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _predmetController,
            decoration: InputDecoration(labelText: "Предмет"),
            // onChanged: (val) {
            //   predmet = val;
            // },
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _datumIVremeController,
            decoration: InputDecoration(labelText: "Датум и време"),
            keyboardType: TextInputType.text,
            // onChanged: (val) {
            //   predmet = val;
            // },
            onSubmitted: (_) => _submitData(),
          ),
          TextButton(child: Text("Додај"), onPressed: _submitData)
        ],
      ),
    );
  }
}
