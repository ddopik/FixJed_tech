import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatelessWidget {
  const Signin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SizedBox(
          width: 375.0,
          height: 812.0,
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Positioned(
                top: 9.0,
                child: SizedBox(
                  width: 338.66,
                  height: 812.0,
                  child: Column(
                    children: <Widget>[
                      Spacer(flex: 9),
// Group: Group 1

                      SizedBox(
                        width: 338.66,
                        height: 21.0,
                        child: Row(
                          children: <Widget>[
                            Spacer(flex: 218),
                            Align(
                              alignment: Alignment(0.0, -0.11),
                              child: SvgPicture.string(
                                // Cellular Connection
                                '<svg viewBox="314.0 138.67 17.0 10.67" ><path transform="translate(314.0, 138.67)" d="M 15.00030040740967 10.6668004989624 C 14.44770050048828 10.6668004989624 14.00040054321289 10.21860027313232 14.00040054321289 9.666900634765625 L 14.00040054321289 0.9999000430107117 C 14.00040054321289 0.4473000168800354 14.44770050048828 0 15.00030040740967 0 L 16.00020027160645 0 C 16.55190086364746 0 17.00010108947754 0.4473000168800354 17.00010108947754 0.9999000430107117 L 17.00010108947754 9.666900634765625 C 17.00010108947754 10.21860027313232 16.55190086364746 10.6668004989624 16.00020027160645 10.6668004989624 L 15.00030040740967 10.6668004989624 Z M 10.33290004730225 10.6668004989624 C 9.781200408935547 10.6668004989624 9.333000183105469 10.21860027313232 9.333000183105469 9.666900634765625 L 9.333000183105469 3.333600044250488 C 9.333000183105469 2.781000137329102 9.781200408935547 2.333699941635132 10.33290004730225 2.333699941635132 L 11.33370018005371 2.333699941635132 C 11.88539981842041 2.333699941635132 12.33360004425049 2.781000137329102 12.33360004425049 3.333600044250488 L 12.33360004425049 9.666900634765625 C 12.33360004425049 10.21860027313232 11.88539981842041 10.6668004989624 11.33370018005371 10.6668004989624 L 10.33290004730225 10.6668004989624 Z M 5.666399955749512 10.6668004989624 C 5.114700317382812 10.6668004989624 4.666500091552734 10.21860027313232 4.666500091552734 9.666900634765625 L 4.666500091552734 5.666399955749512 C 4.666500091552734 5.114700317382812 5.114700317382812 4.666500091552734 5.666399955749512 4.666500091552734 L 6.666300296783447 4.666500091552734 C 7.218900203704834 4.666500091552734 7.667099952697754 5.114700317382812 7.667099952697754 5.666399955749512 L 7.667099952697754 9.666900634765625 C 7.667099952697754 10.21860027313232 7.218900203704834 10.6668004989624 6.666300296783447 10.6668004989624 L 5.666399955749512 10.6668004989624 Z M 0.9999000430107117 10.6668004989624 C 0.4473000168800354 10.6668004989624 0 10.21860027313232 0 9.666900634765625 L 0 7.667099952697754 C 0 7.114500045776367 0.4473000168800354 6.666300296783447 0.9999000430107117 6.666300296783447 L 1.999800086021423 6.666300296783447 C 2.5524001121521 6.666300296783447 2.99970006942749 7.114500045776367 2.99970006942749 7.667099952697754 L 2.99970006942749 9.666900634765625 C 2.99970006942749 10.21860027313232 2.5524001121521 10.6668004989624 1.999800086021423 10.6668004989624 L 0.9999000430107117 10.6668004989624 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                width: 17.0,
                                height: 10.67,
                              ),
                            ),
                            Spacer(flex: 5),
                            Align(
                              alignment: Alignment(0.0, -0.11),
                              child: SvgPicture.string(
                                // Wifi
                                '<svg viewBox="336.0 138.33 15.33 11.0" ><path transform="translate(336.0, 138.33)" d="M 7.44480037689209 10.90710067749023 L 5.438700199127197 8.884799957275391 C 5.37660026550293 8.82450008392334 5.342400074005127 8.740799903869629 5.345099925994873 8.653500556945801 C 5.34689998626709 8.567100524902344 5.383800029754639 8.485199928283691 5.448600292205811 8.426700592041016 C 6.729300022125244 7.344000339508057 8.604900360107422 7.344000339508057 9.885600090026855 8.426700592041016 C 9.950400352478027 8.485199928283691 9.987299919128418 8.567100524902344 9.989100456237793 8.653500556945801 C 9.990900039672852 8.740799903869629 9.956700325012207 8.82450008392334 9.894599914550781 8.884799957275391 L 7.889400005340576 10.90710067749023 C 7.830900192260742 10.9665002822876 7.750800132751465 10.99980068206787 7.667099952697754 10.99980068206787 C 7.583400249481201 10.99980068206787 7.503300189971924 10.9665002822876 7.44480037689209 10.90710067749023 Z M 10.97459983825684 7.365600109100342 C 10.06830024719238 6.545700073242188 8.889300346374512 6.092100143432617 7.667099952697754 6.092100143432617 C 6.445800304412842 6.092999935150146 5.2677001953125 6.546600341796875 4.362299919128418 7.365600109100342 C 4.2399001121521 7.481700420379639 4.04640007019043 7.479900360107422 3.927600145339966 7.36020040512085 L 2.768399953842163 6.189300060272217 C 2.707200050354004 6.128099918365479 2.67300009727478 6.045300006866455 2.673900127410889 5.958899974822998 C 2.674800157546997 5.871600151062012 2.709900140762329 5.789700031280518 2.772900104522705 5.729400157928467 C 5.531400203704834 3.165300130844116 9.804600715637207 3.165300130844116 12.56400012969971 5.729400157928467 C 12.62610054016113 5.789700031280518 12.66209983825684 5.871600151062012 12.66300010681152 5.958899974822998 C 12.66390037536621 6.045300006866455 12.62970066070557 6.128099918365479 12.56850051879883 6.189300060272217 L 11.40929985046387 7.36020040512085 C 11.34852981567383 7.420970916748047 11.26899433135986 7.45134973526001 11.18937015533447 7.451342582702637 C 11.11215686798096 7.45133638381958 11.03485870361328 7.422757148742676 10.97459983825684 7.365600109100342 Z M 13.64400005340576 4.670100212097168 C 12.03120040893555 3.138300180435181 9.891900062561035 2.284199953079224 7.667099952697754 2.284199953079224 C 5.442300319671631 2.284199953079224 3.30210018157959 3.138300180435181 1.689300060272217 4.670100212097168 C 1.568700075149536 4.788899898529053 1.374300003051758 4.787100315093994 1.254600048065186 4.666500091552734 L 0.09360000491142273 3.496500015258789 C 0.0333000011742115 3.43530011177063 -0.0009000000427477062 3.353399991989136 0 3.267000198364258 C 0.0009000000427477062 3.181500196456909 0.03510000184178352 3.099600076675415 0.09630000591278076 3.039299964904785 C 4.328999996185303 -1.013400077819824 11.00520038604736 -1.013400077819824 15.23700046539307 3.039299964904785 C 15.2982006072998 3.099600076675415 15.33240032196045 3.181500196456909 15.33330059051514 3.267000198364258 C 15.33419990539551 3.353399991989136 15.30000019073486 3.43530011177063 15.23970031738281 3.496500015258789 L 14.07870006561279 4.666500091552734 C 14.0181713104248 4.727484703063965 13.93878650665283 4.758090019226074 13.85936737060547 4.75808572769165 C 13.78173160552979 4.758081436157227 13.70406055450439 4.728825569152832 13.64400005340576 4.670100212097168 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                width: 15.33,
                                height: 11.0,
                              ),
                            ),
                            Spacer(flex: 5),
                            Align(
                              alignment: Alignment(0.0, -0.11),
                              child:
// Group: Battery

                              SizedBox(
                                width: 24.33,
                                height: 11.33,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      width: 22.0,
                                      height: 11.33,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            2.6666667461395264),
                                        color: Colors.white.withOpacity(0.35),
                                        border: Border.all(
                                          width: 1.0,
                                          color: Colors.black.withOpacity(0.35),
                                        ),
                                      ),
                                      child: Container(
                                        width: 18.0,
                                        height: 7.33,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              1.3333333730697632),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SvgPicture.string(
                                      // Cap
                                      '<svg viewBox="23.33 4.0 1.33 4.0" ><path transform="translate(23.33, 4.0)" d="M 0 0 L 0 4 C 0.8047311305999756 3.661223411560059 1.328037977218628 2.873133182525635 1.328037977218628 2 C 1.328037977218628 1.126866698265076 0.8047311305999756 0.3387765288352966 0 0" fill="#ffffff" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                      width: 1.33,
                                      height: 4.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(flex: 110),
                      Align(
                        alignment: Alignment(0.03, 0.0),
                        child:
// Group: Login form

                        SizedBox(
                          width: 307.0,
                          height: 167.0,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Log in',
                                style: GoogleFonts.raleway(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(flex: 31),
                              Container(
                                alignment: Alignment(-0.85, 0.0),
                                width: 307.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.16),
                                      offset: Offset(0, 3.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'Email',
                                  style: GoogleFonts.raleway(
                                    fontSize: 14.0,
                                    color: Colors.grey.withOpacity(0.85),
                                  ),
                                ),
                              ),
                              Spacer(flex: 16),
                              Container(
                                alignment: Alignment(-0.84, 0.0),
                                width: 307.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.16),
                                      offset: Offset(0, 3.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'Password',
                                  style: GoogleFonts.raleway(
                                    fontSize: 14.0,
                                    color: Colors.grey.withOpacity(0.85),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(flex: 16),
                      Align(
                        alignment: Alignment(0.03, 0.0),
                        child:
// Group: Login button

                        InkWell(
                          onTap: () {
                            //TODO: onTap Rectangle 85
                            print('onTap Rectangle 85');
                          },
                          child: Container(
                            alignment: Alignment(0.0, 0.04),
                            width: 307.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.grey,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  offset: Offset(0, 3.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Text(
                              'Log in',
                              style: GoogleFonts.raleway(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 27),
                      Text(
                        'Forgot Password?',
                        style: GoogleFonts.raleway(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(flex: 10),
                      Align(
                        alignment: Alignment(0.02, 0.0),
                        child: InkWell(
                          onTap: () {
                            //TODO: onTap doesnt have an account
                            print('onTap doesnt have an account');
                          },
                          child: Text.rich(
                            TextSpan(
                              style: GoogleFonts.raleway(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Doesn\'t have an account? ',
                                ),
                                TextSpan(
                                  text: 'sign up',
                                  style: GoogleFonts.raleway(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Spacer(flex: 347),
                      Container(
                        width: 190.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: const Color(0xFFE6DFDF),
                        ),
                      ),
                      Spacer(flex: 17),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
