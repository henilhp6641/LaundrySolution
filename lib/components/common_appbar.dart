
import '../package/config_packages.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  final AppBar? appBar;
  final List<Widget>? actions;
  final bool isShowNotification;
  final bool isShowMenu;
  final bool isShowSubTitle;
  final bool? centerTitle;
  final String subTitle;
  final Color? backgroundColor;
  final bool isShowBackButton;
  final void Function()? onTap;
  CommonAppBar(
      {Key? key,
      this.title,
      this.backgroundColor,
      this.appBar,
        this.centerTitle,
      this.onTap,
      this.actions,
      this.isShowNotification = false,
      this.isShowMenu = false,
      this.isShowSubTitle = false,
      this.isShowBackButton = true,
      this.subTitle = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isShowBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  GestureDetector(
                      key: const Key("back"),
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios,color: AppColor.gray800,)),
                ],
              ),
            )
          : const SizedBox(),
      backgroundColor: backgroundColor ?? AppColor.white,
      elevation: 0,
      centerTitle:centerTitle?? true,
      title: Column(
        children: [
          Text(title ?? "",
              style: const TextStyle(color: AppColor.gray800).normal24w500,
              maxLines: 2,
              textAlign: TextAlign.center),
          if (isShowSubTitle)
            Text(subTitle, style: const TextStyle(color: AppColor.grey).normal12w400),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar!.preferredSize.height);
}

// ignore: must_be_immutable
