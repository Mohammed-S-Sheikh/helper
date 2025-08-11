import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:helper/src/logic/controllers/controllers.dart';
import 'package:helper/src/logic/data/network/network.dart';
import 'package:helper/src/ui/consumer/consumer.dart';
import 'package:helper/src/ui/context_extension.dart';
import 'package:helper/src/ui/widget/actions/actions.dart';
import 'package:pinput/pinput.dart';

const int _otpLength = 6;

class OtpPage extends StatefulWidget {
  const OtpPage({
    required this.phone,
    required this.verifyOtpEndpoint,
    required this.resendOtpEndpoint,
    required this.onSuccess,
    super.key,
  });

  final String phone;
  final Endpoint verifyOtpEndpoint;
  final Endpoint resendOtpEndpoint;
  final ControllerOnData<ActionController<void>, void> onSuccess;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late Timer _resendStopWatch;
  late String _timeLeftLabel;
  late int _timeWindow;

  final TextEditingController _pinputController = TextEditingController();
  bool get _canResend => _timeWindow == 0 && !_resendStopWatch.isActive;

  bool get _hasEnteredPinput =>
      _pinputController.text.isNotEmpty &&
      _pinputController.text.length == _otpLength;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    FormBuilderValidators;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(context.helperL10n.otp),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${context.helperL10n.otpSentToPhoneNumber} ',
                        ),
                        TextSpan(
                          text: widget.phone,
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    length: _otpLength,
                    controller: _pinputController,
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 4),
                if (_canResend)
                  ActionConsumer<void>(
                    endpoint: widget.resendOtpEndpoint,
                    onSuccess: (controller, data) => _startTimer(),
                    builder: (context, controller) {
                      final onTap = controller.isLoading
                          ? null
                          : () =>
                              controller.request(body: {'phone': widget.phone});

                      return Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    '${context.helperL10n.youCanNowResendOtp} '),
                            TextSpan(
                              text: context.helperL10n.resend,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = onTap,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                else
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '${context.helperL10n.youCanResendAfter} '),
                        TextSpan(
                          text: _timeLeftLabel,
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 12),
                ActionConsumer(
                  endpoint: widget.verifyOtpEndpoint,
                  onSuccess: widget.onSuccess,
                  builder: (context, controller) => LoadingFilledButton(
                    isLoading: controller.isLoading,
                    onPressed: !_hasEnteredPinput || controller.isLoading
                        ? null
                        : () => controller
                            .request(body: {'otp': _pinputController.text}),
                    text: context.helperL10n.verify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _timeWindow = 60 * 2;

    String format() {
      final seconds = _timeWindow % 60;
      final minutes = _timeWindow ~/ 60;
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }

    _timeLeftLabel = format();
    _resendStopWatch = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        --_timeWindow;
        _timeLeftLabel = format();
        if (_timeWindow == 0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _resendStopWatch.cancel();
    super.dispose();
  }
}
