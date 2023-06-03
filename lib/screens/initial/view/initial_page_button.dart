import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class InitialPageButton extends StatefulWidget {
  const InitialPageButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.pressedOpacity = 0.4,
    this.minSize = 40.0,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final double? pressedOpacity;
  bool get enabled => onPressed != null;
  final double? minSize;

  @override
  State<InitialPageButton> createState() => _InitialPageButtonState();
}

class _InitialPageButtonState extends State<InitialPageButton>
    with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(InitialPageButton old) {
    super.didUpdateWidget(old);
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = widget.pressedOpacity ?? 1.0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _animationController.animateTo(1.0,
            duration: kFadeOutDuration, curve: Curves.easeInOutCubicEmphasized)
        : _animationController.animateTo(0.0,
            duration: kFadeInDuration, curve: Curves.easeOutCubic);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;
    final ThemeData themeData = Theme.of(context);
    final Color primaryColor = themeData.highlightColor;
    final Color? backgroundColor = primaryColor;

    final Color foregroundColor = themeData.backgroundColor;

    final TextStyle textStyle = themeData.textTheme.subtitle2 ??
        TextStyle(
            color: Color(0xFF925FF0),
            fontWeight: FontWeight.w700,
            fontSize: 14);

    return MouseRegion(
      cursor: enabled && kIsWeb ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTapCancel: enabled ? _handleTapCancel : null,
        onTap: widget.onPressed,
        child: Semantics(
          button: true,
          child: Container(
            constraints: widget.minSize == null
                ? const BoxConstraints()
                : BoxConstraints(
                    minWidth: widget.minSize!,
                    minHeight: widget.minSize!,
                  ),
            width: MediaQuery.of(context).size.width - 80,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: primaryColor,
                        style: BorderStyle.solid,
                        width: 1)),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Align(
                    alignment: Alignment.center,
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: DefaultTextStyle(
                      style: textStyle,
                      child: IconTheme(
                        data: IconThemeData(color: foregroundColor),
                        child: widget.child,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
