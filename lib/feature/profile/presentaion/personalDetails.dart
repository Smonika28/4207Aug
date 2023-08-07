import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:four20society/feature/profile/presentaion/edit_personal_page.dart';
import '../../../utils/Api/api_calling/api_provider.dart';
import '../model/profile_model.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  ApiProvider apiProvider = ApiProvider();
  ProfileModel profileModel = ProfileModel();

  void profileData() async {
    var resData = await apiProvider.getProfile();
    log(resData.date!.toString());
    setState(() {
      profileModel = resData!;
    });
  }

  @override
  void initState() {
    super.initState();
    profileData();
  }

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Personal Details",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const EditPersonalDetails()));
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: profileModel.date != null
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 211, 209, 209)
                          .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            "First Name",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          subtitle: Text(
                            profileModel.date!.name ?? " ",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            "Last Name",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          subtitle: Text(
                            profileModel.date!.name ?? " ",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            "Mobile Number",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          subtitle: Text(
                            profileModel.date!.phone ?? " ",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            "Email ID",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          subtitle: Text(
                            profileModel.date!.email ?? " ",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            "House / Flat / Block NO.",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          subtitle: Text(
                            profileModel.date!.homeAddress ?? " ",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            "Apartment / Road / Area",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          subtitle: Text(
                            profileModel.date!.homeAddress ?? " ",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            "Zipcode",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          subtitle: Text(
                            profileModel.date!.pincode ?? " ",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            "Save As",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          subtitle: const Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container()
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }
}
