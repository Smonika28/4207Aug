import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:four20society/feature/auth/login/presentaion/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:four20society/feature/change_password/presentation/change_password%20(1).dart';
import 'package:four20society/feature/profile/presentaion/personalDetails.dart';
import '../../../global_widget/app_drawar.dart';
import '../../../utils/Api/api_calling/api_provider.dart';
import '../../../utils/local_storage/local_storage.dart';
import '../model/profile_model.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreen();
}

class _UserProfileScreen extends State<UserProfileScreen> {
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //image
  File? image;
  Future pickImage({fromCamera = false}) async {
    try {
      final image = await ImagePicker().pickImage(
          source: fromCamera ? ImageSource.camera : ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Profile Screen",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black54,
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      drawer: customDrawer(context: context),
      body: profileModel.date != null
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: const Color(0xFF00C8B8).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8)),
                    height: _screenHeight * 0.3,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 64,
                              backgroundImage: image != null
                                  ? Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    ).image
                                  : null,
                            ),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: GestureDetector(
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Color(0XFF00C8B8),
                                ),
                                onTap: () {
                                  print("hello in this ");
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: MediaQuery.of(context)
                                                .padding
                                                .bottom),
                                        child: Wrap(
                                          children: [
                                            const ListTile(
                                              title: Text('Choose From Source'),
                                            ),
                                            ListTile(
                                                leading: const Icon(
                                                    Icons.browse_gallery),
                                                title: const Text(
                                                    'Choose From Gallery'),
                                                onTap: () {
                                                  pickImage(fromCamera: false);
                                                  Navigator.of(context).pop();
                                                }),
                                            ListTile(
                                                leading: const Icon(
                                                    Icons.camera_alt),
                                                title: const Text(
                                                    'Choose From Camera'),
                                                onTap: () {
                                                  pickImage(fromCamera: true);
                                                  Navigator.of(context).pop();
                                                }),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              profileModel.date!.name ?? " ",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF1E1E1E),
                              ),
                            ),
                            Text(
                              profileModel.date!.homeAddress ?? " ",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF1E1E1E),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00C8B8).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "+91  ${profileModel.date!.phone ?? " "}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF1E1E1E),
                              ),
                            ),
                            Text(
                              profileModel.date!.email ?? " ",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF1E1E1E),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PersonalDetails()));
                          },
                          title: const Text(
                            "Personal Details",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text("User Personal Details"),
                          trailing: const Icon(
                            Icons.arrow_forward_outlined,
                            size: 18,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangePasswordScreen1()));
                          },
                          title: const Text(
                            "Privacy",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text("Change And Update Password"),
                          trailing: const Icon(
                            Icons.arrow_forward_outlined,
                            size: 18,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            LocalStorageService().removeToDisk(
                                LocalStorageService.ACCESS_TOKEN_KEY);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                                (route) => false);
                          },
                          title: const Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
