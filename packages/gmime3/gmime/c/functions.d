/// C functions for gmime3 library
module gmime.c.functions;

public import gid.basictypes;
import gid.loader;
import gmime.c.types;
public import gobject.c.types;
public import gio.c.types;

version(Windows)
  private immutable LIBS = ["libgmime-3.0-0.dll;gmime-3.0-0.dll;gmime-3.dll"];
else version(OSX)
  private immutable LIBS = ["libgmime-3.0.0.dylib"];
else
  private immutable LIBS = ["libgmime-3.0.so.0"];

__gshared extern(C)
{
  // ApplicationPkcs7Mime
  GType function() c_g_mime_application_pkcs7_mime_get_type; ///
  GMimeApplicationPkcs7Mime* function(GMimeSecureMimeType type) c_g_mime_application_pkcs7_mime_new; ///
  GMimeApplicationPkcs7Mime* function(GMimeObject* entity, GMimeEncryptFlags flags, GPtrArray* recipients, GError** _err) c_g_mime_application_pkcs7_mime_encrypt; ///
  GMimeApplicationPkcs7Mime* function(GMimeObject* entity, const(char)* userid, GError** _err) c_g_mime_application_pkcs7_mime_sign; ///
  GMimeObject* function(GMimeApplicationPkcs7Mime* pkcs7Mime, GMimeDecryptFlags flags, const(char)* sessionKey, GMimeDecryptResult** result, GError** _err) c_g_mime_application_pkcs7_mime_decrypt; ///
  GMimeSecureMimeType function(GMimeApplicationPkcs7Mime* pkcs7Mime) c_g_mime_application_pkcs7_mime_get_smime_type; ///
  GMimeSignatureList* function(GMimeApplicationPkcs7Mime* pkcs7Mime, GMimeVerifyFlags flags, GMimeObject** entity, GError** _err) c_g_mime_application_pkcs7_mime_verify; ///

  // AutocryptHeader
  GType function() c_g_mime_autocrypt_header_get_type; ///
  GMimeAutocryptHeader* function() c_g_mime_autocrypt_header_new; ///
  GMimeAutocryptHeader* function(const(char)* string_) c_g_mime_autocrypt_header_new_from_string; ///
  void function(GMimeAutocryptHeader* dst, GMimeAutocryptHeader* src) c_g_mime_autocrypt_header_clone; ///
  int function(GMimeAutocryptHeader* ah1, GMimeAutocryptHeader* ah2) c_g_mime_autocrypt_header_compare; ///
  GMimeInternetAddressMailbox* function(GMimeAutocryptHeader* ah) c_g_mime_autocrypt_header_get_address; ///
  const(char)* function(GMimeAutocryptHeader* ah) c_g_mime_autocrypt_header_get_address_as_string; ///
  GDateTime* function(GMimeAutocryptHeader* ah) c_g_mime_autocrypt_header_get_effective_date; ///
  GBytes* function(GMimeAutocryptHeader* ah) c_g_mime_autocrypt_header_get_keydata; ///
  GMimeAutocryptPreferEncrypt function(GMimeAutocryptHeader* ah) c_g_mime_autocrypt_header_get_prefer_encrypt; ///
  bool function(GMimeAutocryptHeader* ah) c_g_mime_autocrypt_header_is_complete; ///
  void function(GMimeAutocryptHeader* ah, GMimeInternetAddressMailbox* address) c_g_mime_autocrypt_header_set_address; ///
  void function(GMimeAutocryptHeader* ah, const(char)* address) c_g_mime_autocrypt_header_set_address_from_string; ///
  void function(GMimeAutocryptHeader* ah, GDateTime* effectiveDate) c_g_mime_autocrypt_header_set_effective_date; ///
  void function(GMimeAutocryptHeader* ah, GBytes* keydata) c_g_mime_autocrypt_header_set_keydata; ///
  void function(GMimeAutocryptHeader* ah, GMimeAutocryptPreferEncrypt pref) c_g_mime_autocrypt_header_set_prefer_encrypt; ///
  char* function(GMimeAutocryptHeader* ah, bool gossip) c_g_mime_autocrypt_header_to_string; ///

  // AutocryptHeaderList
  GType function() c_g_mime_autocrypt_header_list_get_type; ///
  GMimeAutocryptHeaderList* function() c_g_mime_autocrypt_header_list_new; ///
  void function(GMimeAutocryptHeaderList* list, GMimeAutocryptHeader* header) c_g_mime_autocrypt_header_list_add; ///
  uint function(GMimeAutocryptHeaderList* list, GMimeInternetAddressList* addresses) c_g_mime_autocrypt_header_list_add_missing_addresses; ///
  uint function(GMimeAutocryptHeaderList* list) c_g_mime_autocrypt_header_list_get_count; ///
  GMimeAutocryptHeader* function(GMimeAutocryptHeaderList* list, uint index) c_g_mime_autocrypt_header_list_get_header_at; ///
  GMimeAutocryptHeader* function(GMimeAutocryptHeaderList* list, GMimeInternetAddressMailbox* mailbox) c_g_mime_autocrypt_header_list_get_header_for_address; ///
  void function(GMimeAutocryptHeaderList* list) c_g_mime_autocrypt_header_list_remove_incomplete; ///

  // Certificate
  GType function() c_g_mime_certificate_get_type; ///
  GMimeCertificate* function() c_g_mime_certificate_new; ///
  long function(GMimeCertificate* cert) c_g_mime_certificate_get_created; ///
  long function(GMimeCertificate* cert) c_g_mime_certificate_get_created64; ///
  GMimeDigestAlgo function(GMimeCertificate* cert) c_g_mime_certificate_get_digest_algo; ///
  const(char)* function(GMimeCertificate* cert) c_g_mime_certificate_get_email; ///
  long function(GMimeCertificate* cert) c_g_mime_certificate_get_expires; ///
  long function(GMimeCertificate* cert) c_g_mime_certificate_get_expires64; ///
  const(char)* function(GMimeCertificate* cert) c_g_mime_certificate_get_fingerprint; ///
  GMimeValidity function(GMimeCertificate* cert) c_g_mime_certificate_get_id_validity; ///
  const(char)* function(GMimeCertificate* cert) c_g_mime_certificate_get_issuer_name; ///
  const(char)* function(GMimeCertificate* cert) c_g_mime_certificate_get_issuer_serial; ///
  const(char)* function(GMimeCertificate* cert) c_g_mime_certificate_get_key_id; ///
  const(char)* function(GMimeCertificate* cert) c_g_mime_certificate_get_name; ///
  GMimePubKeyAlgo function(GMimeCertificate* cert) c_g_mime_certificate_get_pubkey_algo; ///
  GMimeTrust function(GMimeCertificate* cert) c_g_mime_certificate_get_trust; ///
  const(char)* function(GMimeCertificate* cert) c_g_mime_certificate_get_user_id; ///
  void function(GMimeCertificate* cert, long created) c_g_mime_certificate_set_created; ///
  void function(GMimeCertificate* cert, GMimeDigestAlgo algo) c_g_mime_certificate_set_digest_algo; ///
  void function(GMimeCertificate* cert, const(char)* email) c_g_mime_certificate_set_email; ///
  void function(GMimeCertificate* cert, long expires) c_g_mime_certificate_set_expires; ///
  void function(GMimeCertificate* cert, const(char)* fingerprint) c_g_mime_certificate_set_fingerprint; ///
  void function(GMimeCertificate* cert, GMimeValidity validity) c_g_mime_certificate_set_id_validity; ///
  void function(GMimeCertificate* cert, const(char)* issuerName) c_g_mime_certificate_set_issuer_name; ///
  void function(GMimeCertificate* cert, const(char)* issuerSerial) c_g_mime_certificate_set_issuer_serial; ///
  void function(GMimeCertificate* cert, const(char)* keyId) c_g_mime_certificate_set_key_id; ///
  void function(GMimeCertificate* cert, const(char)* name) c_g_mime_certificate_set_name; ///
  void function(GMimeCertificate* cert, GMimePubKeyAlgo algo) c_g_mime_certificate_set_pubkey_algo; ///
  void function(GMimeCertificate* cert, GMimeTrust trust) c_g_mime_certificate_set_trust; ///
  void function(GMimeCertificate* cert, const(char)* userId) c_g_mime_certificate_set_user_id; ///

  // CertificateList
  GType function() c_g_mime_certificate_list_get_type; ///
  GMimeCertificateList* function() c_g_mime_certificate_list_new; ///
  int function(GMimeCertificateList* list, GMimeCertificate* cert) c_g_mime_certificate_list_add; ///
  void function(GMimeCertificateList* list) c_g_mime_certificate_list_clear; ///
  bool function(GMimeCertificateList* list, GMimeCertificate* cert) c_g_mime_certificate_list_contains; ///
  GMimeCertificate* function(GMimeCertificateList* list, int index) c_g_mime_certificate_list_get_certificate; ///
  int function(GMimeCertificateList* list, GMimeCertificate* cert) c_g_mime_certificate_list_index_of; ///
  void function(GMimeCertificateList* list, int index, GMimeCertificate* cert) c_g_mime_certificate_list_insert; ///
  int function(GMimeCertificateList* list) c_g_mime_certificate_list_length; ///
  bool function(GMimeCertificateList* list, GMimeCertificate* cert) c_g_mime_certificate_list_remove; ///
  bool function(GMimeCertificateList* list, int index) c_g_mime_certificate_list_remove_at; ///
  void function(GMimeCertificateList* list, int index, GMimeCertificate* cert) c_g_mime_certificate_list_set_certificate; ///

  // Charset
  const(char)* function(GMimeCharset* charset) c_g_mime_charset_best_name; ///
  bool function(GMimeCharset* mask, const(char)* charset, const(char)* text, size_t len) c_g_mime_charset_can_encode; ///
  void function(GMimeCharset* charset) c_g_mime_charset_init; ///
  void function(GMimeCharset* charset, const(char)* inbuf, size_t inlen) c_g_mime_charset_step; ///
  const(char)* function(const(char)* inbuf, size_t inlen) c_g_mime_charset_best; ///
  const(char)* function(const(char)* charset) c_g_mime_charset_canon_name; ///
  const(char)* function(const(char)* charset) c_g_mime_charset_iconv_name; ///
  const(char)* function(const(char)* isocharset) c_g_mime_charset_iso_to_windows; ///
  const(char)* function(const(char)* charset) c_g_mime_charset_language; ///
  const(char)* function() c_g_mime_charset_locale_name; ///
  void function() c_g_mime_charset_map_init; ///
  void function() c_g_mime_charset_map_shutdown; ///
  const(char)* function(const(char)* charset) c_g_mime_charset_name; ///

  // ContentDisposition
  GType function() c_g_mime_content_disposition_get_type; ///
  GMimeContentDisposition* function() c_g_mime_content_disposition_new; ///
  GMimeContentDisposition* function(GMimeParserOptions* options, const(char)* str) c_g_mime_content_disposition_parse; ///
  char* function(GMimeContentDisposition* disposition, GMimeFormatOptions* options) c_g_mime_content_disposition_encode; ///
  const(char)* function(GMimeContentDisposition* disposition) c_g_mime_content_disposition_get_disposition; ///
  const(char)* function(GMimeContentDisposition* disposition, const(char)* name) c_g_mime_content_disposition_get_parameter; ///
  GMimeParamList* function(GMimeContentDisposition* disposition) c_g_mime_content_disposition_get_parameters; ///
  bool function(GMimeContentDisposition* disposition) c_g_mime_content_disposition_is_attachment; ///
  void function(GMimeContentDisposition* disposition, const(char)* value) c_g_mime_content_disposition_set_disposition; ///
  void function(GMimeContentDisposition* disposition, const(char)* name, const(char)* value) c_g_mime_content_disposition_set_parameter; ///

  // ContentType
  GType function() c_g_mime_content_type_get_type; ///
  GMimeContentType* function(const(char)* type, const(char)* subtype) c_g_mime_content_type_new; ///
  GMimeContentType* function(GMimeParserOptions* options, const(char)* str) c_g_mime_content_type_parse; ///
  char* function(GMimeContentType* contentType, GMimeFormatOptions* options) c_g_mime_content_type_encode; ///
  const(char)* function(GMimeContentType* contentType) c_g_mime_content_type_get_media_subtype; ///
  const(char)* function(GMimeContentType* contentType) c_g_mime_content_type_get_media_type; ///
  char* function(GMimeContentType* contentType) c_g_mime_content_type_get_mime_type; ///
  const(char)* function(GMimeContentType* contentType, const(char)* name) c_g_mime_content_type_get_parameter; ///
  GMimeParamList* function(GMimeContentType* contentType) c_g_mime_content_type_get_parameters; ///
  bool function(GMimeContentType* contentType, const(char)* type, const(char)* subtype) c_g_mime_content_type_is_type; ///
  void function(GMimeContentType* contentType, const(char)* subtype) c_g_mime_content_type_set_media_subtype; ///
  void function(GMimeContentType* contentType, const(char)* type) c_g_mime_content_type_set_media_type; ///
  void function(GMimeContentType* contentType, const(char)* name, const(char)* value) c_g_mime_content_type_set_parameter; ///

  // CryptoContext
  GType function() c_g_mime_crypto_context_get_type; ///
  GMimeCryptoContext* function(const(char)* protocol) c_g_mime_crypto_context_new; ///
  void function(const(char)* protocol, GMimeCryptoContextNewFunc callback) c_g_mime_crypto_context_register; ///
  GMimeDecryptResult* function(GMimeCryptoContext* ctx, GMimeDecryptFlags flags, const(char)* sessionKey, GMimeStream* istream, GMimeStream* ostream, GError** _err) c_g_mime_crypto_context_decrypt; ///
  GMimeDigestAlgo function(GMimeCryptoContext* ctx, const(char)* name) c_g_mime_crypto_context_digest_id; ///
  const(char)* function(GMimeCryptoContext* ctx, GMimeDigestAlgo digest) c_g_mime_crypto_context_digest_name; ///
  int function(GMimeCryptoContext* ctx, bool sign, const(char)* userid, GMimeEncryptFlags flags, GPtrArray* recipients, GMimeStream* istream, GMimeStream* ostream, GError** _err) c_g_mime_crypto_context_encrypt; ///
  int function(GMimeCryptoContext* ctx, const(char*)* keys, GMimeStream* ostream, GError** _err) c_g_mime_crypto_context_export_keys; ///
  const(char)* function(GMimeCryptoContext* ctx) c_g_mime_crypto_context_get_encryption_protocol; ///
  const(char)* function(GMimeCryptoContext* ctx) c_g_mime_crypto_context_get_key_exchange_protocol; ///
  const(char)* function(GMimeCryptoContext* ctx) c_g_mime_crypto_context_get_signature_protocol; ///
  int function(GMimeCryptoContext* ctx, GMimeStream* istream, GError** _err) c_g_mime_crypto_context_import_keys; ///
  void function(GMimeCryptoContext* ctx, GMimePasswordRequestFunc requestPasswd) c_g_mime_crypto_context_set_request_password; ///
  int function(GMimeCryptoContext* ctx, bool detach, const(char)* userid, GMimeStream* istream, GMimeStream* ostream, GError** _err) c_g_mime_crypto_context_sign; ///
  GMimeSignatureList* function(GMimeCryptoContext* ctx, GMimeVerifyFlags flags, GMimeStream* istream, GMimeStream* sigstream, GMimeStream* ostream, GError** _err) c_g_mime_crypto_context_verify; ///

  // DataWrapper
  GType function() c_g_mime_data_wrapper_get_type; ///
  GMimeDataWrapper* function() c_g_mime_data_wrapper_new; ///
  GMimeDataWrapper* function(GMimeStream* stream, GMimeContentEncoding encoding) c_g_mime_data_wrapper_new_with_stream; ///
  GMimeContentEncoding function(GMimeDataWrapper* wrapper) c_g_mime_data_wrapper_get_encoding; ///
  GMimeStream* function(GMimeDataWrapper* wrapper) c_g_mime_data_wrapper_get_stream; ///
  void function(GMimeDataWrapper* wrapper, GMimeContentEncoding encoding) c_g_mime_data_wrapper_set_encoding; ///
  void function(GMimeDataWrapper* wrapper, GMimeStream* stream) c_g_mime_data_wrapper_set_stream; ///
  ptrdiff_t function(GMimeDataWrapper* wrapper, GMimeStream* stream) c_g_mime_data_wrapper_write_to_stream; ///

  // DecryptResult
  GType function() c_g_mime_decrypt_result_get_type; ///
  GMimeDecryptResult* function() c_g_mime_decrypt_result_new; ///
  GMimeCipherAlgo function(GMimeDecryptResult* result) c_g_mime_decrypt_result_get_cipher; ///
  GMimeDigestAlgo function(GMimeDecryptResult* result) c_g_mime_decrypt_result_get_mdc; ///
  GMimeCertificateList* function(GMimeDecryptResult* result) c_g_mime_decrypt_result_get_recipients; ///
  const(char)* function(GMimeDecryptResult* result) c_g_mime_decrypt_result_get_session_key; ///
  GMimeSignatureList* function(GMimeDecryptResult* result) c_g_mime_decrypt_result_get_signatures; ///
  void function(GMimeDecryptResult* result, GMimeCipherAlgo cipher) c_g_mime_decrypt_result_set_cipher; ///
  void function(GMimeDecryptResult* result, GMimeDigestAlgo mdc) c_g_mime_decrypt_result_set_mdc; ///
  void function(GMimeDecryptResult* result, GMimeCertificateList* recipients) c_g_mime_decrypt_result_set_recipients; ///
  void function(GMimeDecryptResult* result, const(char)* sessionKey) c_g_mime_decrypt_result_set_session_key; ///
  void function(GMimeDecryptResult* result, GMimeSignatureList* signatures) c_g_mime_decrypt_result_set_signatures; ///

  // Encoding
  size_t function(GMimeEncoding* state, const(char)* inbuf, size_t inlen, char* outbuf) c_g_mime_encoding_flush; ///
  void function(GMimeEncoding* state, GMimeContentEncoding encoding) c_g_mime_encoding_init_decode; ///
  void function(GMimeEncoding* state, GMimeContentEncoding encoding) c_g_mime_encoding_init_encode; ///
  size_t function(GMimeEncoding* state, size_t inlen) c_g_mime_encoding_outlen; ///
  void function(GMimeEncoding* state) c_g_mime_encoding_reset; ///
  size_t function(GMimeEncoding* state, const(char)* inbuf, size_t inlen, char* outbuf) c_g_mime_encoding_step; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) c_g_mime_encoding_base64_decode_step; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) c_g_mime_encoding_base64_encode_close; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) c_g_mime_encoding_base64_encode_step; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) c_g_mime_encoding_quoted_decode_step; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) c_g_mime_encoding_quoted_encode_close; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) c_g_mime_encoding_quoted_encode_step; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) c_g_mime_encoding_uudecode_step; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, ubyte* uubuf, int* state, uint* save) c_g_mime_encoding_uuencode_close; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, ubyte* uubuf, int* state, uint* save) c_g_mime_encoding_uuencode_step; ///

  // Filter
  GType function() c_g_mime_filter_get_type; ///
  void function(GMimeFilter* filter, const(ubyte)* data, size_t length) c_g_mime_filter_backup; ///
  void function(GMimeFilter* filter, ubyte* inbuf, size_t inlen, size_t prespace, ubyte** outbuf, size_t* outlen, size_t* outprespace) c_g_mime_filter_complete; ///
  GMimeFilter* function(GMimeFilter* filter) c_g_mime_filter_copy; ///
  void function(GMimeFilter* filter, ubyte* inbuf, size_t inlen, size_t prespace, ubyte** outbuf, size_t* outlen, size_t* outprespace) c_g_mime_filter_filter; ///
  void function(GMimeFilter* filter) c_g_mime_filter_reset; ///
  void function(GMimeFilter* filter, size_t size, bool keep) c_g_mime_filter_set_size; ///

  // FilterBasic
  GType function() c_g_mime_filter_basic_get_type; ///
  GMimeFilter* function(GMimeContentEncoding encoding, bool encode) c_g_mime_filter_basic_new; ///

  // FilterBest
  GType function() c_g_mime_filter_best_get_type; ///
  GMimeFilter* function(GMimeFilterBestFlags flags) c_g_mime_filter_best_new; ///
  const(char)* function(GMimeFilterBest* best) c_g_mime_filter_best_charset; ///
  GMimeContentEncoding function(GMimeFilterBest* best, GMimeEncodingConstraint constraint) c_g_mime_filter_best_encoding; ///

  // FilterCharset
  GType function() c_g_mime_filter_charset_get_type; ///
  GMimeFilter* function(const(char)* fromCharset, const(char)* toCharset) c_g_mime_filter_charset_new; ///

  // FilterChecksum
  GType function() c_g_mime_filter_checksum_get_type; ///
  GMimeFilter* function(GChecksumType type) c_g_mime_filter_checksum_new; ///
  size_t function(GMimeFilterChecksum* checksum, ubyte* digest, size_t len) c_g_mime_filter_checksum_get_digest; ///
  char* function(GMimeFilterChecksum* checksum) c_g_mime_filter_checksum_get_string; ///

  // FilterDos2Unix
  GType function() c_g_mime_filter_dos2unix_get_type; ///
  GMimeFilter* function(bool ensureNewline) c_g_mime_filter_dos2unix_new; ///

  // FilterEnriched
  GType function() c_g_mime_filter_enriched_get_type; ///
  GMimeFilter* function(uint flags) c_g_mime_filter_enriched_new; ///

  // FilterFrom
  GType function() c_g_mime_filter_from_get_type; ///
  GMimeFilter* function(GMimeFilterFromMode mode) c_g_mime_filter_from_new; ///

  // FilterGZip
  GType function() c_g_mime_filter_gzip_get_type; ///
  GMimeFilter* function(GMimeFilterGZipMode mode, int level) c_g_mime_filter_gzip_new; ///
  const(char)* function(GMimeFilterGZip* gzip) c_g_mime_filter_gzip_get_comment; ///
  const(char)* function(GMimeFilterGZip* gzip) c_g_mime_filter_gzip_get_filename; ///
  void function(GMimeFilterGZip* gzip, const(char)* comment) c_g_mime_filter_gzip_set_comment; ///
  void function(GMimeFilterGZip* gzip, const(char)* filename) c_g_mime_filter_gzip_set_filename; ///

  // FilterHTML
  GType function() c_g_mime_filter_html_get_type; ///
  GMimeFilter* function(uint flags, uint colour) c_g_mime_filter_html_new; ///

  // FilterOpenPGP
  GType function() c_g_mime_filter_openpgp_get_type; ///
  GMimeFilter* function() c_g_mime_filter_openpgp_new; ///
  long function(GMimeFilterOpenPGP* openpgp) c_g_mime_filter_openpgp_get_begin_offset; ///
  GMimeOpenPGPData function(GMimeFilterOpenPGP* openpgp) c_g_mime_filter_openpgp_get_data_type; ///
  long function(GMimeFilterOpenPGP* openpgp) c_g_mime_filter_openpgp_get_end_offset; ///

  // FilterSmtpData
  GType function() c_g_mime_filter_smtp_data_get_type; ///
  GMimeFilter* function() c_g_mime_filter_smtp_data_new; ///

  // FilterStrip
  GType function() c_g_mime_filter_strip_get_type; ///
  GMimeFilter* function() c_g_mime_filter_strip_new; ///

  // FilterUnix2Dos
  GType function() c_g_mime_filter_unix2dos_get_type; ///
  GMimeFilter* function(bool ensureNewline) c_g_mime_filter_unix2dos_new; ///

  // FilterWindows
  GType function() c_g_mime_filter_windows_get_type; ///
  GMimeFilter* function(const(char)* claimedCharset) c_g_mime_filter_windows_new; ///
  bool function(GMimeFilterWindows* filter) c_g_mime_filter_windows_is_windows_charset; ///
  const(char)* function(GMimeFilterWindows* filter) c_g_mime_filter_windows_real_charset; ///

  // FilterYenc
  GType function() c_g_mime_filter_yenc_get_type; ///
  GMimeFilter* function(bool encode) c_g_mime_filter_yenc_new; ///
  uint function(GMimeFilterYenc* yenc) c_g_mime_filter_yenc_get_crc; ///
  uint function(GMimeFilterYenc* yenc) c_g_mime_filter_yenc_get_pcrc; ///
  void function(GMimeFilterYenc* yenc, uint crc) c_g_mime_filter_yenc_set_crc; ///
  void function(GMimeFilterYenc* yenc, int state) c_g_mime_filter_yenc_set_state; ///

  // FormatOptions
  GType function() c_g_mime_format_options_get_type; ///
  GMimeFormatOptions* function() c_g_mime_format_options_new; ///
  void function(GMimeFormatOptions* options, const(char)* header) c_g_mime_format_options_add_hidden_header; ///
  void function(GMimeFormatOptions* options) c_g_mime_format_options_clear_hidden_headers; ///
  GMimeFormatOptions* function(GMimeFormatOptions* options) c_g_mime_format_options_clone; ///
  GMimeFilter* function(GMimeFormatOptions* options, bool ensureNewline) c_g_mime_format_options_create_newline_filter; ///
  void function(GMimeFormatOptions* options) c_g_mime_format_options_free; ///
  const(char)* function(GMimeFormatOptions* options) c_g_mime_format_options_get_newline; ///
  GMimeNewLineFormat function(GMimeFormatOptions* options) c_g_mime_format_options_get_newline_format; ///
  GMimeParamEncodingMethod function(GMimeFormatOptions* options) c_g_mime_format_options_get_param_encoding_method; ///
  bool function(GMimeFormatOptions* options, const(char)* header) c_g_mime_format_options_is_hidden_header; ///
  void function(GMimeFormatOptions* options, const(char)* header) c_g_mime_format_options_remove_hidden_header; ///
  void function(GMimeFormatOptions* options, GMimeNewLineFormat newline) c_g_mime_format_options_set_newline_format; ///
  void function(GMimeFormatOptions* options, GMimeParamEncodingMethod method) c_g_mime_format_options_set_param_encoding_method; ///
  GMimeFormatOptions* function() c_g_mime_format_options_get_default; ///

  // GpgContext
  GType function() c_g_mime_gpg_context_get_type; ///
  GMimeCryptoContext* function() c_g_mime_gpg_context_new; ///

  // Header
  GType function() c_g_mime_header_get_type; ///
  char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) c_g_mime_header_format_addrlist; ///
  char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) c_g_mime_header_format_content_disposition; ///
  char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) c_g_mime_header_format_content_type; ///
  char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) c_g_mime_header_format_default; ///
  char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) c_g_mime_header_format_message_id; ///
  char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) c_g_mime_header_format_newsgroups; ///
  char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) c_g_mime_header_format_received; ///
  char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) c_g_mime_header_format_references; ///
  const(char)* function(GMimeHeader* header) c_g_mime_header_get_name; ///
  long function(GMimeHeader* header) c_g_mime_header_get_offset; ///
  const(char)* function(GMimeHeader* header) c_g_mime_header_get_raw_name; ///
  const(char)* function(GMimeHeader* header) c_g_mime_header_get_raw_value; ///
  const(char)* function(GMimeHeader* header) c_g_mime_header_get_value; ///
  void function(GMimeHeader* header, const(char)* rawValue) c_g_mime_header_set_raw_value; ///
  void function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) c_g_mime_header_set_value; ///
  ptrdiff_t function(GMimeHeader* header, GMimeFormatOptions* options, GMimeStream* stream) c_g_mime_header_write_to_stream; ///

  // HeaderList
  GType function() c_g_mime_header_list_get_type; ///
  GMimeHeaderList* function(GMimeParserOptions* options) c_g_mime_header_list_new; ///
  void function(GMimeHeaderList* headers, const(char)* name, const(char)* value, const(char)* charset) c_g_mime_header_list_append; ///
  void function(GMimeHeaderList* headers) c_g_mime_header_list_clear; ///
  bool function(GMimeHeaderList* headers, const(char)* name) c_g_mime_header_list_contains; ///
  int function(GMimeHeaderList* headers) c_g_mime_header_list_get_count; ///
  GMimeHeader* function(GMimeHeaderList* headers, const(char)* name) c_g_mime_header_list_get_header; ///
  GMimeHeader* function(GMimeHeaderList* headers, int index) c_g_mime_header_list_get_header_at; ///
  void function(GMimeHeaderList* headers, const(char)* name, const(char)* value, const(char)* charset) c_g_mime_header_list_prepend; ///
  bool function(GMimeHeaderList* headers, const(char)* name) c_g_mime_header_list_remove; ///
  void function(GMimeHeaderList* headers, int index) c_g_mime_header_list_remove_at; ///
  void function(GMimeHeaderList* headers, const(char)* name, const(char)* value, const(char)* charset) c_g_mime_header_list_set; ///
  char* function(GMimeHeaderList* headers, GMimeFormatOptions* options) c_g_mime_header_list_to_string; ///
  ptrdiff_t function(GMimeHeaderList* headers, GMimeFormatOptions* options, GMimeStream* stream) c_g_mime_header_list_write_to_stream; ///

  // InternetAddress
  GType function() c_internet_address_get_type; ///
  const(char)* function(GMimeInternetAddress* ia) c_internet_address_get_charset; ///
  const(char)* function(GMimeInternetAddress* ia) c_internet_address_get_name; ///
  void function(GMimeInternetAddress* ia, const(char)* charset) c_internet_address_set_charset; ///
  void function(GMimeInternetAddress* ia, const(char)* name) c_internet_address_set_name; ///
  char* function(GMimeInternetAddress* ia, GMimeFormatOptions* options, bool encode) c_internet_address_to_string; ///

  // InternetAddressGroup
  GType function() c_internet_address_group_get_type; ///
  GMimeInternetAddress* function(const(char)* name) c_internet_address_group_new; ///
  int function(GMimeInternetAddressGroup* group, GMimeInternetAddress* member) c_internet_address_group_add_member; ///
  GMimeInternetAddressList* function(GMimeInternetAddressGroup* group) c_internet_address_group_get_members; ///
  void function(GMimeInternetAddressGroup* group, GMimeInternetAddressList* members) c_internet_address_group_set_members; ///

  // InternetAddressList
  GType function() c_internet_address_list_get_type; ///
  GMimeInternetAddressList* function() c_internet_address_list_new; ///
  GMimeInternetAddressList* function(GMimeParserOptions* options, const(char)* str) c_internet_address_list_parse; ///
  int function(GMimeInternetAddressList* list, GMimeInternetAddress* ia) c_internet_address_list_add; ///
  void function(GMimeInternetAddressList* list, GMimeInternetAddressList* append) c_internet_address_list_append; ///
  void function(GMimeInternetAddressList* list, GMimeParserOptions* options, const(char)* str) c_internet_address_list_append_parse; ///
  void function(GMimeInternetAddressList* list) c_internet_address_list_clear; ///
  bool function(GMimeInternetAddressList* list, GMimeInternetAddress* ia) c_internet_address_list_contains; ///
  void function(GMimeInternetAddressList* list, GMimeFormatOptions* options, GString* str) c_internet_address_list_encode; ///
  GMimeInternetAddress* function(GMimeInternetAddressList* list, int index) c_internet_address_list_get_address; ///
  int function(GMimeInternetAddressList* list, GMimeInternetAddress* ia) c_internet_address_list_index_of; ///
  void function(GMimeInternetAddressList* list, int index, GMimeInternetAddress* ia) c_internet_address_list_insert; ///
  int function(GMimeInternetAddressList* list) c_internet_address_list_length; ///
  void function(GMimeInternetAddressList* list, GMimeInternetAddressList* prepend) c_internet_address_list_prepend; ///
  bool function(GMimeInternetAddressList* list, GMimeInternetAddress* ia) c_internet_address_list_remove; ///
  bool function(GMimeInternetAddressList* list, int index) c_internet_address_list_remove_at; ///
  void function(GMimeInternetAddressList* list, int index, GMimeInternetAddress* ia) c_internet_address_list_set_address; ///
  char* function(GMimeInternetAddressList* list, GMimeFormatOptions* options, bool encode) c_internet_address_list_to_string; ///

  // InternetAddressMailbox
  GType function() c_internet_address_mailbox_get_type; ///
  GMimeInternetAddress* function(const(char)* name, const(char)* addr) c_internet_address_mailbox_new; ///
  const(char)* function(GMimeInternetAddressMailbox* mailbox) c_internet_address_mailbox_get_addr; ///
  const(char)* function(GMimeInternetAddressMailbox* mailbox) c_internet_address_mailbox_get_idn_addr; ///
  void function(GMimeInternetAddressMailbox* mailbox, const(char)* addr) c_internet_address_mailbox_set_addr; ///

  // Message
  GType function() c_g_mime_message_get_type; ///
  GMimeMessage* function(bool prettyHeaders) c_g_mime_message_new; ///
  void function(GMimeMessage* message, GMimeAddressType type, const(char)* name, const(char)* addr) c_g_mime_message_add_mailbox; ///
  void function(GMimeMessage* message, GMimeObjectForeachFunc callback, void* userData) c_g_mime_message_foreach; ///
  GMimeInternetAddressList* function(GMimeMessage* message, GMimeAddressType type) c_g_mime_message_get_addresses; ///
  GMimeInternetAddressList* function(GMimeMessage* message) c_g_mime_message_get_all_recipients; ///
  GMimeAutocryptHeaderList* function(GMimeMessage* message, GDateTime* now, GMimeDecryptFlags flags, const(char)* sessionKey, GError** _err) c_g_mime_message_get_autocrypt_gossip_headers; ///
  GMimeAutocryptHeaderList* function(GMimeMessage* message, GDateTime* now, GMimeObject* innerPart) c_g_mime_message_get_autocrypt_gossip_headers_from_inner_part; ///
  GMimeAutocryptHeader* function(GMimeMessage* message, GDateTime* now) c_g_mime_message_get_autocrypt_header; ///
  GMimeInternetAddressList* function(GMimeMessage* message) c_g_mime_message_get_bcc; ///
  GMimeObject* function(GMimeMessage* message) c_g_mime_message_get_body; ///
  GMimeInternetAddressList* function(GMimeMessage* message) c_g_mime_message_get_cc; ///
  GDateTime* function(GMimeMessage* message) c_g_mime_message_get_date; ///
  GMimeInternetAddressList* function(GMimeMessage* message) c_g_mime_message_get_from; ///
  const(char)* function(GMimeMessage* message) c_g_mime_message_get_message_id; ///
  GMimeObject* function(GMimeMessage* message) c_g_mime_message_get_mime_part; ///
  GMimeInternetAddressList* function(GMimeMessage* message) c_g_mime_message_get_reply_to; ///
  GMimeInternetAddressList* function(GMimeMessage* message) c_g_mime_message_get_sender; ///
  const(char)* function(GMimeMessage* message) c_g_mime_message_get_subject; ///
  GMimeInternetAddressList* function(GMimeMessage* message) c_g_mime_message_get_to; ///
  GMimeMessage** function(GMimeMessage* message, size_t maxSize, size_t* nparts) c_g_mime_message_partial_split_message; ///
  void function(GMimeMessage* message, GDateTime* date) c_g_mime_message_set_date; ///
  void function(GMimeMessage* message, const(char)* messageId) c_g_mime_message_set_message_id; ///
  void function(GMimeMessage* message, GMimeObject* mimePart) c_g_mime_message_set_mime_part; ///
  void function(GMimeMessage* message, const(char)* subject, const(char)* charset) c_g_mime_message_set_subject; ///

  // MessagePart
  GType function() c_g_mime_message_part_get_type; ///
  GMimeMessagePart* function(const(char)* subtype) c_g_mime_message_part_new; ///
  GMimeMessagePart* function(const(char)* subtype, GMimeMessage* message) c_g_mime_message_part_new_with_message; ///
  GMimeMessage* function(GMimeMessagePart* part) c_g_mime_message_part_get_message; ///
  void function(GMimeMessagePart* part, GMimeMessage* message) c_g_mime_message_part_set_message; ///

  // MessagePartial
  GType function() c_g_mime_message_partial_get_type; ///
  GMimeMessagePartial* function(const(char)* id, int number, int total) c_g_mime_message_partial_new; ///
  GMimeMessage* function(GMimeMessagePartial** partials, size_t num) c_g_mime_message_partial_reconstruct_message; ///
  const(char)* function(GMimeMessagePartial* partial) c_g_mime_message_partial_get_id; ///
  int function(GMimeMessagePartial* partial) c_g_mime_message_partial_get_number; ///
  int function(GMimeMessagePartial* partial) c_g_mime_message_partial_get_total; ///

  // Multipart
  GType function() c_g_mime_multipart_get_type; ///
  GMimeMultipart* function() c_g_mime_multipart_new; ///
  GMimeMultipart* function(const(char)* subtype) c_g_mime_multipart_new_with_subtype; ///
  void function(GMimeMultipart* multipart, GMimeObject* part) c_g_mime_multipart_add; ///
  void function(GMimeMultipart* multipart) c_g_mime_multipart_clear; ///
  bool function(GMimeMultipart* multipart, GMimeObject* part) c_g_mime_multipart_contains; ///
  void function(GMimeMultipart* multipart, GMimeObjectForeachFunc callback, void* userData) c_g_mime_multipart_foreach; ///
  const(char)* function(GMimeMultipart* multipart) c_g_mime_multipart_get_boundary; ///
  int function(GMimeMultipart* multipart) c_g_mime_multipart_get_count; ///
  const(char)* function(GMimeMultipart* multipart) c_g_mime_multipart_get_epilogue; ///
  GMimeObject* function(GMimeMultipart* multipart, int index) c_g_mime_multipart_get_part; ///
  const(char)* function(GMimeMultipart* multipart) c_g_mime_multipart_get_prologue; ///
  GMimeObject* function(GMimeMultipart* multipart, const(char)* contentId) c_g_mime_multipart_get_subpart_from_content_id; ///
  int function(GMimeMultipart* multipart, GMimeObject* part) c_g_mime_multipart_index_of; ///
  void function(GMimeMultipart* multipart, int index, GMimeObject* part) c_g_mime_multipart_insert; ///
  bool function(GMimeMultipart* multipart, GMimeObject* part) c_g_mime_multipart_remove; ///
  GMimeObject* function(GMimeMultipart* multipart, int index) c_g_mime_multipart_remove_at; ///
  GMimeObject* function(GMimeMultipart* multipart, int index, GMimeObject* replacement) c_g_mime_multipart_replace; ///
  void function(GMimeMultipart* multipart, const(char)* boundary) c_g_mime_multipart_set_boundary; ///
  void function(GMimeMultipart* multipart, const(char)* epilogue) c_g_mime_multipart_set_epilogue; ///
  void function(GMimeMultipart* multipart, const(char)* prologue) c_g_mime_multipart_set_prologue; ///

  // MultipartEncrypted
  GType function() c_g_mime_multipart_encrypted_get_type; ///
  GMimeMultipartEncrypted* function() c_g_mime_multipart_encrypted_new; ///
  GMimeMultipartEncrypted* function(GMimeCryptoContext* ctx, GMimeObject* entity, bool sign, const(char)* userid, GMimeEncryptFlags flags, GPtrArray* recipients, GError** _err) c_g_mime_multipart_encrypted_encrypt; ///
  GMimeObject* function(GMimeMultipartEncrypted* encrypted, GMimeDecryptFlags flags, const(char)* sessionKey, GMimeDecryptResult** result, GError** _err) c_g_mime_multipart_encrypted_decrypt; ///

  // MultipartSigned
  GType function() c_g_mime_multipart_signed_get_type; ///
  GMimeMultipartSigned* function() c_g_mime_multipart_signed_new; ///
  GMimeMultipartSigned* function(GMimeCryptoContext* ctx, GMimeObject* entity, const(char)* userid, GError** _err) c_g_mime_multipart_signed_sign; ///
  GMimeSignatureList* function(GMimeMultipartSigned* mps, GMimeVerifyFlags flags, GError** _err) c_g_mime_multipart_signed_verify; ///

  // ObjectWrap
  GType function() c_g_mime_object_get_type; ///
  GMimeObject* function(GMimeParserOptions* options, GMimeContentType* contentType) c_g_mime_object_new; ///
  GMimeObject* function(GMimeParserOptions* options, const(char)* type, const(char)* subtype) c_g_mime_object_new_type; ///
  void function(const(char)* type, const(char)* subtype, GType objectType) c_g_mime_object_register_type; ///
  void function() c_g_mime_object_type_registry_init; ///
  void function() c_g_mime_object_type_registry_shutdown; ///
  void function(GMimeObject* object, const(char)* header, const(char)* value, const(char)* charset) c_g_mime_object_append_header; ///
  void function(GMimeObject* object, GMimeEncodingConstraint constraint) c_g_mime_object_encode; ///
  GMimeAutocryptHeaderList* function(GMimeObject* mimePart, GDateTime* effectiveDate, const(char)* matchheader, GMimeInternetAddressList* addresses, bool keepIncomplete) c_g_mime_object_get_autocrypt_headers; ///
  GMimeContentDisposition* function(GMimeObject* object) c_g_mime_object_get_content_disposition; ///
  const(char)* function(GMimeObject* object, const(char)* name) c_g_mime_object_get_content_disposition_parameter; ///
  const(char)* function(GMimeObject* object) c_g_mime_object_get_content_id; ///
  GMimeContentType* function(GMimeObject* object) c_g_mime_object_get_content_type; ///
  const(char)* function(GMimeObject* object, const(char)* name) c_g_mime_object_get_content_type_parameter; ///
  const(char)* function(GMimeObject* object) c_g_mime_object_get_disposition; ///
  const(char)* function(GMimeObject* object, const(char)* header) c_g_mime_object_get_header; ///
  GMimeHeaderList* function(GMimeObject* object) c_g_mime_object_get_header_list; ///
  char* function(GMimeObject* object, GMimeFormatOptions* options) c_g_mime_object_get_headers; ///
  void function(GMimeObject* object, const(char)* header, const(char)* value, const(char)* charset) c_g_mime_object_prepend_header; ///
  bool function(GMimeObject* object, const(char)* header) c_g_mime_object_remove_header; ///
  void function(GMimeObject* object, GMimeContentDisposition* disposition) c_g_mime_object_set_content_disposition; ///
  void function(GMimeObject* object, const(char)* name, const(char)* value) c_g_mime_object_set_content_disposition_parameter; ///
  void function(GMimeObject* object, const(char)* contentId) c_g_mime_object_set_content_id; ///
  void function(GMimeObject* object, GMimeContentType* contentType) c_g_mime_object_set_content_type; ///
  void function(GMimeObject* object, const(char)* name, const(char)* value) c_g_mime_object_set_content_type_parameter; ///
  void function(GMimeObject* object, const(char)* disposition) c_g_mime_object_set_disposition; ///
  void function(GMimeObject* object, const(char)* header, const(char)* value, const(char)* charset) c_g_mime_object_set_header; ///
  char* function(GMimeObject* object, GMimeFormatOptions* options) c_g_mime_object_to_string; ///
  ptrdiff_t function(GMimeObject* object, GMimeFormatOptions* options, GMimeStream* stream) c_g_mime_object_write_content_to_stream; ///
  ptrdiff_t function(GMimeObject* object, GMimeFormatOptions* options, GMimeStream* stream) c_g_mime_object_write_to_stream; ///

  // Param
  GType function() c_g_mime_param_get_type; ///
  const(char)* function(GMimeParam* param) c_g_mime_param_get_charset; ///
  GMimeParamEncodingMethod function(GMimeParam* param) c_g_mime_param_get_encoding_method; ///
  const(char)* function(GMimeParam* param) c_g_mime_param_get_lang; ///
  const(char)* function(GMimeParam* param) c_g_mime_param_get_name; ///
  const(char)* function(GMimeParam* param) c_g_mime_param_get_value; ///
  void function(GMimeParam* param, const(char)* charset) c_g_mime_param_set_charset; ///
  void function(GMimeParam* param, GMimeParamEncodingMethod method) c_g_mime_param_set_encoding_method; ///
  void function(GMimeParam* param, const(char)* lang) c_g_mime_param_set_lang; ///
  void function(GMimeParam* param, const(char)* value) c_g_mime_param_set_value; ///

  // ParamList
  GType function() c_g_mime_param_list_get_type; ///
  GMimeParamList* function() c_g_mime_param_list_new; ///
  GMimeParamList* function(GMimeParserOptions* options, const(char)* str) c_g_mime_param_list_parse; ///
  void function(GMimeParamList* list) c_g_mime_param_list_clear; ///
  void function(GMimeParamList* list, GMimeFormatOptions* options, bool fold, GString* str) c_g_mime_param_list_encode; ///
  GMimeParam* function(GMimeParamList* list, const(char)* name) c_g_mime_param_list_get_parameter; ///
  GMimeParam* function(GMimeParamList* list, int index) c_g_mime_param_list_get_parameter_at; ///
  int function(GMimeParamList* list) c_g_mime_param_list_length; ///
  bool function(GMimeParamList* list, const(char)* name) c_g_mime_param_list_remove; ///
  bool function(GMimeParamList* list, int index) c_g_mime_param_list_remove_at; ///
  void function(GMimeParamList* list, const(char)* name, const(char)* value) c_g_mime_param_list_set_parameter; ///

  // Parser
  GType function() c_g_mime_parser_get_type; ///
  GMimeParser* function() c_g_mime_parser_new; ///
  GMimeParser* function(GMimeStream* stream) c_g_mime_parser_new_with_stream; ///
  GMimeMessage* function(GMimeParser* parser, GMimeParserOptions* options) c_g_mime_parser_construct_message; ///
  GMimeObject* function(GMimeParser* parser, GMimeParserOptions* options) c_g_mime_parser_construct_part; ///
  bool function(GMimeParser* parser) c_g_mime_parser_eos; ///
  GMimeFormat function(GMimeParser* parser) c_g_mime_parser_get_format; ///
  long function(GMimeParser* parser) c_g_mime_parser_get_headers_begin; ///
  long function(GMimeParser* parser) c_g_mime_parser_get_headers_end; ///
  char* function(GMimeParser* parser) c_g_mime_parser_get_mbox_marker; ///
  long function(GMimeParser* parser) c_g_mime_parser_get_mbox_marker_offset; ///
  bool function(GMimeParser* parser) c_g_mime_parser_get_persist_stream; ///
  bool function(GMimeParser* parser) c_g_mime_parser_get_respect_content_length; ///
  void function(GMimeParser* parser, GMimeStream* stream) c_g_mime_parser_init_with_stream; ///
  void function(GMimeParser* parser, GMimeFormat format) c_g_mime_parser_set_format; ///
  void function(GMimeParser* parser, const(char)* regex, GMimeParserHeaderRegexFunc headerCb, void* userData) c_g_mime_parser_set_header_regex; ///
  void function(GMimeParser* parser, bool persist) c_g_mime_parser_set_persist_stream; ///
  void function(GMimeParser* parser, bool respectContentLength) c_g_mime_parser_set_respect_content_length; ///
  long function(GMimeParser* parser) c_g_mime_parser_tell; ///

  // ParserOptions
  GType function() c_g_mime_parser_options_get_type; ///
  GMimeParserOptions* function() c_g_mime_parser_options_new; ///
  GMimeParserOptions* function(GMimeParserOptions* options) c_g_mime_parser_options_clone; ///
  void function(GMimeParserOptions* options) c_g_mime_parser_options_free; ///
  GMimeRfcComplianceMode function(GMimeParserOptions* options) c_g_mime_parser_options_get_address_compliance_mode; ///
  bool function(GMimeParserOptions* options) c_g_mime_parser_options_get_allow_addresses_without_domain; ///
  const(char*)* function(GMimeParserOptions* options) c_g_mime_parser_options_get_fallback_charsets; ///
  GMimeRfcComplianceMode function(GMimeParserOptions* options) c_g_mime_parser_options_get_parameter_compliance_mode; ///
  GMimeRfcComplianceMode function(GMimeParserOptions* options) c_g_mime_parser_options_get_rfc2047_compliance_mode; ///
  GMimeParserWarningFunc function(GMimeParserOptions* options) c_g_mime_parser_options_get_warning_callback; ///
  void function(GMimeParserOptions* options, GMimeRfcComplianceMode mode) c_g_mime_parser_options_set_address_compliance_mode; ///
  void function(GMimeParserOptions* options, bool allow) c_g_mime_parser_options_set_allow_addresses_without_domain; ///
  void function(GMimeParserOptions* options, const(char*)* charsets) c_g_mime_parser_options_set_fallback_charsets; ///
  void function(GMimeParserOptions* options, GMimeRfcComplianceMode mode) c_g_mime_parser_options_set_parameter_compliance_mode; ///
  void function(GMimeParserOptions* options, GMimeRfcComplianceMode mode) c_g_mime_parser_options_set_rfc2047_compliance_mode; ///
  void function(GMimeParserOptions* options, GMimeParserWarningFunc warningCb, void* userData, GDestroyNotify notify) c_g_mime_parser_options_set_warning_callback; ///
  GMimeParserOptions* function() c_g_mime_parser_options_get_default; ///

  // Part
  GType function() c_g_mime_part_get_type; ///
  GMimePart* function() c_g_mime_part_new; ///
  GMimePart* function(const(char)* type, const(char)* subtype) c_g_mime_part_new_with_type; ///
  GMimeContentEncoding function(GMimePart* mimePart, GMimeEncodingConstraint constraint) c_g_mime_part_get_best_content_encoding; ///
  GMimeDataWrapper* function(GMimePart* mimePart) c_g_mime_part_get_content; ///
  const(char)* function(GMimePart* mimePart) c_g_mime_part_get_content_description; ///
  GMimeContentEncoding function(GMimePart* mimePart) c_g_mime_part_get_content_encoding; ///
  const(char)* function(GMimePart* mimePart) c_g_mime_part_get_content_id; ///
  const(char)* function(GMimePart* mimePart) c_g_mime_part_get_content_location; ///
  const(char)* function(GMimePart* mimePart) c_g_mime_part_get_content_md5; ///
  const(char)* function(GMimePart* mimePart) c_g_mime_part_get_filename; ///
  GMimeOpenPGPData function(GMimePart* mimePart) c_g_mime_part_get_openpgp_data; ///
  bool function(GMimePart* mimePart) c_g_mime_part_is_attachment; ///
  GMimeDecryptResult* function(GMimePart* mimePart, GMimeDecryptFlags flags, const(char)* sessionKey, GError** _err) c_g_mime_part_openpgp_decrypt; ///
  bool function(GMimePart* mimePart, bool sign, const(char)* userid, GMimeEncryptFlags flags, GPtrArray* recipients, GError** _err) c_g_mime_part_openpgp_encrypt; ///
  bool function(GMimePart* mimePart, const(char)* userid, GError** _err) c_g_mime_part_openpgp_sign; ///
  GMimeSignatureList* function(GMimePart* mimePart, GMimeVerifyFlags flags, GError** _err) c_g_mime_part_openpgp_verify; ///
  void function(GMimePart* mimePart, GMimeDataWrapper* content) c_g_mime_part_set_content; ///
  void function(GMimePart* mimePart, const(char)* description) c_g_mime_part_set_content_description; ///
  void function(GMimePart* mimePart, GMimeContentEncoding encoding) c_g_mime_part_set_content_encoding; ///
  void function(GMimePart* mimePart, const(char)* contentId) c_g_mime_part_set_content_id; ///
  void function(GMimePart* mimePart, const(char)* contentLocation) c_g_mime_part_set_content_location; ///
  void function(GMimePart* mimePart, const(char)* contentMd5) c_g_mime_part_set_content_md5; ///
  void function(GMimePart* mimePart, const(char)* filename) c_g_mime_part_set_filename; ///
  void function(GMimePart* mimePart, GMimeOpenPGPData data) c_g_mime_part_set_openpgp_data; ///
  bool function(GMimePart* mimePart) c_g_mime_part_verify_content_md5; ///

  // PartIter
  GType function() c_g_mime_part_iter_get_type; ///
  GMimePartIter* function(GMimeObject* toplevel) c_g_mime_part_iter_new; ///
  GMimePartIter* function(GMimePartIter* iter) c_g_mime_part_iter_clone; ///
  void function(GMimePartIter* iter) c_g_mime_part_iter_free; ///
  GMimeObject* function(GMimePartIter* iter) c_g_mime_part_iter_get_current; ///
  GMimeObject* function(GMimePartIter* iter) c_g_mime_part_iter_get_parent; ///
  char* function(GMimePartIter* iter) c_g_mime_part_iter_get_path; ///
  GMimeObject* function(GMimePartIter* iter) c_g_mime_part_iter_get_toplevel; ///
  bool function(GMimePartIter* iter) c_g_mime_part_iter_is_valid; ///
  bool function(GMimePartIter* iter, const(char)* path) c_g_mime_part_iter_jump_to; ///
  bool function(GMimePartIter* iter) c_g_mime_part_iter_next; ///
  bool function(GMimePartIter* iter) c_g_mime_part_iter_prev; ///
  bool function(GMimePartIter* iter) c_g_mime_part_iter_remove; ///
  bool function(GMimePartIter* iter, GMimeObject* replacement) c_g_mime_part_iter_replace; ///
  void function(GMimePartIter* iter) c_g_mime_part_iter_reset; ///

  // Pkcs7Context
  GType function() c_g_mime_pkcs7_context_get_type; ///
  GMimeCryptoContext* function() c_g_mime_pkcs7_context_new; ///

  // References
  GType function() c_g_mime_references_get_type; ///
  GMimeReferences* function() c_g_mime_references_new; ///
  void function(GMimeReferences* refs, const(char)* msgid) c_g_mime_references_append; ///
  void function(GMimeReferences* refs) c_g_mime_references_clear; ///
  GMimeReferences* function(GMimeReferences* refs) c_g_mime_references_copy; ///
  void function(GMimeReferences* refs) c_g_mime_references_free; ///
  const(char)* function(GMimeReferences* refs, int index) c_g_mime_references_get_message_id; ///
  int function(GMimeReferences* refs) c_g_mime_references_length; ///
  void function(GMimeReferences* refs, int index, const(char)* msgid) c_g_mime_references_set_message_id; ///
  GMimeReferences* function(GMimeParserOptions* options, const(char)* text) c_g_mime_references_parse; ///

  // Signature
  GType function() c_g_mime_signature_get_type; ///
  GMimeSignature* function() c_g_mime_signature_new; ///
  GMimeCertificate* function(GMimeSignature* sig) c_g_mime_signature_get_certificate; ///
  long function(GMimeSignature* sig) c_g_mime_signature_get_created; ///
  long function(GMimeSignature* sig) c_g_mime_signature_get_created64; ///
  long function(GMimeSignature* sig) c_g_mime_signature_get_expires; ///
  long function(GMimeSignature* sig) c_g_mime_signature_get_expires64; ///
  GMimeSignatureStatus function(GMimeSignature* sig) c_g_mime_signature_get_status; ///
  void function(GMimeSignature* sig, GMimeCertificate* cert) c_g_mime_signature_set_certificate; ///
  void function(GMimeSignature* sig, long created) c_g_mime_signature_set_created; ///
  void function(GMimeSignature* sig, long expires) c_g_mime_signature_set_expires; ///
  void function(GMimeSignature* sig, GMimeSignatureStatus status) c_g_mime_signature_set_status; ///

  // SignatureList
  GType function() c_g_mime_signature_list_get_type; ///
  GMimeSignatureList* function() c_g_mime_signature_list_new; ///
  int function(GMimeSignatureList* list, GMimeSignature* sig) c_g_mime_signature_list_add; ///
  void function(GMimeSignatureList* list) c_g_mime_signature_list_clear; ///
  bool function(GMimeSignatureList* list, GMimeSignature* sig) c_g_mime_signature_list_contains; ///
  GMimeSignature* function(GMimeSignatureList* list, int index) c_g_mime_signature_list_get_signature; ///
  int function(GMimeSignatureList* list, GMimeSignature* sig) c_g_mime_signature_list_index_of; ///
  void function(GMimeSignatureList* list, int index, GMimeSignature* sig) c_g_mime_signature_list_insert; ///
  int function(GMimeSignatureList* list) c_g_mime_signature_list_length; ///
  bool function(GMimeSignatureList* list, GMimeSignature* sig) c_g_mime_signature_list_remove; ///
  bool function(GMimeSignatureList* list, int index) c_g_mime_signature_list_remove_at; ///
  void function(GMimeSignatureList* list, int index, GMimeSignature* sig) c_g_mime_signature_list_set_signature; ///

  // Stream
  GType function() c_g_mime_stream_get_type; ///
  ptrdiff_t function(GMimeStream* stream, ubyte* buf, size_t max) c_g_mime_stream_buffer_gets; ///
  void function(GMimeStream* stream, GByteArray* buffer) c_g_mime_stream_buffer_readln; ///
  int function(GMimeStream* stream) c_g_mime_stream_close; ///
  void function(GMimeStream* stream, long start, long end) c_g_mime_stream_construct; ///
  bool function(GMimeStream* stream) c_g_mime_stream_eos; ///
  int function(GMimeStream* stream) c_g_mime_stream_flush; ///
  long function(GMimeStream* stream) c_g_mime_stream_length; ///
  ptrdiff_t function(GMimeStream* stream, const(char)* fmt,  ...) c_g_mime_stream_printf; ///
  ptrdiff_t function(GMimeStream* stream, ubyte* buf, size_t len) c_g_mime_stream_read; ///
  int function(GMimeStream* stream) c_g_mime_stream_reset; ///
  long function(GMimeStream* stream, long offset, GMimeSeekWhence whence) c_g_mime_stream_seek; ///
  void function(GMimeStream* stream, long start, long end) c_g_mime_stream_set_bounds; ///
  GMimeStream* function(GMimeStream* stream, long start, long end) c_g_mime_stream_substream; ///
  long function(GMimeStream* stream) c_g_mime_stream_tell; ///
  ptrdiff_t function(GMimeStream* stream, const(ubyte)* buf, size_t len) c_g_mime_stream_write; ///
  ptrdiff_t function(GMimeStream* stream, const(char)* str) c_g_mime_stream_write_string; ///
  long function(GMimeStream* src, GMimeStream* dest) c_g_mime_stream_write_to_stream; ///
  long function(GMimeStream* stream, GMimeStreamIOVector* vector, size_t count) c_g_mime_stream_writev; ///

  // StreamBuffer
  GType function() c_g_mime_stream_buffer_get_type; ///
  GMimeStream* function(GMimeStream* source, GMimeStreamBufferMode mode) c_g_mime_stream_buffer_new; ///

  // StreamCat
  GType function() c_g_mime_stream_cat_get_type; ///
  GMimeStream* function() c_g_mime_stream_cat_new; ///
  int function(GMimeStreamCat* cat, GMimeStream* source) c_g_mime_stream_cat_add_source; ///

  // StreamFile
  GType function() c_g_mime_stream_file_get_type; ///
  GMimeStream* function(void* fp) c_g_mime_stream_file_new; ///
  GMimeStream* function(void* fp, long start, long end) c_g_mime_stream_file_new_with_bounds; ///
  GMimeStream* function(const(char)* path, const(char)* mode, GError** _err) c_g_mime_stream_file_open; ///
  bool function(GMimeStreamFile* stream) c_g_mime_stream_file_get_owner; ///
  void function(GMimeStreamFile* stream, bool owner) c_g_mime_stream_file_set_owner; ///

  // StreamFilter
  GType function() c_g_mime_stream_filter_get_type; ///
  GMimeStream* function(GMimeStream* stream) c_g_mime_stream_filter_new; ///
  int function(GMimeStreamFilter* stream, GMimeFilter* filter) c_g_mime_stream_filter_add; ///
  bool function(GMimeStreamFilter* stream) c_g_mime_stream_filter_get_owner; ///
  void function(GMimeStreamFilter* stream, int id) c_g_mime_stream_filter_remove; ///
  void function(GMimeStreamFilter* stream, bool owner) c_g_mime_stream_filter_set_owner; ///

  // StreamFs
  GType function() c_g_mime_stream_fs_get_type; ///
  GMimeStream* function(int fd) c_g_mime_stream_fs_new; ///
  GMimeStream* function(int fd, long start, long end) c_g_mime_stream_fs_new_with_bounds; ///
  GMimeStream* function(const(char)* path, int flags, int mode, GError** _err) c_g_mime_stream_fs_open; ///
  bool function(GMimeStreamFs* stream) c_g_mime_stream_fs_get_owner; ///
  void function(GMimeStreamFs* stream, bool owner) c_g_mime_stream_fs_set_owner; ///

  // StreamGIO
  GType function() c_g_mime_stream_gio_get_type; ///
  GMimeStream* function(GFile* file) c_g_mime_stream_gio_new; ///
  GMimeStream* function(GFile* file, long start, long end) c_g_mime_stream_gio_new_with_bounds; ///
  bool function(GMimeStreamGIO* stream) c_g_mime_stream_gio_get_owner; ///
  void function(GMimeStreamGIO* stream, bool owner) c_g_mime_stream_gio_set_owner; ///

  // StreamMem
  GType function() c_g_mime_stream_mem_get_type; ///
  GMimeStream* function() c_g_mime_stream_mem_new; ///
  GMimeStream* function(const(ubyte)* buffer, size_t len) c_g_mime_stream_mem_new_with_buffer; ///
  GMimeStream* function(GByteArray* array) c_g_mime_stream_mem_new_with_byte_array; ///
  GByteArray* function(GMimeStreamMem* mem) c_g_mime_stream_mem_get_byte_array; ///
  bool function(GMimeStreamMem* mem) c_g_mime_stream_mem_get_owner; ///
  void function(GMimeStreamMem* mem, GByteArray* array) c_g_mime_stream_mem_set_byte_array; ///
  void function(GMimeStreamMem* mem, bool owner) c_g_mime_stream_mem_set_owner; ///

  // StreamMmap
  GType function() c_g_mime_stream_mmap_get_type; ///
  GMimeStream* function(int fd, int prot, int flags) c_g_mime_stream_mmap_new; ///
  GMimeStream* function(int fd, int prot, int flags, long start, long end) c_g_mime_stream_mmap_new_with_bounds; ///
  bool function(GMimeStreamMmap* stream) c_g_mime_stream_mmap_get_owner; ///
  void function(GMimeStreamMmap* stream, bool owner) c_g_mime_stream_mmap_set_owner; ///

  // StreamNull
  GType function() c_g_mime_stream_null_get_type; ///
  GMimeStream* function() c_g_mime_stream_null_new; ///
  bool function(GMimeStreamNull* stream) c_g_mime_stream_null_get_count_newlines; ///
  void function(GMimeStreamNull* stream, bool count) c_g_mime_stream_null_set_count_newlines; ///

  // StreamPipe
  GType function() c_g_mime_stream_pipe_get_type; ///
  GMimeStream* function(int fd) c_g_mime_stream_pipe_new; ///
  bool function(GMimeStreamPipe* stream) c_g_mime_stream_pipe_get_owner; ///
  void function(GMimeStreamPipe* stream, bool owner) c_g_mime_stream_pipe_set_owner; ///

  // TextPart
  GType function() c_g_mime_text_part_get_type; ///
  GMimeTextPart* function() c_g_mime_text_part_new; ///
  GMimeTextPart* function(const(char)* subtype) c_g_mime_text_part_new_with_subtype; ///
  const(char)* function(GMimeTextPart* mimePart) c_g_mime_text_part_get_charset; ///
  char* function(GMimeTextPart* mimePart) c_g_mime_text_part_get_text; ///
  void function(GMimeTextPart* mimePart, const(char)* charset) c_g_mime_text_part_set_charset; ///
  void function(GMimeTextPart* mimePart, const(char)* text) c_g_mime_text_part_set_text; ///

  // global
  bool function(uint major, uint minor, uint micro) c_g_mime_check_version; ///
  GMimeContentEncoding function(const(char)* str) c_g_mime_content_encoding_from_string; ///
  const(char)* function(GMimeContentEncoding encoding) c_g_mime_content_encoding_to_string; ///
  int function(void* cd) c_g_mime_iconv_close; ///
  char* function(const(char)* str) c_g_mime_iconv_locale_to_utf8; ///
  char* function(const(char)* str, size_t n) c_g_mime_iconv_locale_to_utf8_length; ///
  void* function(const(char)* to, const(char)* from) c_g_mime_iconv_open; ///
  char* function(void* cd, const(char)* str) c_g_mime_iconv_strdup; ///
  char* function(void* cd, const(char)* str, size_t n) c_g_mime_iconv_strndup; ///
  char* function(const(char)* str) c_g_mime_iconv_utf8_to_locale; ///
  char* function(const(char)* str, size_t n) c_g_mime_iconv_utf8_to_locale_length; ///
  void function() c_g_mime_init; ///
  const(char)* function() c_g_mime_locale_charset; ///
  const(char)* function() c_g_mime_locale_language; ///
  void function() c_g_mime_shutdown; ///
  GMimeContentEncoding function(const(ubyte)* text, size_t len) c_g_mime_utils_best_encoding; ///
  char* function(GMimeParserOptions* options, const(ubyte)* text, size_t len) c_g_mime_utils_decode_8bit; ///
  char* function(const(char)* messageId) c_g_mime_utils_decode_message_id; ///
  char* function(const(char)* fqdn) c_g_mime_utils_generate_message_id; ///
  GDateTime* function(const(char)* str) c_g_mime_utils_header_decode_date; ///
  char* function(GMimeParserOptions* options, const(char)* phrase) c_g_mime_utils_header_decode_phrase; ///
  char* function(GMimeParserOptions* options, const(char)* text) c_g_mime_utils_header_decode_text; ///
  char* function(GMimeFormatOptions* options, const(char)* phrase, const(char)* charset) c_g_mime_utils_header_encode_phrase; ///
  char* function(GMimeFormatOptions* options, const(char)* text, const(char)* charset) c_g_mime_utils_header_encode_text; ///
  char* function(GDateTime* date) c_g_mime_utils_header_format_date; ///
  char* function(GMimeParserOptions* options, GMimeFormatOptions* format, const(char)* text,  ...) c_g_mime_utils_header_printf; ///
  char* function(const(char)* value) c_g_mime_utils_header_unfold; ///
  char* function(const(char)* str) c_g_mime_utils_quote_string; ///
  char* function(GMimeParserOptions* options, GMimeFormatOptions* format, const(char)* header) c_g_mime_utils_structured_header_fold; ///
  bool function(const(ubyte)* text, size_t len) c_g_mime_utils_text_is_8bit; ///
  void function(char* str) c_g_mime_utils_unquote_string; ///
  char* function(GMimeParserOptions* options, GMimeFormatOptions* format, const(char)* header) c_g_mime_utils_unstructured_header_fold; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* pcrc, uint* crc) c_g_mime_ydecode_step; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* pcrc, uint* crc) c_g_mime_yencode_close; ///
  size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* pcrc, uint* crc) c_g_mime_yencode_step; ///
}

