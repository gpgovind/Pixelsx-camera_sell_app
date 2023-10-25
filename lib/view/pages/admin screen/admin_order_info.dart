import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const_path.dart';
import '../../../widgets/widget_path.dart';

class AdminOrderInfo extends ConsumerWidget {
  const AdminOrderInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getUser = ref.watch(userListProvider);

    return getUser.when(
        data: (userOrder) {
          return backgroundColor(
              child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemCount: userOrder.length,
                    itemBuilder: (context, index) {
                      final userData =
                          userOrder[index].data() as Map<String, dynamic>;
                      final name = userData['name'];
                      final id = userData['email'];

                      final userImage = userData['imageUrl'];
                      log('$userImage userimage');

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            CustomNavigator.navigationPush(
                                context: context,
                                child: AdminOrderListWidget(
                                  userEmail: id.toString(),
                                ));
                          },
                          tileColor: customAppBarColor,
                          leading: Text(
                            name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          title: Text(
                            id,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          trailing: (userImage != '')
                              ? CircleAvatar(
                                  radius: 26.r,
                                  backgroundColor:
                                      const Color.fromRGBO(72, 76, 87, 1),
                                  child: ClipOval(
                                    child: Image.network(
                                      userImage,
                                      fit: BoxFit.cover,
                                      height: 135.r,
                                      width: 135.r,
                                    ),
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 26.r,
                                  backgroundColor: Colors.white,
                                  child: const ClipOval(
                                      child: Icon(Icons.person_2_outlined)),
                                ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ));
        },
        error: (error, stackTrace) => loading(),
        loading: loading);
  }
}
