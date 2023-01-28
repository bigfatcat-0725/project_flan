import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_flan/core/app_colors.dart';

// final findPwIdControllerProvider = StateProvider.autoDispose((ref) {
//   return TextEditingController(text: '');
// });
final findPwEmailControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final certControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final newPwControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

// 1
class FindPwAlert extends ConsumerWidget {
  const FindPwAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final idController = ref.watch(findPwIdControllerProvider);
    final emailController = ref.watch(findPwEmailControllerProvider);

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
              '비밀번호 찾기',
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
                  '비밀번호는 가입 시 입력하신',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  '이메일을 통해 찾을 수 있습니다.',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15.h),
                // TextField(
                //   controller: idController,
                //   cursorColor: AppColors.textFieldGrayColor,
                //   style: TextStyle(
                //     fontSize: 13.sp,
                //     fontFamily: 'fontR',
                //   ),
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: const Color(0xffF3F5F6),
                //     border: InputBorder.none,
                //     hintText: '아이디를 입력하세요.',
                //     hintStyle: TextStyle(
                //       color: AppColors.textFieldGrayColor,
                //       fontSize: 13.sp,
                //       fontFamily: 'fontR',
                //     ),
                //     contentPadding: EdgeInsets.all(15.w),
                //   ),
                // ),
                // SizedBox(height: 10.h),
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
                    border: InputBorder.none,
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
                        return const FindPwAlert2();
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
class FindPwAlert2 extends ConsumerWidget {
  const FindPwAlert2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final certController = ref.watch(certControllerProvider);
    final newPwController = ref.watch(newPwControllerProvider);

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
              '비밀번호 재설정',
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
                  '입력하신 이메일로 인증번호를 발송하였습니다.',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  '새로운 비밀번호를 설정해주세요.',
                  style: TextStyle(
                    fontFamily: 'fontL',
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15.h),
                TextField(
                  controller: certController,
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
                    hintText: '인증번호를 입력하세요.',
                    hintStyle: TextStyle(
                      color: AppColors.textFieldGrayColor,
                      fontSize: 13.sp,
                      fontFamily: 'fontR',
                    ),
                    contentPadding: EdgeInsets.all(15.w),
                  ),
                ),
                SizedBox(height: 10.h),
                TextField(
                  controller: newPwController,
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
                    hintText: '새로운 비밀번호를 입력하세요.',
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
                    print(certController.text);
                    print(newPwController.text);
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
                        '비밀번호 변경',
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