// ApplicationPkcs7Mime

/** */
alias g_mime_application_pkcs7_mime_get_type = c_g_mime_application_pkcs7_mime_get_type;

/** */
alias g_mime_application_pkcs7_mime_new = c_g_mime_application_pkcs7_mime_new;

/** */
alias g_mime_application_pkcs7_mime_encrypt = c_g_mime_application_pkcs7_mime_encrypt;

/** */
alias g_mime_application_pkcs7_mime_sign = c_g_mime_application_pkcs7_mime_sign;

/** */
alias g_mime_application_pkcs7_mime_decrypt = c_g_mime_application_pkcs7_mime_decrypt;

/** */
alias g_mime_application_pkcs7_mime_get_smime_type = c_g_mime_application_pkcs7_mime_get_smime_type;

/** */
alias g_mime_application_pkcs7_mime_verify = c_g_mime_application_pkcs7_mime_verify;

// AutocryptHeader

/** */
alias g_mime_autocrypt_header_get_type = c_g_mime_autocrypt_header_get_type;

/** */
alias g_mime_autocrypt_header_new = c_g_mime_autocrypt_header_new;

/** */
alias g_mime_autocrypt_header_new_from_string = c_g_mime_autocrypt_header_new_from_string;

/** */
alias g_mime_autocrypt_header_clone = c_g_mime_autocrypt_header_clone;

