import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_app/core/constants/app_assets.dart';


import '../../../../common/widgets/app_bar_widget.dart';
import '../../../../common/widgets/big_button.dart';
import '../../../../common/widgets/side_menu_widget.dart';
import '../../../../core/constants/app_colors.dart';

import '../../redeem_points_screen/view/redeem_points.dart';
import '../domain/home_cubit.dart';
import 'widgets/settings_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, });

  static const route = "/HomeView";
  
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homeCubit = context.watch<HomeCubit>();
    return Scaffold(
   
     body: SafeArea(
       child: Container(
          
       decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.backgroundImage),fit: BoxFit.cover)
       ),
       child: Center(
         child: Column(
          
          children: [
          Container(
            padding: EdgeInsets.only(left:24.w,right:24.w,top:11.h,bottom: 11.h),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){},
                  child: SvgPicture.asset(AppImages.sortIcon)),
                  const Text("GitHub Repo.",),
                  InkWell(
                  onTap: (){},
                  child: SvgPicture.asset(AppImages.searchIcon)),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
           Container(
            margin: EdgeInsets.only(left: 20.w,right: 20.w,top:14.h),
             padding: EdgeInsets.only(left:10.w,right:10.w,top:10.h,bottom:10.h),
            height: ScreenUtil().screenHeight/1.2,
            decoration: BoxDecoration(
              color: AppColors.containerColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft:Radius.zero,bottomRight: Radius.zero)
            ),
 child:
 SizedBox(
           height: ScreenUtil().scaleHeight/1,
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context,index){
              return Column(children: [
                
               Row(children: [
                Container(
                  height: 50.h,
                  width: 50.h,
                  margin: EdgeInsets.only(left:10.w,right:10.w,top:10.h,bottom:10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
SizedBox(width: 20.w,),
                 Column(
                 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Name: '),
                          TextSpan(
                            text: 'Test Test',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                         
                        ],
                      ),
                    ),
                    Row(
                 
                      children:[
                        Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Owner: '),
                            TextSpan(
                              text: 'Hani Mustafa',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                           
                          ],
                        ),
                      ),
                      
                      Container(
                        padding: EdgeInsets.only(left:10.w,right:10.w,top:2.h,bottom:2.h),
decoration: BoxDecoration(
  color: AppColors.containerDateColor,
  borderRadius: BorderRadius.circular(10)
),
child: Text("12/10/2023",style: TextStyle(color: AppColors.textDateColor),),
                      )
                  ]),
                  ],
                )
               ],),
Row(children: [Text("Main Branch: Asadsmn-Test test"),
InkWell(
  onTap: (){},
  child: 
SvgPicture.asset(AppImages.copyIcon)
)
])
              ],);

            }, separatorBuilder: (BuildContext context, int index)=>const Divider(
              color: Colors.white,
              indent: 4,
            ),),
          ) ,
           )
          // SizedBox(
          //   height: ScreenUtil().scaleHeight/1,
          //   child: ListView.separated(
          //     itemCount: 4,
          //     itemBuilder: (context,index){
          //     return Container(
          //       decoration:BoxDecoration(
          //         color: AppColors.backgroundColor
          //       ),
          //       child: Column(children: [
          //         Container(
          //               decoration: BoxDecoration(
          //                 color: Colors.white
          //               ),
          //             ),
          //        Row(children: [
          //         Text("Name",style: Theme.of(context).textTheme.titleMedium,),
          //        ],)
          //       ],),
          //     );

          //   }, separatorBuilder: (BuildContext context, int index)=>Divider(),),
          // )
         ],),
       ),
       ),
     )
    );
    
  }
}
