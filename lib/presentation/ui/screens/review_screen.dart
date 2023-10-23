import 'package:craftybay_ecommerce/presentation/state_holders/review_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),),
                            builder: (context){
                          return Container(
                            height: MediaQuery.of(context).size.height * .7,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text("What is you Rate"),

                                ],
                              ),
                            ),
                          );
                        }
                        );
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



}
