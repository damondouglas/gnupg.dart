// Copyright (c) 2016, Damon Douglas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:gnupg/gnupg.dart';
import 'package:test/test.dart';
import 'dart:async';

void main() {
  group('base', () {
    GnupgCommand command;
    setUp(() {
      command = new MockCommand();
    });

    test('gpg executable path defined', () {
      expect(command.pathToGnupg.contains("gpg"), isTrue);
    });
    test('command run has output', () async {
      var result = await command.run([]);
      expect(result.contains("pub"), isTrue);
    });
  });
}

class MockCommand extends GnupgCommand {
  final baseArgs = ['--list-keys'];
}
