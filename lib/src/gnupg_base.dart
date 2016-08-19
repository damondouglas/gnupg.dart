// Copyright (c) 2016, Damon Douglas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:async';
import 'package:which/which.dart' as which;

final EXECUTABLE = "gpg";

abstract class GnupgCommand {
  List get baseArgs;
  String get pathToGnupg => which.whichSync(EXECUTABLE);
  Future<Stdout> run(List addtlArgs) => new Future(() async {
    var args = new List.from(baseArgs);
    args.addAll(addtlArgs);
    var result = await Process.run(pathToGnupg, args);
    return result.stdout;
  });
}
