import 'package:apalive/app/auth/auth_bloc.dart';
import 'package:apalive/assets/images/images.dart';
import 'package:apalive/presentation/widgets/custom_snackbar.dart';
import 'package:apalive/presentation/widgets/custom_text_field.dart';
import 'package:apalive/presentation/widgets/w_button.dart';
import 'package:apalive/utils/formatters.dart';
import 'package:apalive/utils/my_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  late TextEditingController controllerPhone;
  late TextEditingController controllerPassword;

  @override
  void initState() {
    super.initState();
    controllerPhone = TextEditingController();
    controllerPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(AppImages.beck),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          child: Text('1.0.0+5', textAlign: TextAlign.center),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            16,
            32 + MediaQuery.of(context).viewPadding.top,
            16,
            16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppImages.gerb.imgAsset(),
              SizedBox(height: 16),
              Text(
                'Akademiya bitiruvchilari bilan muntazam muloqot va ularning karyerasi rivojlanishi monitoringi platformasi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              CustomTextField(
                onChanged: (value) {},
                title: 'Telefon raqam',
                hintText: '+998 (00) 000-00-00',
                formatter: [Formatters.phoneFormatter],
                keyboardType: TextInputType.phone,
                controller: controllerPhone,
              ),
              SizedBox(height: 16),
              CustomTextField(
                onChanged: (value) {},
                title: 'Parol',
                hintText: 'Parolingizni kiriting',
                controller: controllerPassword,
              ),
              SizedBox(height: 24),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return WButton(
                    onTap: () {
                      context.read<AuthBloc>().add(
                        LoginEvent(
                          username: MyFunction.convertPhoneNumber(
                            controllerPhone.text,
                          ),
                          password: controllerPassword.text,
                          onError: () {
                            CustomSnackbar.show(context, "User topilmadi");
                          },
                        ),
                      );
                    },
                    isLoading: state.statusSms.isInProgress,
                    text: 'Kirish',
                  );
                },
              ),
              SizedBox(height: 16),
              // WButton(
              //   onTap: () {},
              //   color: greyBack,
              //   textColor: buttonBackgroundColor,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     spacing: 12,
              //     children: [
              //       Text('OneID orqali kirish'),
              //       AppImages.oneid.imgAsset(),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
