import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsletterSection extends StatefulWidget {
  const NewsletterSection({super.key});

  @override
  State<NewsletterSection> createState() => _NewsletterSectionState();
}

class _NewsletterSectionState extends State<NewsletterSection> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _subscribe() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email address')),
      );
      return;
    }

    final String body =
        'My Email: $email\n\n'
        'am interested to Join the faith community and receive weekly encouragement, '
        'worship updates, and new story releases directly to my inbox.';

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'solomonondula@gmail.com',
      queryParameters: {
        'subject': 'Newsletter Subscription Request',
        'body': body,
      },
    );

    try {
      final launched = await launchUrl(
        emailLaunchUri,
        mode: LaunchMode.externalApplication,
      );
      if (launched) {
        if (mounted) {
          _emailController.clear();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text(
                'Subscribed!',
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: 24,
                  color: AppColors.charcoalGrey,
                ),
              ),
              content: Text(
                'Thank you for joining our community. We will reach back to you shortly!',
                style: AppStyles.sansDisplay.copyWith(
                  color: AppColors.stone600,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Close',
                    style: AppStyles.sansDisplay.copyWith(
                      color: AppColors.warmTaupe,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      } else if (mounted) {
        throw 'Could not launch email client';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isDesktop = screenWidth > AppSizes.tabletBreakpoint;

        return Container(
          color: AppColors.stone200,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 40 : 16,
            vertical: isDesktop ? 120 : 80,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSizes.maxContentWidth,
              ),
              child: Column(
                children: [
                  Text(
                    'Stay Connected',
                    style: AppStyles.serifDisplay.copyWith(
                      fontSize: isDesktop ? 48 : 36,
                      color: AppColors.charcoalGrey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      'Join the faith community and receive weekly encouragement, worship updates, and new story releases directly to your inbox.',
                      textAlign: TextAlign.center,
                      style: AppStyles.sansDisplay.copyWith(
                        color: AppColors.stone600,
                        height: 1.6,
                        fontSize: isDesktop ? 18 : 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: isDesktop
                        ? Row(
                            children: [
                              Expanded(child: _buildEmailField()),
                              const SizedBox(width: 16),
                              SizedBox(
                                width: 200,
                                child: _buildSubscribeButton(),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              _buildEmailField(),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: _buildSubscribeButton(),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Your email address',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.warmTaupe, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
      ),
    );
  }

  Widget _buildSubscribeButton() {
    return ElevatedButton(
      onPressed: _subscribe,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.warmTaupe,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: Text(
        'Subscribe Now',
        style: AppStyles.sansDisplay.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
