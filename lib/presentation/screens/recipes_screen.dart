import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/presentation/screens/breakfast_screen.dart';
import 'package:get_fit/presentation/screens/dinner_screen.dart';
import 'package:get_fit/presentation/screens/lunch_screen.dart';
import 'package:get_fit/presentation/screens/snack_list_screen.dart';
import 'package:get_fit/presentation/screens/snack_screen.dart';
import '../../constants/text_styles.dart';
import 'breakfast_list_screen.dart';
import 'dinner_list_screen.dart';
import 'lunch_list_screen.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(
            'Recipes',
            style: titlePage,
          ),
          leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_ios_outlined),),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            child: Container(
              decoration: const BoxDecoration(color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage('assets/images/recipes_home.png'),opacity: 0.75, fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(150),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text('Breakfast Recipes',style: widgetTitle,),
                const Spacer(),
                TextButton(onPressed: (){Get.to(const BreakfastList());}, child: Text('See All',style: seeAll,))
              ],
            ),
          ),
          SizedBox(
            // margin: EdgeInsets.only(top: 0,bottom: 15),
            width: screenWidth,height: 120,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 5,bottom: 15),
              itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
              return InkWell(
                onTap: (){Get.to(BreakFastScreen());},
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: height(120),width: width(170),
                  padding: const EdgeInsets.only(left: 10,top: 10),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/pan_Cake.jpg'),opacity: 0.75,fit: BoxFit.fill),color: Colors.black,borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Almond Flour Pancake',style: titlePage,),
                  Text('12 min cook time',style: buttonText,),
                  Text('517 cal',style: buttonText,),
                ],),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text('lunch Recipes',style: widgetTitle,),
                const Spacer(),
                TextButton(onPressed: (){Get.to(const LunchList());}, child: Text('See All',style: seeAll,))
              ],
            ),
          ),
          SizedBox(
            // margin: EdgeInsets.only(top: 0,bottom: 15),
            width: screenWidth,height: 120,
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 5,bottom: 15),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){Get.to(LunchScreen());},
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: height(120),width: width(170),
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/burger.jpg'),opacity: 0.75,fit: BoxFit.fill),color: Colors.black,borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Chicken and Mushrooms',style: titlePage,),
                          Text('18 min cook time',style: buttonText,),
                          Text('250  cal',style: buttonText,),
                        ],),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text('Dinner Recipes',style: widgetTitle,),
                const Spacer(),
                TextButton(onPressed: (){Get.to(const DinnerList());}, child: Text('See All',style: seeAll,))
              ],
            ),
          ),
          SizedBox(
            // margin: EdgeInsets.only(top: 0,bottom: 15),
            width: screenWidth,height: 120,
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 5,bottom: 15),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){Get.to(DinnerScreen());},
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: height(120),width: width(170),
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/shrimp.jpg'),opacity: 0.75,fit: BoxFit.fill),color: Colors.black,borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Basil Shrimp',style: titlePage,),
                          Text('18 min cook time',style: buttonText,),
                          Text('170  cal',style: buttonText,),
                        ],),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text('Snack Recipes',style: widgetTitle,),
                const Spacer(),
                TextButton(onPressed: (){Get.to(const SnackList());}, child: Text('See All',style: seeAll,))
              ],
            ),
          ),
          SizedBox(
            // margin: EdgeInsets.only(top: 0,bottom: 15),
            width: screenWidth,height: 120,
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 5,bottom: 15),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){Get.to(SnackScreen());},
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: height(120),width: width(170),
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/pan_Cake.jpg'),opacity: 0.75,fit: BoxFit.fill),color: Colors.black,borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lemon Berry Crush Smoothie',style: titlePage,),
                          Text('95  cal',style: buttonText,),
                        ],),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}