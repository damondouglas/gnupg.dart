// Copyright (c) 2016, Damon Douglas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// This test cannot be run from fswatch because of stdin.

import 'package:gnupg/gnupg.dart';
import 'package:test/test.dart';
import 'dart:async';
import 'dart:io';

void main() {
  group('pub_key', () {
    DecryptCommand command;
    setUp(() {
      command = new DecryptCommand();
    });

    test('get passphrase', () async {
      var passphrase = await command.passphrase;
      expect(passphrase, isNotEmpty);
    });

    test('encrypt', () async {
      var encryptCommand = new EncryptCommand();
      var content = await encryptCommand.encrypt("foo bar baz");
      var decryptedContent = await command.decrypt(content);
      expect(decryptedContent, "foo bar baz");
    });
  });
}
