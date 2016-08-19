import 'gnupg_base.dart' as base;
import 'pub_key.dart' as pubkey;
import 'dart:io';
import 'dart:async';

class EncryptCommand extends base.GnupgCommand {
  Future<String> get key => (){
    var pubKeyCommand = new pubkey.PubKeyCommand();
    return pubKeyCommand.loadKey();
  }();
  final baseArgs = [
    '-ea'
  ];

  Future<Stdout> run(List addlArgs) => this.run(addlArgs);

  Future<String> encrypt(String content) => new Future(() async {
    var completer = new Completer();
    var _key = await key;

    var proc1 = await Process.start("echo", [content]);
    var proc2 = await Process.start(super.pathToGnupg, ['-ea','-r', _key]);
    proc2.stdout.listen((data) => completer.complete(new String.fromCharCodes(data)));
    proc1.stdout.pipe(proc2.stdin);
    return completer.future;
  });
}
