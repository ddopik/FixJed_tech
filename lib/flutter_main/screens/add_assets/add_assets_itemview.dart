import 'package:flutter/material.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class AddAssetsItemView extends StatefulWidget {
  final i;
  final Function onAddAssets, onSubstructAssets;

  AddAssetsItemView({this.i, this.onAddAssets, this.onSubstructAssets});

  @override
  State<StatefulWidget> createState() => _AddAssetsItemView();
}

class _AddAssetsItemView extends State<AddAssetsItemView> {
  int item = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(S.of(context).Assetname + " ${widget.i + 1}",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffffffff),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              )),
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                ),
                onPressed: () {
                  widget.onAddAssets();
                  setState(() {
                    item++;
                  });
                }),
            Text("$item"),
            IconButton(
                icon: Icon(
                  Icons.do_disturb_on_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  widget.onSubstructAssets();
                  if (item > 0) {
                    setState(() {
                      item--;
                    });
                  }
                }),
          ],
        )
      ],
    );
  }
}
