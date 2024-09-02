import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final int? statusCode;
  final String? message;
  final void Function() refresh;
  const ErrorScreen(
      {super.key, this.statusCode, this.message, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 200),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Terjadi Kesalahan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () => {refresh}, child: const Text("Coba Lagi")),
          const SizedBox(
            height: 8,
          ),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Center(child: Text("Detail Error")),
                          content: SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.error,
                                  color: Colors.red, size: 120),
                              const SizedBox(height: 32),
                              Text("Status code: ${statusCode ?? '-'}"),
                              const SizedBox(height: 16),
                              Text(message ?? "Uknowwn Error")
                            ],
                          )),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text("Ok")),
                          ],
                        ));
              },
              child: const Text("Detail")),
        ],
      ),
    );
  }
}
