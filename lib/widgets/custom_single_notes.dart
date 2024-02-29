import 'package:flutter/material.dart';
import 'package:note_app/utils/colors.dart';

class CustomSingleNotes extends StatelessWidget {
  const CustomSingleNotes({super.key, required this.title, required this.description, required this.date});
final String title;
final String description;
final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
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
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
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
