abstract class KeyManager {
  Future<void> deleteKey(String key);

  Future<void> deleteAllKey();

  Future<Map<String, String>> readAllValue();

  Future<String?> readValue(
    String key,
  );

  Future<void> writeValue(
    String key,
    String value,
  );
}
