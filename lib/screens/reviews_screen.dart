import 'package:event_spotter/model/EAReviewModel.dart';
import 'package:event_spotter/utils/colors.dart';
import 'package:event_spotter/utils/data_provider.dart';
import 'package:event_spotter/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<EAReviewModel> list = reviewList();
  TextEditingController reviewController = TextEditingController();

  Widget slideLeftBackground() {
    return Container(
      color: primaryColor1,
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Icon(Icons.arrow_back, color: Colors.white),
            10.width,
            const Icon(Icons.info_outline, color: Colors.white),
            20.width,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Reviews',
          backWidget: const Icon(Icons.close, color: white).onTap(() {
            finish(context);
          }),
          center: true),
      body: const Center(
        child: Text('Add review screen'),
      ),
    );
  }
}
