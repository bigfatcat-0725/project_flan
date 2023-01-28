import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/features/auth/auth_controller.dart';
import 'package:project_flan/features/home/home_controller.dart';
import 'package:project_flan/features/home/widgets/card_detail.dart';
import 'package:project_flan/features/home/widgets/home_card.dart';
import 'package:project_flan/features/home/widgets/home_question_card.dart';
import 'package:project_flan/model/feed_model.dart';
import 'package:rive/rive.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class HomeList extends HookConsumerWidget {
  const HomeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = useState(<Question>[]);
    final isLoading = useState(false);
    void fetchData(WidgetRef ref) async {
      isLoading.value = true;

      final feedModel = await ref
          .read(homeControllerProvider.notifier)
          .getFeed(seq: ref.read(userProvider.notifier).state!.seq, status: 2);

      ref.read(feedProvider.notifier).update((state) => feedModel);
      isLoading.value = false;

      if (feedModel != null) {
        items.value = feedModel.question!;
        print(items.value);
      }
    }

    useEffect(() {
      Future.microtask(() => fetchData(ref));
      return null;
    }, []);

    return InfiniteList(
      itemCount: items.value.length,
      isLoading: isLoading.value,
      onFetchData: () => {},
      loadingBuilder: (context) => SizedBox(
        width: 150.w,
        height: 150.w,
        child: const RiveAnimation.asset(
          'assets/images/loader.riv',
        ),
      ),
      emptyBuilder: (context) {
        return SizedBox(
          width: 50.w,
          height: 50.w,
          child: FittedBox(
            child: CircularProgressIndicator(
              strokeWidth: 1.w,
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
      // errorBuilder: (context) {
      //   return Center(
      //     child: Text(
      //       '데이터를 불러오는 데에 실패했어요 ㅠㅠ',
      //       style: TextStyle(
      //         fontFamily: 'fontL',
      //         fontSize: 12.sp,
      //         color: AppColors.textFieldGrayColor,
      //       ),
      //     ),
      //   );
      // },
      itemBuilder: (context, index) {
        return Column(
          children: [
            if (index == 0) const HomeQuestionCard(),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    builder: (context) {
                      return CardDetail(index: index);
                    });
              },
              child: HomeCard(index: index),
            ),
          ],
        );
      },
      // separatorBuilder: (context, index) {
      //   return SizedBox(height: 16.h);
      // },
    );
  }
}