/** */
alias g_mime_autocrypt_header_compare = c_g_mime_autocrypt_header_compare;

/** */
alias g_mime_autocrypt_header_get_address = c_g_mime_autocrypt_header_get_address;

/** */
alias g_mime_autocrypt_header_get_address_as_string = c_g_mime_autocrypt_header_get_address_as_string;

/** */
alias g_mime_autocrypt_header_get_effective_date = c_g_mime_autocrypt_header_get_effective_date;

/** */
alias g_mime_autocrypt_header_get_keydata = c_g_mime_autocrypt_header_get_keydata;

/** */
alias g_mime_autocrypt_header_get_prefer_encrypt = c_g_mime_autocrypt_header_get_prefer_encrypt;

/** */
alias g_mime_autocrypt_header_is_complete = c_g_mime_autocrypt_header_is_complete;

/** */
alias g_mime_autocrypt_header_set_address = c_g_mime_autocrypt_header_set_address;

/** */
alias g_mime_autocrypt_header_set_address_from_string = c_g_mime_autocrypt_header_set_address_from_string;

/** */
alias g_mime_autocrypt_header_set_effective_date = c_g_mime_autocrypt_header_set_effective_date;

/** */
alias g_mime_autocrypt_header_set_keydata = c_g_mime_autocrypt_header_set_keydata;

/** */
alias g_mime_autocrypt_header_set_prefer_encrypt = c_g_mime_autocrypt_header_set_prefer_encrypt;

/** */
alias g_mime_autocrypt_header_to_string = c_g_mime_autocrypt_header_to_string;

// AutocryptHeaderList

/** */
alias g_mime_autocrypt_header_list_get_type = c_g_mime_autocrypt_header_list_get_type;

/** */
alias g_mime_autocrypt_header_list_new = c_g_mime_autocrypt_header_list_new;

/** */
alias g_mime_autocrypt_header_list_add = c_g_mime_autocrypt_header_list_add;

/** */
alias g_mime_autocrypt_header_list_add_missing_addresses = c_g_mime_autocrypt_header_list_add_missing_addresses;

/** */
alias g_mime_autocrypt_header_list_get_count = c_g_mime_autocrypt_header_list_get_count;

/** */
alias g_mime_autocrypt_header_list_get_header_at = c_g_mime_autocrypt_header_list_get_header_at;

/** */
alias g_mime_autocrypt_header_list_get_header_for_address = c_g_mime_autocrypt_header_list_get_header_for_address;

/** */
alias g_mime_autocrypt_header_list_remove_incomplete = c_g_mime_autocrypt_header_list_remove_incomplete;

// Certificate

/** */
alias g_mime_certificate_get_type = c_g_mime_certificate_get_type;

/** */
alias g_mime_certificate_new = c_g_mime_certificate_new;

/** */
alias g_mime_certificate_get_created = c_g_mime_certificate_get_created;

/** */
alias g_mime_certificate_get_created64 = c_g_mime_certificate_get_created64;

/** */
alias g_mime_certificate_get_digest_algo = c_g_mime_certificate_get_digest_algo;

/** */
alias g_mime_certificate_get_email = c_g_mime_certificate_get_email;

/** */
alias g_mime_certificate_get_expires = c_g_mime_certificate_get_expires;

/** */
alias g_mime_certificate_get_expires64 = c_g_mime_certificate_get_expires64;

/** */
alias g_mime_certificate_get_fingerprint = c_g_mime_certificate_get_fingerprint;

/** */
alias g_mime_certificate_get_id_validity = c_g_mime_certificate_get_id_validity;

/** */
alias g_mime_certificate_get_issuer_name = c_g_mime_certificate_get_issuer_name;

/** */
alias g_mime_certificate_get_issuer_serial = c_g_mime_certificate_get_issuer_serial;

/** */
alias g_mime_certificate_get_key_id = c_g_mime_certificate_get_key_id;

/** */
alias g_mime_certificate_get_name = c_g_mime_certificate_get_name;

/** */
alias g_mime_certificate_get_pubkey_algo = c_g_mime_certificate_get_pubkey_algo;

/** */
alias g_mime_certificate_get_trust = c_g_mime_certificate_get_trust;

/** */
alias g_mime_certificate_get_user_id = c_g_mime_certificate_get_user_id;

/** */
alias g_mime_certificate_set_created = c_g_mime_certificate_set_created;

/** */
alias g_mime_certificate_set_digest_algo = c_g_mime_certificate_set_digest_algo;

/** */
alias g_mime_certificate_set_email = c_g_mime_certificate_set_email;

/** */
alias g_mime_certificate_set_expires = c_g_mime_certificate_set_expires;

/** */
alias g_mime_certificate_set_fingerprint = c_g_mime_certificate_set_fingerprint;

/** */
alias g_mime_certificate_set_id_validity = c_g_mime_certificate_set_id_validity;

/** */
alias g_mime_certificate_set_issuer_name = c_g_mime_certificate_set_issuer_name;

/** */
alias g_mime_certificate_set_issuer_serial = c_g_mime_certificate_set_issuer_serial;

/** */
alias g_mime_certificate_set_key_id = c_g_mime_certificate_set_key_id;

/** */
alias g_mime_certificate_set_name = c_g_mime_certificate_set_name;

/** */
alias g_mime_certificate_set_pubkey_algo = c_g_mime_certificate_set_pubkey_algo;

/** */
alias g_mime_certificate_set_trust = c_g_mime_certificate_set_trust;

/** */
alias g_mime_certificate_set_user_id = c_g_mime_certificate_set_user_id;

// CertificateList

/** */
alias g_mime_certificate_list_get_type = c_g_mime_certificate_list_get_type;

/** */
alias g_mime_certificate_list_new = c_g_mime_certificate_list_new;

/** */
alias g_mime_certificate_list_add = c_g_mime_certificate_list_add;

/** */
alias g_mime_certificate_list_clear = c_g_mime_certificate_list_clear;

/** */
alias g_mime_certificate_list_contains = c_g_mime_certificate_list_contains;

/** */
alias g_mime_certificate_list_get_certificate = c_g_mime_certificate_list_get_certificate;

