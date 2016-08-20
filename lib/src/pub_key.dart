import 'gnupg_base.dart' as base;
import 'dart:async';
import 'dart:convert';

class PubKeyCommand extends base.GnupgCommand {
  Future<String> get key => loadKey();
  final baseArgs = ['--list-keys'];

  Future<String> loadKey() => new Future(() async {
        var lineMatcher = new RegExp("^pub");
        var keyMatcher = new RegExp("/[a-zA-Z0-9]+");
        var key = "";
        var result = await this.run([]);
        var pubLine = LineSplitter
            .split(result)
            .firstWhere((line) => lineMatcher.hasMatch(line));
        if (keyMatcher.hasMatch(pubLine)) {
          var keyMatch = keyMatcher.firstMatch(pubLine);
          key = keyMatch.group(0);
          key = key.replaceAll("/", "");
        }
        return key;
      });
}
