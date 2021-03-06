import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';

import '../../constants/text_styles.dart';
import '../widgets/excersices_card.dart';
import '../widgets/search_bar.dart';

class ChestScreen extends StatelessWidget {
  const ChestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),),
        actions: const [Center(child: SearchBar(),)],
      ),
      body: Column(
          children: [
            const Space(boxHeight: 15,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: height(40),width: screenWidth,
        color: const Color(0xFF707070).withOpacity(0.3),
        child: Container(alignment: Alignment.centerLeft,child: Text('Chest',style: widgetTitle,)),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context , index){
            return ExcricesCard(name: 'Bench Presses',ex: 'Chest',img: 'assets/images/chest1.png', colorDivider: Colors.black,);
          }),
        )
      ]),
    );
  }
}
