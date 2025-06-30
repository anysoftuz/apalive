import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:apalive/data/models/graduate_user_model.dart';
import 'package:apalive/presentation/views/graduates/graduates_filter_view.dart';
import 'package:apalive/presentation/views/graduates/graduates_info_view.dart';
import 'package:apalive/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class GraduatesView extends StatefulWidget {
  const GraduatesView({super.key});

  @override
  State<GraduatesView> createState() => _GraduatesViewState();
}

class _GraduatesViewState extends State<GraduatesView> {
  @override
  void initState() {
    context.read<AppBloc>().add(GraduateUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitiruvchilar'),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'Bitiruvchini qidirish',
                    prefixIcon: AppIcons.search.svg(),
                  ),
                ),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GraduatesFilterView(),
                      ),
                    );
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: greyBack,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: AppIcons.filter.svg(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.statusGraduateUser.isInProgress) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              context.read<AppBloc>().add(GraduateUserEvent());
              await Future.delayed(Duration.zero);
            },
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
              itemBuilder:
                  (context, index) =>
                      GraduatesIteam(model: state.graduateUser[index]),
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: state.graduateUser.length,
            ),
          );
        },
      ),
    );
  }
}

class GraduatesIteam extends StatelessWidget {
  const GraduatesIteam({super.key, required this.model});

  final GraduateUserModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => GraduatesInfoView(model: model),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          spacing: 12,
          children: [
            Row(
              spacing: 8,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: white,
                  backgroundImage: NetworkImage(
                    model.photo.isEmpty
                        ? "https://academy.rudn.ru/static/images/profile_default.png"
                        : model.photo,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.name} ${model.middleName} ${model.surname}',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(model.phoneNumber),
                  ],
                ),
              ],
            ),
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ILMIY UNVONI YOKI DARAJASI',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(
                  model.academicDegree.map((e) => e.title).toList().join(', '),
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
