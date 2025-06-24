import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:what_chat/features/user/presentation/cubit/credential/cubit/credential_cubit.dart';
import 'package:what_chat/features/user/presentation/screens/profile_submit_page.dart';
import 'package:what_chat/app/theme/theme.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _OTPcontroller = TextEditingController();
  @override
  void dispose() {
    _OTPcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          children: [
            Center(
              child: Text(
                "Verifi you OTP",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tabColor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Enter your OTP for the WhatsApp Clone Verification (so that you will be moved for the further steps to complete)",
              style: TextStyle(
                fontSize: 15,
                color: blackColor
              ),
              textAlign: TextAlign.center,
            ),
            _PinCodeWidget(context),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _SubmitSmsCode,
              child: Container(
                margin: EdgeInsets.only(top: 0.5 * h),
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                  color: tabColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _PinCodeWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          PinCodeTextField(
            controller: _OTPcontroller,
            appContext: context,
            length: 6,
            onCompleted: (String code) {},
            cursorColor: tabColor,
          ),
          Text(
            "Enter your 6 digit code",
            style: TextStyle(color: blackColor),
          ),
        ],
      ),
    );
  }
    void _SubmitSmsCode(){
    print("otpCode ${_OTPcontroller.text}");
    if (_OTPcontroller.text.isNotEmpty){
      BlocProvider.of<CredentialCubit>(context)
          .SubmitSmsCode(smsCode: _OTPcontroller.text);
    }
  }
}
