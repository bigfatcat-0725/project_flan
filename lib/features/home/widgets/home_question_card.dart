import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/features/auth/auth_controller.dart';
import 'package:project_flan/features/home/home_controller.dart';

final homeQuestionTextCtrlProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class HomeQuestionCard extends HookConsumerWidget {
  const HomeQuestionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privateSetting = useState('0');
    final homeQuestionController = ref.watch(homeQuestionTextCtrlProvider);
    final user = ref.watch(userProvider.notifier).state;
    final feed = ref.watch(feedProvider.notifier).state;

    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 5.h, top: 5.h),
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
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: SizedBox(
                  height: 60.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${feed?.myData?.nickname}',
                            style: TextStyle(
                              fontFamily: 'fontB',
                              color: const Color(0xff1D1D1B),
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '팔로워',
                                    style: TextStyle(
                                      fontFamily: 'fontR',
                                      color: const Color(0xff1D1D1B),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    '${feed?.myData?.followCnt}',
                                    style: TextStyle(
                                      fontFamily: 'fontR',
                                      color: const Color(0xff1D1D1B),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 0.8.w,
                                height: 10.h,
                                color: const Color(0xff1D1D1E),
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '답변완료',
                                    style: TextStyle(
                                      fontFamily: 'fontR',
                                      color: const Color(0xff1D1D1B),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    '${feed?.myData?.answerCnt}',
                                    style: TextStyle(
                                      fontFamily: 'fontR',
                                      color: const Color(0xff1D1D1B),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '이곳은 무언가가 작성된 공간입니다.',
                        style: TextStyle(
                          fontFamily: 'fontL',
                          color: const Color(0xff9E9E9E),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          TextField(
            controller: homeQuestionController,
            cursorColor: AppColors.primaryColor,
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'fontR',
              height: 1.2,
            ),
            maxLines: 5,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF5F5F5),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(2),
              ),
              hintText: '궁금한 내용을 익명으로 자유롭게 질문하세요!',
              hintStyle: TextStyle(
                color: AppColors.textFieldGrayColor,
                fontSize: 11.sp,
                fontFamily: 'fontL',
              ),
              contentPadding: EdgeInsets.all(10.w),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              // dropdown
              Expanded(
                child: SizedBox(
                  height: 30.h,
                  child: DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      itemBuilder: (context, text, check) {
                        return Container(
                          height: 30.h,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              text,
                              style: TextStyle(
                                color: const Color(0xff407070),
                                fontFamily: 'fontL',
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        );
                      },
                      fit: FlexFit.loose,
                      showSelectedItems: true,
                      menuProps: MenuProps(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.7.w,
                            color: AppColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        borderOnForeground: true,
                        elevation: 0,
                      ),
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: const [
                      "익명질문",
                      "공개질문",
                    ],
                    dropdownButtonProps: DropdownButtonProps(
                      color: AppColors.primaryColor,
                      padding: EdgeInsets.only(
                        right: 20.w,
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        size: 25.w,
                      ),
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      textAlignVertical: TextAlignVertical.center,
                      baseStyle: TextStyle(
                        color: const Color(0xff407070),
                        fontFamily: 'fontL',
                        fontSize: 12.sp,
                        height: 1.4,
                      ),
                      dropdownSearchDecoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.w),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(
                            width: 0.7.w,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(
                            width: 0.7.w,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      if (value == '익명질문') {
                        privateSetting.value == '0';
                      } else {
                        // 공개질문
                        privateSetting.value == '1';
                      }
                    },
                    selectedItem: "익명질문",
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    ref.read(homeControllerProvider.notifier).postQuestion(
                        from: user?.seq as int,
                        to: feed?.myData?.seq as int,
                        title: homeQuestionController.text,
                        private: privateSetting.value);
                  },
                  child: Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '질문하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'fontL',
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
