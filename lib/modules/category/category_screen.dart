import 'package:e_commerce/modules/category/single_category_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:auto_size_text/auto_size_text.dart';


class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // CategoryModel? categories = appCubit(context).categories;
        // List<DataOfCategory?>? category = appCubit(context).category;
        return Directionality(
          textDirection: appCubit(context).textDirection,
          child: Scaffold(
            body: Container(
              child: Conditional.single(
                context: context,
                 conditionBuilder: (context)=> AppCubit.get(context).categoryModel != null ,
                  fallbackBuilder: (context)=>Container(
                    alignment: Alignment.center ,
                    child: LoadingBouncingLine.square(
                      backgroundColor: Colors.indigo,
                    ),
                  ),
                  widgetBuilder:(context)=> GridView.count(
                    crossAxisCount: 2,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(
                        appCubit(context).categoryModel!.data!.data!.length,
                            (index) => InkWell(
                          onTap: ()=> navigaTo(
                              context: context,
                              widget: SingleCategory(
                                id: appCubit(context).categoryModel!.data!.data![index].id!,
                                name: appCubit(context).categoryModel!.data!.data![index].name!,
                              )),
                          child: Container(
                            // height: 350  ,
                            margin: EdgeInsets.all(7),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepPurple.withOpacity(0.1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AspectRatio(
                                  aspectRatio:  16/9,
                                  child: Container(
                                    // alignment: Alignment.center,
                                    decoration:BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage( appCubit(context).categoryModel!.data!.data![index].image!),
                                          fit: BoxFit.fill,
                                        )
                                    ),),),

                                SizedBox(height: 10,),

                                AutoSizeText('${appCubit(context).categoryModel!.data!.data![index].name}',
                                  style: Theme.of(context).textTheme.bodyText2,
                                  maxFontSize:16 ,
                                  textAlign: TextAlign.center,
                                )


                              ],
                            ),
                          ),
                        )),
                  )

              ),
            ),
            ),
        );
      },
    );
  }
}