/** */
alias g_mime_certificate_list_index_of = c_g_mime_certificate_list_index_of;

/** */
alias g_mime_certificate_list_insert = c_g_mime_certificate_list_insert;

/** */
alias g_mime_certificate_list_length = c_g_mime_certificate_list_length;

/** */
alias g_mime_certificate_list_remove = c_g_mime_certificate_list_remove;

/** */
alias g_mime_certificate_list_remove_at = c_g_mime_certificate_list_remove_at;

/** */
alias g_mime_certificate_list_set_certificate = c_g_mime_certificate_list_set_certificate;

// Charset

/** */
alias g_mime_charset_best_name = c_g_mime_charset_best_name;

/** */
alias g_mime_charset_can_encode = c_g_mime_charset_can_encode;

/** */
alias g_mime_charset_init = c_g_mime_charset_init;

/** */
alias g_mime_charset_step = c_g_mime_charset_step;

/** */
alias g_mime_charset_best = c_g_mime_charset_best;

/** */
alias g_mime_charset_canon_name = c_g_mime_charset_canon_name;

/** */
alias g_mime_charset_iconv_name = c_g_mime_charset_iconv_name;

/** */
alias g_mime_charset_iso_to_windows = c_g_mime_charset_iso_to_windows;

/** */
alias g_mime_charset_language = c_g_mime_charset_language;

/** */
alias g_mime_charset_locale_name = c_g_mime_charset_locale_name;

/** */
alias g_mime_charset_map_init = c_g_mime_charset_map_init;

/** */
alias g_mime_charset_map_shutdown = c_g_mime_charset_map_shutdown;

/** */
alias g_mime_charset_name = c_g_mime_charset_name;

// ContentDisposition

/** */
alias g_mime_content_disposition_get_type = c_g_mime_content_disposition_get_type;

/** */
alias g_mime_content_disposition_new = c_g_mime_content_disposition_new;

/** */
alias g_mime_content_disposition_parse = c_g_mime_content_disposition_parse;

/** */
alias g_mime_content_disposition_encode = c_g_mime_content_disposition_encode;

/** */
alias g_mime_content_disposition_get_disposition = c_g_mime_content_disposition_get_disposition;

/** */
alias g_mime_content_disposition_get_parameter = c_g_mime_content_disposition_get_parameter;

/** */
alias g_mime_content_disposition_get_parameters = c_g_mime_content_disposition_get_parameters;

/** */
alias g_mime_content_disposition_is_attachment = c_g_mime_content_disposition_is_attachment;

/** */
alias g_mime_content_disposition_set_disposition = c_g_mime_content_disposition_set_disposition;

/** */
alias g_mime_content_disposition_set_parameter = c_g_mime_content_disposition_set_parameter;

// ContentType

/** */
alias g_mime_content_type_get_type = c_g_mime_content_type_get_type;

/** */
alias g_mime_content_type_new = c_g_mime_content_type_new;

/** */
alias g_mime_content_type_parse = c_g_mime_content_type_parse;

/** */
alias g_mime_content_type_encode = c_g_mime_content_type_encode;

/** */
alias g_mime_content_type_get_media_subtype = c_g_mime_content_type_get_media_subtype;

/** */
alias g_mime_content_type_get_media_type = c_g_mime_content_type_get_media_type;

/** */
alias g_mime_content_type_get_mime_type = c_g_mime_content_type_get_mime_type;

/** */
alias g_mime_content_type_get_parameter = c_g_mime_content_type_get_parameter;

/** */
alias g_mime_content_type_get_parameters = c_g_mime_content_type_get_parameters;

/** */
alias g_mime_content_type_is_type = c_g_mime_content_type_is_type;

/** */
alias g_mime_content_type_set_media_subtype = c_g_mime_content_type_set_media_subtype;

/** */
alias g_mime_content_type_set_media_type = c_g_mime_content_type_set_media_type;

/** */
alias g_mime_content_type_set_parameter = c_g_mime_content_type_set_parameter;

// CryptoContext

/** */
alias g_mime_crypto_context_get_type = c_g_mime_crypto_context_get_type;

/** */
alias g_mime_crypto_context_new = c_g_mime_crypto_context_new;

/** */
alias g_mime_crypto_context_register = c_g_mime_crypto_context_register;

/** */
alias g_mime_crypto_context_decrypt = c_g_mime_crypto_context_decrypt;

/** */
alias g_mime_crypto_context_digest_id = c_g_mime_crypto_context_digest_id;

/** */
alias g_mime_crypto_context_digest_name = c_g_mime_crypto_context_digest_name;

/** */
alias g_mime_crypto_context_encrypt = c_g_mime_crypto_context_encrypt;

/** */
alias g_mime_crypto_context_export_keys = c_g_mime_crypto_context_export_keys;

/** */
alias g_mime_crypto_context_get_encryption_protocol = c_g_mime_crypto_context_get_encryption_protocol;

/** */
alias g_mime_crypto_context_get_key_exchange_protocol = c_g_mime_crypto_context_get_key_exchange_protocol;

/** */
alias g_mime_crypto_context_get_signature_protocol = c_g_mime_crypto_context_get_signature_protocol;

/** */
alias g_mime_crypto_context_import_keys = c_g_mime_crypto_context_import_keys;

/** */
alias g_mime_crypto_context_set_request_password = c_g_mime_crypto_context_set_request_password;

/** */
alias g_mime_crypto_context_sign = c_g_mime_crypto_context_sign;

/** */
alias g_mime_crypto_context_verify = c_g_mime_crypto_context_verify;

// DataWrapper

/** */
alias g_mime_data_wrapper_get_type = c_g_mime_data_wrapper_get_type;

/** */
alias g_mime_data_wrapper_new = c_g_mime_data_wrapper_new;

/** */
alias g_mime_data_wrapper_new_with_stream = c_g_mime_data_wrapper_new_with_stream;

/** */
alias g_mime_data_wrapper_get_encoding = c_g_mime_data_wrapper_get_encoding;

/** */
alias g_mime_data_wrapper_get_stream = c_g_mime_data_wrapper_get_stream;

/** */
alias g_mime_data_wrapper_set_encoding = c_g_mime_data_wrapper_set_encoding;

/** */
alias g_mime_data_wrapper_set_stream = c_g_mime_data_wrapper_set_stream;

/** */
alias g_mime_data_wrapper_write_to_stream = c_g_mime_data_wrapper_write_to_stream;

// DecryptResult

/** */
alias g_mime_decrypt_result_get_type = c_g_mime_decrypt_result_get_type;

/** */
alias g_mime_decrypt_result_new = c_g_mime_decrypt_result_new;

/** */
alias g_mime_decrypt_result_get_cipher = c_g_mime_decrypt_result_get_cipher;

/** */
alias g_mime_decrypt_result_get_mdc = c_g_mime_decrypt_result_get_mdc;

/** */
alias g_mime_decrypt_result_get_recipients = c_g_mime_decrypt_result_get_recipients;

/** */
alias g_mime_decrypt_result_get_session_key = c_g_mime_decrypt_result_get_session_key;

/** */
alias g_mime_decrypt_result_get_signatures = c_g_mime_decrypt_result_get_signatures;

/** */
alias g_mime_decrypt_result_set_cipher = c_g_mime_decrypt_result_set_cipher;

/** */
alias g_mime_decrypt_result_set_mdc = c_g_mime_decrypt_result_set_mdc;

/** */
alias g_mime_decrypt_result_set_recipients = c_g_mime_decrypt_result_set_recipients;

/** */
alias g_mime_decrypt_result_set_session_key = c_g_mime_decrypt_result_set_session_key;

/** */
alias g_mime_decrypt_result_set_signatures = c_g_mime_decrypt_result_set_signatures;

// Encoding

/** */
alias g_mime_encoding_flush = c_g_mime_encoding_flush;

/** */
alias g_mime_encoding_init_decode = c_g_mime_encoding_init_decode;

/** */
alias g_mime_encoding_init_encode = c_g_mime_encoding_init_encode;

/** */
alias g_mime_encoding_outlen = c_g_mime_encoding_outlen;

/** */
alias g_mime_encoding_reset = c_g_mime_encoding_reset;

/** */
alias g_mime_encoding_step = c_g_mime_encoding_step;

/** */
alias g_mime_encoding_base64_decode_step = c_g_mime_encoding_base64_decode_step;

/** */
alias g_mime_encoding_base64_encode_close = c_g_mime_encoding_base64_encode_close;

/** */
alias g_mime_encoding_base64_encode_step = c_g_mime_encoding_base64_encode_step;

/** */
alias g_mime_encoding_quoted_decode_step = c_g_mime_encoding_quoted_decode_step;

/** */
alias g_mime_encoding_quoted_encode_close = c_g_mime_encoding_quoted_encode_close;

/** */
alias g_mime_encoding_quoted_encode_step = c_g_mime_encoding_quoted_encode_step;

/** */
alias g_mime_encoding_uudecode_step = c_g_mime_encoding_uudecode_step;

/** */
alias g_mime_encoding_uuencode_close = c_g_mime_encoding_uuencode_close;

/** */
alias g_mime_encoding_uuencode_step = c_g_mime_encoding_uuencode_step;

// Filter

/** */
alias g_mime_filter_get_type = c_g_mime_filter_get_type;

/** */
alias g_mime_filter_backup = c_g_mime_filter_backup;

/** */
alias g_mime_filter_complete = c_g_mime_filter_complete;

/** */
alias g_mime_filter_copy = c_g_mime_filter_copy;

/** */
alias g_mime_filter_filter = c_g_mime_filter_filter;

/** */
alias g_mime_filter_reset = c_g_mime_filter_reset;

/** */
alias g_mime_filter_set_size = c_g_mime_filter_set_size;

// FilterBasic

/** */
alias g_mime_filter_basic_get_type = c_g_mime_filter_basic_get_type;

/** */
alias g_mime_filter_basic_new = c_g_mime_filter_basic_new;

// FilterBest

/** */
alias g_mime_filter_best_get_type = c_g_mime_filter_best_get_type;

/** */
alias g_mime_filter_best_new = c_g_mime_filter_best_new;

/** */
alias g_mime_filter_best_charset = c_g_mime_filter_best_charset;

/** */
alias g_mime_filter_best_encoding = c_g_mime_filter_best_encoding;

// FilterCharset

/** */
alias g_mime_filter_charset_get_type = c_g_mime_filter_charset_get_type;

/** */
alias g_mime_filter_charset_new = c_g_mime_filter_charset_new;

// FilterChecksum

/** */
alias g_mime_filter_checksum_get_type = c_g_mime_filter_checksum_get_type;

/** */
alias g_mime_filter_checksum_new = c_g_mime_filter_checksum_new;

/** */
alias g_mime_filter_checksum_get_digest = c_g_mime_filter_checksum_get_digest;

/** */
alias g_mime_filter_checksum_get_string = c_g_mime_filter_checksum_get_string;

// FilterDos2Unix

/** */
alias g_mime_filter_dos2unix_get_type = c_g_mime_filter_dos2unix_get_type;

/** */
alias g_mime_filter_dos2unix_new = c_g_mime_filter_dos2unix_new;

// FilterEnriched

/** */
alias g_mime_filter_enriched_get_type = c_g_mime_filter_enriched_get_type;

/** */
alias g_mime_filter_enriched_new = c_g_mime_filter_enriched_new;

// FilterFrom

/** */
alias g_mime_filter_from_get_type = c_g_mime_filter_from_get_type;

/** */
alias g_mime_filter_from_new = c_g_mime_filter_from_new;

// FilterGZip

/** */
alias g_mime_filter_gzip_get_type = c_g_mime_filter_gzip_get_type;

/** */
alias g_mime_filter_gzip_new = c_g_mime_filter_gzip_new;

/** */
alias g_mime_filter_gzip_get_comment = c_g_mime_filter_gzip_get_comment;

/** */
alias g_mime_filter_gzip_get_filename = c_g_mime_filter_gzip_get_filename;

/** */
alias g_mime_filter_gzip_set_comment = c_g_mime_filter_gzip_set_comment;

/** */
alias g_mime_filter_gzip_set_filename = c_g_mime_filter_gzip_set_filename;

// FilterHTML

/** */
alias g_mime_filter_html_get_type = c_g_mime_filter_html_get_type;

/** */
alias g_mime_filter_html_new = c_g_mime_filter_html_new;

// FilterOpenPGP

/** */
alias g_mime_filter_openpgp_get_type = c_g_mime_filter_openpgp_get_type;

/** */
alias g_mime_filter_openpgp_new = c_g_mime_filter_openpgp_new;

/** */
alias g_mime_filter_openpgp_get_begin_offset = c_g_mime_filter_openpgp_get_begin_offset;

/** */
alias g_mime_filter_openpgp_get_data_type = c_g_mime_filter_openpgp_get_data_type;

/** */
alias g_mime_filter_openpgp_get_end_offset = c_g_mime_filter_openpgp_get_end_offset;

// FilterSmtpData

/** */
alias g_mime_filter_smtp_data_get_type = c_g_mime_filter_smtp_data_get_type;

/** */
alias g_mime_filter_smtp_data_new = c_g_mime_filter_smtp_data_new;

// FilterStrip

/** */
alias g_mime_filter_strip_get_type = c_g_mime_filter_strip_get_type;

/** */
alias g_mime_filter_strip_new = c_g_mime_filter_strip_new;

// FilterUnix2Dos

/** */
alias g_mime_filter_unix2dos_get_type = c_g_mime_filter_unix2dos_get_type;

/** */
alias g_mime_filter_unix2dos_new = c_g_mime_filter_unix2dos_new;

// FilterWindows

/** */
alias g_mime_filter_windows_get_type = c_g_mime_filter_windows_get_type;

/** */
alias g_mime_filter_windows_new = c_g_mime_filter_windows_new;

/** */
alias g_mime_filter_windows_is_windows_charset = c_g_mime_filter_windows_is_windows_charset;

/** */
alias g_mime_filter_windows_real_charset = c_g_mime_filter_windows_real_charset;

// FilterYenc

/** */
alias g_mime_filter_yenc_get_type = c_g_mime_filter_yenc_get_type;

/** */
alias g_mime_filter_yenc_new = c_g_mime_filter_yenc_new;

/** */
alias g_mime_filter_yenc_get_crc = c_g_mime_filter_yenc_get_crc;

/** */
alias g_mime_filter_yenc_get_pcrc = c_g_mime_filter_yenc_get_pcrc;

/** */
alias g_mime_filter_yenc_set_crc = c_g_mime_filter_yenc_set_crc;

/** */
alias g_mime_filter_yenc_set_state = c_g_mime_filter_yenc_set_state;

// FormatOptions

/** */
alias g_mime_format_options_get_type = c_g_mime_format_options_get_type;

/** */
alias g_mime_format_options_new = c_g_mime_format_options_new;

/** */
alias g_mime_format_options_add_hidden_header = c_g_mime_format_options_add_hidden_header;

/** */
alias g_mime_format_options_clear_hidden_headers = c_g_mime_format_options_clear_hidden_headers;

/** */
alias g_mime_format_options_clone = c_g_mime_format_options_clone;

/** */
alias g_mime_format_options_create_newline_filter = c_g_mime_format_options_create_newline_filter;

/** */
alias g_mime_format_options_free = c_g_mime_format_options_free;

/** */
alias g_mime_format_options_get_newline = c_g_mime_format_options_get_newline;

/** */
alias g_mime_format_options_get_newline_format = c_g_mime_format_options_get_newline_format;

/** */
alias g_mime_format_options_get_param_encoding_method = c_g_mime_format_options_get_param_encoding_method;

/** */
alias g_mime_format_options_is_hidden_header = c_g_mime_format_options_is_hidden_header;

/** */
alias g_mime_format_options_remove_hidden_header = c_g_mime_format_options_remove_hidden_header;

/** */
alias g_mime_format_options_set_newline_format = c_g_mime_format_options_set_newline_format;

/** */
alias g_mime_format_options_set_param_encoding_method = c_g_mime_format_options_set_param_encoding_method;

/** */
alias g_mime_format_options_get_default = c_g_mime_format_options_get_default;

// GpgContext

/** */
alias g_mime_gpg_context_get_type = c_g_mime_gpg_context_get_type;

/** */
alias g_mime_gpg_context_new = c_g_mime_gpg_context_new;

// Header

/** */
alias g_mime_header_get_type = c_g_mime_header_get_type;

/** */
alias g_mime_header_format_addrlist = c_g_mime_header_format_addrlist;

/** */
alias g_mime_header_format_content_disposition = c_g_mime_header_format_content_disposition;

/** */
alias g_mime_header_format_content_type = c_g_mime_header_format_content_type;

/** */
alias g_mime_header_format_default = c_g_mime_header_format_default;

/** */
alias g_mime_header_format_message_id = c_g_mime_header_format_message_id;

/** */
alias g_mime_header_format_newsgroups = c_g_mime_header_format_newsgroups;

/** */
alias g_mime_header_format_received = c_g_mime_header_format_received;

/** */
alias g_mime_header_format_references = c_g_mime_header_format_references;

/** */
alias g_mime_header_get_name = c_g_mime_header_get_name;

/** */
alias g_mime_header_get_offset = c_g_mime_header_get_offset;

/** */
alias g_mime_header_get_raw_name = c_g_mime_header_get_raw_name;

/** */
alias g_mime_header_get_raw_value = c_g_mime_header_get_raw_value;

/** */
alias g_mime_header_get_value = c_g_mime_header_get_value;

/** */
alias g_mime_header_set_raw_value = c_g_mime_header_set_raw_value;

/** */
alias g_mime_header_set_value = c_g_mime_header_set_value;

/** */
alias g_mime_header_write_to_stream = c_g_mime_header_write_to_stream;

// HeaderList

/** */
alias g_mime_header_list_get_type = c_g_mime_header_list_get_type;

/** */
alias g_mime_header_list_new = c_g_mime_header_list_new;

/** */
alias g_mime_header_list_append = c_g_mime_header_list_append;

/** */
alias g_mime_header_list_clear = c_g_mime_header_list_clear;

/** */
alias g_mime_header_list_contains = c_g_mime_header_list_contains;

/** */
alias g_mime_header_list_get_count = c_g_mime_header_list_get_count;

/** */
alias g_mime_header_list_get_header = c_g_mime_header_list_get_header;

/** */
alias g_mime_header_list_get_header_at = c_g_mime_header_list_get_header_at;

/** */
alias g_mime_header_list_prepend = c_g_mime_header_list_prepend;

/** */
alias g_mime_header_list_remove = c_g_mime_header_list_remove;

/** */
alias g_mime_header_list_remove_at = c_g_mime_header_list_remove_at;

/** */
alias g_mime_header_list_set = c_g_mime_header_list_set;

/** */
alias g_mime_header_list_to_string = c_g_mime_header_list_to_string;

/** */
alias g_mime_header_list_write_to_stream = c_g_mime_header_list_write_to_stream;

// InternetAddress

/** */
alias internet_address_get_type = c_internet_address_get_type;

/** */
alias internet_address_get_charset = c_internet_address_get_charset;

/** */
alias internet_address_get_name = c_internet_address_get_name;

/** */
alias internet_address_set_charset = c_internet_address_set_charset;

/** */
alias internet_address_set_name = c_internet_address_set_name;

/** */
alias internet_address_to_string = c_internet_address_to_string;

// InternetAddressGroup

/** */
alias internet_address_group_get_type = c_internet_address_group_get_type;

/** */
alias internet_address_group_new = c_internet_address_group_new;

/** */
alias internet_address_group_add_member = c_internet_address_group_add_member;

/** */
alias internet_address_group_get_members = c_internet_address_group_get_members;

/** */
alias internet_address_group_set_members = c_internet_address_group_set_members;

// InternetAddressList

/** */
alias internet_address_list_get_type = c_internet_address_list_get_type;

/** */
alias internet_address_list_new = c_internet_address_list_new;

/** */
alias internet_address_list_parse = c_internet_address_list_parse;

/** */
alias internet_address_list_add = c_internet_address_list_add;

/** */
alias internet_address_list_append = c_internet_address_list_append;

/** */
alias internet_address_list_append_parse = c_internet_address_list_append_parse;

/** */
alias internet_address_list_clear = c_internet_address_list_clear;

/** */
alias internet_address_list_contains = c_internet_address_list_contains;

/** */
alias internet_address_list_encode = c_internet_address_list_encode;

/** */
alias internet_address_list_get_address = c_internet_address_list_get_address;

/** */
alias internet_address_list_index_of = c_internet_address_list_index_of;

/** */
alias internet_address_list_insert = c_internet_address_list_insert;

/** */
alias internet_address_list_length = c_internet_address_list_length;

/** */
alias internet_address_list_prepend = c_internet_address_list_prepend;

/** */
alias internet_address_list_remove = c_internet_address_list_remove;

/** */
alias internet_address_list_remove_at = c_internet_address_list_remove_at;

/** */
alias internet_address_list_set_address = c_internet_address_list_set_address;

/** */
alias internet_address_list_to_string = c_internet_address_list_to_string;

// InternetAddressMailbox

/** */
alias internet_address_mailbox_get_type = c_internet_address_mailbox_get_type;

/** */
alias internet_address_mailbox_new = c_internet_address_mailbox_new;

/** */
alias internet_address_mailbox_get_addr = c_internet_address_mailbox_get_addr;

/** */
alias internet_address_mailbox_get_idn_addr = c_internet_address_mailbox_get_idn_addr;

/** */
alias internet_address_mailbox_set_addr = c_internet_address_mailbox_set_addr;

// Message

/** */
alias g_mime_message_get_type = c_g_mime_message_get_type;

/** */
alias g_mime_message_new = c_g_mime_message_new;

/** */
alias g_mime_message_add_mailbox = c_g_mime_message_add_mailbox;

/** */
alias g_mime_message_foreach = c_g_mime_message_foreach;

/** */
alias g_mime_message_get_addresses = c_g_mime_message_get_addresses;

/** */
alias g_mime_message_get_all_recipients = c_g_mime_message_get_all_recipients;

/** */
alias g_mime_message_get_autocrypt_gossip_headers = c_g_mime_message_get_autocrypt_gossip_headers;

/** */
alias g_mime_message_get_autocrypt_gossip_headers_from_inner_part = c_g_mime_message_get_autocrypt_gossip_headers_from_inner_part;

/** */
alias g_mime_message_get_autocrypt_header = c_g_mime_message_get_autocrypt_header;

/** */
alias g_mime_message_get_bcc = c_g_mime_message_get_bcc;

/** */
alias g_mime_message_get_body = c_g_mime_message_get_body;

/** */
alias g_mime_message_get_cc = c_g_mime_message_get_cc;

/** */
alias g_mime_message_get_date = c_g_mime_message_get_date;

/** */
alias g_mime_message_get_from = c_g_mime_message_get_from;

/** */
alias g_mime_message_get_message_id = c_g_mime_message_get_message_id;

/** */
alias g_mime_message_get_mime_part = c_g_mime_message_get_mime_part;

/** */
alias g_mime_message_get_reply_to = c_g_mime_message_get_reply_to;

/** */
alias g_mime_message_get_sender = c_g_mime_message_get_sender;

/** */
alias g_mime_message_get_subject = c_g_mime_message_get_subject;

/** */
alias g_mime_message_get_to = c_g_mime_message_get_to;

/** */
alias g_mime_message_partial_split_message = c_g_mime_message_partial_split_message;

/** */
alias g_mime_message_set_date = c_g_mime_message_set_date;

/** */
alias g_mime_message_set_message_id = c_g_mime_message_set_message_id;

/** */
alias g_mime_message_set_mime_part = c_g_mime_message_set_mime_part;

/** */
alias g_mime_message_set_subject = c_g_mime_message_set_subject;

// MessagePart

/** */
alias g_mime_message_part_get_type = c_g_mime_message_part_get_type;

/** */
alias g_mime_message_part_new = c_g_mime_message_part_new;

/** */
alias g_mime_message_part_new_with_message = c_g_mime_message_part_new_with_message;

/** */
alias g_mime_message_part_get_message = c_g_mime_message_part_get_message;

/** */
alias g_mime_message_part_set_message = c_g_mime_message_part_set_message;

// MessagePartial

/** */
alias g_mime_message_partial_get_type = c_g_mime_message_partial_get_type;

/** */
alias g_mime_message_partial_new = c_g_mime_message_partial_new;

/** */
alias g_mime_message_partial_reconstruct_message = c_g_mime_message_partial_reconstruct_message;

/** */
alias g_mime_message_partial_get_id = c_g_mime_message_partial_get_id;

/** */
alias g_mime_message_partial_get_number = c_g_mime_message_partial_get_number;

/** */
alias g_mime_message_partial_get_total = c_g_mime_message_partial_get_total;

// Multipart

/** */
alias g_mime_multipart_get_type = c_g_mime_multipart_get_type;

