import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/nav_bar.dart';
import '../../theme.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            NavBar(title: "Settings"),
            const SizedBox(height: 35),
            CircleAvatar(
              radius: 70,
              backgroundColor: TColor.gray20,
              child: Text("A"),
            ),
            const SizedBox(height: 20),
            //we will replace it with the value of the TextEditingController
            //of the name textField on the login creen
            Text(
              "Name",
              style: TextStyle(
                  color: TColor.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text("zero@gmail.com",
                style: TextStyle(
                    color: TColor.gray30,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: TColor.gray30.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: TColor.border.withOpacity(0.15))),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 2, left: 10),
                      child: Text(
                        "General",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      // height: media.width * 1,
                      padding: const EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 20),
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: TColor.gray40.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("The Name",
                                        style: TextStyle(
                                          color: TColor.white,
                                        )),
                                    Icon(
                                      Icons.access_time_filled_outlined,
                                      color: TColor.white,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("The Name",
                                        style: TextStyle(
                                          color: TColor.white,
                                        )),
                                    Icon(
                                      Icons.access_time_filled_outlined,
                                      color: TColor.white,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("The Name",
                                        style: TextStyle(
                                          color: TColor.white,
                                        )),
                                    Icon(
                                      Icons.access_time_filled_outlined,
                                      color: TColor.white,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
