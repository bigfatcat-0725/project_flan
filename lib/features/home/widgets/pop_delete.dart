import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';

class PopDelete extends ConsumerWidget {
  const PopDelete({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          Column(
            children: [
              Container(
                width: 1.sw,
                height: 100.h,
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
                  children: [
                    Text(
                      '삭제하기',
                      style: TextStyle(
                        fontFamily: 'fontB',
                        fontSize: 17.sp,
                        color: AppColors.defaultTextColor,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        Text(
                          '데이터는 영구적으로 삭제되어',
                          style: TextStyle(
                            fontFamily: 'fontL',
                            fontSize: 12.sp,
                            color: AppColors.defaultTextColor,
                            letterSpacing: -0.05.sp,
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        Text(
                          '삭제한 후에는 복구가 불가능합니다.',
                          style: TextStyle(
                            fontFamily: 'fontL',
                            fontSize: 12.sp,
                            color: AppColors.defaultTextColor,
                            letterSpacing: -0.05.sp,
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
                  context.pop();
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
                      '삭제하기',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 13.sp,
                        color: AppColors.redColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  context.pop();
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
                      '취소',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 13.sp,
                        color: AppColors.defaultTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