/** */
alias g_mime_multipart_new = c_g_mime_multipart_new;

/** */
alias g_mime_multipart_new_with_subtype = c_g_mime_multipart_new_with_subtype;

/** */
alias g_mime_multipart_add = c_g_mime_multipart_add;

/** */
alias g_mime_multipart_clear = c_g_mime_multipart_clear;

/** */
alias g_mime_multipart_contains = c_g_mime_multipart_contains;

/** */
alias g_mime_multipart_foreach = c_g_mime_multipart_foreach;

/** */
alias g_mime_multipart_get_boundary = c_g_mime_multipart_get_boundary;

/** */
alias g_mime_multipart_get_count = c_g_mime_multipart_get_count;

/** */
alias g_mime_multipart_get_epilogue = c_g_mime_multipart_get_epilogue;

/** */
alias g_mime_multipart_get_part = c_g_mime_multipart_get_part;

/** */
alias g_mime_multipart_get_prologue = c_g_mime_multipart_get_prologue;

/** */
alias g_mime_multipart_get_subpart_from_content_id = c_g_mime_multipart_get_subpart_from_content_id;

/** */
alias g_mime_multipart_index_of = c_g_mime_multipart_index_of;

/** */
alias g_mime_multipart_insert = c_g_mime_multipart_insert;

/** */
alias g_mime_multipart_remove = c_g_mime_multipart_remove;

/** */
alias g_mime_multipart_remove_at = c_g_mime_multipart_remove_at;

/** */
alias g_mime_multipart_replace = c_g_mime_multipart_replace;

/** */
alias g_mime_multipart_set_boundary = c_g_mime_multipart_set_boundary;

/** */
alias g_mime_multipart_set_epilogue = c_g_mime_multipart_set_epilogue;

/** */
alias g_mime_multipart_set_prologue = c_g_mime_multipart_set_prologue;

// MultipartEncrypted

/** */
alias g_mime_multipart_encrypted_get_type = c_g_mime_multipart_encrypted_get_type;

/** */
alias g_mime_multipart_encrypted_new = c_g_mime_multipart_encrypted_new;

/** */
alias g_mime_multipart_encrypted_encrypt = c_g_mime_multipart_encrypted_encrypt;

/** */
alias g_mime_multipart_encrypted_decrypt = c_g_mime_multipart_encrypted_decrypt;

// MultipartSigned

/** */
alias g_mime_multipart_signed_get_type = c_g_mime_multipart_signed_get_type;

/** */
alias g_mime_multipart_signed_new = c_g_mime_multipart_signed_new;

/** */
alias g_mime_multipart_signed_sign = c_g_mime_multipart_signed_sign;

/** */
alias g_mime_multipart_signed_verify = c_g_mime_multipart_signed_verify;

// ObjectWrap

/** */
alias g_mime_object_get_type = c_g_mime_object_get_type;

/** */
alias g_mime_object_new = c_g_mime_object_new;

/** */
alias g_mime_object_new_type = c_g_mime_object_new_type;

/** */
alias g_mime_object_register_type = c_g_mime_object_register_type;

/** */
alias g_mime_object_type_registry_init = c_g_mime_object_type_registry_init;

/** */
alias g_mime_object_type_registry_shutdown = c_g_mime_object_type_registry_shutdown;

/** */
alias g_mime_object_append_header = c_g_mime_object_append_header;

/** */
alias g_mime_object_encode = c_g_mime_object_encode;

/** */
alias g_mime_object_get_autocrypt_headers = c_g_mime_object_get_autocrypt_headers;

/** */
alias g_mime_object_get_content_disposition = c_g_mime_object_get_content_disposition;

/** */
alias g_mime_object_get_content_disposition_parameter = c_g_mime_object_get_content_disposition_parameter;

/** */
alias g_mime_object_get_content_id = c_g_mime_object_get_content_id;

/** */
alias g_mime_object_get_content_type = c_g_mime_object_get_content_type;

/** */
alias g_mime_object_get_content_type_parameter = c_g_mime_object_get_content_type_parameter;

/** */
alias g_mime_object_get_disposition = c_g_mime_object_get_disposition;

/** */
alias g_mime_object_get_header = c_g_mime_object_get_header;

/** */
alias g_mime_object_get_header_list = c_g_mime_object_get_header_list;

/** */
alias g_mime_object_get_headers = c_g_mime_object_get_headers;

/** */
alias g_mime_object_prepend_header = c_g_mime_object_prepend_header;

/** */
alias g_mime_object_remove_header = c_g_mime_object_remove_header;

/** */
alias g_mime_object_set_content_disposition = c_g_mime_object_set_content_disposition;

/** */
alias g_mime_object_set_content_disposition_parameter = c_g_mime_object_set_content_disposition_parameter;

/** */
alias g_mime_object_set_content_id = c_g_mime_object_set_content_id;

/** */
alias g_mime_object_set_content_type = c_g_mime_object_set_content_type;

/** */
alias g_mime_object_set_content_type_parameter = c_g_mime_object_set_content_type_parameter;

/** */
alias g_mime_object_set_disposition = c_g_mime_object_set_disposition;

/** */
alias g_mime_object_set_header = c_g_mime_object_set_header;

/** */
alias g_mime_object_to_string = c_g_mime_object_to_string;

/** */
alias g_mime_object_write_content_to_stream = c_g_mime_object_write_content_to_stream;

/** */
alias g_mime_object_write_to_stream = c_g_mime_object_write_to_stream;

// Param

/** */
alias g_mime_param_get_type = c_g_mime_param_get_type;

/** */
alias g_mime_param_get_charset = c_g_mime_param_get_charset;

/** */
alias g_mime_param_get_encoding_method = c_g_mime_param_get_encoding_method;

/** */
alias g_mime_param_get_lang = c_g_mime_param_get_lang;

/** */
alias g_mime_param_get_name = c_g_mime_param_get_name;

/** */
alias g_mime_param_get_value = c_g_mime_param_get_value;

/** */
alias g_mime_param_set_charset = c_g_mime_param_set_charset;

/** */
alias g_mime_param_set_encoding_method = c_g_mime_param_set_encoding_method;

/** */
alias g_mime_param_set_lang = c_g_mime_param_set_lang;

/** */
alias g_mime_param_set_value = c_g_mime_param_set_value;

// ParamList

/** */
alias g_mime_param_list_get_type = c_g_mime_param_list_get_type;

/** */
alias g_mime_param_list_new = c_g_mime_param_list_new;

/** */
alias g_mime_param_list_parse = c_g_mime_param_list_parse;

/** */
alias g_mime_param_list_clear = c_g_mime_param_list_clear;

/** */
alias g_mime_param_list_encode = c_g_mime_param_list_encode;

/** */
alias g_mime_param_list_get_parameter = c_g_mime_param_list_get_parameter;

/** */
alias g_mime_param_list_get_parameter_at = c_g_mime_param_list_get_parameter_at;

/** */
alias g_mime_param_list_length = c_g_mime_param_list_length;

/** */
alias g_mime_param_list_remove = c_g_mime_param_list_remove;

/** */
alias g_mime_param_list_remove_at = c_g_mime_param_list_remove_at;

/** */
alias g_mime_param_list_set_parameter = c_g_mime_param_list_set_parameter;

// Parser

/** */
alias g_mime_parser_get_type = c_g_mime_parser_get_type;

/** */
alias g_mime_parser_new = c_g_mime_parser_new;

/** */
alias g_mime_parser_new_with_stream = c_g_mime_parser_new_with_stream;

/** */
alias g_mime_parser_construct_message = c_g_mime_parser_construct_message;

/** */
alias g_mime_parser_construct_part = c_g_mime_parser_construct_part;

/** */
alias g_mime_parser_eos = c_g_mime_parser_eos;

/** */
alias g_mime_parser_get_format = c_g_mime_parser_get_format;

/** */
alias g_mime_parser_get_headers_begin = c_g_mime_parser_get_headers_begin;

/** */
alias g_mime_parser_get_headers_end = c_g_mime_parser_get_headers_end;

/** */
alias g_mime_parser_get_mbox_marker = c_g_mime_parser_get_mbox_marker;

/** */
alias g_mime_parser_get_mbox_marker_offset = c_g_mime_parser_get_mbox_marker_offset;

/** */
alias g_mime_parser_get_persist_stream = c_g_mime_parser_get_persist_stream;

/** */
alias g_mime_parser_get_respect_content_length = c_g_mime_parser_get_respect_content_length;

/** */
alias g_mime_parser_init_with_stream = c_g_mime_parser_init_with_stream;

/** */
alias g_mime_parser_set_format = c_g_mime_parser_set_format;

/** */
alias g_mime_parser_set_header_regex = c_g_mime_parser_set_header_regex;

/** */
alias g_mime_parser_set_persist_stream = c_g_mime_parser_set_persist_stream;

/** */
alias g_mime_parser_set_respect_content_length = c_g_mime_parser_set_respect_content_length;

/** */
alias g_mime_parser_tell = c_g_mime_parser_tell;

// ParserOptions

/** */
alias g_mime_parser_options_get_type = c_g_mime_parser_options_get_type;

/** */
alias g_mime_parser_options_new = c_g_mime_parser_options_new;

/** */
alias g_mime_parser_options_clone = c_g_mime_parser_options_clone;

/** */
alias g_mime_parser_options_free = c_g_mime_parser_options_free;

/** */
alias g_mime_parser_options_get_address_compliance_mode = c_g_mime_parser_options_get_address_compliance_mode;

/** */
alias g_mime_parser_options_get_allow_addresses_without_domain = c_g_mime_parser_options_get_allow_addresses_without_domain;

/** */
alias g_mime_parser_options_get_fallback_charsets = c_g_mime_parser_options_get_fallback_charsets;

/** */
alias g_mime_parser_options_get_parameter_compliance_mode = c_g_mime_parser_options_get_parameter_compliance_mode;

/** */
alias g_mime_parser_options_get_rfc2047_compliance_mode = c_g_mime_parser_options_get_rfc2047_compliance_mode;

/** */
alias g_mime_parser_options_get_warning_callback = c_g_mime_parser_options_get_warning_callback;

/** */
alias g_mime_parser_options_set_address_compliance_mode = c_g_mime_parser_options_set_address_compliance_mode;

/** */
alias g_mime_parser_options_set_allow_addresses_without_domain = c_g_mime_parser_options_set_allow_addresses_without_domain;

/** */
alias g_mime_parser_options_set_fallback_charsets = c_g_mime_parser_options_set_fallback_charsets;

/** */
alias g_mime_parser_options_set_parameter_compliance_mode = c_g_mime_parser_options_set_parameter_compliance_mode;

/** */
alias g_mime_parser_options_set_rfc2047_compliance_mode = c_g_mime_parser_options_set_rfc2047_compliance_mode;

/** */
alias g_mime_parser_options_set_warning_callback = c_g_mime_parser_options_set_warning_callback;

/** */
alias g_mime_parser_options_get_default = c_g_mime_parser_options_get_default;

// Part

/** */
alias g_mime_part_get_type = c_g_mime_part_get_type;

/** */
alias g_mime_part_new = c_g_mime_part_new;

/** */
alias g_mime_part_new_with_type = c_g_mime_part_new_with_type;

/** */
alias g_mime_part_get_best_content_encoding = c_g_mime_part_get_best_content_encoding;

/** */
alias g_mime_part_get_content = c_g_mime_part_get_content;

/** */
alias g_mime_part_get_content_description = c_g_mime_part_get_content_description;

/** */
alias g_mime_part_get_content_encoding = c_g_mime_part_get_content_encoding;

/** */
alias g_mime_part_get_content_id = c_g_mime_part_get_content_id;

/** */
alias g_mime_part_get_content_location = c_g_mime_part_get_content_location;

/** */
alias g_mime_part_get_content_md5 = c_g_mime_part_get_content_md5;

/** */
alias g_mime_part_get_filename = c_g_mime_part_get_filename;

/** */
alias g_mime_part_get_openpgp_data = c_g_mime_part_get_openpgp_data;

/** */
alias g_mime_part_is_attachment = c_g_mime_part_is_attachment;

/** */
alias g_mime_part_openpgp_decrypt = c_g_mime_part_openpgp_decrypt;

/** */
alias g_mime_part_openpgp_encrypt = c_g_mime_part_openpgp_encrypt;

/** */
alias g_mime_part_openpgp_sign = c_g_mime_part_openpgp_sign;

/** */
alias g_mime_part_openpgp_verify = c_g_mime_part_openpgp_verify;

/** */
alias g_mime_part_set_content = c_g_mime_part_set_content;

/** */
alias g_mime_part_set_content_description = c_g_mime_part_set_content_description;

/** */
alias g_mime_part_set_content_encoding = c_g_mime_part_set_content_encoding;

/** */
alias g_mime_part_set_content_id = c_g_mime_part_set_content_id;

/** */
alias g_mime_part_set_content_location = c_g_mime_part_set_content_location;

/** */
alias g_mime_part_set_content_md5 = c_g_mime_part_set_content_md5;

/** */
alias g_mime_part_set_filename = c_g_mime_part_set_filename;

/** */
alias g_mime_part_set_openpgp_data = c_g_mime_part_set_openpgp_data;

/** */
alias g_mime_part_verify_content_md5 = c_g_mime_part_verify_content_md5;

// PartIter

/** */
alias g_mime_part_iter_get_type = c_g_mime_part_iter_get_type;

/** */
alias g_mime_part_iter_new = c_g_mime_part_iter_new;

/** */
alias g_mime_part_iter_clone = c_g_mime_part_iter_clone;

/** */
alias g_mime_part_iter_free = c_g_mime_part_iter_free;

/** */
alias g_mime_part_iter_get_current = c_g_mime_part_iter_get_current;

/** */
alias g_mime_part_iter_get_parent = c_g_mime_part_iter_get_parent;

/** */
alias g_mime_part_iter_get_path = c_g_mime_part_iter_get_path;

/** */
alias g_mime_part_iter_get_toplevel = c_g_mime_part_iter_get_toplevel;

/** */
alias g_mime_part_iter_is_valid = c_g_mime_part_iter_is_valid;

/** */
alias g_mime_part_iter_jump_to = c_g_mime_part_iter_jump_to;

/** */
alias g_mime_part_iter_next = c_g_mime_part_iter_next;

/** */
alias g_mime_part_iter_prev = c_g_mime_part_iter_prev;

/** */
alias g_mime_part_iter_remove = c_g_mime_part_iter_remove;

/** */
alias g_mime_part_iter_replace = c_g_mime_part_iter_replace;

/** */
alias g_mime_part_iter_reset = c_g_mime_part_iter_reset;

// Pkcs7Context

/** */
alias g_mime_pkcs7_context_get_type = c_g_mime_pkcs7_context_get_type;

/** */
alias g_mime_pkcs7_context_new = c_g_mime_pkcs7_context_new;

// References

/** */
alias g_mime_references_get_type = c_g_mime_references_get_type;

/** */
alias g_mime_references_new = c_g_mime_references_new;

/** */
alias g_mime_references_append = c_g_mime_references_append;

/** */
alias g_mime_references_clear = c_g_mime_references_clear;

/** */
alias g_mime_references_copy = c_g_mime_references_copy;

/** */
alias g_mime_references_free = c_g_mime_references_free;

/** */
alias g_mime_references_get_message_id = c_g_mime_references_get_message_id;

/** */
alias g_mime_references_length = c_g_mime_references_length;

/** */
alias g_mime_references_set_message_id = c_g_mime_references_set_message_id;

/** */
alias g_mime_references_parse = c_g_mime_references_parse;

// Signature

/** */
alias g_mime_signature_get_type = c_g_mime_signature_get_type;

/** */
alias g_mime_signature_new = c_g_mime_signature_new;

/** */
alias g_mime_signature_get_certificate = c_g_mime_signature_get_certificate;

/** */
alias g_mime_signature_get_created = c_g_mime_signature_get_created;

/** */
alias g_mime_signature_get_created64 = c_g_mime_signature_get_created64;

/** */
alias g_mime_signature_get_expires = c_g_mime_signature_get_expires;

/** */
alias g_mime_signature_get_expires64 = c_g_mime_signature_get_expires64;

/** */
alias g_mime_signature_get_status = c_g_mime_signature_get_status;

/** */
alias g_mime_signature_set_certificate = c_g_mime_signature_set_certificate;

/** */
alias g_mime_signature_set_created = c_g_mime_signature_set_created;

/** */
alias g_mime_signature_set_expires = c_g_mime_signature_set_expires;

/** */
alias g_mime_signature_set_status = c_g_mime_signature_set_status;

// SignatureList

/** */
alias g_mime_signature_list_get_type = c_g_mime_signature_list_get_type;

/** */
alias g_mime_signature_list_new = c_g_mime_signature_list_new;

/** */
alias g_mime_signature_list_add = c_g_mime_signature_list_add;

/** */
alias g_mime_signature_list_clear = c_g_mime_signature_list_clear;

/** */
alias g_mime_signature_list_contains = c_g_mime_signature_list_contains;

/** */
alias g_mime_signature_list_get_signature = c_g_mime_signature_list_get_signature;

/** */
alias g_mime_signature_list_index_of = c_g_mime_signature_list_index_of;

/** */
alias g_mime_signature_list_insert = c_g_mime_signature_list_insert;

/** */
alias g_mime_signature_list_length = c_g_mime_signature_list_length;

/** */
alias g_mime_signature_list_remove = c_g_mime_signature_list_remove;

/** */
alias g_mime_signature_list_remove_at = c_g_mime_signature_list_remove_at;

/** */
alias g_mime_signature_list_set_signature = c_g_mime_signature_list_set_signature;

// Stream

/** */
alias g_mime_stream_get_type = c_g_mime_stream_get_type;

/** */
alias g_mime_stream_buffer_gets = c_g_mime_stream_buffer_gets;

/** */
alias g_mime_stream_buffer_readln = c_g_mime_stream_buffer_readln;

/** */
alias g_mime_stream_close = c_g_mime_stream_close;

/** */
alias g_mime_stream_construct = c_g_mime_stream_construct;

/** */
alias g_mime_stream_eos = c_g_mime_stream_eos;

/** */
alias g_mime_stream_flush = c_g_mime_stream_flush;

/** */
alias g_mime_stream_length = c_g_mime_stream_length;

/** */
alias g_mime_stream_printf = c_g_mime_stream_printf;

/** */
alias g_mime_stream_read = c_g_mime_stream_read;

/** */
alias g_mime_stream_reset = c_g_mime_stream_reset;

/** */
alias g_mime_stream_seek = c_g_mime_stream_seek;

/** */
alias g_mime_stream_set_bounds = c_g_mime_stream_set_bounds;

/** */
alias g_mime_stream_substream = c_g_mime_stream_substream;

/** */
alias g_mime_stream_tell = c_g_mime_stream_tell;

/** */
alias g_mime_stream_write = c_g_mime_stream_write;

/** */
alias g_mime_stream_write_string = c_g_mime_stream_write_string;

/** */
alias g_mime_stream_write_to_stream = c_g_mime_stream_write_to_stream;

/** */
alias g_mime_stream_writev = c_g_mime_stream_writev;

// StreamBuffer

/** */
alias g_mime_stream_buffer_get_type = c_g_mime_stream_buffer_get_type;

/** */
alias g_mime_stream_buffer_new = c_g_mime_stream_buffer_new;

// StreamCat

/** */
alias g_mime_stream_cat_get_type = c_g_mime_stream_cat_get_type;

/** */
alias g_mime_stream_cat_new = c_g_mime_stream_cat_new;

/** */
alias g_mime_stream_cat_add_source = c_g_mime_stream_cat_add_source;

// StreamFile

/** */
alias g_mime_stream_file_get_type = c_g_mime_stream_file_get_type;

/** */
alias g_mime_stream_file_new = c_g_mime_stream_file_new;

/** */
alias g_mime_stream_file_new_with_bounds = c_g_mime_stream_file_new_with_bounds;

/** */
alias g_mime_stream_file_open = c_g_mime_stream_file_open;

/** */
alias g_mime_stream_file_get_owner = c_g_mime_stream_file_get_owner;

/** */
alias g_mime_stream_file_set_owner = c_g_mime_stream_file_set_owner;

// StreamFilter

/** */
alias g_mime_stream_filter_get_type = c_g_mime_stream_filter_get_type;

/** */
alias g_mime_stream_filter_new = c_g_mime_stream_filter_new;

/** */
alias g_mime_stream_filter_add = c_g_mime_stream_filter_add;

/** */
alias g_mime_stream_filter_get_owner = c_g_mime_stream_filter_get_owner;

/** */
alias g_mime_stream_filter_remove = c_g_mime_stream_filter_remove;

/** */
alias g_mime_stream_filter_set_owner = c_g_mime_stream_filter_set_owner;

// StreamFs

/** */
alias g_mime_stream_fs_get_type = c_g_mime_stream_fs_get_type;

/** */
alias g_mime_stream_fs_new = c_g_mime_stream_fs_new;

/** */
alias g_mime_stream_fs_new_with_bounds = c_g_mime_stream_fs_new_with_bounds;

/** */
alias g_mime_stream_fs_open = c_g_mime_stream_fs_open;

/** */
alias g_mime_stream_fs_get_owner = c_g_mime_stream_fs_get_owner;

/** */
alias g_mime_stream_fs_set_owner = c_g_mime_stream_fs_set_owner;

// StreamGIO

/** */
alias g_mime_stream_gio_get_type = c_g_mime_stream_gio_get_type;

/** */
alias g_mime_stream_gio_new = c_g_mime_stream_gio_new;

/** */
alias g_mime_stream_gio_new_with_bounds = c_g_mime_stream_gio_new_with_bounds;

/** */
alias g_mime_stream_gio_get_owner = c_g_mime_stream_gio_get_owner;

/** */
alias g_mime_stream_gio_set_owner = c_g_mime_stream_gio_set_owner;

// StreamMem

/** */
alias g_mime_stream_mem_get_type = c_g_mime_stream_mem_get_type;

/** */
alias g_mime_stream_mem_new = c_g_mime_stream_mem_new;

/** */
alias g_mime_stream_mem_new_with_buffer = c_g_mime_stream_mem_new_with_buffer;

/** */
alias g_mime_stream_mem_new_with_byte_array = c_g_mime_stream_mem_new_with_byte_array;

/** */
alias g_mime_stream_mem_get_byte_array = c_g_mime_stream_mem_get_byte_array;

/** */
alias g_mime_stream_mem_get_owner = c_g_mime_stream_mem_get_owner;

/** */
alias g_mime_stream_mem_set_byte_array = c_g_mime_stream_mem_set_byte_array;

/** */
alias g_mime_stream_mem_set_owner = c_g_mime_stream_mem_set_owner;

// StreamMmap

/** */
alias g_mime_stream_mmap_get_type = c_g_mime_stream_mmap_get_type;

/** */
alias g_mime_stream_mmap_new = c_g_mime_stream_mmap_new;

/** */
alias g_mime_stream_mmap_new_with_bounds = c_g_mime_stream_mmap_new_with_bounds;

/** */
alias g_mime_stream_mmap_get_owner = c_g_mime_stream_mmap_get_owner;

/** */
alias g_mime_stream_mmap_set_owner = c_g_mime_stream_mmap_set_owner;

// StreamNull

/** */
alias g_mime_stream_null_get_type = c_g_mime_stream_null_get_type;

/** */
alias g_mime_stream_null_new = c_g_mime_stream_null_new;

/** */
alias g_mime_stream_null_get_count_newlines = c_g_mime_stream_null_get_count_newlines;

/** */
alias g_mime_stream_null_set_count_newlines = c_g_mime_stream_null_set_count_newlines;

// StreamPipe

/** */
alias g_mime_stream_pipe_get_type = c_g_mime_stream_pipe_get_type;

/** */
alias g_mime_stream_pipe_new = c_g_mime_stream_pipe_new;

/** */
alias g_mime_stream_pipe_get_owner = c_g_mime_stream_pipe_get_owner;

/** */
alias g_mime_stream_pipe_set_owner = c_g_mime_stream_pipe_set_owner;

// TextPart

/** */
alias g_mime_text_part_get_type = c_g_mime_text_part_get_type;

/** */
alias g_mime_text_part_new = c_g_mime_text_part_new;

/** */
alias g_mime_text_part_new_with_subtype = c_g_mime_text_part_new_with_subtype;

/** */
alias g_mime_text_part_get_charset = c_g_mime_text_part_get_charset;

/** */
alias g_mime_text_part_get_text = c_g_mime_text_part_get_text;

/** */
alias g_mime_text_part_set_charset = c_g_mime_text_part_set_charset;

/** */
alias g_mime_text_part_set_text = c_g_mime_text_part_set_text;

// global

/** */
alias g_mime_check_version = c_g_mime_check_version;

/** */
alias g_mime_content_encoding_from_string = c_g_mime_content_encoding_from_string;

