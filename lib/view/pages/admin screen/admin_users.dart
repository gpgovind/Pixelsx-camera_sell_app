
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/widget_path.dart';
import '../../../utils/const_path.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  bool isRedSelected = true;

  @override
  Widget build(BuildContext context) {
    return backgroundColor(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
        children: [
           statusWidget,
            const SizedBox(
            height: 20,
          ),
          UserManageCard(
              name: Row(
                children: [
                  const Text("Name",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white54)),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 26.r,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        'lib/assets/rs.jpeg',
                        fit: BoxFit.cover,
                        height: 135.r,
                        width: 135.r,
                      ),
                    ),
                  ),
                ],
              ),
              status: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(isRedSelected ? 'Unblocked' : 'Blocked',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color:
                              isRedSelected ? Colors.green : Colors.red)),
                  Radio(
                    activeColor: isRedSelected ? Colors.green : Colors.red,
                    value: true,
                    groupValue: isRedSelected,
                    onChanged: (value) {
                      setState(() {
                        value = isRedSelected;
                      });
                    },
                  ),
                ],
              ),
              action: neoPopBtnNew(
                  text: isRedSelected ? 'Block' : 'Unblock',
                  color:
                      isRedSelected ? Colors.red[100]! : Colors.green[100]!,
                  horizontal: 10,
                  vertical: 10,
                  textColor: isRedSelected ? Colors.red : Colors.green,
                  onTapUp: () {
                    setState(() {
                      isRedSelected = !isRedSelected;
                    });
                    HapticFeedback.vibrate();
                  }),
              hight: 100.h,
              width: double.infinity),
          const SizedBox(
            height: 20,
          ),
          UserManageCard(
              name: Row(
                children: [
                  const Text("Name",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white54)),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 26.r,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        'lib/assets/rs.jpeg',
                        fit: BoxFit.cover,
                        height: 135.r,
                        width: 135.r,
                      ),
                    ),
                  ),
                ],
              ),
              status: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(isRedSelected ? 'Unblocked' : 'Blocked',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color:
                              isRedSelected ? Colors.green : Colors.red)),
                  Radio(
                    activeColor: isRedSelected ? Colors.green : Colors.red,
                    value: true,
                    groupValue: isRedSelected,
                    onChanged: (value) {
                      setState(() {
                        value = isRedSelected;
                      });
                    },
                  ),
                ],
              ),
              action: neoPopBtnNew(
                  text: isRedSelected ? 'Block' : 'Unblock',
                  color:
                      isRedSelected ? Colors.red[100]! : Colors.green[100]!,
                  horizontal: 10,
                  vertical: 10,
                  textColor: isRedSelected ? Colors.red : Colors.green,
                  onTapUp: () {
                    setState(() {
                      isRedSelected = !isRedSelected;
                    });
                  }),
              hight: 100.h,
              width: double.infinity),
          const SizedBox(
            height: 20,
          ),
          UserManageCard(
              name: Row(
                children: [
                  const Text("Name",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white54)),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 26.r,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        'lib/assets/rs.jpeg',
                        fit: BoxFit.cover,
                        height: 135.r,
                        width: 135.r,
                      ),
                    ),
                  ),
                ],
              ),
              status: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(isRedSelected ? 'Unblocked' : 'Blocked',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color:
                              isRedSelected ? Colors.green : Colors.red)),
                  Radio(
                    activeColor: isRedSelected ? Colors.green : Colors.red,
                    value: true,
                    groupValue: isRedSelected,
                    onChanged: (value) {
                      setState(() {
                        value = isRedSelected;
                      });
                    },
                  ),
                ],
              ),
              action: neoPopBtnNew(
                  text: isRedSelected ? 'Block' : 'Unblock',
                  color:
                      isRedSelected ? Colors.red[100]! : Colors.green[100]!,
                  horizontal: 10,
                  vertical: 10,
                  textColor: isRedSelected ? Colors.red : Colors.green,
                  onTapUp: () {
                    setState(() {
                      isRedSelected = !isRedSelected;
                    });
                  }),
              hight: 100.h,
              width: double.infinity),
        ],
          ),
        ),
      );
    
  }
}
