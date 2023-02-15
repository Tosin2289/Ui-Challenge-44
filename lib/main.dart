import "package:flutter/material.dart";
import "package:flutter_carousel_slider/carousel_slider.dart";
import "package:flutter_carousel_slider/carousel_slider_indicators.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List letters = [
    "assets/img1.jpeg",
    "assets/img2.jpeg",
    "assets/img3.jpeg",
    "assets/img4.jpeg",
  ];

  int counter = 0;

  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                  controller: _sliderController,
                  slideBuilder: (index) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("${letters[index]}"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                  slideIndicator: CircularSlideIndicator(
                    indicatorBackgroundColor: Colors.white.withOpacity(0.5),
                    currentIndicatorColor: Colors.white,
                    itemSpacing: 14,
                    indicatorRadius: 3,
                    padding: EdgeInsets.only(bottom: 32),
                    indicatorBorderColor: Colors.white,
                  ),
                  itemCount: letters.length,
                  initialPage: 0,
                  enableAutoSlider: true,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Lake Tahoe",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.blue[600],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.blue[600],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.blue[600],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.blue[600],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.blue[600],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.blue[600],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("4.6"),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "[254 review]",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          child: const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            overflow: TextOverflow.fade,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Location",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Accomodation",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Enquiries",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              width: 12,
                            ),
                            itemCount: letters.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: NetworkImage("${letters[index]}"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
