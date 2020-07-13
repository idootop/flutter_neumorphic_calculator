import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constans.dart';
import 'cal.dart';
import 'neumorphic/button.dart';
import 'neumorphic/card.dart';
// import 'package:vibration/vibration.dart';//震动反馈

void main() {
  runApp(MaterialApp(home: MyCalculator()));
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String _num = " & ";

  Cal _cal = new Cal();
  ScrollController _controller1 = ScrollController();
  ScrollController _controller2 = ScrollController();

  void clickKey(String key) {
    _cal.addKey(key);
    setState(() {
      _num = _cal.OutPut; //计算显示
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          myHead(),
          Expanded(
            child: myScreen(),
          ),
          Container(
            color: bgColor,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(w1),
              child: Wrap(
                children: <Widget>[
                  neuButton(
                      label: "AC",
                      colorText: miscOpColor,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(w1),
                        topEnd: Radius.circular(w1 / 2),
                        bottomStart: Radius.circular(w1 / 2),
                        bottomEnd: Radius.circular(w1 / 2),
                      )),
                  neuButton(
                    label: "÷",
                    colorText: opColor,
                  ),
                  neuButton(
                    label: "×",
                    colorText: opColor,
                  ),
                  neuButton(
                      label: "+/-",
                      colorText: opColor,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(w1 / 2),
                        topEnd: Radius.circular(w1),
                        bottomStart: Radius.circular(w1 / 2),
                        bottomEnd: Radius.circular(w1 / 2),
                      )),
                  neuButton(
                    label: "7",
                    colorText: textColor,
                  ),
                  neuButton(
                    label: "8",
                    colorText: textColor,
                  ),
                  neuButton(
                    label: "9",
                    colorText: textColor,
                  ),
                  neuButton(
                    label: "—",
                    colorText: opColor,
                  ),
                  neuButton(
                    label: "4",
                    colorText: textColor,
                  ),
                  neuButton(
                    label: "5",
                    colorText: textColor,
                  ),
                  neuButton(
                    label: "6",
                    colorText: textColor,
                  ),
                  neuButton(
                    label: "+",
                    colorText: opColor,
                  ),
                  neuButton(
                    label: "1",
                    colorText: textColor,
                  ),
                  neuButton(
                    label: "2",
                    colorText: textColor,
                  ),
                  neuButton(
                    label: "3",
                    colorText: textColor,
                  ),
                  neuButton(
                    label: "%",
                    colorText: opColor,
                  ),
                  SizedBox(
                    width: w1 * 7 + w1 * 2,
                    child: neuButton(
                        label: "0",
                        colorText: textColor,
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(w1 / 2),
                          topEnd: Radius.circular(w1 / 2),
                          bottomStart: Radius.circular(w1),
                          bottomEnd: Radius.circular(w1 / 2),
                        )),
                  ),
                  neuButton(
                    label: ".",
                    colorText: textColor,
                  ),
                  neuButton(
                      label: "=",
                      colorText: white,
                      colorBack: opColor,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(w1 / 2),
                        topEnd: Radius.circular(w1 / 2),
                        bottomStart: Radius.circular(w1 / 2),
                        bottomEnd: Radius.circular(w1),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onAbout() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('关于（颜值即正义计算器）'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text('颜值即正义计算器'),
                Text('一个简简单单的计算器'),
                Text('网页版地址：cal.idoo.top',
                    style: TextStyle(color: Colors.blueAccent)),
                Text(''),
                Text(
                    '我在追波上闲逛时看到了这个计算器的UI被惊艳到，就用Flutter仿写了下，然后打包成安卓和网页应用，然后你就看到了这段话。'),
                Text('缘，妙不可言。( PS: 有彩蛋 )\nEnjoy :)'),
                Text(''),
                Text('----分割线----'),
                Text(''),
                Text('界面fork自Calculator UI'),
                Text('https://dribbble.com/shots/10076573-Calculator-UI',
                    style: TextStyle(
                        color: Colors.blueAccent, fontSize: w1 * 0.8)),
                Text('功能fork自小鸡计算器'),
                Text('https://github.com/jicg/flutter_cal',
                    style: TextStyle(
                        color: Colors.blueAccent, fontSize: w1 * 0.8)),
                Text(''),
                Text('自己写的代码太烂就不开源了~\n捂脸.jpg'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('了解'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> onTips() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示：在找彩蛋？'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('请输入666，然后对天长啸:'),
                Text('“ 老铁，双击666，么么哒~ ”',
                    style: TextStyle(color: Colors.redAccent)),
                Text('最后按 = 即可（手动滑稽233'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('原来如此！\n恍然大悟！',
                  style: TextStyle(color: Colors.blueAccent)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('豁然开朗！\n茅塞顿开！',
                  style: TextStyle(color: Colors.blueAccent)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> colorEgg() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('恭喜! '),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text('彩蛋就是：没有彩蛋...'),
                Text('惊不惊喜，意不意外？\n彩蛋就是：没有彩蛋...\n不过可以关注我的微信公众号：'),
                Text('乂乂又又',
                    style:
                        TextStyle(color: Colors.redAccent, fontSize: w1 * 3)),
                Text('我的应用都会在上面首发和更新\n别说你不认识前面那俩字:)\n念《观乂（yì）麦》啦~~~'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  myHead() {
    return Padding(
      padding:
          EdgeInsets.only(top: w1, bottom: w1, left: w1 * 1.5, right: w1 * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: onAbout,
            child: Text(
              'IDOO',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: w1 * 1.4,
                color: textColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTips,
            child: Text(
              'ZM-520 CC',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: w1 * 1,
                color: mainTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  myScreen() {
    var oper = _num.split('&')[0];
    var re = _num.split('&')[1];
    if (oper == '666' && re == '666') {
      print('666'); //彩蛋
      Future.delayed(Duration.zero, () {
        colorEgg();
      });
    }
    return NeuCard(
        width: w1 * 17,
        alignment: Alignment.bottomRight,
        curveType: CurveType.emboss,
        bevel: 15,
        decoration: NeumorphicDecoration(
            color: Color(0xFFf8f9fa),
            borderRadius: BorderRadius.circular(w1 / 2)),
        padding: EdgeInsets.only(bottom: w1, right: w1, left: w1 / 1.42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            myOper(oper),
            SizedBox(height: w1 / 2),
            myResult(re),
          ],
        ));
  }

  myResult(txt) {
    Future.delayed(Duration.zero, () {
      if (txt.length > 13)
        _controller1.jumpTo(_controller1.position.maxScrollExtent);
    });
    return txt.length > 13
        ? Container(
            height: w1 * 2.4,
            width: w1 * 18,
            child: ListView(
              controller: _controller1,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Text(
                  txt,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: w1 * 2,
                  ),
                )
              ],
            ),
          )
        : Container(
            alignment: Alignment.bottomRight,
            height: w1 * 2.4,
            width: w1 * 18,
            child: Text(
              txt,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: w1 * 2,
              ),
            ));
  }

  myOper(txt) {
    Future.delayed(Duration.zero, () {
      if (txt.length > 17)
        _controller2.jumpTo(_controller2.position.maxScrollExtent);
    });
    return txt.length > 17
        ? Container(
            height: w1 * 1.5,
            width: w1 * 18,
            child: ListView(
              controller: _controller2,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Text(txt,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: w1 * 1.5,
                    ))
              ],
            ),
          )
        : Container(
            alignment: Alignment.bottomRight,
            height: w1 * 1.5,
            width: w1 * 18,
            child: Text(txt,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: w1 * 1.5,
                )));
  }

  neuButton(
      {label,
      colorText,
      colorBack = bgColor,
      BorderRadiusGeometry borderRadius}) {
    return Padding(
        padding: EdgeInsets.all(w1 / 2),
        child: Container(
            height: w1 * 3.5,
            width: w1 * 3.5,
            child: NeuButton(
              borderRadius: borderRadius ??
                  BorderRadiusDirectional.all(Radius.circular(w1 / 2)),
              color: colorBack,
              onPressed: () {
                switch (label) {
                  case 'AC':
                    clickKey('C');
                    break;
                  case '+/-':
                    clickKey('D');
                    break;
                  case '%':
                    clickKey('*');
                    clickKey('0');
                    clickKey('.');
                    clickKey('0');
                    clickKey('1');
                    break;
                  case '×':
                    clickKey('*');
                    break;
                  case '÷':
                    clickKey('/');
                    break;
                  case '—':
                    clickKey('-');
                    break;
                  default:
                    clickKey(label);
                }
                print('点击了$label');
                // Vibration.vibrate(duration: 50, amplitude: 50);//震动反馈
              },
              child: label == '+/-'
                  ? Icon(
                      Icons.backspace,
                      color: textColor,
                      size: w1 * 1.2,
                    )
                  : Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: w1 * 1.3,
                        color: colorText,
                      ),
                    ),
            )));
  }
}
