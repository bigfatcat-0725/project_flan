import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/features/home/home_controller.dart';
import 'package:project_flan/features/home/widgets/pop_delete.dart';
import 'package:project_flan/features/home/widgets/pop_edit.dart';
import 'package:project_flan/features/home/widgets/pop_report.dart';

class BasicMorePop extends ConsumerWidget {
  const BasicMorePop({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qa = ref.watch(feedProvider.notifier).state!.question![index];

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
          if (qa.status == '1')
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
                    '차단',
                    style: TextStyle(
                      fontFamily: 'fontL',
                      fontSize: 13.sp,
                      color: const Color(0xffDB1818),
                    ),
                  ),
                ),
              ),
            ),
          if (qa.status == '1') SizedBox(height: 5.h),
          if (qa.status == '2')
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
          if (qa.status == '2') SizedBox(height: 5.h),
          if (qa.status == '2' || qa.status == '3')
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
          if (qa.status == '2' || qa.status == '3') SizedBox(height: 5.h),
          if (qa.status == '2')
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
          if (qa.status == '2') SizedBox(height: 5.h),
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
