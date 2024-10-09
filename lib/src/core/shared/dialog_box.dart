import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class ActivationCodeDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ActivationCodeDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              request.title ?? 'Enter Activation Code',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: request.data as TextEditingController,
              decoration: const InputDecoration(
                labelText: 'Activation Code',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => completer(DialogResponse(confirmed: false)),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () => completer(
                    DialogResponse(
                      confirmed: true,
                      data: (request.data as TextEditingController).text,
                    ),
                  ),
                  child: Text(request.mainButtonTitle ?? 'Activate'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
