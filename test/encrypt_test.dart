// Copyright (c) 2016, Damon Douglas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:gnupg/gnupg.dart';
import 'package:test/test.dart';
import 'dart:async';

void main() {
  group('pub_key', () {
    EncryptCommand command;
    setUp(() {
      command = new EncryptCommand();
    });

    test('encrypt', () async {
      var result = await command.encrypt("foo  bar   baz");
      expect(result.isNotEmpty, isTrue);
    });
  });
}
