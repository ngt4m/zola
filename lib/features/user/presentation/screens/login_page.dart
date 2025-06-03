import 'package:flutter/material.dart';
import 'package:what_chat/features/user/presentation/screens/otp_page.dart';
import 'package:what_chat/app/theme/theme.dart';
import 'package:country_picker/country_picker.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  static Country _selectCountry = Country.worldWide;
  String _countryCode = _selectCountry.phoneCode;

  String _phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Center(
              child: Text(
                "Verify your phone number",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: tabColor,
                ),
              ),
            ),
            Text(
              "WhatsApp will send you SMS message (carrier charges may apply) to verify your phone number. Enter the country code and phone number",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: blackColor,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 4),
              onTap: _OpenFilterCountryPhone,
              title: _BuildDialogItem(_selectCountry),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.5,
                        color: tabColor,
                      ),
                    ),
                  ),
                  width: 70,
                  height: 51,
                  alignment: Alignment.center,
                  child: Text(
                    _selectCountry.phoneCode,
                    style: TextStyle(fontSize: 15,color: blackColor),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 1.5),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: tabColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: TextField(
                      controller: _phoneController,
                      
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: tabColor),
                        hintText: "Phone Number",
                        border: InputBorder.none,
                       
                      ),

                      style: TextStyle(fontSize: 15, color: blackColor),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpPage(),
                  ),
                );
              },
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
            ),
          ],
        ),
      ),
    );
  }

  void _OpenFilterCountryPhone() {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        onSelect: (Country country) {
          setState(() {
            _selectCountry = country;
            _countryCode = country.phoneCode;
          });
        },
        countryListTheme: CountryListThemeData(
          backgroundColor: tabColor,
          flagSize: 25,
          bottomSheetHeight: 400,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ));
  }
}

Widget _BuildDialogItem(Country country) {
  return Container(
    height: 40,
    width: 300,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: tabColor, width: 1.5),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          " +${country.phoneCode}",
          style: TextStyle(color: blackColor),
        ),
        Expanded(
          child: Text(
            " ${country.name}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: blackColor),
          ),
        ),
        const Spacer(),
        const Icon(Icons.arrow_drop_down)
      ],
    ),
  );
}
