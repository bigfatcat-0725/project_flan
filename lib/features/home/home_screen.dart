import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/core/bottom_nav.dart';
import 'package:project_flan/features/auth/auth_controller.dart';
import 'package:project_flan/features/home/home_controller.dart';
import 'package:project_flan/features/home/widgets/card_detail.dart';
import 'package:project_flan/features/home/widgets/home_card.dart';
import 'package:project_flan/features/home/widgets/home_list.dart';
import 'package:project_flan/features/home/widgets/home_question_card.dart';
import 'package:project_flan/model/feed_model.dart';
import 'package:rive/rive.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

// 답변완료인 질문만 피드에 나타난다.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // infinite scroll
  List<Question> _items = <Question>[];
  bool _isLoading = false;

  _fetchData(WidgetRef ref) async {
    setState(() {
      _isLoading = true;
    });

    final feedModel = await ref
        .read(homeControllerProvider.notifier)
        .getFeed(seq: ref.read(userProvider.notifier).state!.seq, status: 2);

    ref.read(feedProvider.notifier).update((state) => feedModel);

    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = false;

      if (feedModel != null) {
        _items = feedModel.question!;
        print(_items);
      }

      if (_items.length >= 5) {
        _items = List.generate(_items.length + 5, (i) => _items[i]);
      } else {
        _items = _items;
      }
    });
  }
  //

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 메인화면들 뒤로가기 막기
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          elevation: 0,
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          toolbarHeight: 40.h,
          titleSpacing: 0,
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80.w,
                  height: 50.h,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      'assets/images/logo/appbar_logo.svg',
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/appbar_dm.svg',
                ),
              ],
            ),
          ),
        ),
        body: const SafeArea(
          child: HomeList(),
        ),
        bottomNavigationBar: const BottomNav(
          location: 'home',
        ),
      ),
    );
  }
}
