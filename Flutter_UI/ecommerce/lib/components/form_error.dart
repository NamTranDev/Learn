import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class FormError extends StatelessWidget {
  final List<String> errors;

  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          List.generate(errors.length, (index) => formErrorText(errors[index])),
    );
  }

  Column formErrorText(String error) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/Error.svg',
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(error)
          ],
        ),
        SizedBox(height: 5)
      ],
    );
  }
}
