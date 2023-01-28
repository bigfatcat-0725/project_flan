import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/features/auth/widgets/find_pw_alert.dart';

import 'auth_controller.dart';

final idControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final pwControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class LoginScreen extends ConsumerWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idController = ref.watch(idControllerProvider);
    final pwController = ref.watch(pwControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              SvgPicture.asset('assets/images/logo/logo.svg'),
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '익명으로 질문을 주고 받아보실 수 있습니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'fontL',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      '작성자는 익명으로 보장해드립니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'fontL',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 3,
                      color: Color(0xffdddddd),
                    ),
                  ],
                ),
                child: TextField(
                  controller: idController,
                  cursorColor: AppColors.textFieldGrayColor,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'fontR',
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
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
              ),
              SizedBox(height: 10.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 3,
                      color: Color(0xffdddddd),
                    ),
                  ],
                ),
                child: TextField(
                  obscureText: true,
                  controller: pwController,
                  cursorColor: AppColors.textFieldGrayColor,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'fontR',
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    hintText: '비밀번호를 입력하세요.',
                    hintStyle: TextStyle(
                      color: AppColors.textFieldGrayColor,
                      fontSize: 13.sp,
                      fontFamily: 'fontR',
                    ),
                    contentPadding: EdgeInsets.all(15.w),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     showDialog(
                    //       context: context,
                    //       barrierDismissible: true,
                    //       builder: (BuildContext context) {
                    //         return const FindIdAlert();
                    //       },
                    //     );
                    //   },
                    //   child: Text(
                    //     '아이디 찾기',
                    //     style: TextStyle(
                    //       fontSize: 11.sp,
                    //       color: const Color(0xff4F4F4F),
                    //       fontFamily: 'fontR',
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   width: 0.8.w,
                    //   height: 10.h,
                    //   color: const Color(0xff1D1D1E),
                    //   margin: EdgeInsets.symmetric(horizontal: 10.w),
                    // ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return const FindPwAlert();
                          },
                        );
                      },
                      child: Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: const Color(0xff4F4F4F),
                          fontFamily: 'fontR',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () async {
                  ref
                      .read(authControllerProvider.notifier)
                      .login(idController.text, pwController.text);
                },
                child: Container(
                  width: 1.sw,
                  height: 45.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontFamily: 'fontR',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 0.7.h,
                        color: const Color(0xff959595),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Text(
                        '또는',
                        style: TextStyle(
                          fontFamily: 'fontR',
                          fontSize: 14.sp,
                          color: const Color(0xff9E9E9E),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 0.7.h,
                        color: const Color(0xff959595),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45.w,
                    height: 45.w,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffeeeeee)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: FittedBox(
                        child: Image.asset(
                          'assets/images/logo/zalo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Container(
                    width: 45.w,
                    height: 45.w,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffeeeeee)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/logo/facebook.png',
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Container(
                    width: 45.w,
                    height: 45.w,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffeeeeee)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: FittedBox(
                        child: Image.asset('assets/images/logo/google.png'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                'FLAN은 처음이신가요?',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'fontR',
                  color: const Color(0xff2B3333),
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  context.go('/sign');
                },
                child: Container(
                  width: 1.sw,
                  height: 45.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1.w,
                      color: const Color(0xff2B3333),
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Text(
                      '간편 회원가입하기',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'fontR',
                        color: const Color(0xff2B3333),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
