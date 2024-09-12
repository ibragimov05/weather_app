part of 'utils.dart';

sealed class AppUtils {
  AppUtils._();

  /// box
  static const Gap kGap = Gap(0);
  static const Gap kGap2 = Gap(2);
  static const Gap kGap4 = Gap(4);
  static const Gap kGap6 = Gap(6);
  static const Gap kGap8 = Gap(8);
  static const Gap kGap12 = Gap(12);
  static const Gap kGap16 = Gap(16);
  static const Gap kGap24 = Gap(24);
  static const Gap kGap32 = Gap(32);
  static const Gap kGap40 = Gap(40);

  static const EdgeInsets kPaddingAll4 = EdgeInsets.all(4);
  static const EdgeInsets kPaddingAll6 = EdgeInsets.all(6);
  static const EdgeInsets kPaddingAll8 = EdgeInsets.all(8);
  static const EdgeInsets kPaddingAll10 = EdgeInsets.all(10);
  static const EdgeInsets kPaddingAll12 = EdgeInsets.all(12);
  static const EdgeInsets kPaddingAll16 = EdgeInsets.all(16);
  static const EdgeInsets kPaddingAllB16 = EdgeInsets.fromLTRB(16, 16, 16, 0);
  static const EdgeInsets kPaddingAll24 = EdgeInsets.all(24);
  static const EdgeInsets kPaddingHor4 = EdgeInsets.symmetric(horizontal: 4);
  static const EdgeInsets kPaddingHor6 = EdgeInsets.symmetric(horizontal: 6);
  static const EdgeInsets kPaddingHor10 = EdgeInsets.symmetric(horizontal: 10);
  static const EdgeInsets kPaddingHor12 = EdgeInsets.symmetric(horizontal: 12);
  static const EdgeInsets kPaddingHor16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets kPaddingVertical16 =
      EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets kPaddingHor32Ver20 =
      EdgeInsets.symmetric(horizontal: 32, vertical: 20);
  static const EdgeInsets kPaddingHor16Ver12 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const EdgeInsets kPaddingHor16Ver4 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 4);
  static const EdgeInsets kPaddingHor16Ver8 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const EdgeInsets kPaddingHor12Ver8 =
      EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const EdgeInsets kPaddingHor8Ver4 =
      EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const EdgeInsets kPaddingHor8Ver2 =
      EdgeInsets.symmetric(horizontal: 8, vertical: 2);
  static const EdgeInsets kPaddingHor10Ver3 =
      EdgeInsets.symmetric(horizontal: 10, vertical: 3);
  static const EdgeInsets kPaddingLeft12Right6Ver8 =
      EdgeInsets.only(left: 12, right: 6, top: 8, bottom: 8);

  /// border radius
  static const Radius kRadius = Radius.zero;
  static const Radius kRadius8 = Radius.circular(8);
  static const Radius kRadius12 = Radius.circular(12);
  static const BorderRadius kBorderRadius = BorderRadius.zero;
  static const BorderRadius kBorderRadius2 =
      BorderRadius.all(Radius.circular(2));
  static const BorderRadius kBorderRadius4 =
      BorderRadius.all(Radius.circular(4));
  static const BorderRadius kBorderRadius6 =
      BorderRadius.all(Radius.circular(6));
  static const BorderRadius kBorderRadius8 =
      BorderRadius.all(Radius.circular(8));
  static const BorderRadius kBorderRadius12 =
      BorderRadius.all(Radius.circular(12));
  static const BorderRadius kBorderRadius16 =
      BorderRadius.all(Radius.circular(16));
  static const BorderRadius kBorderTopRadius24 = BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );
  static const BorderRadius kBorderRadius24 =
      BorderRadius.all(Radius.circular(24));
  static const BorderRadius kBorderRadius48 =
      BorderRadius.all(Radius.circular(48));
  static const BorderRadius kBorderRadius64 =
      BorderRadius.all(Radius.circular(64));

  static void showSnackBar(BuildContext context, String text) {
    final SnackBar snackBar = SnackBar(
      content: Text(text, style: const TextStyle(fontSize: 24)),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
