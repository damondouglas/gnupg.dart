// Copyright (c) 2016, Damon Douglas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:gnupg/gnupg.dart';
import 'package:test/test.dart';
import 'dart:async';

void main() {
  group('pub_key', () {
    PubKeyCommand command;
    setUp(() {
      command = new PubKeyCommand();
    });

    test('loadKey()', () async {
      var result = await command.loadKey();
      expect(result.isNotEmpty, isTrue);
      var key = await command.key;
      expect(key.isNotEmpty, isTrue);
    });
  });
}
