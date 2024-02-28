import 'package:flutter/material.dart';
import 'package:note_app/utils/colors.dart';

class CustomSingleNotes extends StatelessWidget {
  const CustomSingleNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black.withOpacity(.2),
        )
      ),
      child: ListTile(
        horizontalTitleGap: 0,
        leading: Container(
          height: 13,
          width: 13,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.backgroundColors,
          ),
        ),
        title: Text(
          'Software Developer',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi there, This is a Text note.',
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '12.00 AM.',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 12,
                  ),
                ),
                InkWell(onTap: (){},child: const Icon(Icons.delete,size: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
