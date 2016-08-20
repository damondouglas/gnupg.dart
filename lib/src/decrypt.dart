import 'gnupg_base.dart' as base;
import 'dart:io';
import 'dart:async';

class DecryptCommand extends base.GnupgCommand {

  final baseArgs = [
    // Not sure yet what to do with this. Maybe convert to Mixin
  ];

  Future<Stdout> run(List addlArgs) => this.run(addlArgs);

  Future<String> decrypt(String content, String passphrase) => new Future(() async {
    var completer = new Completer();
    var proc1 = await Process.start("echo", [content]);
    var proc2 = await Process.start(super.pathToGnupg, ['-d','--batch','--passphrase', passphrase]);
    proc2.stdout.listen((data) => completer.complete(new String.fromCharCodes(data)));
    proc1.stdout.pipe(proc2.stdin);
    return completer.future;
  });
}
