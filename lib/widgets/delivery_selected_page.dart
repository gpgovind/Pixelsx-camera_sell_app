import 'dart:developer';

import 'package:camera_sell_app/utils/const_path.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum OrderUpdate {
  orderPlaced,
  orderArrivingTomorrow,
  orderPacked,
  orderDelivered
}

class OrderUpdatePage extends ConsumerStatefulWidget {
  const OrderUpdatePage({super.key, required this.docId});
  final String docId;
  @override
  ConsumerState<OrderUpdatePage> createState() => _OrderUpdatePageState();
}

class _OrderUpdatePageState extends ConsumerState<OrderUpdatePage> {
  OrderUpdate? _selectedUpdate;
  @override
  Widget build(BuildContext context) {
    final orderStatus = ref.watch(orderProvider);
    return ListView(
      children: <Widget>[
        RadioListTile<OrderUpdate>(
          fillColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.blue;
              }
              return Colors.white;
            },
          ),
          tileColor: const Color.fromRGBO(72, 76, 87, 1),
          title: const Text('Order placed',
              style: TextStyle(color: Colors.white)),
          value: OrderUpdate.orderPlaced,
          groupValue: _selectedUpdate,
          onChanged: (OrderUpdate? value) {
            setState(() {
              _selectedUpdate = value;
            });
          },
        ),
        const Divider(
          color: Colors.white54,
        ),
        RadioListTile<OrderUpdate>(
          fillColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.blue;
              }
              return Colors.white;
            },
          ),
          tileColor: const Color.fromRGBO(72, 76, 87, 1),
          title: const Text('Order Arriving Tomorrow',
              style: TextStyle(color: Colors.white)),
          value: OrderUpdate.orderArrivingTomorrow,
          groupValue: _selectedUpdate,
          onChanged: (OrderUpdate? value) {
            setState(() {
              _selectedUpdate = value;
            });
          },
        ),
        const Divider(
          color: Colors.white54,
        ),
        RadioListTile<OrderUpdate>(
          fillColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.blue;
              }
              return Colors.white;
            },
          ),
          tileColor: const Color.fromRGBO(72, 76, 87, 1),
          title:
              const Text('Order Packed', style: TextStyle(color: Colors.white)),
          value: OrderUpdate.orderPacked,
          groupValue: _selectedUpdate,
          onChanged: (OrderUpdate? value) {
            setState(() {
              _selectedUpdate = value;
            });
          },
        ),
        const Divider(
          color: Colors.white54,
        ),
        RadioListTile<OrderUpdate>(
          fillColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.blue;
              }
              return Colors.white;
            },
          ),
          tileColor: const Color.fromRGBO(72, 76, 87, 1),
          title: const Text(
            'Order Delivered',
            style: TextStyle(color: Colors.white),
          ),
          value: OrderUpdate.orderDelivered,
          groupValue: _selectedUpdate,
          onChanged: (OrderUpdate? value) {
            setState(() {
              _selectedUpdate = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: ()async  {
            
                EasyLoading.show(indicator: esLoading(), status: 'please wait');
              if (_selectedUpdate != null) {
                final orderUpdate = _selectedUpdate;
                final extractedPart = EnumToString.convertToString(orderUpdate);
                log(extractedPart.toString());
                log('${widget.docId} doc id');
                await orderStatus
                    .changeOrderStatus(widget.docId, extractedPart)
                    .then((value) {
                      EasyLoading.dismiss();
                    });
              } else {
                log('No Order Update selected.');
              }
           
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}
