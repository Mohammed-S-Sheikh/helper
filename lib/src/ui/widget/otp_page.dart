import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helper/src/logic/controllers/controllers.dart';
import 'package:helper/src/logic/data/network/network.dart';
import 'package:helper/src/ui/consumer/consumer.dart';
import 'package:helper/src/ui/context_extension.dart';
import 'package:helper/src/ui/widget/actions/actions.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';

const int _otpLength = 6;

class OtpPage<ResponseT> extends StatefulWidget {
  const OtpPage({
    required this.phone,
    this.sentMessage,
    this.phoneKey = 'phone',
    this.otpKey = 'otp',
    required this.verifyOtpEndpoint,
    this.verifyOtpEndpointExtra,
    required this.resendOtpEndpoint,
    this.resendOtpEndpointExtra,
    required this.onSuccess,
    super.key,
  });

  final String phone;
  final String? sentMessage;
  final String phoneKey;
  final String otpKey;
  final Endpoint verifyOtpEndpoint;
  final Json? verifyOtpEndpointExtra;
  final Endpoint resendOtpEndpoint;
  final Json? resendOtpEndpointExtra;
  final ControllerOnData<ActionController<ResponseT>, ResponseT> onSuccess;

  @override
  State<OtpPage<ResponseT>> createState() => _OtpPageState<ResponseT>();
}

class _OtpPageState<ResponseT> extends State<OtpPage<ResponseT>> {
  late Timer _resendStopWatch;
  late String _timeLeftLabel;
  late int _timeWindow;

  final TextEditingController _pinputController = TextEditingController();
  bool get _canResend => _timeWindow == 0 && !_resendStopWatch.isActive;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _autofillSms();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: widget.sentMessage != null
                      ? Text(widget.sentMessage!)
                      : Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${context.helperL10n.otpSentToPhoneNumber} ',
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
                          : () => controller.request(
                                body: {
                                  widget.phoneKey: widget.phone,
                                  ...?widget.resendOtpEndpointExtra,
                                },
                              );

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
                ActionConsumer<ResponseT>(
                  endpoint: widget.verifyOtpEndpoint,
                  onSuccess: widget.onSuccess,
                  builder: (context, controller) => LoadingFilledButton(
                    isLoading: controller.isLoading,
                    onPressed: () => controller.request(
                      body: {
                        widget.otpKey: _pinputController.text,
                        ...?widget.verifyOtpEndpointExtra,
                      },
                    ),
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

  Future<void> _autofillSms() async {
    final result = await SmartAuth.instance.getSmsWithRetrieverApi();
    final code = result.data?.code;
    if (code == null) return;

    _pinputController.setText(code);
  }

  @override
  void dispose() {
    _resendStopWatch.cancel();

    try {
      SmartAuth.instance.removeSmsRetrieverApiListener();
    } catch (_) {}

    super.dispose();
  }
}
