import 'package:aserar/controller/api_controller.dart';
import 'package:aserar/view/home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<ApiController>(
      builder: (controller) => Scaffold(
        body: controller.foodsList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      elevation: 0.0,
                      pinned: false,
                      snap: false,
                      floating: false,
                      expandedHeight: size.height * 0.2,
                      backgroundColor: Colors.transparent,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Container(
                          decoration: BoxDecoration(),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    'Find Best Ethiopian \nFood Recipes',
                                    style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverAppBar(
                      elevation: 0.0,
                      pinned: true,
                      snap: false,
                      floating: false,
                      expandedHeight: size.height * 0.08,
                      backgroundColor: Colors.transparent,
                      flexibleSpace: Container(
                        height: 70.0,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: HomeWidgets.buildFloatingSearchBar(context),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return HomeWidgets.buildHomeScreenCard(size, index, controller);
                        },
                        childCount: controller.foodsList.length,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
