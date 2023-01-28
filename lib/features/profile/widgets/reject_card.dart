import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/features/auth/auth_controller.dart';
import 'package:project_flan/features/home/home_controller.dart';
import 'package:project_flan/features/profile/widgets/profile_home_card.dart';
import 'package:project_flan/model/feed_model.dart';
import 'package:rive/rive.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class RejectCard extends HookConsumerWidget {
  const RejectCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // infinite scroll
    // 사용법 미숙으로 flutter hooks 로 대체중.
    final items = useState(<Question>[]);
    final isLoading = useState(false);
    void fetchData(WidgetRef ref) async {
      isLoading.value = true;

      final feedModel = await ref
          .read(homeControllerProvider.notifier)
          .getFeed(seq: ref.read(userProvider.notifier).state!.seq, status: 3);

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
    //

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
        return Container();
      },
      separatorBuilder: (context, index) {
        return Container(
          width: 1.sw,
          height: 1.h,
          color: const Color(0xffD9D9D9),
        );
      },
      itemBuilder: (context, index) {
        return Column(
          children: [
            ProfileHomeCard(
              index: index,
              status: 2,
            ),
            // _items[_items.length - 1] == _items[index]
            //     ? SizedBox(height: 50.h)
            //     : Container(),
          ],
        );
      },
      // separatorBuilder: (context, index) {
      //   return SizedBox(height: 16.h);
      // },
    );
  }
}
