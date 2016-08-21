import 'gnupg_base.dart' as base;
import 'dart:io';
import 'dart:async';

class DecryptCommand extends base.GnupgCommand {
  Future<String> get passphrase => new Future(() async {
        var result = await Process.run("security",
            ['find-generic-password', '-s', 'gpg', '-w']); // MacOS only
        return result.stdout.trim();
      });
  final baseArgs = [
    // Not sure yet what to do with this. Maybe convert to Mixin
  ];

  Future<Stdout> run(List addlArgs) => this.run(addlArgs);

  Future<String> decrypt(String content, {String passphrase: null}) =>
      new Future(() async {
        var completer = new Completer();
        if (passphrase == null) passphrase = await this.passphrase;

        if (passphrase != null) {
          var proc1 = await Process.start("echo", [content]);
          var proc2 = await Process.start(
              super.pathToGnupg, ['-d', '--batch', '--passphrase', passphrase]);
          proc2.stdout.listen((data) {
            var result = new String.fromCharCodes(data);
            completer.complete(result.trim());
          });
          proc1.stdout.pipe(proc2.stdin);
        } else
          completer.complete(null);

        return completer.future;
      });
}
