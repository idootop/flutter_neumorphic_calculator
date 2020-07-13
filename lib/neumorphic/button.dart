/// 备注：新拟态风格组件抽取自 neumorphic.flutter  
/// https://github.com/neumorphic/neumorphic.flutter

import 'package:flutter/widgets.dart';
import 'card.dart';

class NeuButton extends StatefulWidget {
  const NeuButton({
    @required this.onPressed,
    this.child,
    this.color = const Color(0xFFffffff),
    this.padding = const EdgeInsets.all(12.0),
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    Key key,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final BoxShape shape;
  final BorderRadiusGeometry borderRadius;
  final Color color;

  @override
  _NeuButtonState createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool _isPressed = false;

  void _toggle(bool value) {
    if (_isPressed != value) {
      setState(() {
        _isPressed = value;
      });
    }
  }

  void _tapDown() => _toggle(true);

  void _tapUp() => _toggle(false);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown: (_) => _tapDown(),
        onTapUp: (_) => _tapUp(),
        onTapCancel: _tapUp,
        onTap: widget.onPressed,
        child: NeuCard(
          // color: widget.color,
          curveType: _isPressed ? CurveType.concave : CurveType.flat,
          padding: widget.padding,
          child: widget.child,
          alignment: Alignment.center,
          decoration: NeumorphicDecoration(
            color: widget.color,
            borderRadius: widget.shape == BoxShape.circle
                ? null
                : widget.borderRadius ?? BorderRadius.circular(16),
            shape: widget.shape,
          ),
        ),
      );
}
