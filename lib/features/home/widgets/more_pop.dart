import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/features/home/home_controller.dart';
import 'package:project_flan/features/home/widgets/pop_delete.dart';
import 'package:project_flan/features/home/widgets/pop_edit.dart';
import 'package:project_flan/features/home/widgets/pop_report.dart';

class MorePop extends ConsumerWidget {
  const MorePop({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 해당 카드
    final qa = ref.watch(feedProvider.notifier).state!.question![index];
    final topAnswer = qa.answer![0];

    return AlertDialog(
      alignment: Alignment.bottomCenter,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 1.sw,
            height: 130.h,
            margin: EdgeInsets.symmetric(horizontal: 0.w),
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: Offset.zero,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: const FittedBox(
                                child: Text(
                                  'Q',
                                  style: TextStyle(
                                    fontFamily: 'fontB',
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              qa.private == '0' ? '익명' : '이름',
                              style: TextStyle(
                                fontFamily: 'fontB',
                                color: AppColors.primaryColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 1.sw,
                      margin: EdgeInsets.only(left: 30.w),
                      child: Text(
                        '${qa.question}',
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: 'fontB',
                          color: const Color(0xff1D1D1B),
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF5F5F5),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                topAnswer.users!.nickname.toString(),
                                style: TextStyle(
                                  fontFamily: 'fontB',
                                  color: const Color(0xff1D1D1B),
                                  fontSize: 13.sp,
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Text(
                                '1일 전',
                                style: TextStyle(
                                  fontFamily: 'fontR',
                                  color: const Color(0xff4F4F4F),
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            topAnswer.answers!.reply.toString(),
                            maxLines: 2,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: 'fontR',
                              fontSize: 12.sp,
                              color: const Color(0xff2B3333),
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 7.5.h),
          GestureDetector(
            onTap: () {
              context.pop();
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return const PopReport();
                },
              );
            },
            child: Container(
              width: 1.sw,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  '신고',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: const Color(0xffDB1818),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return const PopDelete();
                  });
            },
            child: Container(
              width: 1.sw,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  '답변 삭제',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: const Color(0xffDB1818),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  builder: (context) {
                    return PopEdit(index: index);
                  });
            },
            child: Container(
              width: 1.sw,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  '답변 수정',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: const Color(0xff1D1D1B),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 1.sw,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  '취소',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: const Color(0xff1D1D1B),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 30.h,
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
    );
  }
}
