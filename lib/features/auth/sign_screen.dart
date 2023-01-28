import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/features/auth/auth_controller.dart';

final signNameControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
// final signIdControllerProvider = StateProvider.autoDispose((ref) {
//   return TextEditingController(text: '');
// });
final signEmailControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final signPwControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class SignScreen extends ConsumerWidget {
  const SignScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(signNameControllerProvider);
    final emailController = ref.watch(signEmailControllerProvider);
    final pwController = ref.watch(signPwControllerProvider);
    // final idController = ref.watch(signIdControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: GestureDetector(
          onTap: () {
            context.go('/');
          },
          child: Container(
            width: 25.w,
            height: 25.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: FittedBox(
              child: SvgPicture.asset('assets/images/back.svg'),
            ),
          ),
        ),
        toolbarHeight: 30.h,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              SvgPicture.asset('assets/images/logo/logo.svg'),
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'FLAN에 오신 것을 환영합니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'fontL',
                        color: const Color(0xff2B3333),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      '간편 회원가입을 하고 익명 질문을 주고받아 보세요.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'fontL',
                        color: const Color(0xff2B3333),
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
                  controller: nameController,
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
                    hintText: '이름을 입력하세요.',
                    hintStyle: TextStyle(
                      color: AppColors.textFieldGrayColor,
                      fontSize: 13.sp,
                      fontFamily: 'fontR',
                    ),
                    contentPadding: EdgeInsets.all(15.w),
                  ),
                ),
              ),
              // SizedBox(height: 10.h),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 15.w),
              //   decoration: const BoxDecoration(
              //     boxShadow: [
              //       BoxShadow(
              //         offset: Offset(0, 0),
              //         blurRadius: 3,
              //         color: Color(0xffdddddd),
              //       ),
              //     ],
              //   ),
              //   child: TextField(
              //     controller: idController,
              //     cursorColor: AppColors.textFieldGrayColor,
              //     style: TextStyle(
              //       fontSize: 13.sp,
              //       fontFamily: 'fontR',
              //     ),
              //     decoration: InputDecoration(
              //       filled: true,
              //       fillColor: Colors.white,
              //       border: OutlineInputBorder(
              //         borderSide: BorderSide.none,
              //         borderRadius: BorderRadius.circular(2),
              //       ),
              //       hintText: '아이디를 입력하세요.',
              //       hintStyle: TextStyle(
              //         color: AppColors.textFieldGrayColor,
              //         fontSize: 13.sp,
              //         fontFamily: 'fontR',
              //       ),
              //       contentPadding: EdgeInsets.all(15.w),
              //     ),
              //   ),
              // ),
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
                  controller: emailController,
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
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  ref.read(authControllerProvider.notifier).sign(
                        nameController.text,
                        emailController.text,
                        pwController.text,
                        context,
                      );
                },
                child: Container(
                  width: 1.sw,
                  height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontFamily: 'fontR',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'FLAN의 계정이 있다면 ?',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xff2B3333),
                      fontFamily: 'fontR',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go('/');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        '로그인',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primaryColor,
                          fontFamily: 'fontB',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '하세요.',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xff2B3333),
                      fontFamily: 'fontR',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '가입하면 FLAN의 약관 및 개인정보취급방침에',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff959595),
                      fontFamily: 'fontL',
                    ),
                  ),
                  Text(
                    '동의하게 됩니다.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff959595),
                      fontFamily: 'fontL',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
