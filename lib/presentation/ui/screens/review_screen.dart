import 'package:craftybay_ecommerce/presentation/state_holders/review_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ReviewScreen extends StatefulWidget {
  final int id;
  const ReviewScreen({super.key, required this.id});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReviewController>().getReview(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: GetBuilder<ReviewController>(builder: (controller) {
        if (controller.getReviewInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: controller.review.data!.length ?? 0,
                      itemBuilder: (context, index) {
                        return ReviewCard(
                            cusName: controller.review.data![index].profile?.cusName ?? '',
                            reviewDescription: controller.review.data![index].description ?? '',
                            createdAt: controller.review.data![index].createdAt ?? '',
                            star: controller.review.data![index].rating ?? '',
                        );
                      }),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      'Reviews (${controller.review.data!.length ?? 0})',
                       style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black54
                    ),),
                    FloatingActionButton(
                      onPressed: (){
                        _showRatingAppDialog(controller,widget.id);
                      },
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),


    );
  }

  void _showRatingAppDialog(ReviewController controller,int id) {
    final dialog = RatingDialog(
      initialRating: 1.0,
      title: const Text(
        'Give your ratings',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      message: const Text(
        'Tap a star to set your rating.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      submitButtonText: 'Submit',
      commentHint: 'What do you think about this product?',
      onSubmitted: (response) {
        Map<String,dynamic> body = {
          "description": response.comment.toString(),
          "product_id": widget.id,
          "rating": response.rating
        };

        controller.setReview(id,body).then((value) {
          if(value){
            Get.find<ReviewController>().getReview(widget.id);
          }
        });


      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => dialog,
    );
  }



}
