import 'package:english_memory_vocab/values/app_assets.dart';
import 'package:english_memory_vocab/values/app_colors.dart';
import 'package:english_memory_vocab/values/app_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //to render indicator

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.secondColor,
        appBar: AppBar(
          title: Text(
            'English today',
            style:
                AppStyles.h4.copyWith(fontSize: 36, color: AppColors.textColor),
          ),
          backgroundColor: AppColors.secondColor,
          elevation: 0,
          leading: InkWell(
            child: Image.asset(AppAssets.menu),
            onTap: () {
              // ignore: avoid_print
              print('hello');
            },
          ),
        ),
        // ignore: sized_box_for_whitespace
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: size.height * 1 / 10,
                child: Text(
                  'One of the advantages of being disorderly is that one is constantly making exciting discoveries.',
                  style: AppStyles.h4
                      .copyWith(color: AppColors.textColor, fontSize: 16),
                ),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: size.height * 2 / 3,
                margin: const EdgeInsets.only(bottom: 16),
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                      // ignore: avoid_print
                      print('current page: $_currentIndex');
                    });
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(3, 6),
                                    blurRadius: 6),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: AppColors.primaryColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(AppAssets.heart)),
                              RichText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  text: const TextSpan(
                                      text: 'B',
                                      style: TextStyle(
                                          fontFamily: FontFamily.sen,
                                          shadows: [
                                            BoxShadow(
                                                blurRadius: 6,
                                                color: Colors.black38,
                                                offset: Offset(3, 6)),
                                          ],
                                          fontSize: 64,
                                          fontWeight: FontWeight.bold),
                                      children: [TextSpan(text: 'eautiful')])),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  '"One who gains strength by overcoming obstacles possesses the only strength which can overcome adversity. "',
                                  style: AppStyles.h4.copyWith(
                                      color: AppColors.textColor,
                                      letterSpacing: 0.8),
                                ),
                              )
                            ],
                          )),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 12,
                child: Container(
                  padding: const EdgeInsets.only(left: 24),
                  // margin: const EdgeInsets.only(bottom: 10),
                  // color: Colors.greenAccent,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return buildIndicator(index == _currentIndex, size);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          child: Image.asset(AppAssets.exchange),
          onPressed: (() {
            // ignore: avoid_print
            print('hello');
          }),
        ));
  }

  Widget buildIndicator(bool isActive, Size size) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      // height: 8,
      width: isActive ? size.width / 5 : 24,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 6, color: Colors.black38, offset: Offset(3, 6))
          ],
          // color: Colors.black38
          color: isActive ? AppColors.lighBlue : AppColors.lightGrey,
          borderRadius: const BorderRadius.all(Radius.circular(24))),
    );
  }
}
