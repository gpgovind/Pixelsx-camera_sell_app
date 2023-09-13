import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/widget_path.dart';
import '../../../utils/const_path.dart';

class Users extends ConsumerStatefulWidget {
  const Users({super.key});

  @override
  ConsumerState<Users> createState() => _UsersState();
}

class _UsersState extends ConsumerState<Users> {
  bool isSelected=true;

  @override
  Widget build(BuildContext context) {
    final getUser =
        ref.watch(userListProvider); // Get the UserProvider instance
    final user = ref.watch(userProvider);
    return backgroundColor(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            statusWidget,
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: getUser.when(
              data: (data) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final userData = data[index].data() as Map<String, dynamic>;
                    final name = userData['name'];
                    final id = userData['id'];
                    final isBlocked = userData['isBlocked'] as bool;
                    final userImage = userData['imageUrl'];
                    log('$userImage userimage');

                    return UserManageCard(
                        name: Row(
                          children: [
                            Text(name,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                            const SizedBox(
                              width: 10,
                            ),
                            (userImage != 'empty')
                                ? CircleAvatar(
                                    radius: 26.r,
                                    backgroundColor: Colors.white,
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
                                  )
                          ],
                        ),
                        status: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(isBlocked ? 'Unblocked' : 'Blocked',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        isBlocked ? Colors.green : Colors.red)),
                            Radio(
                              activeColor:
                                  isBlocked ? Colors.green : Colors.red,
                              value: true,
                              groupValue: isBlocked,
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        action: neoPopBtnNew(
                            text: isBlocked ? 'Block' : 'Unblock',
                            color: isBlocked
                                ?
                                 Colors.green[100]! : Colors.red[100]!,
                            horizontal: 20,
                            vertical: 20,
                            textColor: isBlocked ? Colors.red : Colors.green,
                            onTapUp: () async {
                              log(id);
                             
                              setState(() {
                               isSelected=!isSelected;
                              });
                               await user.blockUser(
                                  uid: id, isBlocked:isSelected );

                              HapticFeedback.vibrate();
                            }),
                        hight: 80.h,
                        width: double.infinity);
                  },
                );
              },
              error: (error, stackTrace) {
                return Center(child: Text('Error: $error'));
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
            ))
          ],
        ),
      ),
    );
  }
}
