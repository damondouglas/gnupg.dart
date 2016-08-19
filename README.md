# gnupg

Wrapper for [gnupg](https://help.ubuntu.com/community/GnuPrivacyGuardHowto).

## Usage

A simple usage example:

```dart
    import 'package:gnupg/gnupg.dart';

    // Encrypt:
    ... async {
      var command = new EncryptCommand();
      var encryptedMessage = await command.encrypt("foo bar baz"); // hQEMAwQB2ZKGsg...
    }
```

## Install

`$ den install -s git gnupg=git@github.com:damondouglas/gnupg.dart.git`

See [den](https://pub.dartlang.org/packages/den) pub page for more information.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/damondouglas/gnupg.dart/issues
