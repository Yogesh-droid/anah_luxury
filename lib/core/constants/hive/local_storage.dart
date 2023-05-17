import 'dart:convert';

import 'package:anah_luxury/core/constants/hive/storage_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class LocalStorage {
  final FlutterSecureStorage secureStorage =
      LocalStorageClient().flutterSecureStorage;

  // This method stores the token in encrypted form
  Future<void> saveToken(String token) async {
    final enctriptedBox = await getEnctriptedBox();
    await enctriptedBox.put(dotenv.env['token_value'], token);
  }

  Future<String> getToken() async {
    final enctriptedBox = await getEnctriptedBox();
    return enctriptedBox.get(dotenv.env['token_value']) ?? '';
  }

  Future<Box<E>> getEnctriptedBox<E>() async {
    // Read token key from secure storage
    final token = await secureStorage.read(key: dotenv.env['token_key']!);

    // If token key does not exist, generate a new key and write it to secure storage
    if (token == null) {
      final key = Hive.generateSecureKey();

      // Write the key value as base64 encoded string
      await secureStorage.write(
          key: dotenv.env['token_key']!, value: base64UrlEncode(key));
    }

    // Get the token key and decode it into Uint8List format
    final key = await secureStorage.read(key: dotenv.env['token_key']!);
    final encryptionKeyUint8List = base64Url.decode(key!);

    // Open an encrypted box using the decoded key and store the token value in this box
    return await Hive.openBox('tokenBox',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
  }
}
