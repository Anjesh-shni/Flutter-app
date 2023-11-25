import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zunun/utils/constants/dimension.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.transparent,
        period: const Duration(milliseconds: 700),
        child: const ShimmerLayout());
  }
}

class ShimmerLayout extends StatelessWidget {
  const ShimmerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
            Container(
              height: 18,
              width: 200,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.white, Colors.white],
                ),
              ),
            ),
            SizedBox(height: Adaptive.h(AppDimens.mediumSizedBox)),
            Container(
              height: Adaptive.h(40),
              width: Adaptive.w(100),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                ),
              ),
            ),
            SizedBox(
              height: Adaptive.h(AppDimens.smallSizedBox),
            ),
            Container(
              height: 18,
              width: 160,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.white, Colors.white],
                ),
              ),
            ),
            SizedBox(
              height: Adaptive.h(AppDimens.miniSizedBox),
            ),
            SizedBox(
                height: Adaptive.h(AppDimens.homeCoursesContainerHeight),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                            padding: EdgeInsets.all(8),
                            width:
                                Adaptive.w(AppDimens.homeCoursesContainerWidth),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [Colors.white70, Colors.white10],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 76,
                                      width: 76,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Colors.white, Colors.white],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 76,
                                      width: 76,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.topRight,
                                          colors: [Colors.white, Colors.white],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Adaptive.h(AppDimens.miniSizedBox),
                                ),
                                Container(
                                  height: 18,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.white, Colors.white],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Adaptive.h(AppDimens.tinySizedBox),
                                ),
                                Container(
                                  height: 18,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.white, Colors.white],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    })),
            SizedBox(
              height: Adaptive.h(AppDimens.smallSizedBox),
            ),
            Container(
              height: 18,
              width: 160,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.white, Colors.white],
                ),
              ),
            ),
            SizedBox(
              height: Adaptive.h(AppDimens.miniSizedBox),
            ),
            SizedBox(
                height: Adaptive.h(AppDimens.homeRecentlyViewedContainerHeight),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: Adaptive.w(
                              AppDimens.homeRecentlyViewedContainerWidth),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [Colors.white70, Colors.white10],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: [Colors.white, Colors.white],
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 18,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Colors.white, Colors.white],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Adaptive.h(AppDimens.tinySizedBox),
                                  ),
                                  Container(
                                    height: 18,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Colors.white, Colors.white],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Adaptive.h(AppDimens.tinySizedBox),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Colors.white, Colors.white],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })),
            SizedBox(
              height: Adaptive.h(AppDimens.smallSizedBox),
            ),
            Container(
              height: 18,
              width: 160,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.white, Colors.white],
                ),
              ),
            ),
            SizedBox(
              height: Adaptive.h(AppDimens.smallSizedBox),
            ),
            Container(
              height: 18,
              width: 80,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.white, Colors.white],
                ),
              ),
            ),
            SizedBox(
              height: Adaptive.h(AppDimens.smallSizedBox),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      height: Adaptive.h(10),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [Colors.white70, Colors.white10],
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Container(
                              height: 76,
                              width: 66,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.white, Colors.white],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 18,
                                width: 130,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.white, Colors.white],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Adaptive.h(AppDimens.tinySizedBox),
                              ),
                              Container(
                                height: 18,
                                width: 60,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.white, Colors.white],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: Adaptive.h(AppDimens.smallSizedBox),
            ),
            Container(
              height: 18,
              width: 80,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.white, Colors.white],
                ),
              ),
            ),
            SizedBox(
              height: Adaptive.h(AppDimens.miniSizedBox),
            ),
            SizedBox(
                height: Adaptive.h(AppDimens.homeBlogsContainerHeight),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: Adaptive.w(AppDimens.homeBlogsContainerWidth),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [Colors.white70, Colors.white10],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 96,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.white, Colors.white],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Adaptive.h(AppDimens.tinySizedBox),
                              ),
                              Container(
                                height: 18,
                                width: 60,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.white, Colors.white],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Adaptive.h(AppDimens.tinySizedBox),
                              ),
                              Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.white, Colors.white],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
            SizedBox(height: Adaptive.h(AppDimens.largeSizedBox)),
          ],
        ),
      ),
    );
  }
}
