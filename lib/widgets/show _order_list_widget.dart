import 'package:camera_sell_app/utils/cash_network_image.dart';
import 'package:camera_sell_app/widgets/custom_button.dart';
import 'package:camera_sell_app/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class ShowOrderList extends StatefulWidget {
  const ShowOrderList(
      {super.key,
      required this.imageUrl,
      required this.orderInfo,
      required this.productName,
      required this.productDescription,
      required this.userAddress,
      required this.userName,
      required this.userNumber,
      required this.currentRating,
      required this.pId,
      required this.isDelved,
      required this.productPrice});
  final String productName;
  final String productPrice;
  final String orderInfo;
  final String imageUrl;
  final String productDescription;
  final bool isDelved;

  final String userName;
  final String userAddress;
  final String userNumber;
  final String pId;
  final double currentRating;

  @override
  State<ShowOrderList> createState() => _ShowOrderListState();
}

class _ShowOrderListState extends State<ShowOrderList> {
  bool onClicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ExpansionTile(
        clipBehavior: Clip.antiAlias,
        textColor: Colors.white,
        trailing: Text(widget.orderInfo,
            style: TextStyle(
                fontSize: 17.863384246826172,
                fontWeight: FontWeight.w400,
                color: Colors.green[300])),
        collapsedBackgroundColor: const Color.fromRGBO(72, 76, 87, 1),
        title: Text(widget.productName,
            style: const TextStyle(
                fontSize: 17.863384246826172,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        onExpansionChanged: (value) {
          setState(() => onClicked = value);
        },
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Positioned(
                  left: 1,
                  top: 5,
                  child: Text('name: ${widget.userName}',
                      style: const TextStyle(
                          fontSize: 15.863384246826172,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
                Positioned(
                  left: 1,
                  top: 30,
                  child: Text('address: ${widget.userAddress}',
                      style: const TextStyle(
                          fontSize: 15.863384246826172,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
                Positioned(
                  left: 1,
                  top: 55,
                  child: Text('number: ${widget.userNumber}',
                      style: const TextStyle(
                          fontSize: 15.863384246826172,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
                Positioned(
                  left: 1,
                  top: 80,
                  child: Text('price: ${widget.productPrice}',
                      style: const TextStyle(
                          fontSize: 15.863384246826172,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
                Positioned(
                  left: 1,
                  bottom: 20,
                  child: widget.isDelved
                      ? const SizedBox()
                      : const CustomButton(
                          buttonName: 'cancel',
                          hight: 50,
                          radius: 10,
                          width: 100),
                ),
                Positioned(
                    right: 1,
                    bottom: 10,
                    child: CashNetworkImage(imageUrl: widget.imageUrl)),
                Positioned(
                    left: 1,
                    bottom: 10,
                    child:widget.orderInfo=='orderDelivered'?  RatingWidget(
                      currentRating: widget.currentRating,
                      pId: widget.pId,
                    ):const SizedBox()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
