import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/features/auth/auth_controller.dart';
import 'package:project_flan/features/home/home_controller.dart';
import 'package:project_flan/features/profile/profile_controller.dart';

class AnswerSheet extends HookConsumerWidget {
  const AnswerSheet({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 해당 카드
    final qa = ref.watch(feedProvider.notifier).state!.question![index];
    // textController
    final replyTextController = useTextEditingController(text: '');
    // user
    final user = ref.watch(userProvider.notifier).state;

    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                width: 1.sw,
                height: 30.h,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: SizedBox(
                              width: 17.5.w,
                              height: 17.5.w,
                              child: FittedBox(
                                child:
                                    SvgPicture.asset('assets/images/back.svg'),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                            onTap: () {
                              context.pop();
                              context.pop();
                              context.go('/home');
                            },
                            child: SizedBox(
                              width: 17.5.w,
                              height: 17.5.w,
                              child: FittedBox(
                                child: SvgPicture.asset(
                                    'assets/images/bottom_icon/home.svg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1.sw,
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        Expanded(
                          child: Text(
                            qa.private == '0' ? '익명' : '이름',
                            style: TextStyle(
                              fontFamily: 'fontB',
                              color: AppColors.primaryColor,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${qa.question}',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: 'fontB',
                                color: const Color(0xff1D1D1B),
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
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
                        minLines: 30,
                        maxLines: 30,
                        controller: replyTextController,
                        cursorColor: AppColors.textFieldGrayColor,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'fontR',
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffF5F5F5),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          contentPadding: EdgeInsets.all(15.w),
                          hintText: '답변을 입력해주세요.',
                          hintStyle: TextStyle(
                            color: AppColors.textFieldGrayColor,
                            fontSize: 12.sp,
                            fontFamily: 'fontR',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          ProfileController().postAnswer(
                            user: user?.seq as int,
                            question: qa.seq as int,
                            reply: replyTextController.text,
                          );
                          context.push('/profile');
                        },
                        child: Container(
                          width: 120.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Center(
                            child: Text(
                              '답변',
                              style: TextStyle(
                                fontFamily: 'fontR',
                                fontSize: 13.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
