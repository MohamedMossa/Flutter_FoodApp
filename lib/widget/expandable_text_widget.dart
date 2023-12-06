import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text ;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgitState();
}
class _ExpandableTextWidgitState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight/6;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf="";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf,height:1.6,
        size: Dimensions.font16,color: AppColors.paraColor,):Column(
        children: [
          SmallText(height:1.6,size: Dimensions.font16,color: AppColors.paraColor,text:hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),

          InkWell(
            onTap: (){
              setState((){
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                hiddenText?SmallText(text:"Show more",color: AppColors.mainColor,)
                    :SmallText(text:"Show less",color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor,)

              ],
            ),
          ),
        ],
      ),
    );
  }
}