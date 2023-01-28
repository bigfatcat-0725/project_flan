import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/features/auth/auth_controller.dart';
import 'package:project_flan/features/home/home_controller.dart';
import 'package:project_flan/features/home/widgets/more_pop.dart';
import 'package:project_flan/features/profile/profile_controller.dart';
import 'package:project_flan/features/profile/widgets/answer_sheet.dart';
import 'package:project_flan/features/profile/widgets/basic_more_pop.dart';

class ProfileHomeCard extends HookConsumerWidget {
  const ProfileHomeCard({
    Key? key,
    required this.index,
    required this.status,
  }) : super(key: key);
  final int index;
  final int status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 개별 카드
    final qa = ref.watch(feedProvider.notifier).state!.question![index];
    // 좋아요, 북마크
    final isLike = useState(false);
    final isSave = useState(false);

    // 새질문
    if (status == 0) {
      return Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 17.5.w,
                      height: 17.5.w,
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
                    Row(
                      children: [
                        Text(
                          qa.private == '0' ? '익명' : '이름',
                          style: TextStyle(
                            fontFamily: 'fontB',
                            color: AppColors.primaryColor,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          '1일 전',
                          style: TextStyle(
                            fontFamily: 'fontR',
                            color: const Color(0xff4F4F4F),
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return BasicMorePop(index: index);
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
            Container(
              width: 1.sw,
              margin: EdgeInsets.only(left: 27.5.w),
              child: Text(
                '${qa.question}',
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'fontB',
                  color: const Color(0xff1D1D1B),
                  fontSize: 13.sp,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('거절하기');
                        print(qa);
                        ProfileController().reject(seq: qa.seq as int);
                        context.push('/profile');
                      },
                      child: Container(
                        width: 1.sw,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.7.w, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(
                          child: Text(
                            '거절하기',
                            style: TextStyle(
                              fontFamily: 'fontR',
                              fontSize: 12.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            builder: (context) {
                              return AnswerSheet(index: index);
                            });
                      },
                      child: Container(
                        width: 1.sw,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(
                          child: Text(
                            '답변하기',
                            style: TextStyle(
                              fontFamily: 'fontR',
                              fontSize: 12.sp,
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
      );
    }
    // 답변완료
    if (status == 1) {
      return Container(
        width: 1.sw,
        // height: 120.h,
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 17.5.w,
                      height: 17.5.w,
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
                        fontSize: 12.sp,
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
                          return BasicMorePop(index: index);
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
            Container(
              width: 1.sw,
              margin: EdgeInsets.only(left: 27.5.w),
              child: Text(
                '${qa.question}',
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'fontB',
                  color: const Color(0xff1D1D1B),
                  fontSize: 13.sp,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // *임시 클릭 시 해당 유저의
                  },
                  child: Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF5F5F5),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                // Top Answer
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            qa.answer!.first.users!.nickname.toString(),
                            style: TextStyle(
                              fontFamily: 'fontB',
                              color: const Color(0xff1D1D1B),
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            '1일 전',
                            style: TextStyle(
                              fontFamily: 'fontR',
                              color: const Color(0xff4F4F4F),
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        qa.answer!.first.answers!.reply.toString(),
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
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (isLike.value == true) {
                      isLike.value = false;
                    } else {
                      isLike.value = true;
                    }
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        isLike.value
                            ? 'assets/images/card/heart_active.svg'
                            : 'assets/images/card/heart.svg',
                        width: 12.5.w,
                        height: 12.5.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '좋아요',
                        style: TextStyle(
                          fontFamily: 'fontL',
                          fontSize: 11.sp,
                          color: const Color(0xff1D1D1B),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    if (isSave.value == true) {
                      isSave.value = false;
                    } else {
                      isSave.value = true;
                    }
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        isSave.value
                            ? 'assets/images/card/save_active.svg'
                            : 'assets/images/card/save.svg',
                        width: 12.5.w,
                        height: 12.5.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '저장',
                        style: TextStyle(
                          fontFamily: 'fontL',
                          fontSize: 11.sp,
                          color: const Color(0xff1D1D1B),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/card/share.svg',
                      width: 12.5.w,
                      height: 12.5.w,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '공유',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 11.sp,
                        color: const Color(0xff1D1D1B),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }
    // 답변거절
    if (status == 2) {
      return Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 17.5.w,
                      height: 17.5.w,
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
                    Row(
                      children: [
                        Text(
                          qa.private == '0' ? '익명' : '이름',
                          style: TextStyle(
                            fontFamily: 'fontB',
                            color: AppColors.primaryColor,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          '1일 전',
                          style: TextStyle(
                            fontFamily: 'fontR',
                            color: const Color(0xff4F4F4F),
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return BasicMorePop(index: index);
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
            Container(
              width: 1.sw,
              margin: EdgeInsets.only(left: 27.5.w),
              child: Text(
                '${qa.question}',
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'fontB',
                  color: const Color(0xff1D1D1B),
                  fontSize: 13.sp,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 1.sw,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.7.w, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(
                          child: Text(
                            '삭제하기',
                            style: TextStyle(
                              fontFamily: 'fontR',
                              fontSize: 12.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 1.sw,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(
                          child: Text(
                            '답변하기',
                            style: TextStyle(
                              fontFamily: 'fontR',
                              fontSize: 12.sp,
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
      );
    }

    return Container();
  }
}
