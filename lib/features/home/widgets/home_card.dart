import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/features/home/home_controller.dart';
import 'package:project_flan/features/home/widgets/more_pop.dart';

class HomeCard extends HookConsumerWidget {
  const HomeCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 개별 카드
    final qa = ref.watch(feedProvider.notifier).state!.question![index];
    final topAnswer = qa.answer![0];
    // 좋아요, 북마크
    final isLike = useState(false);
    final isSave = useState(false);

    return Container(
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            return MorePop(index: index);
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
                    fontFamily: 'fontB',
                    color: const Color(0xff1D1D1B),
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
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
                          topAnswer.users!.nickname.toString(),
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
                      topAnswer.answers!.reply.toString(),
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
}
