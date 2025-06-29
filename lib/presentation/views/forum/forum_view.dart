import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:apalive/data/models/forum/forums_model.dart';
import 'package:apalive/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';

class ForumView extends StatefulWidget {
  const ForumView({super.key});

  @override
  State<ForumView> createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  @override
  void initState() {
    context.read<AppBloc>().add(ForumsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum"),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: CustomTextField(
              hintText: 'Forum qidirish',
              prefixIcon: AppIcons.search.svg(),
            ),
          ),
        ),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.statusForum.isInProgress) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (state.forums.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppIcons.meetsEmpty.svg(),
                  SizedBox(height: 28),
                  Text(
                    'Hozirda hech qanday reja qilingan uchrashuvlar mavjud emas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hozirda hec qanday rejalashtirilgan uchrashuvlar\n mavjud emas, uchrashuvlar rejalashtirilganida\n menyuda bu haqida ko’rsatiladi',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                context.read<AppBloc>().add(ForumsEvent());
                await Future.delayed(Duration.zero);
              },
              child: ListView.separated(
                padding: EdgeInsets.all(16),
                itemBuilder:
                    (context, index) => ForumIteam(model: state.forums[index]),
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: state.forums.length,
              ),
            );
          }
        },
      ),
    );
  }
}

class ForumIteam extends StatelessWidget {
  const ForumIteam({super.key, required this.model});
  final ForumsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
                border: Border.all(color: borderColor),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(0, 1),
                    color: Color(0xFF0A0D12).withValues(alpha: .1),
                  ),
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: Offset(0, 3),
                    color: Color(0xFF0A0D12).withValues(alpha: .1),
                  ),
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 0,
                    offset: Offset(1, 8),
                    color: Color(0xFF0A0D12).withValues(alpha: .05),
                  ),
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(0, -2),
                    color: Color(0xFF0A0D12).withValues(alpha: .1),
                  ),
                ],
              ),
              padding: EdgeInsets.all(6),
              child: AppIcons.messageChat.svg(),
            ),
          ),
          Row(
            children: [
              Expanded(child: Html(data: model.title)),
              GestureDetector(onTap: () {}, child: AppIcons.arrowUpRight.svg()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Forum qatnashchilari',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              Text(
                "${model.users.length}",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Forum muallifi',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              Text(
                "Muallif topilmadi",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
