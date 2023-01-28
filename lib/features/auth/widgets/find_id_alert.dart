import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_flan/core/app_colors.dart';

final findEmailControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

// 1
class FindIdAlert extends ConsumerWidget {
  const FindIdAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(findEmailControllerProvider);

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
              '아이디 찾기',
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
                  '아이디는 가입 시 입력하신 이메일을',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  '통해 찾을 수 있습니다.',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15.h),
                TextField(
                  controller: emailController,
                  cursorColor: AppColors.textFieldGrayColor,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'fontR',
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF3F5F6),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    hintText: '이메일을 입력하세요.',
                    hintStyle: TextStyle(
                      color: AppColors.textFieldGrayColor,
                      fontSize: 13.sp,
                      fontFamily: 'fontR',
                    ),
                    contentPadding: EdgeInsets.all(15.w),
                  ),
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {
                    print(emailController.text);

                    // go 2
                    context.pop();
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return const FindIdAlert2();
                      },
                    );
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
                        '아이디 찾기',
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

// 2
class FindIdAlert2 extends ConsumerWidget {
  const FindIdAlert2({
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
              '아이디 찾기',
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
                Column(
                  children: [
                    Text(
                      '회원가입 시 사용한 아이디는',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 13.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '아이디',
                          style: TextStyle(
                            fontFamily: 'fontB',
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          '입니다.',
                          style: TextStyle(
                            fontFamily: 'fontL',
                            fontSize: 13.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {
                    context.pop();
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
                        '로그인 화면으로 돌아가기',
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
