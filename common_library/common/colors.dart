import 'package:flutter/material.dart';

const kEmptyColor = 0x0D000000;

/// basic colors
const kTeal50 = Color(0xFFE0F2F1);
const kTeal100 = Colors.blueAccent;

const kDefaultBackgroundAvatar = '3FC1BE';
const kDefaultTextColorAvatar = 'EEEEEE';
const kDefaultAdminBackgroundAvatar = 'EEEEEE';
const kDefaultAdminTextColorAvatar = '3FC1BE';

const kTeal400 = Color(0xff00abff);
const kGrey900 = Color(0xFF263238);
const kGrey600 = Color(0xFF546E7A);
const kGrey200 = Color(0xFFEEEEEE);
const kGrey400 = Color(0xFF90a4ae);
const kErrorRed = Color(0xFFe74c3c);
const kSurfaceWhite = Color(0xFFFFFBFA);
const kBackgroundWhite = Colors.white;
const kBackgroundAppBar = Colors.lightBlue;

/// color for theme
const kLightPrimary = Color(0xfffcfcff);
const kLightAccent = Color(0xFF546E7A);
const kDarkAccent = Color(0xffF4F5F5);
const kLightTeal100 = Color(0xffdef9f6);
const kTealish = Colors.blue;
const kIcUrple = Color(0xffa26ff6);
const kIcUrpleShadow = Color(0xffd8d8d8);

const kLightBG = Color(0xffF1F2F3);
const kDarkBG = Color(0xff121212);
const kDarkBgLight = Color(0xff1E1E1E);
const kBadgeColor = Colors.red;
const btnBlueColor = Colors.blueAccent;

const offWhite = Color(0xfffcf7e4);

const purpleBrown = Color(0xff231f20);

const bubbleGumPink = Color(0xffff68af);

const reddish = Color(0xffcc4d41);

const lightPink = Color(0xfffef0f7);
const iceBlue = Color(0xffeaf5fa);
const white = Color(0xfff5f5f5);
const purplishBrown = Color(0xff4d4a4b);
const dustyLavender = Color(0xffa19fa0);
const veryLightPink = Color(0xfff9dfde);
const brownishGrey = Color(0xff777575);
const beige = Color(0xffcbcaca);
const rustRed = Color(0xffbc2206);
const coral = Color(0xffed6154);
const lightBlueGrey = Color(0xffd7d8d9);
const black = Color(0xff1a1818);

