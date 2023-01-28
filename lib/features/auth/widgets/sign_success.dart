import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';

class SignSuccess extends ConsumerWidget {
  const SignSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      content: SizedBox(
        width: 290.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '회원가입 완료',
              style: TextStyle(
                fontFamily: 'fontB',
                fontSize: 17.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '회원가입이 완료되었습니다.',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'FLAN에서 제공하는 서비스를 이용해보세요.',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {
                    context.pop();
                    context.go('/');
                  },
                  child: Container(
                    width: 1.sw,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: Text(
                        '로그인 페이지로 돌아가기',
                        style: TextStyle(
                          fontFamily: 'fontR',
                          fontSize: 13.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 30.h,
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 25.w),
    );
  }
}
