import 'package:testsweets/src/dart_only_locator.dart';
import 'package:testsweets/src/models/build_error.dart';
import 'package:testsweets/utils/error_messages.dart';

Future<void> quit(
  String errorMsg,
) =>
    throw BuildError('Error: $errorMsg');

Future<void> main(
  List<String> args, {
  bool isMocking = false,
}) async {
  print('TestSweets running!');
  if (args.length < 1) quit(ErrorMessages.buildArgumentsError);

  final command = args[0];

  if (!['buildAndUpload', 'uploadApp', 'uploadKeys'].contains(command)) {
    quit(
      ErrorMessages.notValidCommand(command),
    );
  }

  if (!isMocking) await setupDartOnlyLocator();

  print("Done!");
}

bool onlyUploadAutomationKeys(String command) => command == 'uploadKeys';
