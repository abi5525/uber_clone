import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:uber_clone/components/widget.dart';
import 'package:uber_clone/extensions/colors.dart';
import 'package:uber_clone/extensions/style.dart';
import 'package:uber_clone/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  PageController pageController = PageController();
  int currentPage = 0;
  List<WalkThroughModelClass> walkthroughList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() {
    walkthroughList.add(WalkThroughModelClass(
        title: "Request a Ride",
        subTitle: "Request a ride to get picked up by \nnearby community drive",
        image: img_walkthrough1));
    walkthroughList.add(WalkThroughModelClass(
        title: "Request a Ride",
        subTitle: "Request a ride to get picked up by \nnearby community drive",
        image: img_walkthrough2));
    walkthroughList.add(WalkThroughModelClass(
        title: "Request a Ride",
        subTitle: "Request a ride to get picked up by \nnearby community drive",
        image: img_walkthrough3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: context.height() * 0.9,
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                currentPage = index;
                setState(() {});
              },
              children: walkthroughList.map((e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(e.title.validate(), style: HeaderStyle())
                        .paddingSymmetric(horizontal: 24),
                    Vertical_small,
                    Text(e.subTitle.validate(), style: BodyStyle())
                        .paddingSymmetric(horizontal: 24),
                    SvgPicture.asset(
                      e.image.validate(),
                      width: context.width() ,
                      height: context.height() *0.7,
                      fit: BoxFit.contain,
                    )
                  ],
                );
              }).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: context.height()*0.1,
            color: darkColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Skip").textColor(Colors.white).onTap((){
                  //goto home
                }),
                DotIndicator(pageController: pageController,
                 pages: walkthroughList,
                 unselectedIndicatorColor: Colors.grey.withOpacity(0.5),
                 ),
                 Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(currentPage ==3 ? "Finish" : "Next").textColor(Colors.white),
                 ).decorated(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(30)
                 ).onTap((){
                    if(currentPage ==3){
                      //goto home
                    }
                    else{
                      pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.decelerate);
                    }
                 })
              ],
            ),
          )
        ],
      ),
    );
  }
}
