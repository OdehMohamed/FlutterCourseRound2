import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 270,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/developer_banner.jpg'),
                    ),
                    Positioned(
                      top: 125,
                      left: 140,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/iam.jpg',
                            scale: 5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "Mohamed Odeh Hleesi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                "Junior Mobile App Developer",
                style: TextStyle(fontSize: 16, color: AppColors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                  ),
                  Text("Palestine, Jerusalem"),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.language_outlined,
                    size: 16,
                  ),
                  Text("Arabic, English"),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Contact Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.message),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Message",
                            style: TextStyle(
                              //color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.phone),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.facebook),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 10.0),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 10,
                  mainAxisSpacing: 10,
                  children: const [
                    Icon(
                      Icons.email,
                    ),
                    Text("moh95od@gmail.com"),
                    Icon(Icons.link),
                    Text("linkedin.com/in/Mohamed Odeh"),
                    Icon(Icons.phone),
                    Text("+972 569041611"),
                    Icon(Icons.code),
                    Text("github.com/OdehMohamed"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
