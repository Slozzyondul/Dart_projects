import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactFormSection extends StatefulWidget {
  const ContactFormSection({super.key});

  @override
  State<ContactFormSection> createState() => _ContactFormSectionState();
}

class _ContactFormSectionState extends State<ContactFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateController = TextEditingController();
  final _messageController = TextEditingController();
  String _inquiryType = 'Worship Ministry';

  final List<String> _inquiryTypes = [
    'Worship Ministry',
    'Storytelling Workshop',
    'Speaking Engagement',
    'General Message',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  Future<void> _submitForm() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your name')));
      return;
    }

    if (!_isValidEmail(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    if (_messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your message')),
      );
      return;
    }

    final String subject = Uri.encodeComponent(
      '[$_inquiryType] Contact from ${_nameController.text}',
    );
    final String body = Uri.encodeComponent(
      'Name: ${_nameController.text}\n'
      'Email: ${_emailController.text}\n'
      'Inquiry Type: $_inquiryType\n'
      'Preferred Date: ${_dateController.text}\n\n'
      'Message:\n${_messageController.text}',
    );

    final Uri mailUri = Uri.parse(
      'mailto:bosekfavour@gmail.com?subject=$subject&body=$body',
    );

    try {
      if (await canLaunchUrl(mailUri)) {
        await launchUrl(mailUri, mode: LaunchMode.externalApplication);
        if (mounted) {
          _showSuccessDialog();
        }
      } else {
        throw 'Could not launch $mailUri';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open email app. Please try again.'),
          ),
        );
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.softBeige,
        title: Text(
          'Message Ready',
          style: AppStyles.serifDisplay.copyWith(color: AppColors.charcoalGrey),
        ),
        content: Text(
          'Your inquiry has been prepared in your email app. Please send it to complete the process. We will reach back shortly!',
          style: AppStyles.sansDisplay.copyWith(color: AppColors.charcoalGrey),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _nameController.clear();
              _emailController.clear();
              _dateController.clear();
              _messageController.clear();
            },
            child: Text(
              'OK',
              style: AppStyles.sansDisplay.copyWith(
                color: AppColors.galleryTaupe,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking & Inquiries',
          style: AppStyles.serifDisplay.copyWith(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            color: AppColors.charcoalGrey,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'RESPONSE TIME: USUALLY WITHIN 48 HOURS',
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 12,
            letterSpacing: 1.0,
            color: AppColors.charcoalGrey.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 48),
        _buildFormUI(),
      ],
    );
  }

  Widget _buildFormUI() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField('FULL NAME', 'Your Name', _nameController),
          const SizedBox(height: 32),
          _buildTextField(
            'EMAIL ADDRESS',
            'example@email.com',
            _emailController,
          ),
          const SizedBox(height: 32),
          _buildDropdown('INQUIRY TYPE', _inquiryTypes),
          const SizedBox(height: 32),
          _buildTextField('PREFERRED DATE', '', _dateController, isDate: true),
          const SizedBox(height: 32),
          _buildTextField(
            'YOUR MESSAGE',
            'Tell us about your event or vision...',
            _messageController,
            maxLines: 4,
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.galleryTaupe,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                'SEND MESSAGE',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String placeholder,
    TextEditingController controller, {
    int maxLines = 1,
    bool isDate = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: AppColors.charcoalGrey,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: AppColors.charcoalGrey.withValues(alpha: 0.4),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.charcoalGrey.withValues(alpha: 0.2),
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.charcoalGrey.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.charcoalGrey),
            ),
            suffixIcon: isDate
                ? const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppColors.charcoalGrey,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: AppColors.charcoalGrey,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: _inquiryType,
          items: items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _inquiryType = value;
              });
            }
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.charcoalGrey.withValues(alpha: 0.2),
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.charcoalGrey.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.charcoalGrey),
            ),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.charcoalGrey,
          ),
        ),
      ],
    );
  }
}
