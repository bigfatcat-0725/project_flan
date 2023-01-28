import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/features/home/home_controller.dart';

class CardDetail extends HookConsumerWidget {
  const CardDetail({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 해당 카드
    final qa = ref.watch(feedProvider.notifier).state!.question![index];
    final topAnswer = qa.answer![0];

    // textController
    final replyTextController =
        useTextEditingController(text: topAnswer.answers?.reply ?? '');

    //
    final status = useState('read');

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
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
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
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: 1.sw,
                                              height: 45.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '답변 삭제',
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
                                              status.value = 'edit';
                                              context.pop();
                                            },
                                            child: Container(
                                              width: 1.sw,
                                              height: 45.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '수정하기',
                                                  style: TextStyle(
                                                    fontFamily: 'fontL',
                                                    fontSize: 13.sp,
                                                    color: AppColors
                                                        .defaultTextColor,
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
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '취소',
                                                  style: TextStyle(
                                                    fontFamily: 'fontL',
                                                    fontSize: 13.sp,
                                                    color: AppColors
                                                        .defaultTextColor,
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
                                  insetPadding:
                                      EdgeInsets.symmetric(horizontal: 0.w),
                                );
                              });
                        },
                        child: Icon(
                          Icons.more_horiz,
                          color: const Color(0xff1D1D1B),
                          size: 20.w,
                        ),
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
                    SizedBox(height: 10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                              Text(
                                topAnswer.users!.nickname.toString(),
                                style: TextStyle(
                                  fontFamily: 'fontB',
                                  color: const Color(0xff1D1D1B),
                                  fontSize: 13.sp,
                                ),
                              ),
                              SizedBox(height: 5.h),
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
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
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
                        enabled: status.value == 'read' ? false : true,
                        minLines: 10,
                        maxLines: 10,
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
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          if (status.value == 'edit') {
                            ref
                                .read(homeControllerProvider.notifier)
                                .editAnswer(topAnswer.answers?.seq,
                                    replyTextController.text, null);
                            context.push('/home');
                          } else {
                            context.pop();
                          }
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
                              status.value == 'read' ? '확인' : '수정',
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
