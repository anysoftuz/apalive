import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    context.read<AppBloc>().add(NewsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.statusNews.isInProgress) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          return ListView.separated(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 36),
            itemBuilder:
                (context, index) => Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor),
                  ),
                  child: Column(
                    children: [
                      // CachedNetworkImage(
                      //   imageUrl: ,
                      //   height: 120,
                      //   width: double.infinity,
                      //   fit: BoxFit.cover,
                      // ),
                      if (state.news[index].file.isNotEmpty) ...[
                        if (state.news[index].file.endsWith('.svg'))
                          SizedBox(
                            height: 120,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: state.news[index].file.svgNetwork(),
                            ),
                          )
                        else
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  state.news[index].file,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ],
                      Html(data: state.news[index].mainText),
                      Html(data: state.news[index].extraText),
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemCount: state.news.length,
          );
        },
      ),
    );
  }
}