/// This color is define for the Product variant Color
/// Please add more color to match with your Product Color name
const kNameToHex = {
  "red": "#ec3636",
  "black": "#000000",
  "white": "#ffffff",
  "green": "#36ec58",
  "grey": "#919191",
  "yellow": "#f6e46a",
  "blue": "#3b35f3",
  "aliceblue": "#F0F8FF",
  "antiquewhite": "#FAEBD7",
  "aqua": "#00FFFF",
  "aquamarine": "#7FFFD4",
  "azure": "#F0FFFF",
  "beige": "#F5F5DC",
  "bisque": "#FFE4C4",
  "blanched_almond": "#FFEBCD",
  "blueviolet": "#8A2BE2",
  "brown": "#A52A2A",
  "burlywood": "#DEB887",
  "badetblue": "#5F9EA0",
  "bhartreuse": "#7FFF00",
  "bhocolate": "#D2691E",
  "boral": "#FF7F50",
  "bornflowerblue": "#6495ED",
  "bornsilk": "#FFF8DC",
  "brimson": "#DC143C",
  "cyan": "#00FFFF",
  "darkblue": "#00008B",
  "darkcyan": "#008B8B",
  "darkgoldenrod": "#B8860B",
  "darkgray": "#A9A9A9",
  "darkgreen": "#006400",
  "darkkhaki": "#BDB76B",
  "darkmagenta": "#8B008B",
  "darkolivegreen": "#556B2F",
  "darkorange": "#FF8C00",
  "darkorchid": "#9932CC",
  "darkred": "#8B0000",
  "darksalmon": "#E9967A",
  "darkseagreen": "#8DBC8F",
  "darkslateblue": "#483D8B",
  "darkslategray": "#2F4F4F",
  "darkturquoise": "#00DED1",
  "darkviolet": "#9400D3",
  "deeppink": "#FF1493",
  "deepskyblue": "#00BFFF",
  "dimgray": "#696969",
  "dodgerblue": "#1E90FF",
  "firebrick": "#B22222",
  "floralwhite": "#FFFAF0",
  "forestgreen": "#228B22",
  "fuchsia": "#FF00FF",
  "gainsboro": "#DCDCDC",
  "ghostwhite": "#F8F8FF",
  "gold": "#FFD700",
  "goldenrod": "#DAA520",
  "gray": "#808080",
  "greenyellow": "#ADFF2F",
  "honeydew": "#F0FFF0",
  "hotpink": "#FF69B4",
  "indianred": "#CD5C5C",
  "indigo": "#4B0082",
  "ivory": "#FFFFF0",
  "khaki": "#F0E68C",
  "lavender": "#E6E6FA",
  "lavenderblush": "#FFF0F5",
  "lawngreen": "#7CFC00",
  "lemonchiffon": "#FFFACD",
  "lightblue": "#ADD8E6",
  "lightcoral": "#F08080",
  "lightcyan": "#E0FFFF",
  "lightgoldenrodyellow": "#FAFAD2",
  "lightgreen": "#90EE90",
  "lightgrey": "#D3D3D3",
  "lightpink": "#FFB6C1",
  "lightsalmon": "#FFA07A",
  "lightseagreen": "#20B2AA",
  "lightskyblue": "#87CEFA",
  "lightslategray": "#778899",
  "lightsteelblue": "#B0C4DE",
  "lightyellow": "#FFFFE0",
  "lime": "#00FF00",
  "limegreen": "#32CD32",
  "linen": "#FAF0E6",
  "magenta": "#FF00FF",
  "maroon": "#800000",
  "mediumaquamarine": "#66CDAA",
  "mediumblue": "#0000CD",
  "mediumorchid": "#BA55D3",
  "mediumpurple": "#9370DB",
  "mediumseagreen": "#3CB371",
  "mediumslateblue": "#7B68EE",
  "mediumspringgreen": "#00FA9A",
  "mediumturquoise": "#48D1CC",
  "mediumvioletred": "#C71585",
  "midnightblue": "#191970",
  "mintcream": "#F5FFFA",
  "mistyrose": "#FFE4E1",
  "Moccasin": "#FFE4B5",
  "navajowhite": "#FFDEAD",
  "navy": "#000080",
  "oldlace": "#FDF5E6",
  "olivedrab": "#6B8E23",
  "orange": "#FFA500",
  "orangered": "#FF4500",
  "orchid": "#DA70D6",
  "palegoldenrod": "#EEE8AA",
  "palegreen": "#98FB98",
  "paleturquoise": "#AFEEEE",
  "palevioletred": "#DB7093",
  "papayawhip": "#FFEFD5",
  "peachpuff": "#FFDAB9",
  "peru": "#CD853F",
  "pink": "#FFC8CB",
  "plum": "#DDA0DD",
  "powderblue": "#B0E0E6",
  "purple": "#800080",
  "rosybrown": "#BC8F8F",
  "royalblue": "#4169E1",
  "saddlebrown": "#8B4513",
  "salmon": "#FA8072",
  "sandybrown": "#F4A460",
  "seagreen": "#2E8B57",
  "seashell": "#FFF5EE",
  "sienna": "#A0522D",
  "silver": "#C0C0C0",
  "skyblue": "#87CEEB",
  "slateblue": "#6A5ACD",
  "snow": "#FFFAFA",
  "springgreen": "#00FF7F",
  "Steelblue": "#4682B4",
  "tan": "#D2B48C",
  "thistle": "#D8BFD8",
  "teal": "#008080",
  "tomato": "#FF6347",
  "Turquoise": "#40E0D0",
  "violet": "#EE82EE",
  "wheat": "#F5DEB3",
  "whitesmoke": "#F5F5F5",
  "yellowgreen": "#9ACD32"
};

const kOrderStatusColor = {
  "processing": Color(0xff00abff),
  "refunded": Color(0xffa26ff6),
  "cancelled": reddish,
  "completed": Color(0xff06bc68),
  "failed": "#e74c3c",
  "pending":  Color(0xffe0ba28),
  "on-hold": Color(0xffcc7c41),
  "out-for-delivery": Color(0xffcc7c41)
};
const kOrderStatusColorAccent = {
  "processing": iceBlue,
  "refunded": Color(0xffd8d8d8),
  "cancelled": Color(0xfffeeced),
  "completed": Color(0xffdef9f6),
  "failed": "#e74c3c",
  "pending": offWhite,
  "on-hold":Color(0xfffeeced),
  "out-for-delivery":Color(0xfffeeced)
};

/// Color for Product Detail
const kColorRatingStar = Color(0xfff39c12);
const kColorInStock = Color(0xff1abc9c);
const kColorOutOfStock = Color(0xFFe74c3c);
const kColorBackOrder = Color(0xFFEAA601);

const kColorInitRegistrationBtn = Color(0xfff7f7f7);