/** */
alias g_mime_content_encoding_to_string = c_g_mime_content_encoding_to_string;

/** */
alias g_mime_iconv_close = c_g_mime_iconv_close;

/** */
alias g_mime_iconv_locale_to_utf8 = c_g_mime_iconv_locale_to_utf8;

/** */
alias g_mime_iconv_locale_to_utf8_length = c_g_mime_iconv_locale_to_utf8_length;

/** */
alias g_mime_iconv_open = c_g_mime_iconv_open;

/** */
alias g_mime_iconv_strdup = c_g_mime_iconv_strdup;

/** */
alias g_mime_iconv_strndup = c_g_mime_iconv_strndup;

/** */
alias g_mime_iconv_utf8_to_locale = c_g_mime_iconv_utf8_to_locale;

/** */
alias g_mime_iconv_utf8_to_locale_length = c_g_mime_iconv_utf8_to_locale_length;

/** */
alias g_mime_init = c_g_mime_init;

/** */
alias g_mime_locale_charset = c_g_mime_locale_charset;

/** */
alias g_mime_locale_language = c_g_mime_locale_language;

/** */
alias g_mime_shutdown = c_g_mime_shutdown;

/** */
alias g_mime_utils_best_encoding = c_g_mime_utils_best_encoding;

/** */
alias g_mime_utils_decode_8bit = c_g_mime_utils_decode_8bit;

/** */
alias g_mime_utils_decode_message_id = c_g_mime_utils_decode_message_id;

/** */
alias g_mime_utils_generate_message_id = c_g_mime_utils_generate_message_id;

/** */
alias g_mime_utils_header_decode_date = c_g_mime_utils_header_decode_date;

/** */
alias g_mime_utils_header_decode_phrase = c_g_mime_utils_header_decode_phrase;

/** */
alias g_mime_utils_header_decode_text = c_g_mime_utils_header_decode_text;

/** */
alias g_mime_utils_header_encode_phrase = c_g_mime_utils_header_encode_phrase;

/** */
alias g_mime_utils_header_encode_text = c_g_mime_utils_header_encode_text;

/** */
alias g_mime_utils_header_format_date = c_g_mime_utils_header_format_date;

/** */
alias g_mime_utils_header_printf = c_g_mime_utils_header_printf;

/** */
alias g_mime_utils_header_unfold = c_g_mime_utils_header_unfold;

/** */
alias g_mime_utils_quote_string = c_g_mime_utils_quote_string;

/** */
alias g_mime_utils_structured_header_fold = c_g_mime_utils_structured_header_fold;

/** */
alias g_mime_utils_text_is_8bit = c_g_mime_utils_text_is_8bit;

/** */
alias g_mime_utils_unquote_string = c_g_mime_utils_unquote_string;

/** */
alias g_mime_utils_unstructured_header_fold = c_g_mime_utils_unstructured_header_fold;

/** */
alias g_mime_ydecode_step = c_g_mime_ydecode_step;

/** */
alias g_mime_yencode_close = c_g_mime_yencode_close;

