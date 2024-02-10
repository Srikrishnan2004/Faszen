import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchcontroller = TextEditingController();
  int currentPageIndex = 0;
  int currentChoiceIndex = 0;
  int currentOccasionChoiceIndex = 0;
  int currentWeddimgImageChoice = 0;
  List<String> WeddingImages = [
    "assets/weddingimage1.png",
    "assets/weddingimage2.png",
    "assets/weddingimage3.png",
    "assets/weddingimage4.png",
    "assets/weddingimage5.png",
    "assets/weddingimage6.png",
    "assets/weddingimage7.png",
    "assets/weddingimage8.png"
  ];
  List<String> WeddingImagesText = [
    "Saree",
    "Lehanga",
    "Salwar Kameez",
    "Kurtis",
    "Catholic Gown",
    "Sherwani",
    "Wedding Suit",
    "Silk Dhoti"
  ];
  List<String> choices = [
    "All",
    "Winter Fashion",
    "Summer Fashion",
    "Spring Fashion",
    "Fall Fashion"
  ];
  List<String> occasionchoice = [
    "Wedding wear",
    "Party wear",
    "Casual wear",
    "Formal wear",
    "Festive wear",
    "Adventure/Outdoor wear",
    "Holiday/Vacation wear",
    "Athleisure wear",
    "Black-tie Affairs",
    "Prom wear",
    "School/College wear",
    "Other Special Occasions"
  ];
  List<String> allImages = [
    "assets/allimage1.png",
    "assets/allimage2.png",
    "assets/allimage3.png",
    "assets/allimage4.png"
  ];
  List<String> allImagesText = [
    "Old Money aesthetics",
    "All -over Denim",
    "Oversized Cardigans",
    "Varsity Jackets"
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.blue,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite, color: Colors.black),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications, color: Colors.black),
              label: 'Notifications',
            ),
            NavigationDestination(
              icon: Icon(Icons.person, color: Colors.black),
              label: 'Profile',
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  Image.asset(
                    "assets/summonfizard.png",
                    height: 34,
                    width: 146,
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/iconimage1.png",
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    "assets/iconimage2.png",
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    "assets/iconimage3.png",
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 0.9 * width,
                child: TextFormField(
                  controller: searchcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Search by keyword or Product ID",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.search),
                        ],
                      ),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.mic_none),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons
                              .camera_alt_outlined), // Add your second icon
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 0.9 * width,
                child: Text(
                  "Welcome, Rohit",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 0.9 * width,
                child: Text(
                  "What are you looking for?",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(children: [
                const SizedBox(width: 20),
                Column(children: [
                  Image.asset("assets/accessories.png", height: 46, width: 46),
                  const SizedBox(height: 5),
                  const Text("Categories",
                      style: TextStyle(
                        fontSize: 8,
                      )),
                ]),
                const Spacer(),
                Column(children: [
                  Image.asset("assets/indic wear.png", height: 46, width: 46),
                  const SizedBox(height: 5),
                  const Text("Indic Wear",
                      style: TextStyle(
                        fontSize: 8,
                      )),
                ]),
                const Spacer(),
                Column(children: [
                  Image.asset("assets/westernwear.png", height: 46, width: 46),
                  const SizedBox(height: 5),
                  const Text("Western Wear",
                      style: TextStyle(
                        fontSize: 8,
                      )),
                ]),
                const Spacer(),
                Column(children: [
                  Image.asset("assets/categories.png", height: 46, width: 46),
                  const SizedBox(height: 5),
                  const Text("Accessories",
                      style: TextStyle(
                        fontSize: 8,
                      )),
                ]),
                const Spacer(),
                Column(children: [
                  Image.asset("assets/footwears.png", height: 46, width: 46),
                  const SizedBox(height: 5),
                  const Text("Footwear",
                      style: TextStyle(
                        fontSize: 8,
                      )),
                ]),
                const SizedBox(width: 20),
              ]),
              const SizedBox(height: 20),
              SizedBox(
                width: 0.9 * width,
                child: Text(
                  "Explored by trend",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 0.9 * width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: choices.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          currentChoiceIndex =
                              index; // Update the selected index
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the radius as needed
                          color: index == currentChoiceIndex
                              ? Colors.blue
                              : Colors.white,
                          border:
                              Border.all(color: Colors.blue), // Add a border
                        ),
                        child: Center(
                          child: Text(
                            choices[index],
                            style: TextStyle(
                              fontSize: 16,
                              color: index == currentChoiceIndex
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 195,
                width: 0.9 * width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allImages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            allImages[index],
                            height: 159,
                            width: 100,
                          ),
                          // const SizedBox(height: 5),
                          Text(allImagesText[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ));
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 0.9 * width,
                child: Text(
                  "Any Occasion on mind ?",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 0.9 * width,
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 2.0,
                  children: occasionchoice
                      .asMap()
                      .entries
                      .map(
                        (entry) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentOccasionChoiceIndex = entry.key;
                            });
                          },
                          child: Chip(
                            label: Text(entry.value),
                            backgroundColor:
                                currentOccasionChoiceIndex == entry.key
                                    ? Colors.blue
                                    : Colors.white,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 8.0,
                runSpacing: 2.0,
                children: List.generate(
                  WeddingImages.length,
                  (index) => InkWell(
                    onTap: () {
                      // Handle onTap
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          WeddingImages[index],
                          height: 88,
                          width: 88,
                        ),
                        Text(
                          WeddingImagesText[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