/** */
alias g_mime_yencode_step = c_g_mime_yencode_step;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // ApplicationPkcs7Mime
  gidLink(cast(void**)&g_mime_application_pkcs7_mime_get_type, "g_mime_application_pkcs7_mime_get_type", libs);
  gidLink(cast(void**)&g_mime_application_pkcs7_mime_new, "g_mime_application_pkcs7_mime_new", libs);
  gidLink(cast(void**)&g_mime_application_pkcs7_mime_encrypt, "g_mime_application_pkcs7_mime_encrypt", libs);
  gidLink(cast(void**)&g_mime_application_pkcs7_mime_sign, "g_mime_application_pkcs7_mime_sign", libs);
  gidLink(cast(void**)&g_mime_application_pkcs7_mime_decrypt, "g_mime_application_pkcs7_mime_decrypt", libs);
  gidLink(cast(void**)&g_mime_application_pkcs7_mime_get_smime_type, "g_mime_application_pkcs7_mime_get_smime_type", libs);
  gidLink(cast(void**)&g_mime_application_pkcs7_mime_verify, "g_mime_application_pkcs7_mime_verify", libs);

  // AutocryptHeader
  gidLink(cast(void**)&g_mime_autocrypt_header_get_type, "g_mime_autocrypt_header_get_type", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_new, "g_mime_autocrypt_header_new", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_new_from_string, "g_mime_autocrypt_header_new_from_string", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_clone, "g_mime_autocrypt_header_clone", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_compare, "g_mime_autocrypt_header_compare", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_get_address, "g_mime_autocrypt_header_get_address", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_get_address_as_string, "g_mime_autocrypt_header_get_address_as_string", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_get_effective_date, "g_mime_autocrypt_header_get_effective_date", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_get_keydata, "g_mime_autocrypt_header_get_keydata", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_get_prefer_encrypt, "g_mime_autocrypt_header_get_prefer_encrypt", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_is_complete, "g_mime_autocrypt_header_is_complete", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_set_address, "g_mime_autocrypt_header_set_address", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_set_address_from_string, "g_mime_autocrypt_header_set_address_from_string", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_set_effective_date, "g_mime_autocrypt_header_set_effective_date", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_set_keydata, "g_mime_autocrypt_header_set_keydata", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_set_prefer_encrypt, "g_mime_autocrypt_header_set_prefer_encrypt", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_to_string, "g_mime_autocrypt_header_to_string", libs);

  // AutocryptHeaderList
  gidLink(cast(void**)&g_mime_autocrypt_header_list_get_type, "g_mime_autocrypt_header_list_get_type", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_list_new, "g_mime_autocrypt_header_list_new", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_list_add, "g_mime_autocrypt_header_list_add", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_list_add_missing_addresses, "g_mime_autocrypt_header_list_add_missing_addresses", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_list_get_count, "g_mime_autocrypt_header_list_get_count", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_list_get_header_at, "g_mime_autocrypt_header_list_get_header_at", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_list_get_header_for_address, "g_mime_autocrypt_header_list_get_header_for_address", libs);
  gidLink(cast(void**)&g_mime_autocrypt_header_list_remove_incomplete, "g_mime_autocrypt_header_list_remove_incomplete", libs);

  // Certificate
  gidLink(cast(void**)&g_mime_certificate_get_type, "g_mime_certificate_get_type", libs);
  gidLink(cast(void**)&g_mime_certificate_new, "g_mime_certificate_new", libs);
  gidLink(cast(void**)&g_mime_certificate_get_created, "g_mime_certificate_get_created", libs);
  gidLink(cast(void**)&g_mime_certificate_get_created64, "g_mime_certificate_get_created64", libs);
  gidLink(cast(void**)&g_mime_certificate_get_digest_algo, "g_mime_certificate_get_digest_algo", libs);
  gidLink(cast(void**)&g_mime_certificate_get_email, "g_mime_certificate_get_email", libs);
  gidLink(cast(void**)&g_mime_certificate_get_expires, "g_mime_certificate_get_expires", libs);
  gidLink(cast(void**)&g_mime_certificate_get_expires64, "g_mime_certificate_get_expires64", libs);
  gidLink(cast(void**)&g_mime_certificate_get_fingerprint, "g_mime_certificate_get_fingerprint", libs);
  gidLink(cast(void**)&g_mime_certificate_get_id_validity, "g_mime_certificate_get_id_validity", libs);
  gidLink(cast(void**)&g_mime_certificate_get_issuer_name, "g_mime_certificate_get_issuer_name", libs);
  gidLink(cast(void**)&g_mime_certificate_get_issuer_serial, "g_mime_certificate_get_issuer_serial", libs);
  gidLink(cast(void**)&g_mime_certificate_get_key_id, "g_mime_certificate_get_key_id", libs);
  gidLink(cast(void**)&g_mime_certificate_get_name, "g_mime_certificate_get_name", libs);
  gidLink(cast(void**)&g_mime_certificate_get_pubkey_algo, "g_mime_certificate_get_pubkey_algo", libs);
  gidLink(cast(void**)&g_mime_certificate_get_trust, "g_mime_certificate_get_trust", libs);
  gidLink(cast(void**)&g_mime_certificate_get_user_id, "g_mime_certificate_get_user_id", libs);
  gidLink(cast(void**)&g_mime_certificate_set_created, "g_mime_certificate_set_created", libs);
  gidLink(cast(void**)&g_mime_certificate_set_digest_algo, "g_mime_certificate_set_digest_algo", libs);
  gidLink(cast(void**)&g_mime_certificate_set_email, "g_mime_certificate_set_email", libs);
  gidLink(cast(void**)&g_mime_certificate_set_expires, "g_mime_certificate_set_expires", libs);
  gidLink(cast(void**)&g_mime_certificate_set_fingerprint, "g_mime_certificate_set_fingerprint", libs);
  gidLink(cast(void**)&g_mime_certificate_set_id_validity, "g_mime_certificate_set_id_validity", libs);
  gidLink(cast(void**)&g_mime_certificate_set_issuer_name, "g_mime_certificate_set_issuer_name", libs);
  gidLink(cast(void**)&g_mime_certificate_set_issuer_serial, "g_mime_certificate_set_issuer_serial", libs);
  gidLink(cast(void**)&g_mime_certificate_set_key_id, "g_mime_certificate_set_key_id", libs);
  gidLink(cast(void**)&g_mime_certificate_set_name, "g_mime_certificate_set_name", libs);
  gidLink(cast(void**)&g_mime_certificate_set_pubkey_algo, "g_mime_certificate_set_pubkey_algo", libs);
  gidLink(cast(void**)&g_mime_certificate_set_trust, "g_mime_certificate_set_trust", libs);
  gidLink(cast(void**)&g_mime_certificate_set_user_id, "g_mime_certificate_set_user_id", libs);

  // CertificateList
  gidLink(cast(void**)&g_mime_certificate_list_get_type, "g_mime_certificate_list_get_type", libs);
  gidLink(cast(void**)&g_mime_certificate_list_new, "g_mime_certificate_list_new", libs);
  gidLink(cast(void**)&g_mime_certificate_list_add, "g_mime_certificate_list_add", libs);
  gidLink(cast(void**)&g_mime_certificate_list_clear, "g_mime_certificate_list_clear", libs);
  gidLink(cast(void**)&g_mime_certificate_list_contains, "g_mime_certificate_list_contains", libs);
  gidLink(cast(void**)&g_mime_certificate_list_get_certificate, "g_mime_certificate_list_get_certificate", libs);
  gidLink(cast(void**)&g_mime_certificate_list_index_of, "g_mime_certificate_list_index_of", libs);
  gidLink(cast(void**)&g_mime_certificate_list_insert, "g_mime_certificate_list_insert", libs);
  gidLink(cast(void**)&g_mime_certificate_list_length, "g_mime_certificate_list_length", libs);
  gidLink(cast(void**)&g_mime_certificate_list_remove, "g_mime_certificate_list_remove", libs);
  gidLink(cast(void**)&g_mime_certificate_list_remove_at, "g_mime_certificate_list_remove_at", libs);
  gidLink(cast(void**)&g_mime_certificate_list_set_certificate, "g_mime_certificate_list_set_certificate", libs);

  // Charset
  gidLink(cast(void**)&g_mime_charset_best_name, "g_mime_charset_best_name", libs);
  gidLink(cast(void**)&g_mime_charset_can_encode, "g_mime_charset_can_encode", libs);
  gidLink(cast(void**)&g_mime_charset_init, "g_mime_charset_init", libs);
  gidLink(cast(void**)&g_mime_charset_step, "g_mime_charset_step", libs);
  gidLink(cast(void**)&g_mime_charset_best, "g_mime_charset_best", libs);
  gidLink(cast(void**)&g_mime_charset_canon_name, "g_mime_charset_canon_name", libs);
  gidLink(cast(void**)&g_mime_charset_iconv_name, "g_mime_charset_iconv_name", libs);
  gidLink(cast(void**)&g_mime_charset_iso_to_windows, "g_mime_charset_iso_to_windows", libs);
  gidLink(cast(void**)&g_mime_charset_language, "g_mime_charset_language", libs);
  gidLink(cast(void**)&g_mime_charset_locale_name, "g_mime_charset_locale_name", libs);
  gidLink(cast(void**)&g_mime_charset_map_init, "g_mime_charset_map_init", libs);
  gidLink(cast(void**)&g_mime_charset_map_shutdown, "g_mime_charset_map_shutdown", libs);
  gidLink(cast(void**)&g_mime_charset_name, "g_mime_charset_name", libs);

  // ContentDisposition
  gidLink(cast(void**)&g_mime_content_disposition_get_type, "g_mime_content_disposition_get_type", libs);
  gidLink(cast(void**)&g_mime_content_disposition_new, "g_mime_content_disposition_new", libs);
  gidLink(cast(void**)&g_mime_content_disposition_parse, "g_mime_content_disposition_parse", libs);
  gidLink(cast(void**)&g_mime_content_disposition_encode, "g_mime_content_disposition_encode", libs);
  gidLink(cast(void**)&g_mime_content_disposition_get_disposition, "g_mime_content_disposition_get_disposition", libs);
  gidLink(cast(void**)&g_mime_content_disposition_get_parameter, "g_mime_content_disposition_get_parameter", libs);
  gidLink(cast(void**)&g_mime_content_disposition_get_parameters, "g_mime_content_disposition_get_parameters", libs);
  gidLink(cast(void**)&g_mime_content_disposition_is_attachment, "g_mime_content_disposition_is_attachment", libs);
  gidLink(cast(void**)&g_mime_content_disposition_set_disposition, "g_mime_content_disposition_set_disposition", libs);
  gidLink(cast(void**)&g_mime_content_disposition_set_parameter, "g_mime_content_disposition_set_parameter", libs);

  // ContentType
  gidLink(cast(void**)&g_mime_content_type_get_type, "g_mime_content_type_get_type", libs);
  gidLink(cast(void**)&g_mime_content_type_new, "g_mime_content_type_new", libs);
  gidLink(cast(void**)&g_mime_content_type_parse, "g_mime_content_type_parse", libs);
  gidLink(cast(void**)&g_mime_content_type_encode, "g_mime_content_type_encode", libs);
  gidLink(cast(void**)&g_mime_content_type_get_media_subtype, "g_mime_content_type_get_media_subtype", libs);
  gidLink(cast(void**)&g_mime_content_type_get_media_type, "g_mime_content_type_get_media_type", libs);
  gidLink(cast(void**)&g_mime_content_type_get_mime_type, "g_mime_content_type_get_mime_type", libs);
  gidLink(cast(void**)&g_mime_content_type_get_parameter, "g_mime_content_type_get_parameter", libs);
  gidLink(cast(void**)&g_mime_content_type_get_parameters, "g_mime_content_type_get_parameters", libs);
  gidLink(cast(void**)&g_mime_content_type_is_type, "g_mime_content_type_is_type", libs);
  gidLink(cast(void**)&g_mime_content_type_set_media_subtype, "g_mime_content_type_set_media_subtype", libs);
  gidLink(cast(void**)&g_mime_content_type_set_media_type, "g_mime_content_type_set_media_type", libs);
  gidLink(cast(void**)&g_mime_content_type_set_parameter, "g_mime_content_type_set_parameter", libs);

  // CryptoContext
  gidLink(cast(void**)&g_mime_crypto_context_get_type, "g_mime_crypto_context_get_type", libs);
  gidLink(cast(void**)&g_mime_crypto_context_new, "g_mime_crypto_context_new", libs);
  gidLink(cast(void**)&g_mime_crypto_context_register, "g_mime_crypto_context_register", libs);
  gidLink(cast(void**)&g_mime_crypto_context_decrypt, "g_mime_crypto_context_decrypt", libs);
  gidLink(cast(void**)&g_mime_crypto_context_digest_id, "g_mime_crypto_context_digest_id", libs);
  gidLink(cast(void**)&g_mime_crypto_context_digest_name, "g_mime_crypto_context_digest_name", libs);
  gidLink(cast(void**)&g_mime_crypto_context_encrypt, "g_mime_crypto_context_encrypt", libs);
  gidLink(cast(void**)&g_mime_crypto_context_export_keys, "g_mime_crypto_context_export_keys", libs);
  gidLink(cast(void**)&g_mime_crypto_context_get_encryption_protocol, "g_mime_crypto_context_get_encryption_protocol", libs);
  gidLink(cast(void**)&g_mime_crypto_context_get_key_exchange_protocol, "g_mime_crypto_context_get_key_exchange_protocol", libs);
  gidLink(cast(void**)&g_mime_crypto_context_get_signature_protocol, "g_mime_crypto_context_get_signature_protocol", libs);
  gidLink(cast(void**)&g_mime_crypto_context_import_keys, "g_mime_crypto_context_import_keys", libs);
  gidLink(cast(void**)&g_mime_crypto_context_set_request_password, "g_mime_crypto_context_set_request_password", libs);
  gidLink(cast(void**)&g_mime_crypto_context_sign, "g_mime_crypto_context_sign", libs);
  gidLink(cast(void**)&g_mime_crypto_context_verify, "g_mime_crypto_context_verify", libs);

  // DataWrapper
  gidLink(cast(void**)&g_mime_data_wrapper_get_type, "g_mime_data_wrapper_get_type", libs);
  gidLink(cast(void**)&g_mime_data_wrapper_new, "g_mime_data_wrapper_new", libs);
  gidLink(cast(void**)&g_mime_data_wrapper_new_with_stream, "g_mime_data_wrapper_new_with_stream", libs);
  gidLink(cast(void**)&g_mime_data_wrapper_get_encoding, "g_mime_data_wrapper_get_encoding", libs);
  gidLink(cast(void**)&g_mime_data_wrapper_get_stream, "g_mime_data_wrapper_get_stream", libs);
  gidLink(cast(void**)&g_mime_data_wrapper_set_encoding, "g_mime_data_wrapper_set_encoding", libs);
  gidLink(cast(void**)&g_mime_data_wrapper_set_stream, "g_mime_data_wrapper_set_stream", libs);
  gidLink(cast(void**)&g_mime_data_wrapper_write_to_stream, "g_mime_data_wrapper_write_to_stream", libs);

  // DecryptResult
  gidLink(cast(void**)&g_mime_decrypt_result_get_type, "g_mime_decrypt_result_get_type", libs);
  gidLink(cast(void**)&g_mime_decrypt_result_new, "g_mime_decrypt_result_new", libs);
  gidLink(cast(void**)&g_mime_decrypt_result_get_cipher, "g_mime_decrypt_result_get_cipher", libs);
  gidLink(cast(void**)&g_mime_decrypt_result_get_mdc, "g_mime_decrypt_result_get_mdc", libs);
  gidLink(cast(void**)&g_mime_decrypt_result_get_recipients, "g_mime_decrypt_result_get_recipients", libs);
  gidLink(cast(void**)&g_mime_decrypt_result_get_session_key, "g_mime_decrypt_result_get_session_key", libs);
  gidLink(cast(void**)&g_mime_decrypt_result_get_signatures, "g_mime_decrypt_result_get_signatures", libs);
  gidLink(cast(void**)&g_mime_decrypt_result_set_cipher, "g_mime_decrypt_result_set_cipher", libs);
  gidLink(cast(void**)&g_mime_decrypt_result_set_mdc, "g_mime_decrypt_result_set_mdc", libs);
  gidLink(cast(void**)&g_mime_decrypt_result_set_recipients, "g_mime_decrypt_result_set_recipients", libs);
  gidLink(cast(void**)&g_mime_decrypt_result_set_session_key, "g_mime_decrypt_result_set_session_key", libs);
  gidLink(cast(void**)&g_mime_decrypt_result_set_signatures, "g_mime_decrypt_result_set_signatures", libs);

  // Encoding
  gidLink(cast(void**)&g_mime_encoding_flush, "g_mime_encoding_flush", libs);
  gidLink(cast(void**)&g_mime_encoding_init_decode, "g_mime_encoding_init_decode", libs);
  gidLink(cast(void**)&g_mime_encoding_init_encode, "g_mime_encoding_init_encode", libs);
  gidLink(cast(void**)&g_mime_encoding_outlen, "g_mime_encoding_outlen", libs);
  gidLink(cast(void**)&g_mime_encoding_reset, "g_mime_encoding_reset", libs);
  gidLink(cast(void**)&g_mime_encoding_step, "g_mime_encoding_step", libs);
  gidLink(cast(void**)&g_mime_encoding_base64_decode_step, "g_mime_encoding_base64_decode_step", libs);
  gidLink(cast(void**)&g_mime_encoding_base64_encode_close, "g_mime_encoding_base64_encode_close", libs);
  gidLink(cast(void**)&g_mime_encoding_base64_encode_step, "g_mime_encoding_base64_encode_step", libs);
  gidLink(cast(void**)&g_mime_encoding_quoted_decode_step, "g_mime_encoding_quoted_decode_step", libs);
  gidLink(cast(void**)&g_mime_encoding_quoted_encode_close, "g_mime_encoding_quoted_encode_close", libs);
  gidLink(cast(void**)&g_mime_encoding_quoted_encode_step, "g_mime_encoding_quoted_encode_step", libs);
  gidLink(cast(void**)&g_mime_encoding_uudecode_step, "g_mime_encoding_uudecode_step", libs);
  gidLink(cast(void**)&g_mime_encoding_uuencode_close, "g_mime_encoding_uuencode_close", libs);
  gidLink(cast(void**)&g_mime_encoding_uuencode_step, "g_mime_encoding_uuencode_step", libs);

  // Filter
  gidLink(cast(void**)&g_mime_filter_get_type, "g_mime_filter_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_backup, "g_mime_filter_backup", libs);
  gidLink(cast(void**)&g_mime_filter_complete, "g_mime_filter_complete", libs);
  gidLink(cast(void**)&g_mime_filter_copy, "g_mime_filter_copy", libs);
  gidLink(cast(void**)&g_mime_filter_filter, "g_mime_filter_filter", libs);
  gidLink(cast(void**)&g_mime_filter_reset, "g_mime_filter_reset", libs);
  gidLink(cast(void**)&g_mime_filter_set_size, "g_mime_filter_set_size", libs);

  // FilterBasic
  gidLink(cast(void**)&g_mime_filter_basic_get_type, "g_mime_filter_basic_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_basic_new, "g_mime_filter_basic_new", libs);

  // FilterBest
  gidLink(cast(void**)&g_mime_filter_best_get_type, "g_mime_filter_best_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_best_new, "g_mime_filter_best_new", libs);
  gidLink(cast(void**)&g_mime_filter_best_charset, "g_mime_filter_best_charset", libs);
  gidLink(cast(void**)&g_mime_filter_best_encoding, "g_mime_filter_best_encoding", libs);

  // FilterCharset
  gidLink(cast(void**)&g_mime_filter_charset_get_type, "g_mime_filter_charset_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_charset_new, "g_mime_filter_charset_new", libs);

  // FilterChecksum
  gidLink(cast(void**)&g_mime_filter_checksum_get_type, "g_mime_filter_checksum_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_checksum_new, "g_mime_filter_checksum_new", libs);
  gidLink(cast(void**)&g_mime_filter_checksum_get_digest, "g_mime_filter_checksum_get_digest", libs);
  gidLink(cast(void**)&g_mime_filter_checksum_get_string, "g_mime_filter_checksum_get_string", libs);

  // FilterDos2Unix
  gidLink(cast(void**)&g_mime_filter_dos2unix_get_type, "g_mime_filter_dos2unix_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_dos2unix_new, "g_mime_filter_dos2unix_new", libs);

  // FilterEnriched
  gidLink(cast(void**)&g_mime_filter_enriched_get_type, "g_mime_filter_enriched_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_enriched_new, "g_mime_filter_enriched_new", libs);

  // FilterFrom
  gidLink(cast(void**)&g_mime_filter_from_get_type, "g_mime_filter_from_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_from_new, "g_mime_filter_from_new", libs);

  // FilterGZip
  gidLink(cast(void**)&g_mime_filter_gzip_get_type, "g_mime_filter_gzip_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_gzip_new, "g_mime_filter_gzip_new", libs);
  gidLink(cast(void**)&g_mime_filter_gzip_get_comment, "g_mime_filter_gzip_get_comment", libs);
  gidLink(cast(void**)&g_mime_filter_gzip_get_filename, "g_mime_filter_gzip_get_filename", libs);
  gidLink(cast(void**)&g_mime_filter_gzip_set_comment, "g_mime_filter_gzip_set_comment", libs);
  gidLink(cast(void**)&g_mime_filter_gzip_set_filename, "g_mime_filter_gzip_set_filename", libs);

  // FilterHTML
  gidLink(cast(void**)&g_mime_filter_html_get_type, "g_mime_filter_html_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_html_new, "g_mime_filter_html_new", libs);

  // FilterOpenPGP
  gidLink(cast(void**)&g_mime_filter_openpgp_get_type, "g_mime_filter_openpgp_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_openpgp_new, "g_mime_filter_openpgp_new", libs);
  gidLink(cast(void**)&g_mime_filter_openpgp_get_begin_offset, "g_mime_filter_openpgp_get_begin_offset", libs);
  gidLink(cast(void**)&g_mime_filter_openpgp_get_data_type, "g_mime_filter_openpgp_get_data_type", libs);
  gidLink(cast(void**)&g_mime_filter_openpgp_get_end_offset, "g_mime_filter_openpgp_get_end_offset", libs);

  // FilterSmtpData
  gidLink(cast(void**)&g_mime_filter_smtp_data_get_type, "g_mime_filter_smtp_data_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_smtp_data_new, "g_mime_filter_smtp_data_new", libs);

  // FilterStrip
  gidLink(cast(void**)&g_mime_filter_strip_get_type, "g_mime_filter_strip_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_strip_new, "g_mime_filter_strip_new", libs);

  // FilterUnix2Dos
  gidLink(cast(void**)&g_mime_filter_unix2dos_get_type, "g_mime_filter_unix2dos_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_unix2dos_new, "g_mime_filter_unix2dos_new", libs);

  // FilterWindows
  gidLink(cast(void**)&g_mime_filter_windows_get_type, "g_mime_filter_windows_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_windows_new, "g_mime_filter_windows_new", libs);
  gidLink(cast(void**)&g_mime_filter_windows_is_windows_charset, "g_mime_filter_windows_is_windows_charset", libs);
  gidLink(cast(void**)&g_mime_filter_windows_real_charset, "g_mime_filter_windows_real_charset", libs);

  // FilterYenc
  gidLink(cast(void**)&g_mime_filter_yenc_get_type, "g_mime_filter_yenc_get_type", libs);
  gidLink(cast(void**)&g_mime_filter_yenc_new, "g_mime_filter_yenc_new", libs);
  gidLink(cast(void**)&g_mime_filter_yenc_get_crc, "g_mime_filter_yenc_get_crc", libs);
  gidLink(cast(void**)&g_mime_filter_yenc_get_pcrc, "g_mime_filter_yenc_get_pcrc", libs);
  gidLink(cast(void**)&g_mime_filter_yenc_set_crc, "g_mime_filter_yenc_set_crc", libs);
  gidLink(cast(void**)&g_mime_filter_yenc_set_state, "g_mime_filter_yenc_set_state", libs);

  // FormatOptions
  gidLink(cast(void**)&g_mime_format_options_get_type, "g_mime_format_options_get_type", libs);
  gidLink(cast(void**)&g_mime_format_options_new, "g_mime_format_options_new", libs);
  gidLink(cast(void**)&g_mime_format_options_add_hidden_header, "g_mime_format_options_add_hidden_header", libs);
  gidLink(cast(void**)&g_mime_format_options_clear_hidden_headers, "g_mime_format_options_clear_hidden_headers", libs);
  gidLink(cast(void**)&g_mime_format_options_clone, "g_mime_format_options_clone", libs);
  gidLink(cast(void**)&g_mime_format_options_create_newline_filter, "g_mime_format_options_create_newline_filter", libs);
  gidLink(cast(void**)&g_mime_format_options_free, "g_mime_format_options_free", libs);
  gidLink(cast(void**)&g_mime_format_options_get_newline, "g_mime_format_options_get_newline", libs);
  gidLink(cast(void**)&g_mime_format_options_get_newline_format, "g_mime_format_options_get_newline_format", libs);
  gidLink(cast(void**)&g_mime_format_options_get_param_encoding_method, "g_mime_format_options_get_param_encoding_method", libs);
  gidLink(cast(void**)&g_mime_format_options_is_hidden_header, "g_mime_format_options_is_hidden_header", libs);
  gidLink(cast(void**)&g_mime_format_options_remove_hidden_header, "g_mime_format_options_remove_hidden_header", libs);
  gidLink(cast(void**)&g_mime_format_options_set_newline_format, "g_mime_format_options_set_newline_format", libs);
  gidLink(cast(void**)&g_mime_format_options_set_param_encoding_method, "g_mime_format_options_set_param_encoding_method", libs);
  gidLink(cast(void**)&g_mime_format_options_get_default, "g_mime_format_options_get_default", libs);

  // GpgContext
  gidLink(cast(void**)&g_mime_gpg_context_get_type, "g_mime_gpg_context_get_type", libs);
  gidLink(cast(void**)&g_mime_gpg_context_new, "g_mime_gpg_context_new", libs);

  // Header
  gidLink(cast(void**)&g_mime_header_get_type, "g_mime_header_get_type", libs);
  gidLink(cast(void**)&g_mime_header_format_addrlist, "g_mime_header_format_addrlist", libs);
  gidLink(cast(void**)&g_mime_header_format_content_disposition, "g_mime_header_format_content_disposition", libs);
  gidLink(cast(void**)&g_mime_header_format_content_type, "g_mime_header_format_content_type", libs);
  gidLink(cast(void**)&g_mime_header_format_default, "g_mime_header_format_default", libs);
  gidLink(cast(void**)&g_mime_header_format_message_id, "g_mime_header_format_message_id", libs);
  gidLink(cast(void**)&g_mime_header_format_newsgroups, "g_mime_header_format_newsgroups", libs);
  gidLink(cast(void**)&g_mime_header_format_received, "g_mime_header_format_received", libs);
  gidLink(cast(void**)&g_mime_header_format_references, "g_mime_header_format_references", libs);
  gidLink(cast(void**)&g_mime_header_get_name, "g_mime_header_get_name", libs);
  gidLink(cast(void**)&g_mime_header_get_offset, "g_mime_header_get_offset", libs);
  gidLink(cast(void**)&g_mime_header_get_raw_name, "g_mime_header_get_raw_name", libs);
  gidLink(cast(void**)&g_mime_header_get_raw_value, "g_mime_header_get_raw_value", libs);
  gidLink(cast(void**)&g_mime_header_get_value, "g_mime_header_get_value", libs);
  gidLink(cast(void**)&g_mime_header_set_raw_value, "g_mime_header_set_raw_value", libs);
  gidLink(cast(void**)&g_mime_header_set_value, "g_mime_header_set_value", libs);
  gidLink(cast(void**)&g_mime_header_write_to_stream, "g_mime_header_write_to_stream", libs);

  // HeaderList
  gidLink(cast(void**)&g_mime_header_list_get_type, "g_mime_header_list_get_type", libs);
  gidLink(cast(void**)&g_mime_header_list_new, "g_mime_header_list_new", libs);
  gidLink(cast(void**)&g_mime_header_list_append, "g_mime_header_list_append", libs);
  gidLink(cast(void**)&g_mime_header_list_clear, "g_mime_header_list_clear", libs);
  gidLink(cast(void**)&g_mime_header_list_contains, "g_mime_header_list_contains", libs);
  gidLink(cast(void**)&g_mime_header_list_get_count, "g_mime_header_list_get_count", libs);
  gidLink(cast(void**)&g_mime_header_list_get_header, "g_mime_header_list_get_header", libs);
  gidLink(cast(void**)&g_mime_header_list_get_header_at, "g_mime_header_list_get_header_at", libs);
  gidLink(cast(void**)&g_mime_header_list_prepend, "g_mime_header_list_prepend", libs);
  gidLink(cast(void**)&g_mime_header_list_remove, "g_mime_header_list_remove", libs);
  gidLink(cast(void**)&g_mime_header_list_remove_at, "g_mime_header_list_remove_at", libs);
  gidLink(cast(void**)&g_mime_header_list_set, "g_mime_header_list_set", libs);
  gidLink(cast(void**)&g_mime_header_list_to_string, "g_mime_header_list_to_string", libs);
  gidLink(cast(void**)&g_mime_header_list_write_to_stream, "g_mime_header_list_write_to_stream", libs);

  // InternetAddress
  gidLink(cast(void**)&internet_address_get_type, "internet_address_get_type", libs);
  gidLink(cast(void**)&internet_address_get_charset, "internet_address_get_charset", libs);
  gidLink(cast(void**)&internet_address_get_name, "internet_address_get_name", libs);
  gidLink(cast(void**)&internet_address_set_charset, "internet_address_set_charset", libs);
  gidLink(cast(void**)&internet_address_set_name, "internet_address_set_name", libs);
  gidLink(cast(void**)&internet_address_to_string, "internet_address_to_string", libs);

  // InternetAddressGroup
  gidLink(cast(void**)&internet_address_group_get_type, "internet_address_group_get_type", libs);
  gidLink(cast(void**)&internet_address_group_new, "internet_address_group_new", libs);
  gidLink(cast(void**)&internet_address_group_add_member, "internet_address_group_add_member", libs);
  gidLink(cast(void**)&internet_address_group_get_members, "internet_address_group_get_members", libs);
  gidLink(cast(void**)&internet_address_group_set_members, "internet_address_group_set_members", libs);

  // InternetAddressList
  gidLink(cast(void**)&internet_address_list_get_type, "internet_address_list_get_type", libs);
  gidLink(cast(void**)&internet_address_list_new, "internet_address_list_new", libs);
  gidLink(cast(void**)&internet_address_list_parse, "internet_address_list_parse", libs);
  gidLink(cast(void**)&internet_address_list_add, "internet_address_list_add", libs);
  gidLink(cast(void**)&internet_address_list_append, "internet_address_list_append", libs);
  gidLink(cast(void**)&internet_address_list_append_parse, "internet_address_list_append_parse", libs);
  gidLink(cast(void**)&internet_address_list_clear, "internet_address_list_clear", libs);
  gidLink(cast(void**)&internet_address_list_contains, "internet_address_list_contains", libs);
  gidLink(cast(void**)&internet_address_list_encode, "internet_address_list_encode", libs);
  gidLink(cast(void**)&internet_address_list_get_address, "internet_address_list_get_address", libs);
  gidLink(cast(void**)&internet_address_list_index_of, "internet_address_list_index_of", libs);
  gidLink(cast(void**)&internet_address_list_insert, "internet_address_list_insert", libs);
  gidLink(cast(void**)&internet_address_list_length, "internet_address_list_length", libs);
  gidLink(cast(void**)&internet_address_list_prepend, "internet_address_list_prepend", libs);
  gidLink(cast(void**)&internet_address_list_remove, "internet_address_list_remove", libs);
  gidLink(cast(void**)&internet_address_list_remove_at, "internet_address_list_remove_at", libs);
  gidLink(cast(void**)&internet_address_list_set_address, "internet_address_list_set_address", libs);
  gidLink(cast(void**)&internet_address_list_to_string, "internet_address_list_to_string", libs);

  // InternetAddressMailbox
  gidLink(cast(void**)&internet_address_mailbox_get_type, "internet_address_mailbox_get_type", libs);
  gidLink(cast(void**)&internet_address_mailbox_new, "internet_address_mailbox_new", libs);
  gidLink(cast(void**)&internet_address_mailbox_get_addr, "internet_address_mailbox_get_addr", libs);
  gidLink(cast(void**)&internet_address_mailbox_get_idn_addr, "internet_address_mailbox_get_idn_addr", libs);
  gidLink(cast(void**)&internet_address_mailbox_set_addr, "internet_address_mailbox_set_addr", libs);

  // Message
  gidLink(cast(void**)&g_mime_message_get_type, "g_mime_message_get_type", libs);
  gidLink(cast(void**)&g_mime_message_new, "g_mime_message_new", libs);
  gidLink(cast(void**)&g_mime_message_add_mailbox, "g_mime_message_add_mailbox", libs);
  gidLink(cast(void**)&g_mime_message_foreach, "g_mime_message_foreach", libs);
  gidLink(cast(void**)&g_mime_message_get_addresses, "g_mime_message_get_addresses", libs);
  gidLink(cast(void**)&g_mime_message_get_all_recipients, "g_mime_message_get_all_recipients", libs);
  gidLink(cast(void**)&g_mime_message_get_autocrypt_gossip_headers, "g_mime_message_get_autocrypt_gossip_headers", libs);
  gidLink(cast(void**)&g_mime_message_get_autocrypt_gossip_headers_from_inner_part, "g_mime_message_get_autocrypt_gossip_headers_from_inner_part", libs);
  gidLink(cast(void**)&g_mime_message_get_autocrypt_header, "g_mime_message_get_autocrypt_header", libs);
  gidLink(cast(void**)&g_mime_message_get_bcc, "g_mime_message_get_bcc", libs);
  gidLink(cast(void**)&g_mime_message_get_body, "g_mime_message_get_body", libs);
  gidLink(cast(void**)&g_mime_message_get_cc, "g_mime_message_get_cc", libs);
  gidLink(cast(void**)&g_mime_message_get_date, "g_mime_message_get_date", libs);
  gidLink(cast(void**)&g_mime_message_get_from, "g_mime_message_get_from", libs);
  gidLink(cast(void**)&g_mime_message_get_message_id, "g_mime_message_get_message_id", libs);
  gidLink(cast(void**)&g_mime_message_get_mime_part, "g_mime_message_get_mime_part", libs);
  gidLink(cast(void**)&g_mime_message_get_reply_to, "g_mime_message_get_reply_to", libs);
  gidLink(cast(void**)&g_mime_message_get_sender, "g_mime_message_get_sender", libs);
  gidLink(cast(void**)&g_mime_message_get_subject, "g_mime_message_get_subject", libs);
  gidLink(cast(void**)&g_mime_message_get_to, "g_mime_message_get_to", libs);
  gidLink(cast(void**)&g_mime_message_partial_split_message, "g_mime_message_partial_split_message", libs);
  gidLink(cast(void**)&g_mime_message_set_date, "g_mime_message_set_date", libs);
  gidLink(cast(void**)&g_mime_message_set_message_id, "g_mime_message_set_message_id", libs);
  gidLink(cast(void**)&g_mime_message_set_mime_part, "g_mime_message_set_mime_part", libs);
  gidLink(cast(void**)&g_mime_message_set_subject, "g_mime_message_set_subject", libs);

  // MessagePart
  gidLink(cast(void**)&g_mime_message_part_get_type, "g_mime_message_part_get_type", libs);
  gidLink(cast(void**)&g_mime_message_part_new, "g_mime_message_part_new", libs);
  gidLink(cast(void**)&g_mime_message_part_new_with_message, "g_mime_message_part_new_with_message", libs);
  gidLink(cast(void**)&g_mime_message_part_get_message, "g_mime_message_part_get_message", libs);
  gidLink(cast(void**)&g_mime_message_part_set_message, "g_mime_message_part_set_message", libs);

  // MessagePartial
  gidLink(cast(void**)&g_mime_message_partial_get_type, "g_mime_message_partial_get_type", libs);
  gidLink(cast(void**)&g_mime_message_partial_new, "g_mime_message_partial_new", libs);
  gidLink(cast(void**)&g_mime_message_partial_reconstruct_message, "g_mime_message_partial_reconstruct_message", libs);
  gidLink(cast(void**)&g_mime_message_partial_get_id, "g_mime_message_partial_get_id", libs);
  gidLink(cast(void**)&g_mime_message_partial_get_number, "g_mime_message_partial_get_number", libs);
  gidLink(cast(void**)&g_mime_message_partial_get_total, "g_mime_message_partial_get_total", libs);

  // Multipart
  gidLink(cast(void**)&g_mime_multipart_get_type, "g_mime_multipart_get_type", libs);
  gidLink(cast(void**)&g_mime_multipart_new, "g_mime_multipart_new", libs);
  gidLink(cast(void**)&g_mime_multipart_new_with_subtype, "g_mime_multipart_new_with_subtype", libs);
  gidLink(cast(void**)&g_mime_multipart_add, "g_mime_multipart_add", libs);
  gidLink(cast(void**)&g_mime_multipart_clear, "g_mime_multipart_clear", libs);
  gidLink(cast(void**)&g_mime_multipart_contains, "g_mime_multipart_contains", libs);
  gidLink(cast(void**)&g_mime_multipart_foreach, "g_mime_multipart_foreach", libs);
  gidLink(cast(void**)&g_mime_multipart_get_boundary, "g_mime_multipart_get_boundary", libs);
  gidLink(cast(void**)&g_mime_multipart_get_count, "g_mime_multipart_get_count", libs);
  gidLink(cast(void**)&g_mime_multipart_get_epilogue, "g_mime_multipart_get_epilogue", libs);
  gidLink(cast(void**)&g_mime_multipart_get_part, "g_mime_multipart_get_part", libs);
  gidLink(cast(void**)&g_mime_multipart_get_prologue, "g_mime_multipart_get_prologue", libs);
  gidLink(cast(void**)&g_mime_multipart_get_subpart_from_content_id, "g_mime_multipart_get_subpart_from_content_id", libs);
  gidLink(cast(void**)&g_mime_multipart_index_of, "g_mime_multipart_index_of", libs);
  gidLink(cast(void**)&g_mime_multipart_insert, "g_mime_multipart_insert", libs);
  gidLink(cast(void**)&g_mime_multipart_remove, "g_mime_multipart_remove", libs);
  gidLink(cast(void**)&g_mime_multipart_remove_at, "g_mime_multipart_remove_at", libs);
  gidLink(cast(void**)&g_mime_multipart_replace, "g_mime_multipart_replace", libs);
  gidLink(cast(void**)&g_mime_multipart_set_boundary, "g_mime_multipart_set_boundary", libs);
  gidLink(cast(void**)&g_mime_multipart_set_epilogue, "g_mime_multipart_set_epilogue", libs);
  gidLink(cast(void**)&g_mime_multipart_set_prologue, "g_mime_multipart_set_prologue", libs);

  // MultipartEncrypted
  gidLink(cast(void**)&g_mime_multipart_encrypted_get_type, "g_mime_multipart_encrypted_get_type", libs);
  gidLink(cast(void**)&g_mime_multipart_encrypted_new, "g_mime_multipart_encrypted_new", libs);
  gidLink(cast(void**)&g_mime_multipart_encrypted_encrypt, "g_mime_multipart_encrypted_encrypt", libs);
  gidLink(cast(void**)&g_mime_multipart_encrypted_decrypt, "g_mime_multipart_encrypted_decrypt", libs);

  // MultipartSigned
  gidLink(cast(void**)&g_mime_multipart_signed_get_type, "g_mime_multipart_signed_get_type", libs);
  gidLink(cast(void**)&g_mime_multipart_signed_new, "g_mime_multipart_signed_new", libs);
  gidLink(cast(void**)&g_mime_multipart_signed_sign, "g_mime_multipart_signed_sign", libs);
  gidLink(cast(void**)&g_mime_multipart_signed_verify, "g_mime_multipart_signed_verify", libs);

  // ObjectWrap
  gidLink(cast(void**)&g_mime_object_get_type, "g_mime_object_get_type", libs);
  gidLink(cast(void**)&g_mime_object_new, "g_mime_object_new", libs);
  gidLink(cast(void**)&g_mime_object_new_type, "g_mime_object_new_type", libs);
  gidLink(cast(void**)&g_mime_object_register_type, "g_mime_object_register_type", libs);
  gidLink(cast(void**)&g_mime_object_type_registry_init, "g_mime_object_type_registry_init", libs);
  gidLink(cast(void**)&g_mime_object_type_registry_shutdown, "g_mime_object_type_registry_shutdown", libs);
  gidLink(cast(void**)&g_mime_object_append_header, "g_mime_object_append_header", libs);
  gidLink(cast(void**)&g_mime_object_encode, "g_mime_object_encode", libs);
  gidLink(cast(void**)&g_mime_object_get_autocrypt_headers, "g_mime_object_get_autocrypt_headers", libs);
  gidLink(cast(void**)&g_mime_object_get_content_disposition, "g_mime_object_get_content_disposition", libs);
  gidLink(cast(void**)&g_mime_object_get_content_disposition_parameter, "g_mime_object_get_content_disposition_parameter", libs);
  gidLink(cast(void**)&g_mime_object_get_content_id, "g_mime_object_get_content_id", libs);
  gidLink(cast(void**)&g_mime_object_get_content_type, "g_mime_object_get_content_type", libs);
  gidLink(cast(void**)&g_mime_object_get_content_type_parameter, "g_mime_object_get_content_type_parameter", libs);
  gidLink(cast(void**)&g_mime_object_get_disposition, "g_mime_object_get_disposition", libs);
  gidLink(cast(void**)&g_mime_object_get_header, "g_mime_object_get_header", libs);
  gidLink(cast(void**)&g_mime_object_get_header_list, "g_mime_object_get_header_list", libs);
  gidLink(cast(void**)&g_mime_object_get_headers, "g_mime_object_get_headers", libs);
  gidLink(cast(void**)&g_mime_object_prepend_header, "g_mime_object_prepend_header", libs);
  gidLink(cast(void**)&g_mime_object_remove_header, "g_mime_object_remove_header", libs);
  gidLink(cast(void**)&g_mime_object_set_content_disposition, "g_mime_object_set_content_disposition", libs);
  gidLink(cast(void**)&g_mime_object_set_content_disposition_parameter, "g_mime_object_set_content_disposition_parameter", libs);
  gidLink(cast(void**)&g_mime_object_set_content_id, "g_mime_object_set_content_id", libs);
  gidLink(cast(void**)&g_mime_object_set_content_type, "g_mime_object_set_content_type", libs);
  gidLink(cast(void**)&g_mime_object_set_content_type_parameter, "g_mime_object_set_content_type_parameter", libs);
  gidLink(cast(void**)&g_mime_object_set_disposition, "g_mime_object_set_disposition", libs);
  gidLink(cast(void**)&g_mime_object_set_header, "g_mime_object_set_header", libs);
  gidLink(cast(void**)&g_mime_object_to_string, "g_mime_object_to_string", libs);
  gidLink(cast(void**)&g_mime_object_write_content_to_stream, "g_mime_object_write_content_to_stream", libs);
  gidLink(cast(void**)&g_mime_object_write_to_stream, "g_mime_object_write_to_stream", libs);

  // Param
  gidLink(cast(void**)&g_mime_param_get_type, "g_mime_param_get_type", libs);
  gidLink(cast(void**)&g_mime_param_get_charset, "g_mime_param_get_charset", libs);
  gidLink(cast(void**)&g_mime_param_get_encoding_method, "g_mime_param_get_encoding_method", libs);
  gidLink(cast(void**)&g_mime_param_get_lang, "g_mime_param_get_lang", libs);
  gidLink(cast(void**)&g_mime_param_get_name, "g_mime_param_get_name", libs);
  gidLink(cast(void**)&g_mime_param_get_value, "g_mime_param_get_value", libs);
  gidLink(cast(void**)&g_mime_param_set_charset, "g_mime_param_set_charset", libs);
  gidLink(cast(void**)&g_mime_param_set_encoding_method, "g_mime_param_set_encoding_method", libs);
  gidLink(cast(void**)&g_mime_param_set_lang, "g_mime_param_set_lang", libs);
  gidLink(cast(void**)&g_mime_param_set_value, "g_mime_param_set_value", libs);

  // ParamList
  gidLink(cast(void**)&g_mime_param_list_get_type, "g_mime_param_list_get_type", libs);
  gidLink(cast(void**)&g_mime_param_list_new, "g_mime_param_list_new", libs);
  gidLink(cast(void**)&g_mime_param_list_parse, "g_mime_param_list_parse", libs);
  gidLink(cast(void**)&g_mime_param_list_clear, "g_mime_param_list_clear", libs);
  gidLink(cast(void**)&g_mime_param_list_encode, "g_mime_param_list_encode", libs);
  gidLink(cast(void**)&g_mime_param_list_get_parameter, "g_mime_param_list_get_parameter", libs);
  gidLink(cast(void**)&g_mime_param_list_get_parameter_at, "g_mime_param_list_get_parameter_at", libs);
  gidLink(cast(void**)&g_mime_param_list_length, "g_mime_param_list_length", libs);
  gidLink(cast(void**)&g_mime_param_list_remove, "g_mime_param_list_remove", libs);
  gidLink(cast(void**)&g_mime_param_list_remove_at, "g_mime_param_list_remove_at", libs);
  gidLink(cast(void**)&g_mime_param_list_set_parameter, "g_mime_param_list_set_parameter", libs);

  // Parser
  gidLink(cast(void**)&g_mime_parser_get_type, "g_mime_parser_get_type", libs);
  gidLink(cast(void**)&g_mime_parser_new, "g_mime_parser_new", libs);
  gidLink(cast(void**)&g_mime_parser_new_with_stream, "g_mime_parser_new_with_stream", libs);
  gidLink(cast(void**)&g_mime_parser_construct_message, "g_mime_parser_construct_message", libs);
  gidLink(cast(void**)&g_mime_parser_construct_part, "g_mime_parser_construct_part", libs);
  gidLink(cast(void**)&g_mime_parser_eos, "g_mime_parser_eos", libs);
  gidLink(cast(void**)&g_mime_parser_get_format, "g_mime_parser_get_format", libs);
  gidLink(cast(void**)&g_mime_parser_get_headers_begin, "g_mime_parser_get_headers_begin", libs);
  gidLink(cast(void**)&g_mime_parser_get_headers_end, "g_mime_parser_get_headers_end", libs);
  gidLink(cast(void**)&g_mime_parser_get_mbox_marker, "g_mime_parser_get_mbox_marker", libs);
  gidLink(cast(void**)&g_mime_parser_get_mbox_marker_offset, "g_mime_parser_get_mbox_marker_offset", libs);
  gidLink(cast(void**)&g_mime_parser_get_persist_stream, "g_mime_parser_get_persist_stream", libs);
  gidLink(cast(void**)&g_mime_parser_get_respect_content_length, "g_mime_parser_get_respect_content_length", libs);
  gidLink(cast(void**)&g_mime_parser_init_with_stream, "g_mime_parser_init_with_stream", libs);
  gidLink(cast(void**)&g_mime_parser_set_format, "g_mime_parser_set_format", libs);
  gidLink(cast(void**)&g_mime_parser_set_header_regex, "g_mime_parser_set_header_regex", libs);
  gidLink(cast(void**)&g_mime_parser_set_persist_stream, "g_mime_parser_set_persist_stream", libs);
  gidLink(cast(void**)&g_mime_parser_set_respect_content_length, "g_mime_parser_set_respect_content_length", libs);
  gidLink(cast(void**)&g_mime_parser_tell, "g_mime_parser_tell", libs);

  // ParserOptions
  gidLink(cast(void**)&g_mime_parser_options_get_type, "g_mime_parser_options_get_type", libs);
  gidLink(cast(void**)&g_mime_parser_options_new, "g_mime_parser_options_new", libs);
  gidLink(cast(void**)&g_mime_parser_options_clone, "g_mime_parser_options_clone", libs);
  gidLink(cast(void**)&g_mime_parser_options_free, "g_mime_parser_options_free", libs);
  gidLink(cast(void**)&g_mime_parser_options_get_address_compliance_mode, "g_mime_parser_options_get_address_compliance_mode", libs);
  gidLink(cast(void**)&g_mime_parser_options_get_allow_addresses_without_domain, "g_mime_parser_options_get_allow_addresses_without_domain", libs);
  gidLink(cast(void**)&g_mime_parser_options_get_fallback_charsets, "g_mime_parser_options_get_fallback_charsets", libs);
  gidLink(cast(void**)&g_mime_parser_options_get_parameter_compliance_mode, "g_mime_parser_options_get_parameter_compliance_mode", libs);
  gidLink(cast(void**)&g_mime_parser_options_get_rfc2047_compliance_mode, "g_mime_parser_options_get_rfc2047_compliance_mode", libs);
  gidLink(cast(void**)&g_mime_parser_options_get_warning_callback, "g_mime_parser_options_get_warning_callback", libs);
  gidLink(cast(void**)&g_mime_parser_options_set_address_compliance_mode, "g_mime_parser_options_set_address_compliance_mode", libs);
  gidLink(cast(void**)&g_mime_parser_options_set_allow_addresses_without_domain, "g_mime_parser_options_set_allow_addresses_without_domain", libs);
  gidLink(cast(void**)&g_mime_parser_options_set_fallback_charsets, "g_mime_parser_options_set_fallback_charsets", libs);
  gidLink(cast(void**)&g_mime_parser_options_set_parameter_compliance_mode, "g_mime_parser_options_set_parameter_compliance_mode", libs);
  gidLink(cast(void**)&g_mime_parser_options_set_rfc2047_compliance_mode, "g_mime_parser_options_set_rfc2047_compliance_mode", libs);
  gidLink(cast(void**)&g_mime_parser_options_set_warning_callback, "g_mime_parser_options_set_warning_callback", libs);
  gidLink(cast(void**)&g_mime_parser_options_get_default, "g_mime_parser_options_get_default", libs);

  // Part
  gidLink(cast(void**)&g_mime_part_get_type, "g_mime_part_get_type", libs);
  gidLink(cast(void**)&g_mime_part_new, "g_mime_part_new", libs);
  gidLink(cast(void**)&g_mime_part_new_with_type, "g_mime_part_new_with_type", libs);
  gidLink(cast(void**)&g_mime_part_get_best_content_encoding, "g_mime_part_get_best_content_encoding", libs);
  gidLink(cast(void**)&g_mime_part_get_content, "g_mime_part_get_content", libs);
  gidLink(cast(void**)&g_mime_part_get_content_description, "g_mime_part_get_content_description", libs);
  gidLink(cast(void**)&g_mime_part_get_content_encoding, "g_mime_part_get_content_encoding", libs);
  gidLink(cast(void**)&g_mime_part_get_content_id, "g_mime_part_get_content_id", libs);
  gidLink(cast(void**)&g_mime_part_get_content_location, "g_mime_part_get_content_location", libs);
  gidLink(cast(void**)&g_mime_part_get_content_md5, "g_mime_part_get_content_md5", libs);
  gidLink(cast(void**)&g_mime_part_get_filename, "g_mime_part_get_filename", libs);
  gidLink(cast(void**)&g_mime_part_get_openpgp_data, "g_mime_part_get_openpgp_data", libs);
  gidLink(cast(void**)&g_mime_part_is_attachment, "g_mime_part_is_attachment", libs);
  gidLink(cast(void**)&g_mime_part_openpgp_decrypt, "g_mime_part_openpgp_decrypt", libs);
  gidLink(cast(void**)&g_mime_part_openpgp_encrypt, "g_mime_part_openpgp_encrypt", libs);
  gidLink(cast(void**)&g_mime_part_openpgp_sign, "g_mime_part_openpgp_sign", libs);
  gidLink(cast(void**)&g_mime_part_openpgp_verify, "g_mime_part_openpgp_verify", libs);
  gidLink(cast(void**)&g_mime_part_set_content, "g_mime_part_set_content", libs);
  gidLink(cast(void**)&g_mime_part_set_content_description, "g_mime_part_set_content_description", libs);
  gidLink(cast(void**)&g_mime_part_set_content_encoding, "g_mime_part_set_content_encoding", libs);
  gidLink(cast(void**)&g_mime_part_set_content_id, "g_mime_part_set_content_id", libs);
  gidLink(cast(void**)&g_mime_part_set_content_location, "g_mime_part_set_content_location", libs);
  gidLink(cast(void**)&g_mime_part_set_content_md5, "g_mime_part_set_content_md5", libs);
  gidLink(cast(void**)&g_mime_part_set_filename, "g_mime_part_set_filename", libs);
  gidLink(cast(void**)&g_mime_part_set_openpgp_data, "g_mime_part_set_openpgp_data", libs);
  gidLink(cast(void**)&g_mime_part_verify_content_md5, "g_mime_part_verify_content_md5", libs);

  // PartIter
  gidLink(cast(void**)&g_mime_part_iter_get_type, "g_mime_part_iter_get_type", libs);
  gidLink(cast(void**)&g_mime_part_iter_new, "g_mime_part_iter_new", libs);
  gidLink(cast(void**)&g_mime_part_iter_clone, "g_mime_part_iter_clone", libs);
  gidLink(cast(void**)&g_mime_part_iter_free, "g_mime_part_iter_free", libs);
  gidLink(cast(void**)&g_mime_part_iter_get_current, "g_mime_part_iter_get_current", libs);
  gidLink(cast(void**)&g_mime_part_iter_get_parent, "g_mime_part_iter_get_parent", libs);
  gidLink(cast(void**)&g_mime_part_iter_get_path, "g_mime_part_iter_get_path", libs);
  gidLink(cast(void**)&g_mime_part_iter_get_toplevel, "g_mime_part_iter_get_toplevel", libs);
  gidLink(cast(void**)&g_mime_part_iter_is_valid, "g_mime_part_iter_is_valid", libs);
  gidLink(cast(void**)&g_mime_part_iter_jump_to, "g_mime_part_iter_jump_to", libs);
  gidLink(cast(void**)&g_mime_part_iter_next, "g_mime_part_iter_next", libs);
  gidLink(cast(void**)&g_mime_part_iter_prev, "g_mime_part_iter_prev", libs);
  gidLink(cast(void**)&g_mime_part_iter_remove, "g_mime_part_iter_remove", libs);
  gidLink(cast(void**)&g_mime_part_iter_replace, "g_mime_part_iter_replace", libs);
  gidLink(cast(void**)&g_mime_part_iter_reset, "g_mime_part_iter_reset", libs);

  // Pkcs7Context
  gidLink(cast(void**)&g_mime_pkcs7_context_get_type, "g_mime_pkcs7_context_get_type", libs);
  gidLink(cast(void**)&g_mime_pkcs7_context_new, "g_mime_pkcs7_context_new", libs);

  // References
  gidLink(cast(void**)&g_mime_references_get_type, "g_mime_references_get_type", libs);
  gidLink(cast(void**)&g_mime_references_new, "g_mime_references_new", libs);
  gidLink(cast(void**)&g_mime_references_append, "g_mime_references_append", libs);
  gidLink(cast(void**)&g_mime_references_clear, "g_mime_references_clear", libs);
  gidLink(cast(void**)&g_mime_references_copy, "g_mime_references_copy", libs);
  gidLink(cast(void**)&g_mime_references_free, "g_mime_references_free", libs);
  gidLink(cast(void**)&g_mime_references_get_message_id, "g_mime_references_get_message_id", libs);
  gidLink(cast(void**)&g_mime_references_length, "g_mime_references_length", libs);
  gidLink(cast(void**)&g_mime_references_set_message_id, "g_mime_references_set_message_id", libs);
  gidLink(cast(void**)&g_mime_references_parse, "g_mime_references_parse", libs);

  // Signature
  gidLink(cast(void**)&g_mime_signature_get_type, "g_mime_signature_get_type", libs);
  gidLink(cast(void**)&g_mime_signature_new, "g_mime_signature_new", libs);
  gidLink(cast(void**)&g_mime_signature_get_certificate, "g_mime_signature_get_certificate", libs);
  gidLink(cast(void**)&g_mime_signature_get_created, "g_mime_signature_get_created", libs);
  gidLink(cast(void**)&g_mime_signature_get_created64, "g_mime_signature_get_created64", libs);
  gidLink(cast(void**)&g_mime_signature_get_expires, "g_mime_signature_get_expires", libs);
  gidLink(cast(void**)&g_mime_signature_get_expires64, "g_mime_signature_get_expires64", libs);
  gidLink(cast(void**)&g_mime_signature_get_status, "g_mime_signature_get_status", libs);
  gidLink(cast(void**)&g_mime_signature_set_certificate, "g_mime_signature_set_certificate", libs);
  gidLink(cast(void**)&g_mime_signature_set_created, "g_mime_signature_set_created", libs);
  gidLink(cast(void**)&g_mime_signature_set_expires, "g_mime_signature_set_expires", libs);
  gidLink(cast(void**)&g_mime_signature_set_status, "g_mime_signature_set_status", libs);

  // SignatureList
  gidLink(cast(void**)&g_mime_signature_list_get_type, "g_mime_signature_list_get_type", libs);
  gidLink(cast(void**)&g_mime_signature_list_new, "g_mime_signature_list_new", libs);
  gidLink(cast(void**)&g_mime_signature_list_add, "g_mime_signature_list_add", libs);
  gidLink(cast(void**)&g_mime_signature_list_clear, "g_mime_signature_list_clear", libs);
  gidLink(cast(void**)&g_mime_signature_list_contains, "g_mime_signature_list_contains", libs);
  gidLink(cast(void**)&g_mime_signature_list_get_signature, "g_mime_signature_list_get_signature", libs);
  gidLink(cast(void**)&g_mime_signature_list_index_of, "g_mime_signature_list_index_of", libs);
  gidLink(cast(void**)&g_mime_signature_list_insert, "g_mime_signature_list_insert", libs);
  gidLink(cast(void**)&g_mime_signature_list_length, "g_mime_signature_list_length", libs);
  gidLink(cast(void**)&g_mime_signature_list_remove, "g_mime_signature_list_remove", libs);
  gidLink(cast(void**)&g_mime_signature_list_remove_at, "g_mime_signature_list_remove_at", libs);
  gidLink(cast(void**)&g_mime_signature_list_set_signature, "g_mime_signature_list_set_signature", libs);

  // Stream
  gidLink(cast(void**)&g_mime_stream_get_type, "g_mime_stream_get_type", libs);
  gidLink(cast(void**)&g_mime_stream_buffer_gets, "g_mime_stream_buffer_gets", libs);
  gidLink(cast(void**)&g_mime_stream_buffer_readln, "g_mime_stream_buffer_readln", libs);
  gidLink(cast(void**)&g_mime_stream_close, "g_mime_stream_close", libs);
  gidLink(cast(void**)&g_mime_stream_construct, "g_mime_stream_construct", libs);
  gidLink(cast(void**)&g_mime_stream_eos, "g_mime_stream_eos", libs);
  gidLink(cast(void**)&g_mime_stream_flush, "g_mime_stream_flush", libs);
  gidLink(cast(void**)&g_mime_stream_length, "g_mime_stream_length", libs);
  gidLink(cast(void**)&g_mime_stream_printf, "g_mime_stream_printf", libs);
  gidLink(cast(void**)&g_mime_stream_read, "g_mime_stream_read", libs);
  gidLink(cast(void**)&g_mime_stream_reset, "g_mime_stream_reset", libs);
  gidLink(cast(void**)&g_mime_stream_seek, "g_mime_stream_seek", libs);
  gidLink(cast(void**)&g_mime_stream_set_bounds, "g_mime_stream_set_bounds", libs);
  gidLink(cast(void**)&g_mime_stream_substream, "g_mime_stream_substream", libs);
  gidLink(cast(void**)&g_mime_stream_tell, "g_mime_stream_tell", libs);
  gidLink(cast(void**)&g_mime_stream_write, "g_mime_stream_write", libs);
  gidLink(cast(void**)&g_mime_stream_write_string, "g_mime_stream_write_string", libs);
  gidLink(cast(void**)&g_mime_stream_write_to_stream, "g_mime_stream_write_to_stream", libs);
  gidLink(cast(void**)&g_mime_stream_writev, "g_mime_stream_writev", libs);

  // StreamBuffer
  gidLink(cast(void**)&g_mime_stream_buffer_get_type, "g_mime_stream_buffer_get_type", libs);
  gidLink(cast(void**)&g_mime_stream_buffer_new, "g_mime_stream_buffer_new", libs);

  // StreamCat
  gidLink(cast(void**)&g_mime_stream_cat_get_type, "g_mime_stream_cat_get_type", libs);
  gidLink(cast(void**)&g_mime_stream_cat_new, "g_mime_stream_cat_new", libs);
  gidLink(cast(void**)&g_mime_stream_cat_add_source, "g_mime_stream_cat_add_source", libs);

  // StreamFile
  gidLink(cast(void**)&g_mime_stream_file_get_type, "g_mime_stream_file_get_type", libs);
  gidLink(cast(void**)&g_mime_stream_file_new, "g_mime_stream_file_new", libs);
  gidLink(cast(void**)&g_mime_stream_file_new_with_bounds, "g_mime_stream_file_new_with_bounds", libs);
  gidLink(cast(void**)&g_mime_stream_file_open, "g_mime_stream_file_open", libs);
  gidLink(cast(void**)&g_mime_stream_file_get_owner, "g_mime_stream_file_get_owner", libs);
  gidLink(cast(void**)&g_mime_stream_file_set_owner, "g_mime_stream_file_set_owner", libs);

  // StreamFilter
  gidLink(cast(void**)&g_mime_stream_filter_get_type, "g_mime_stream_filter_get_type", libs);
  gidLink(cast(void**)&g_mime_stream_filter_new, "g_mime_stream_filter_new", libs);
  gidLink(cast(void**)&g_mime_stream_filter_add, "g_mime_stream_filter_add", libs);
  gidLink(cast(void**)&g_mime_stream_filter_get_owner, "g_mime_stream_filter_get_owner", libs);
  gidLink(cast(void**)&g_mime_stream_filter_remove, "g_mime_stream_filter_remove", libs);
  gidLink(cast(void**)&g_mime_stream_filter_set_owner, "g_mime_stream_filter_set_owner", libs);

  // StreamFs
  gidLink(cast(void**)&g_mime_stream_fs_get_type, "g_mime_stream_fs_get_type", libs);
  gidLink(cast(void**)&g_mime_stream_fs_new, "g_mime_stream_fs_new", libs);
  gidLink(cast(void**)&g_mime_stream_fs_new_with_bounds, "g_mime_stream_fs_new_with_bounds", libs);
  gidLink(cast(void**)&g_mime_stream_fs_open, "g_mime_stream_fs_open", libs);
  gidLink(cast(void**)&g_mime_stream_fs_get_owner, "g_mime_stream_fs_get_owner", libs);
  gidLink(cast(void**)&g_mime_stream_fs_set_owner, "g_mime_stream_fs_set_owner", libs);

  // StreamGIO
  gidLink(cast(void**)&g_mime_stream_gio_get_type, "g_mime_stream_gio_get_type", libs);
  gidLink(cast(void**)&g_mime_stream_gio_new, "g_mime_stream_gio_new", libs);
  gidLink(cast(void**)&g_mime_stream_gio_new_with_bounds, "g_mime_stream_gio_new_with_bounds", libs);
  gidLink(cast(void**)&g_mime_stream_gio_get_owner, "g_mime_stream_gio_get_owner", libs);
  gidLink(cast(void**)&g_mime_stream_gio_set_owner, "g_mime_stream_gio_set_owner", libs);

  // StreamMem
  gidLink(cast(void**)&g_mime_stream_mem_get_type, "g_mime_stream_mem_get_type", libs);
  gidLink(cast(void**)&g_mime_stream_mem_new, "g_mime_stream_mem_new", libs);
  gidLink(cast(void**)&g_mime_stream_mem_new_with_buffer, "g_mime_stream_mem_new_with_buffer", libs);
  gidLink(cast(void**)&g_mime_stream_mem_new_with_byte_array, "g_mime_stream_mem_new_with_byte_array", libs);
  gidLink(cast(void**)&g_mime_stream_mem_get_byte_array, "g_mime_stream_mem_get_byte_array", libs);
  gidLink(cast(void**)&g_mime_stream_mem_get_owner, "g_mime_stream_mem_get_owner", libs);
  gidLink(cast(void**)&g_mime_stream_mem_set_byte_array, "g_mime_stream_mem_set_byte_array", libs);
  gidLink(cast(void**)&g_mime_stream_mem_set_owner, "g_mime_stream_mem_set_owner", libs);

  // StreamMmap
  gidLink(cast(void**)&g_mime_stream_mmap_get_type, "g_mime_stream_mmap_get_type", libs);
  gidLink(cast(void**)&g_mime_stream_mmap_new, "g_mime_stream_mmap_new", libs);
  gidLink(cast(void**)&g_mime_stream_mmap_new_with_bounds, "g_mime_stream_mmap_new_with_bounds", libs);
  gidLink(cast(void**)&g_mime_stream_mmap_get_owner, "g_mime_stream_mmap_get_owner", libs);
  gidLink(cast(void**)&g_mime_stream_mmap_set_owner, "g_mime_stream_mmap_set_owner", libs);

  // StreamNull
  gidLink(cast(void**)&g_mime_stream_null_get_type, "g_mime_stream_null_get_type", libs);
  gidLink(cast(void**)&g_mime_stream_null_new, "g_mime_stream_null_new", libs);
  gidLink(cast(void**)&g_mime_stream_null_get_count_newlines, "g_mime_stream_null_get_count_newlines", libs);
  gidLink(cast(void**)&g_mime_stream_null_set_count_newlines, "g_mime_stream_null_set_count_newlines", libs);

  // StreamPipe
  gidLink(cast(void**)&g_mime_stream_pipe_get_type, "g_mime_stream_pipe_get_type", libs);
  gidLink(cast(void**)&g_mime_stream_pipe_new, "g_mime_stream_pipe_new", libs);
  gidLink(cast(void**)&g_mime_stream_pipe_get_owner, "g_mime_stream_pipe_get_owner", libs);
  gidLink(cast(void**)&g_mime_stream_pipe_set_owner, "g_mime_stream_pipe_set_owner", libs);

  // TextPart
  gidLink(cast(void**)&g_mime_text_part_get_type, "g_mime_text_part_get_type", libs);
  gidLink(cast(void**)&g_mime_text_part_new, "g_mime_text_part_new", libs);
  gidLink(cast(void**)&g_mime_text_part_new_with_subtype, "g_mime_text_part_new_with_subtype", libs);
  gidLink(cast(void**)&g_mime_text_part_get_charset, "g_mime_text_part_get_charset", libs);
  gidLink(cast(void**)&g_mime_text_part_get_text, "g_mime_text_part_get_text", libs);
  gidLink(cast(void**)&g_mime_text_part_set_charset, "g_mime_text_part_set_charset", libs);
  gidLink(cast(void**)&g_mime_text_part_set_text, "g_mime_text_part_set_text", libs);

  // global
  gidLink(cast(void**)&g_mime_check_version, "g_mime_check_version", libs);
  gidLink(cast(void**)&g_mime_content_encoding_from_string, "g_mime_content_encoding_from_string", libs);
  gidLink(cast(void**)&g_mime_content_encoding_to_string, "g_mime_content_encoding_to_string", libs);
  gidLink(cast(void**)&g_mime_iconv_close, "g_mime_iconv_close", libs);
  gidLink(cast(void**)&g_mime_iconv_locale_to_utf8, "g_mime_iconv_locale_to_utf8", libs);
  gidLink(cast(void**)&g_mime_iconv_locale_to_utf8_length, "g_mime_iconv_locale_to_utf8_length", libs);
  gidLink(cast(void**)&g_mime_iconv_open, "g_mime_iconv_open", libs);
  gidLink(cast(void**)&g_mime_iconv_strdup, "g_mime_iconv_strdup", libs);
  gidLink(cast(void**)&g_mime_iconv_strndup, "g_mime_iconv_strndup", libs);
  gidLink(cast(void**)&g_mime_iconv_utf8_to_locale, "g_mime_iconv_utf8_to_locale", libs);
  gidLink(cast(void**)&g_mime_iconv_utf8_to_locale_length, "g_mime_iconv_utf8_to_locale_length", libs);
  gidLink(cast(void**)&g_mime_init, "g_mime_init", libs);
  gidLink(cast(void**)&g_mime_locale_charset, "g_mime_locale_charset", libs);
  gidLink(cast(void**)&g_mime_locale_language, "g_mime_locale_language", libs);
  gidLink(cast(void**)&g_mime_shutdown, "g_mime_shutdown", libs);
  gidLink(cast(void**)&g_mime_utils_best_encoding, "g_mime_utils_best_encoding", libs);
  gidLink(cast(void**)&g_mime_utils_decode_8bit, "g_mime_utils_decode_8bit", libs);
  gidLink(cast(void**)&g_mime_utils_decode_message_id, "g_mime_utils_decode_message_id", libs);
  gidLink(cast(void**)&g_mime_utils_generate_message_id, "g_mime_utils_generate_message_id", libs);
  gidLink(cast(void**)&g_mime_utils_header_decode_date, "g_mime_utils_header_decode_date", libs);
  gidLink(cast(void**)&g_mime_utils_header_decode_phrase, "g_mime_utils_header_decode_phrase", libs);
  gidLink(cast(void**)&g_mime_utils_header_decode_text, "g_mime_utils_header_decode_text", libs);
  gidLink(cast(void**)&g_mime_utils_header_encode_phrase, "g_mime_utils_header_encode_phrase", libs);
  gidLink(cast(void**)&g_mime_utils_header_encode_text, "g_mime_utils_header_encode_text", libs);
  gidLink(cast(void**)&g_mime_utils_header_format_date, "g_mime_utils_header_format_date", libs);
  gidLink(cast(void**)&g_mime_utils_header_printf, "g_mime_utils_header_printf", libs);
  gidLink(cast(void**)&g_mime_utils_header_unfold, "g_mime_utils_header_unfold", libs);
  gidLink(cast(void**)&g_mime_utils_quote_string, "g_mime_utils_quote_string", libs);
  gidLink(cast(void**)&g_mime_utils_structured_header_fold, "g_mime_utils_structured_header_fold", libs);
  gidLink(cast(void**)&g_mime_utils_text_is_8bit, "g_mime_utils_text_is_8bit", libs);
  gidLink(cast(void**)&g_mime_utils_unquote_string, "g_mime_utils_unquote_string", libs);
  gidLink(cast(void**)&g_mime_utils_unstructured_header_fold, "g_mime_utils_unstructured_header_fold", libs);
  gidLink(cast(void**)&g_mime_ydecode_step, "g_mime_ydecode_step", libs);
  gidLink(cast(void**)&g_mime_yencode_close, "g_mime_yencode_close", libs);
  gidLink(cast(void**)&g_mime_yencode_step, "g_mime_yencode_step", libs);
}
