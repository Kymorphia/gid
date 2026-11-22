/// C functions for gmime3 library
module gid.gmime3.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gmime3.c.types;
static import gid.gmime3.c._gidlib_GMime;
public import gid.gio2.c.types;
public import gid.gobject2.c.types;

private immutable LIBS = ["gmime-3.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.gmime3.c._gidlib_GMime.gidLibLinked;

// ApplicationPkcs7Mime
private alias c_g_mime_application_pkcs7_mime_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_application_pkcs7_mime_get_typeFn c_g_mime_application_pkcs7_mime_get_type; ///
private alias c_g_mime_application_pkcs7_mime_newFn = extern(C) GMimeApplicationPkcs7Mime* function(GMimeSecureMimeType type) nothrow;
__gshared c_g_mime_application_pkcs7_mime_newFn c_g_mime_application_pkcs7_mime_new; ///
private alias c_g_mime_application_pkcs7_mime_encryptFn = extern(C) GMimeApplicationPkcs7Mime* function(GMimeObject* entity, GMimeEncryptFlags flags, GPtrArray* recipients, GError** _err) nothrow;
__gshared c_g_mime_application_pkcs7_mime_encryptFn c_g_mime_application_pkcs7_mime_encrypt; ///
private alias c_g_mime_application_pkcs7_mime_signFn = extern(C) GMimeApplicationPkcs7Mime* function(GMimeObject* entity, const(char)* userid, GError** _err) nothrow;
__gshared c_g_mime_application_pkcs7_mime_signFn c_g_mime_application_pkcs7_mime_sign; ///
private alias c_g_mime_application_pkcs7_mime_decryptFn = extern(C) GMimeObject* function(GMimeApplicationPkcs7Mime* pkcs7Mime, GMimeDecryptFlags flags, const(char)* sessionKey, GMimeDecryptResult** result, GError** _err) nothrow;
__gshared c_g_mime_application_pkcs7_mime_decryptFn c_g_mime_application_pkcs7_mime_decrypt; ///
private alias c_g_mime_application_pkcs7_mime_get_smime_typeFn = extern(C) GMimeSecureMimeType function(GMimeApplicationPkcs7Mime* pkcs7Mime) nothrow;
__gshared c_g_mime_application_pkcs7_mime_get_smime_typeFn c_g_mime_application_pkcs7_mime_get_smime_type; ///
private alias c_g_mime_application_pkcs7_mime_verifyFn = extern(C) GMimeSignatureList* function(GMimeApplicationPkcs7Mime* pkcs7Mime, GMimeVerifyFlags flags, GMimeObject** entity, GError** _err) nothrow;
__gshared c_g_mime_application_pkcs7_mime_verifyFn c_g_mime_application_pkcs7_mime_verify; ///

// AutocryptHeader
private alias c_g_mime_autocrypt_header_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_autocrypt_header_get_typeFn c_g_mime_autocrypt_header_get_type; ///
private alias c_g_mime_autocrypt_header_newFn = extern(C) GMimeAutocryptHeader* function() nothrow;
__gshared c_g_mime_autocrypt_header_newFn c_g_mime_autocrypt_header_new; ///
private alias c_g_mime_autocrypt_header_new_from_stringFn = extern(C) GMimeAutocryptHeader* function(const(char)* string_) nothrow;
__gshared c_g_mime_autocrypt_header_new_from_stringFn c_g_mime_autocrypt_header_new_from_string; ///
private alias c_g_mime_autocrypt_header_cloneFn = extern(C) void function(GMimeAutocryptHeader* dst, GMimeAutocryptHeader* src) nothrow;
__gshared c_g_mime_autocrypt_header_cloneFn c_g_mime_autocrypt_header_clone; ///
private alias c_g_mime_autocrypt_header_compareFn = extern(C) int function(GMimeAutocryptHeader* ah1, GMimeAutocryptHeader* ah2) nothrow;
__gshared c_g_mime_autocrypt_header_compareFn c_g_mime_autocrypt_header_compare; ///
private alias c_g_mime_autocrypt_header_get_addressFn = extern(C) GMimeInternetAddressMailbox* function(GMimeAutocryptHeader* ah) nothrow;
__gshared c_g_mime_autocrypt_header_get_addressFn c_g_mime_autocrypt_header_get_address; ///
private alias c_g_mime_autocrypt_header_get_address_as_stringFn = extern(C) const(char)* function(GMimeAutocryptHeader* ah) nothrow;
__gshared c_g_mime_autocrypt_header_get_address_as_stringFn c_g_mime_autocrypt_header_get_address_as_string; ///
private alias c_g_mime_autocrypt_header_get_effective_dateFn = extern(C) GDateTime* function(GMimeAutocryptHeader* ah) nothrow;
__gshared c_g_mime_autocrypt_header_get_effective_dateFn c_g_mime_autocrypt_header_get_effective_date; ///
private alias c_g_mime_autocrypt_header_get_keydataFn = extern(C) GBytes* function(GMimeAutocryptHeader* ah) nothrow;
__gshared c_g_mime_autocrypt_header_get_keydataFn c_g_mime_autocrypt_header_get_keydata; ///
private alias c_g_mime_autocrypt_header_get_prefer_encryptFn = extern(C) GMimeAutocryptPreferEncrypt function(GMimeAutocryptHeader* ah) nothrow;
__gshared c_g_mime_autocrypt_header_get_prefer_encryptFn c_g_mime_autocrypt_header_get_prefer_encrypt; ///
private alias c_g_mime_autocrypt_header_is_completeFn = extern(C) gboolean function(GMimeAutocryptHeader* ah) nothrow;
__gshared c_g_mime_autocrypt_header_is_completeFn c_g_mime_autocrypt_header_is_complete; ///
private alias c_g_mime_autocrypt_header_set_addressFn = extern(C) void function(GMimeAutocryptHeader* ah, GMimeInternetAddressMailbox* address) nothrow;
__gshared c_g_mime_autocrypt_header_set_addressFn c_g_mime_autocrypt_header_set_address; ///
private alias c_g_mime_autocrypt_header_set_address_from_stringFn = extern(C) void function(GMimeAutocryptHeader* ah, const(char)* address) nothrow;
__gshared c_g_mime_autocrypt_header_set_address_from_stringFn c_g_mime_autocrypt_header_set_address_from_string; ///
private alias c_g_mime_autocrypt_header_set_effective_dateFn = extern(C) void function(GMimeAutocryptHeader* ah, GDateTime* effectiveDate) nothrow;
__gshared c_g_mime_autocrypt_header_set_effective_dateFn c_g_mime_autocrypt_header_set_effective_date; ///
private alias c_g_mime_autocrypt_header_set_keydataFn = extern(C) void function(GMimeAutocryptHeader* ah, GBytes* keydata) nothrow;
__gshared c_g_mime_autocrypt_header_set_keydataFn c_g_mime_autocrypt_header_set_keydata; ///
private alias c_g_mime_autocrypt_header_set_prefer_encryptFn = extern(C) void function(GMimeAutocryptHeader* ah, GMimeAutocryptPreferEncrypt pref) nothrow;
__gshared c_g_mime_autocrypt_header_set_prefer_encryptFn c_g_mime_autocrypt_header_set_prefer_encrypt; ///
private alias c_g_mime_autocrypt_header_to_stringFn = extern(C) char* function(GMimeAutocryptHeader* ah, gboolean gossip) nothrow;
__gshared c_g_mime_autocrypt_header_to_stringFn c_g_mime_autocrypt_header_to_string; ///

// AutocryptHeaderList
private alias c_g_mime_autocrypt_header_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_autocrypt_header_list_get_typeFn c_g_mime_autocrypt_header_list_get_type; ///
private alias c_g_mime_autocrypt_header_list_newFn = extern(C) GMimeAutocryptHeaderList* function() nothrow;
__gshared c_g_mime_autocrypt_header_list_newFn c_g_mime_autocrypt_header_list_new; ///
private alias c_g_mime_autocrypt_header_list_addFn = extern(C) void function(GMimeAutocryptHeaderList* list, GMimeAutocryptHeader* header) nothrow;
__gshared c_g_mime_autocrypt_header_list_addFn c_g_mime_autocrypt_header_list_add; ///
private alias c_g_mime_autocrypt_header_list_add_missing_addressesFn = extern(C) uint function(GMimeAutocryptHeaderList* list, GMimeInternetAddressList* addresses) nothrow;
__gshared c_g_mime_autocrypt_header_list_add_missing_addressesFn c_g_mime_autocrypt_header_list_add_missing_addresses; ///
private alias c_g_mime_autocrypt_header_list_get_countFn = extern(C) uint function(GMimeAutocryptHeaderList* list) nothrow;
__gshared c_g_mime_autocrypt_header_list_get_countFn c_g_mime_autocrypt_header_list_get_count; ///
private alias c_g_mime_autocrypt_header_list_get_header_atFn = extern(C) GMimeAutocryptHeader* function(GMimeAutocryptHeaderList* list, uint index) nothrow;
__gshared c_g_mime_autocrypt_header_list_get_header_atFn c_g_mime_autocrypt_header_list_get_header_at; ///
private alias c_g_mime_autocrypt_header_list_get_header_for_addressFn = extern(C) GMimeAutocryptHeader* function(GMimeAutocryptHeaderList* list, GMimeInternetAddressMailbox* mailbox) nothrow;
__gshared c_g_mime_autocrypt_header_list_get_header_for_addressFn c_g_mime_autocrypt_header_list_get_header_for_address; ///
private alias c_g_mime_autocrypt_header_list_remove_incompleteFn = extern(C) void function(GMimeAutocryptHeaderList* list) nothrow;
__gshared c_g_mime_autocrypt_header_list_remove_incompleteFn c_g_mime_autocrypt_header_list_remove_incomplete; ///

// Certificate
private alias c_g_mime_certificate_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_certificate_get_typeFn c_g_mime_certificate_get_type; ///
private alias c_g_mime_certificate_newFn = extern(C) GMimeCertificate* function() nothrow;
__gshared c_g_mime_certificate_newFn c_g_mime_certificate_new; ///
private alias c_g_mime_certificate_get_createdFn = extern(C) long function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_createdFn c_g_mime_certificate_get_created; ///
private alias c_g_mime_certificate_get_created64Fn = extern(C) long function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_created64Fn c_g_mime_certificate_get_created64; ///
private alias c_g_mime_certificate_get_digest_algoFn = extern(C) GMimeDigestAlgo function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_digest_algoFn c_g_mime_certificate_get_digest_algo; ///
private alias c_g_mime_certificate_get_emailFn = extern(C) const(char)* function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_emailFn c_g_mime_certificate_get_email; ///
private alias c_g_mime_certificate_get_expiresFn = extern(C) long function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_expiresFn c_g_mime_certificate_get_expires; ///
private alias c_g_mime_certificate_get_expires64Fn = extern(C) long function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_expires64Fn c_g_mime_certificate_get_expires64; ///
private alias c_g_mime_certificate_get_fingerprintFn = extern(C) const(char)* function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_fingerprintFn c_g_mime_certificate_get_fingerprint; ///
private alias c_g_mime_certificate_get_id_validityFn = extern(C) GMimeValidity function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_id_validityFn c_g_mime_certificate_get_id_validity; ///
private alias c_g_mime_certificate_get_issuer_nameFn = extern(C) const(char)* function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_issuer_nameFn c_g_mime_certificate_get_issuer_name; ///
private alias c_g_mime_certificate_get_issuer_serialFn = extern(C) const(char)* function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_issuer_serialFn c_g_mime_certificate_get_issuer_serial; ///
private alias c_g_mime_certificate_get_key_idFn = extern(C) const(char)* function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_key_idFn c_g_mime_certificate_get_key_id; ///
private alias c_g_mime_certificate_get_nameFn = extern(C) const(char)* function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_nameFn c_g_mime_certificate_get_name; ///
private alias c_g_mime_certificate_get_pubkey_algoFn = extern(C) GMimePubKeyAlgo function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_pubkey_algoFn c_g_mime_certificate_get_pubkey_algo; ///
private alias c_g_mime_certificate_get_trustFn = extern(C) GMimeTrust function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_trustFn c_g_mime_certificate_get_trust; ///
private alias c_g_mime_certificate_get_user_idFn = extern(C) const(char)* function(GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_get_user_idFn c_g_mime_certificate_get_user_id; ///
private alias c_g_mime_certificate_set_createdFn = extern(C) void function(GMimeCertificate* cert, long created) nothrow;
__gshared c_g_mime_certificate_set_createdFn c_g_mime_certificate_set_created; ///
private alias c_g_mime_certificate_set_digest_algoFn = extern(C) void function(GMimeCertificate* cert, GMimeDigestAlgo algo) nothrow;
__gshared c_g_mime_certificate_set_digest_algoFn c_g_mime_certificate_set_digest_algo; ///
private alias c_g_mime_certificate_set_emailFn = extern(C) void function(GMimeCertificate* cert, const(char)* email) nothrow;
__gshared c_g_mime_certificate_set_emailFn c_g_mime_certificate_set_email; ///
private alias c_g_mime_certificate_set_expiresFn = extern(C) void function(GMimeCertificate* cert, long expires) nothrow;
__gshared c_g_mime_certificate_set_expiresFn c_g_mime_certificate_set_expires; ///
private alias c_g_mime_certificate_set_fingerprintFn = extern(C) void function(GMimeCertificate* cert, const(char)* fingerprint) nothrow;
__gshared c_g_mime_certificate_set_fingerprintFn c_g_mime_certificate_set_fingerprint; ///
private alias c_g_mime_certificate_set_id_validityFn = extern(C) void function(GMimeCertificate* cert, GMimeValidity validity) nothrow;
__gshared c_g_mime_certificate_set_id_validityFn c_g_mime_certificate_set_id_validity; ///
private alias c_g_mime_certificate_set_issuer_nameFn = extern(C) void function(GMimeCertificate* cert, const(char)* issuerName) nothrow;
__gshared c_g_mime_certificate_set_issuer_nameFn c_g_mime_certificate_set_issuer_name; ///
private alias c_g_mime_certificate_set_issuer_serialFn = extern(C) void function(GMimeCertificate* cert, const(char)* issuerSerial) nothrow;
__gshared c_g_mime_certificate_set_issuer_serialFn c_g_mime_certificate_set_issuer_serial; ///
private alias c_g_mime_certificate_set_key_idFn = extern(C) void function(GMimeCertificate* cert, const(char)* keyId) nothrow;
__gshared c_g_mime_certificate_set_key_idFn c_g_mime_certificate_set_key_id; ///
private alias c_g_mime_certificate_set_nameFn = extern(C) void function(GMimeCertificate* cert, const(char)* name) nothrow;
__gshared c_g_mime_certificate_set_nameFn c_g_mime_certificate_set_name; ///
private alias c_g_mime_certificate_set_pubkey_algoFn = extern(C) void function(GMimeCertificate* cert, GMimePubKeyAlgo algo) nothrow;
__gshared c_g_mime_certificate_set_pubkey_algoFn c_g_mime_certificate_set_pubkey_algo; ///
private alias c_g_mime_certificate_set_trustFn = extern(C) void function(GMimeCertificate* cert, GMimeTrust trust) nothrow;
__gshared c_g_mime_certificate_set_trustFn c_g_mime_certificate_set_trust; ///
private alias c_g_mime_certificate_set_user_idFn = extern(C) void function(GMimeCertificate* cert, const(char)* userId) nothrow;
__gshared c_g_mime_certificate_set_user_idFn c_g_mime_certificate_set_user_id; ///

// CertificateList
private alias c_g_mime_certificate_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_certificate_list_get_typeFn c_g_mime_certificate_list_get_type; ///
private alias c_g_mime_certificate_list_newFn = extern(C) GMimeCertificateList* function() nothrow;
__gshared c_g_mime_certificate_list_newFn c_g_mime_certificate_list_new; ///
private alias c_g_mime_certificate_list_addFn = extern(C) int function(GMimeCertificateList* list, GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_list_addFn c_g_mime_certificate_list_add; ///
private alias c_g_mime_certificate_list_clearFn = extern(C) void function(GMimeCertificateList* list) nothrow;
__gshared c_g_mime_certificate_list_clearFn c_g_mime_certificate_list_clear; ///
private alias c_g_mime_certificate_list_containsFn = extern(C) gboolean function(GMimeCertificateList* list, GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_list_containsFn c_g_mime_certificate_list_contains; ///
private alias c_g_mime_certificate_list_get_certificateFn = extern(C) GMimeCertificate* function(GMimeCertificateList* list, int index) nothrow;
__gshared c_g_mime_certificate_list_get_certificateFn c_g_mime_certificate_list_get_certificate; ///
private alias c_g_mime_certificate_list_index_ofFn = extern(C) int function(GMimeCertificateList* list, GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_list_index_ofFn c_g_mime_certificate_list_index_of; ///
private alias c_g_mime_certificate_list_insertFn = extern(C) void function(GMimeCertificateList* list, int index, GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_list_insertFn c_g_mime_certificate_list_insert; ///
private alias c_g_mime_certificate_list_lengthFn = extern(C) int function(GMimeCertificateList* list) nothrow;
__gshared c_g_mime_certificate_list_lengthFn c_g_mime_certificate_list_length; ///
private alias c_g_mime_certificate_list_removeFn = extern(C) gboolean function(GMimeCertificateList* list, GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_list_removeFn c_g_mime_certificate_list_remove; ///
private alias c_g_mime_certificate_list_remove_atFn = extern(C) gboolean function(GMimeCertificateList* list, int index) nothrow;
__gshared c_g_mime_certificate_list_remove_atFn c_g_mime_certificate_list_remove_at; ///
private alias c_g_mime_certificate_list_set_certificateFn = extern(C) void function(GMimeCertificateList* list, int index, GMimeCertificate* cert) nothrow;
__gshared c_g_mime_certificate_list_set_certificateFn c_g_mime_certificate_list_set_certificate; ///

// Charset
private alias c_g_mime_charset_best_nameFn = extern(C) const(char)* function(GMimeCharset* charset) nothrow;
__gshared c_g_mime_charset_best_nameFn c_g_mime_charset_best_name; ///
private alias c_g_mime_charset_can_encodeFn = extern(C) gboolean function(GMimeCharset* mask, const(char)* charset, const(char)* text, size_t len) nothrow;
__gshared c_g_mime_charset_can_encodeFn c_g_mime_charset_can_encode; ///
private alias c_g_mime_charset_initFn = extern(C) void function(GMimeCharset* charset) nothrow;
__gshared c_g_mime_charset_initFn c_g_mime_charset_init; ///
private alias c_g_mime_charset_stepFn = extern(C) void function(GMimeCharset* charset, const(char)* inbuf, size_t inlen) nothrow;
__gshared c_g_mime_charset_stepFn c_g_mime_charset_step; ///
private alias c_g_mime_charset_bestFn = extern(C) const(char)* function(const(char)* inbuf, size_t inlen) nothrow;
__gshared c_g_mime_charset_bestFn c_g_mime_charset_best; ///
private alias c_g_mime_charset_canon_nameFn = extern(C) const(char)* function(const(char)* charset) nothrow;
__gshared c_g_mime_charset_canon_nameFn c_g_mime_charset_canon_name; ///
private alias c_g_mime_charset_iconv_nameFn = extern(C) const(char)* function(const(char)* charset) nothrow;
__gshared c_g_mime_charset_iconv_nameFn c_g_mime_charset_iconv_name; ///
private alias c_g_mime_charset_iso_to_windowsFn = extern(C) const(char)* function(const(char)* isocharset) nothrow;
__gshared c_g_mime_charset_iso_to_windowsFn c_g_mime_charset_iso_to_windows; ///
private alias c_g_mime_charset_languageFn = extern(C) const(char)* function(const(char)* charset) nothrow;
__gshared c_g_mime_charset_languageFn c_g_mime_charset_language; ///
private alias c_g_mime_charset_locale_nameFn = extern(C) const(char)* function() nothrow;
__gshared c_g_mime_charset_locale_nameFn c_g_mime_charset_locale_name; ///
private alias c_g_mime_charset_map_initFn = extern(C) void function() nothrow;
__gshared c_g_mime_charset_map_initFn c_g_mime_charset_map_init; ///
private alias c_g_mime_charset_map_shutdownFn = extern(C) void function() nothrow;
__gshared c_g_mime_charset_map_shutdownFn c_g_mime_charset_map_shutdown; ///
private alias c_g_mime_charset_nameFn = extern(C) const(char)* function(const(char)* charset) nothrow;
__gshared c_g_mime_charset_nameFn c_g_mime_charset_name; ///

// ContentDisposition
private alias c_g_mime_content_disposition_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_content_disposition_get_typeFn c_g_mime_content_disposition_get_type; ///
private alias c_g_mime_content_disposition_newFn = extern(C) GMimeContentDisposition* function() nothrow;
__gshared c_g_mime_content_disposition_newFn c_g_mime_content_disposition_new; ///
private alias c_g_mime_content_disposition_parseFn = extern(C) GMimeContentDisposition* function(GMimeParserOptions* options, const(char)* str) nothrow;
__gshared c_g_mime_content_disposition_parseFn c_g_mime_content_disposition_parse; ///
private alias c_g_mime_content_disposition_encodeFn = extern(C) char* function(GMimeContentDisposition* disposition, GMimeFormatOptions* options) nothrow;
__gshared c_g_mime_content_disposition_encodeFn c_g_mime_content_disposition_encode; ///
private alias c_g_mime_content_disposition_get_dispositionFn = extern(C) const(char)* function(GMimeContentDisposition* disposition) nothrow;
__gshared c_g_mime_content_disposition_get_dispositionFn c_g_mime_content_disposition_get_disposition; ///
private alias c_g_mime_content_disposition_get_parameterFn = extern(C) const(char)* function(GMimeContentDisposition* disposition, const(char)* name) nothrow;
__gshared c_g_mime_content_disposition_get_parameterFn c_g_mime_content_disposition_get_parameter; ///
private alias c_g_mime_content_disposition_get_parametersFn = extern(C) GMimeParamList* function(GMimeContentDisposition* disposition) nothrow;
__gshared c_g_mime_content_disposition_get_parametersFn c_g_mime_content_disposition_get_parameters; ///
private alias c_g_mime_content_disposition_is_attachmentFn = extern(C) gboolean function(GMimeContentDisposition* disposition) nothrow;
__gshared c_g_mime_content_disposition_is_attachmentFn c_g_mime_content_disposition_is_attachment; ///
private alias c_g_mime_content_disposition_set_dispositionFn = extern(C) void function(GMimeContentDisposition* disposition, const(char)* value) nothrow;
__gshared c_g_mime_content_disposition_set_dispositionFn c_g_mime_content_disposition_set_disposition; ///
private alias c_g_mime_content_disposition_set_parameterFn = extern(C) void function(GMimeContentDisposition* disposition, const(char)* name, const(char)* value) nothrow;
__gshared c_g_mime_content_disposition_set_parameterFn c_g_mime_content_disposition_set_parameter; ///

// ContentType
private alias c_g_mime_content_type_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_content_type_get_typeFn c_g_mime_content_type_get_type; ///
private alias c_g_mime_content_type_newFn = extern(C) GMimeContentType* function(const(char)* type, const(char)* subtype) nothrow;
__gshared c_g_mime_content_type_newFn c_g_mime_content_type_new; ///
private alias c_g_mime_content_type_parseFn = extern(C) GMimeContentType* function(GMimeParserOptions* options, const(char)* str) nothrow;
__gshared c_g_mime_content_type_parseFn c_g_mime_content_type_parse; ///
private alias c_g_mime_content_type_encodeFn = extern(C) char* function(GMimeContentType* contentType, GMimeFormatOptions* options) nothrow;
__gshared c_g_mime_content_type_encodeFn c_g_mime_content_type_encode; ///
private alias c_g_mime_content_type_get_media_subtypeFn = extern(C) const(char)* function(GMimeContentType* contentType) nothrow;
__gshared c_g_mime_content_type_get_media_subtypeFn c_g_mime_content_type_get_media_subtype; ///
private alias c_g_mime_content_type_get_media_typeFn = extern(C) const(char)* function(GMimeContentType* contentType) nothrow;
__gshared c_g_mime_content_type_get_media_typeFn c_g_mime_content_type_get_media_type; ///
private alias c_g_mime_content_type_get_mime_typeFn = extern(C) char* function(GMimeContentType* contentType) nothrow;
__gshared c_g_mime_content_type_get_mime_typeFn c_g_mime_content_type_get_mime_type; ///
private alias c_g_mime_content_type_get_parameterFn = extern(C) const(char)* function(GMimeContentType* contentType, const(char)* name) nothrow;
__gshared c_g_mime_content_type_get_parameterFn c_g_mime_content_type_get_parameter; ///
private alias c_g_mime_content_type_get_parametersFn = extern(C) GMimeParamList* function(GMimeContentType* contentType) nothrow;
__gshared c_g_mime_content_type_get_parametersFn c_g_mime_content_type_get_parameters; ///
private alias c_g_mime_content_type_is_typeFn = extern(C) gboolean function(GMimeContentType* contentType, const(char)* type, const(char)* subtype) nothrow;
__gshared c_g_mime_content_type_is_typeFn c_g_mime_content_type_is_type; ///
private alias c_g_mime_content_type_set_media_subtypeFn = extern(C) void function(GMimeContentType* contentType, const(char)* subtype) nothrow;
__gshared c_g_mime_content_type_set_media_subtypeFn c_g_mime_content_type_set_media_subtype; ///
private alias c_g_mime_content_type_set_media_typeFn = extern(C) void function(GMimeContentType* contentType, const(char)* type) nothrow;
__gshared c_g_mime_content_type_set_media_typeFn c_g_mime_content_type_set_media_type; ///
private alias c_g_mime_content_type_set_parameterFn = extern(C) void function(GMimeContentType* contentType, const(char)* name, const(char)* value) nothrow;
__gshared c_g_mime_content_type_set_parameterFn c_g_mime_content_type_set_parameter; ///

// CryptoContext
private alias c_g_mime_crypto_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_crypto_context_get_typeFn c_g_mime_crypto_context_get_type; ///
private alias c_g_mime_crypto_context_newFn = extern(C) GMimeCryptoContext* function(const(char)* protocol) nothrow;
__gshared c_g_mime_crypto_context_newFn c_g_mime_crypto_context_new; ///
private alias c_g_mime_crypto_context_registerFn = extern(C) void function(const(char)* protocol, GMimeCryptoContextNewFunc callback) nothrow;
__gshared c_g_mime_crypto_context_registerFn c_g_mime_crypto_context_register; ///
private alias c_g_mime_crypto_context_decryptFn = extern(C) GMimeDecryptResult* function(GMimeCryptoContext* ctx, GMimeDecryptFlags flags, const(char)* sessionKey, GMimeStream* istream, GMimeStream* ostream, GError** _err) nothrow;
__gshared c_g_mime_crypto_context_decryptFn c_g_mime_crypto_context_decrypt; ///
private alias c_g_mime_crypto_context_digest_idFn = extern(C) GMimeDigestAlgo function(GMimeCryptoContext* ctx, const(char)* name) nothrow;
__gshared c_g_mime_crypto_context_digest_idFn c_g_mime_crypto_context_digest_id; ///
private alias c_g_mime_crypto_context_digest_nameFn = extern(C) const(char)* function(GMimeCryptoContext* ctx, GMimeDigestAlgo digest) nothrow;
__gshared c_g_mime_crypto_context_digest_nameFn c_g_mime_crypto_context_digest_name; ///
private alias c_g_mime_crypto_context_encryptFn = extern(C) int function(GMimeCryptoContext* ctx, gboolean sign, const(char)* userid, GMimeEncryptFlags flags, GPtrArray* recipients, GMimeStream* istream, GMimeStream* ostream, GError** _err) nothrow;
__gshared c_g_mime_crypto_context_encryptFn c_g_mime_crypto_context_encrypt; ///
private alias c_g_mime_crypto_context_export_keysFn = extern(C) int function(GMimeCryptoContext* ctx, const(char*)* keys, GMimeStream* ostream, GError** _err) nothrow;
__gshared c_g_mime_crypto_context_export_keysFn c_g_mime_crypto_context_export_keys; ///
private alias c_g_mime_crypto_context_get_encryption_protocolFn = extern(C) const(char)* function(GMimeCryptoContext* ctx) nothrow;
__gshared c_g_mime_crypto_context_get_encryption_protocolFn c_g_mime_crypto_context_get_encryption_protocol; ///
private alias c_g_mime_crypto_context_get_key_exchange_protocolFn = extern(C) const(char)* function(GMimeCryptoContext* ctx) nothrow;
__gshared c_g_mime_crypto_context_get_key_exchange_protocolFn c_g_mime_crypto_context_get_key_exchange_protocol; ///
private alias c_g_mime_crypto_context_get_signature_protocolFn = extern(C) const(char)* function(GMimeCryptoContext* ctx) nothrow;
__gshared c_g_mime_crypto_context_get_signature_protocolFn c_g_mime_crypto_context_get_signature_protocol; ///
private alias c_g_mime_crypto_context_import_keysFn = extern(C) int function(GMimeCryptoContext* ctx, GMimeStream* istream, GError** _err) nothrow;
__gshared c_g_mime_crypto_context_import_keysFn c_g_mime_crypto_context_import_keys; ///
private alias c_g_mime_crypto_context_set_request_passwordFn = extern(C) void function(GMimeCryptoContext* ctx, GMimePasswordRequestFunc requestPasswd) nothrow;
__gshared c_g_mime_crypto_context_set_request_passwordFn c_g_mime_crypto_context_set_request_password; ///
private alias c_g_mime_crypto_context_signFn = extern(C) int function(GMimeCryptoContext* ctx, gboolean detach, const(char)* userid, GMimeStream* istream, GMimeStream* ostream, GError** _err) nothrow;
__gshared c_g_mime_crypto_context_signFn c_g_mime_crypto_context_sign; ///
private alias c_g_mime_crypto_context_verifyFn = extern(C) GMimeSignatureList* function(GMimeCryptoContext* ctx, GMimeVerifyFlags flags, GMimeStream* istream, GMimeStream* sigstream, GMimeStream* ostream, GError** _err) nothrow;
__gshared c_g_mime_crypto_context_verifyFn c_g_mime_crypto_context_verify; ///

// DataWrapper
private alias c_g_mime_data_wrapper_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_data_wrapper_get_typeFn c_g_mime_data_wrapper_get_type; ///
private alias c_g_mime_data_wrapper_newFn = extern(C) GMimeDataWrapper* function() nothrow;
__gshared c_g_mime_data_wrapper_newFn c_g_mime_data_wrapper_new; ///
private alias c_g_mime_data_wrapper_new_with_streamFn = extern(C) GMimeDataWrapper* function(GMimeStream* stream, GMimeContentEncoding encoding) nothrow;
__gshared c_g_mime_data_wrapper_new_with_streamFn c_g_mime_data_wrapper_new_with_stream; ///
private alias c_g_mime_data_wrapper_get_encodingFn = extern(C) GMimeContentEncoding function(GMimeDataWrapper* wrapper) nothrow;
__gshared c_g_mime_data_wrapper_get_encodingFn c_g_mime_data_wrapper_get_encoding; ///
private alias c_g_mime_data_wrapper_get_streamFn = extern(C) GMimeStream* function(GMimeDataWrapper* wrapper) nothrow;
__gshared c_g_mime_data_wrapper_get_streamFn c_g_mime_data_wrapper_get_stream; ///
private alias c_g_mime_data_wrapper_set_encodingFn = extern(C) void function(GMimeDataWrapper* wrapper, GMimeContentEncoding encoding) nothrow;
__gshared c_g_mime_data_wrapper_set_encodingFn c_g_mime_data_wrapper_set_encoding; ///
private alias c_g_mime_data_wrapper_set_streamFn = extern(C) void function(GMimeDataWrapper* wrapper, GMimeStream* stream) nothrow;
__gshared c_g_mime_data_wrapper_set_streamFn c_g_mime_data_wrapper_set_stream; ///
private alias c_g_mime_data_wrapper_write_to_streamFn = extern(C) ptrdiff_t function(GMimeDataWrapper* wrapper, GMimeStream* stream) nothrow;
__gshared c_g_mime_data_wrapper_write_to_streamFn c_g_mime_data_wrapper_write_to_stream; ///

// DecryptResult
private alias c_g_mime_decrypt_result_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_decrypt_result_get_typeFn c_g_mime_decrypt_result_get_type; ///
private alias c_g_mime_decrypt_result_newFn = extern(C) GMimeDecryptResult* function() nothrow;
__gshared c_g_mime_decrypt_result_newFn c_g_mime_decrypt_result_new; ///
private alias c_g_mime_decrypt_result_get_cipherFn = extern(C) GMimeCipherAlgo function(GMimeDecryptResult* result) nothrow;
__gshared c_g_mime_decrypt_result_get_cipherFn c_g_mime_decrypt_result_get_cipher; ///
private alias c_g_mime_decrypt_result_get_mdcFn = extern(C) GMimeDigestAlgo function(GMimeDecryptResult* result) nothrow;
__gshared c_g_mime_decrypt_result_get_mdcFn c_g_mime_decrypt_result_get_mdc; ///
private alias c_g_mime_decrypt_result_get_recipientsFn = extern(C) GMimeCertificateList* function(GMimeDecryptResult* result) nothrow;
__gshared c_g_mime_decrypt_result_get_recipientsFn c_g_mime_decrypt_result_get_recipients; ///
private alias c_g_mime_decrypt_result_get_session_keyFn = extern(C) const(char)* function(GMimeDecryptResult* result) nothrow;
__gshared c_g_mime_decrypt_result_get_session_keyFn c_g_mime_decrypt_result_get_session_key; ///
private alias c_g_mime_decrypt_result_get_signaturesFn = extern(C) GMimeSignatureList* function(GMimeDecryptResult* result) nothrow;
__gshared c_g_mime_decrypt_result_get_signaturesFn c_g_mime_decrypt_result_get_signatures; ///
private alias c_g_mime_decrypt_result_set_cipherFn = extern(C) void function(GMimeDecryptResult* result, GMimeCipherAlgo cipher) nothrow;
__gshared c_g_mime_decrypt_result_set_cipherFn c_g_mime_decrypt_result_set_cipher; ///
private alias c_g_mime_decrypt_result_set_mdcFn = extern(C) void function(GMimeDecryptResult* result, GMimeDigestAlgo mdc) nothrow;
__gshared c_g_mime_decrypt_result_set_mdcFn c_g_mime_decrypt_result_set_mdc; ///
private alias c_g_mime_decrypt_result_set_recipientsFn = extern(C) void function(GMimeDecryptResult* result, GMimeCertificateList* recipients) nothrow;
__gshared c_g_mime_decrypt_result_set_recipientsFn c_g_mime_decrypt_result_set_recipients; ///
private alias c_g_mime_decrypt_result_set_session_keyFn = extern(C) void function(GMimeDecryptResult* result, const(char)* sessionKey) nothrow;
__gshared c_g_mime_decrypt_result_set_session_keyFn c_g_mime_decrypt_result_set_session_key; ///
private alias c_g_mime_decrypt_result_set_signaturesFn = extern(C) void function(GMimeDecryptResult* result, GMimeSignatureList* signatures) nothrow;
__gshared c_g_mime_decrypt_result_set_signaturesFn c_g_mime_decrypt_result_set_signatures; ///

// Encoding
private alias c_g_mime_encoding_flushFn = extern(C) size_t function(GMimeEncoding* state, const(char)* inbuf, size_t inlen, char* outbuf) nothrow;
__gshared c_g_mime_encoding_flushFn c_g_mime_encoding_flush; ///
private alias c_g_mime_encoding_init_decodeFn = extern(C) void function(GMimeEncoding* state, GMimeContentEncoding encoding) nothrow;
__gshared c_g_mime_encoding_init_decodeFn c_g_mime_encoding_init_decode; ///
private alias c_g_mime_encoding_init_encodeFn = extern(C) void function(GMimeEncoding* state, GMimeContentEncoding encoding) nothrow;
__gshared c_g_mime_encoding_init_encodeFn c_g_mime_encoding_init_encode; ///
private alias c_g_mime_encoding_outlenFn = extern(C) size_t function(GMimeEncoding* state, size_t inlen) nothrow;
__gshared c_g_mime_encoding_outlenFn c_g_mime_encoding_outlen; ///
private alias c_g_mime_encoding_resetFn = extern(C) void function(GMimeEncoding* state) nothrow;
__gshared c_g_mime_encoding_resetFn c_g_mime_encoding_reset; ///
private alias c_g_mime_encoding_stepFn = extern(C) size_t function(GMimeEncoding* state, const(char)* inbuf, size_t inlen, char* outbuf) nothrow;
__gshared c_g_mime_encoding_stepFn c_g_mime_encoding_step; ///
private alias c_g_mime_encoding_base64_decode_stepFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) nothrow;
__gshared c_g_mime_encoding_base64_decode_stepFn c_g_mime_encoding_base64_decode_step; ///
private alias c_g_mime_encoding_base64_encode_closeFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) nothrow;
__gshared c_g_mime_encoding_base64_encode_closeFn c_g_mime_encoding_base64_encode_close; ///
private alias c_g_mime_encoding_base64_encode_stepFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) nothrow;
__gshared c_g_mime_encoding_base64_encode_stepFn c_g_mime_encoding_base64_encode_step; ///
private alias c_g_mime_encoding_quoted_decode_stepFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) nothrow;
__gshared c_g_mime_encoding_quoted_decode_stepFn c_g_mime_encoding_quoted_decode_step; ///
private alias c_g_mime_encoding_quoted_encode_closeFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) nothrow;
__gshared c_g_mime_encoding_quoted_encode_closeFn c_g_mime_encoding_quoted_encode_close; ///
private alias c_g_mime_encoding_quoted_encode_stepFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) nothrow;
__gshared c_g_mime_encoding_quoted_encode_stepFn c_g_mime_encoding_quoted_encode_step; ///
private alias c_g_mime_encoding_uudecode_stepFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* save) nothrow;
__gshared c_g_mime_encoding_uudecode_stepFn c_g_mime_encoding_uudecode_step; ///
private alias c_g_mime_encoding_uuencode_closeFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, ubyte* uubuf, int* state, uint* save) nothrow;
__gshared c_g_mime_encoding_uuencode_closeFn c_g_mime_encoding_uuencode_close; ///
private alias c_g_mime_encoding_uuencode_stepFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, ubyte* uubuf, int* state, uint* save) nothrow;
__gshared c_g_mime_encoding_uuencode_stepFn c_g_mime_encoding_uuencode_step; ///

// Filter
private alias c_g_mime_filter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_get_typeFn c_g_mime_filter_get_type; ///
private alias c_g_mime_filter_backupFn = extern(C) void function(GMimeFilter* filter, const(ubyte)* data, size_t length) nothrow;
__gshared c_g_mime_filter_backupFn c_g_mime_filter_backup; ///
private alias c_g_mime_filter_completeFn = extern(C) void function(GMimeFilter* filter, ubyte* inbuf, size_t inlen, size_t prespace, ubyte** outbuf, size_t* outlen, size_t* outprespace) nothrow;
__gshared c_g_mime_filter_completeFn c_g_mime_filter_complete; ///
private alias c_g_mime_filter_copyFn = extern(C) GMimeFilter* function(GMimeFilter* filter) nothrow;
__gshared c_g_mime_filter_copyFn c_g_mime_filter_copy; ///
private alias c_g_mime_filter_filterFn = extern(C) void function(GMimeFilter* filter, ubyte* inbuf, size_t inlen, size_t prespace, ubyte** outbuf, size_t* outlen, size_t* outprespace) nothrow;
__gshared c_g_mime_filter_filterFn c_g_mime_filter_filter; ///
private alias c_g_mime_filter_resetFn = extern(C) void function(GMimeFilter* filter) nothrow;
__gshared c_g_mime_filter_resetFn c_g_mime_filter_reset; ///
private alias c_g_mime_filter_set_sizeFn = extern(C) void function(GMimeFilter* filter, size_t size, gboolean keep) nothrow;
__gshared c_g_mime_filter_set_sizeFn c_g_mime_filter_set_size; ///

// FilterBasic
private alias c_g_mime_filter_basic_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_basic_get_typeFn c_g_mime_filter_basic_get_type; ///
private alias c_g_mime_filter_basic_newFn = extern(C) GMimeFilter* function(GMimeContentEncoding encoding, gboolean encode) nothrow;
__gshared c_g_mime_filter_basic_newFn c_g_mime_filter_basic_new; ///

// FilterBest
private alias c_g_mime_filter_best_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_best_get_typeFn c_g_mime_filter_best_get_type; ///
private alias c_g_mime_filter_best_newFn = extern(C) GMimeFilter* function(GMimeFilterBestFlags flags) nothrow;
__gshared c_g_mime_filter_best_newFn c_g_mime_filter_best_new; ///
private alias c_g_mime_filter_best_charsetFn = extern(C) const(char)* function(GMimeFilterBest* best) nothrow;
__gshared c_g_mime_filter_best_charsetFn c_g_mime_filter_best_charset; ///
private alias c_g_mime_filter_best_encodingFn = extern(C) GMimeContentEncoding function(GMimeFilterBest* best, GMimeEncodingConstraint constraint) nothrow;
__gshared c_g_mime_filter_best_encodingFn c_g_mime_filter_best_encoding; ///

// FilterCharset
private alias c_g_mime_filter_charset_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_charset_get_typeFn c_g_mime_filter_charset_get_type; ///
private alias c_g_mime_filter_charset_newFn = extern(C) GMimeFilter* function(const(char)* fromCharset, const(char)* toCharset) nothrow;
__gshared c_g_mime_filter_charset_newFn c_g_mime_filter_charset_new; ///

// FilterChecksum
private alias c_g_mime_filter_checksum_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_checksum_get_typeFn c_g_mime_filter_checksum_get_type; ///
private alias c_g_mime_filter_checksum_newFn = extern(C) GMimeFilter* function(GChecksumType type) nothrow;
__gshared c_g_mime_filter_checksum_newFn c_g_mime_filter_checksum_new; ///
private alias c_g_mime_filter_checksum_get_digestFn = extern(C) size_t function(GMimeFilterChecksum* checksum, ubyte* digest, size_t len) nothrow;
__gshared c_g_mime_filter_checksum_get_digestFn c_g_mime_filter_checksum_get_digest; ///
private alias c_g_mime_filter_checksum_get_stringFn = extern(C) char* function(GMimeFilterChecksum* checksum) nothrow;
__gshared c_g_mime_filter_checksum_get_stringFn c_g_mime_filter_checksum_get_string; ///

// FilterDos2Unix
private alias c_g_mime_filter_dos2unix_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_dos2unix_get_typeFn c_g_mime_filter_dos2unix_get_type; ///
private alias c_g_mime_filter_dos2unix_newFn = extern(C) GMimeFilter* function(gboolean ensureNewline) nothrow;
__gshared c_g_mime_filter_dos2unix_newFn c_g_mime_filter_dos2unix_new; ///

// FilterEnriched
private alias c_g_mime_filter_enriched_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_enriched_get_typeFn c_g_mime_filter_enriched_get_type; ///
private alias c_g_mime_filter_enriched_newFn = extern(C) GMimeFilter* function(uint flags) nothrow;
__gshared c_g_mime_filter_enriched_newFn c_g_mime_filter_enriched_new; ///

// FilterFrom
private alias c_g_mime_filter_from_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_from_get_typeFn c_g_mime_filter_from_get_type; ///
private alias c_g_mime_filter_from_newFn = extern(C) GMimeFilter* function(GMimeFilterFromMode mode) nothrow;
__gshared c_g_mime_filter_from_newFn c_g_mime_filter_from_new; ///

// FilterGZip
private alias c_g_mime_filter_gzip_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_gzip_get_typeFn c_g_mime_filter_gzip_get_type; ///
private alias c_g_mime_filter_gzip_newFn = extern(C) GMimeFilter* function(GMimeFilterGZipMode mode, int level) nothrow;
__gshared c_g_mime_filter_gzip_newFn c_g_mime_filter_gzip_new; ///
private alias c_g_mime_filter_gzip_get_commentFn = extern(C) const(char)* function(GMimeFilterGZip* gzip) nothrow;
__gshared c_g_mime_filter_gzip_get_commentFn c_g_mime_filter_gzip_get_comment; ///
private alias c_g_mime_filter_gzip_get_filenameFn = extern(C) const(char)* function(GMimeFilterGZip* gzip) nothrow;
__gshared c_g_mime_filter_gzip_get_filenameFn c_g_mime_filter_gzip_get_filename; ///
private alias c_g_mime_filter_gzip_set_commentFn = extern(C) void function(GMimeFilterGZip* gzip, const(char)* comment) nothrow;
__gshared c_g_mime_filter_gzip_set_commentFn c_g_mime_filter_gzip_set_comment; ///
private alias c_g_mime_filter_gzip_set_filenameFn = extern(C) void function(GMimeFilterGZip* gzip, const(char)* filename) nothrow;
__gshared c_g_mime_filter_gzip_set_filenameFn c_g_mime_filter_gzip_set_filename; ///

// FilterHTML
private alias c_g_mime_filter_html_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_html_get_typeFn c_g_mime_filter_html_get_type; ///
private alias c_g_mime_filter_html_newFn = extern(C) GMimeFilter* function(uint flags, uint colour) nothrow;
__gshared c_g_mime_filter_html_newFn c_g_mime_filter_html_new; ///

// FilterOpenPGP
private alias c_g_mime_filter_openpgp_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_openpgp_get_typeFn c_g_mime_filter_openpgp_get_type; ///
private alias c_g_mime_filter_openpgp_newFn = extern(C) GMimeFilter* function() nothrow;
__gshared c_g_mime_filter_openpgp_newFn c_g_mime_filter_openpgp_new; ///
private alias c_g_mime_filter_openpgp_get_begin_offsetFn = extern(C) long function(GMimeFilterOpenPGP* openpgp) nothrow;
__gshared c_g_mime_filter_openpgp_get_begin_offsetFn c_g_mime_filter_openpgp_get_begin_offset; ///
private alias c_g_mime_filter_openpgp_get_data_typeFn = extern(C) GMimeOpenPGPData function(GMimeFilterOpenPGP* openpgp) nothrow;
__gshared c_g_mime_filter_openpgp_get_data_typeFn c_g_mime_filter_openpgp_get_data_type; ///
private alias c_g_mime_filter_openpgp_get_end_offsetFn = extern(C) long function(GMimeFilterOpenPGP* openpgp) nothrow;
__gshared c_g_mime_filter_openpgp_get_end_offsetFn c_g_mime_filter_openpgp_get_end_offset; ///

// FilterSmtpData
private alias c_g_mime_filter_smtp_data_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_smtp_data_get_typeFn c_g_mime_filter_smtp_data_get_type; ///
private alias c_g_mime_filter_smtp_data_newFn = extern(C) GMimeFilter* function() nothrow;
__gshared c_g_mime_filter_smtp_data_newFn c_g_mime_filter_smtp_data_new; ///

// FilterStrip
private alias c_g_mime_filter_strip_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_strip_get_typeFn c_g_mime_filter_strip_get_type; ///
private alias c_g_mime_filter_strip_newFn = extern(C) GMimeFilter* function() nothrow;
__gshared c_g_mime_filter_strip_newFn c_g_mime_filter_strip_new; ///

// FilterUnix2Dos
private alias c_g_mime_filter_unix2dos_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_unix2dos_get_typeFn c_g_mime_filter_unix2dos_get_type; ///
private alias c_g_mime_filter_unix2dos_newFn = extern(C) GMimeFilter* function(gboolean ensureNewline) nothrow;
__gshared c_g_mime_filter_unix2dos_newFn c_g_mime_filter_unix2dos_new; ///

// FilterWindows
private alias c_g_mime_filter_windows_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_windows_get_typeFn c_g_mime_filter_windows_get_type; ///
private alias c_g_mime_filter_windows_newFn = extern(C) GMimeFilter* function(const(char)* claimedCharset) nothrow;
__gshared c_g_mime_filter_windows_newFn c_g_mime_filter_windows_new; ///
private alias c_g_mime_filter_windows_is_windows_charsetFn = extern(C) gboolean function(GMimeFilterWindows* filter) nothrow;
__gshared c_g_mime_filter_windows_is_windows_charsetFn c_g_mime_filter_windows_is_windows_charset; ///
private alias c_g_mime_filter_windows_real_charsetFn = extern(C) const(char)* function(GMimeFilterWindows* filter) nothrow;
__gshared c_g_mime_filter_windows_real_charsetFn c_g_mime_filter_windows_real_charset; ///

// FilterYenc
private alias c_g_mime_filter_yenc_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_filter_yenc_get_typeFn c_g_mime_filter_yenc_get_type; ///
private alias c_g_mime_filter_yenc_newFn = extern(C) GMimeFilter* function(gboolean encode) nothrow;
__gshared c_g_mime_filter_yenc_newFn c_g_mime_filter_yenc_new; ///
private alias c_g_mime_filter_yenc_get_crcFn = extern(C) uint function(GMimeFilterYenc* yenc) nothrow;
__gshared c_g_mime_filter_yenc_get_crcFn c_g_mime_filter_yenc_get_crc; ///
private alias c_g_mime_filter_yenc_get_pcrcFn = extern(C) uint function(GMimeFilterYenc* yenc) nothrow;
__gshared c_g_mime_filter_yenc_get_pcrcFn c_g_mime_filter_yenc_get_pcrc; ///
private alias c_g_mime_filter_yenc_set_crcFn = extern(C) void function(GMimeFilterYenc* yenc, uint crc) nothrow;
__gshared c_g_mime_filter_yenc_set_crcFn c_g_mime_filter_yenc_set_crc; ///
private alias c_g_mime_filter_yenc_set_stateFn = extern(C) void function(GMimeFilterYenc* yenc, int state) nothrow;
__gshared c_g_mime_filter_yenc_set_stateFn c_g_mime_filter_yenc_set_state; ///

// FormatOptions
private alias c_g_mime_format_options_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_format_options_get_typeFn c_g_mime_format_options_get_type; ///
private alias c_g_mime_format_options_newFn = extern(C) GMimeFormatOptions* function() nothrow;
__gshared c_g_mime_format_options_newFn c_g_mime_format_options_new; ///
private alias c_g_mime_format_options_add_hidden_headerFn = extern(C) void function(GMimeFormatOptions* options, const(char)* header) nothrow;
__gshared c_g_mime_format_options_add_hidden_headerFn c_g_mime_format_options_add_hidden_header; ///
private alias c_g_mime_format_options_clear_hidden_headersFn = extern(C) void function(GMimeFormatOptions* options) nothrow;
__gshared c_g_mime_format_options_clear_hidden_headersFn c_g_mime_format_options_clear_hidden_headers; ///
private alias c_g_mime_format_options_cloneFn = extern(C) GMimeFormatOptions* function(GMimeFormatOptions* options) nothrow;
__gshared c_g_mime_format_options_cloneFn c_g_mime_format_options_clone; ///
private alias c_g_mime_format_options_create_newline_filterFn = extern(C) GMimeFilter* function(GMimeFormatOptions* options, gboolean ensureNewline) nothrow;
__gshared c_g_mime_format_options_create_newline_filterFn c_g_mime_format_options_create_newline_filter; ///
private alias c_g_mime_format_options_freeFn = extern(C) void function(GMimeFormatOptions* options) nothrow;
__gshared c_g_mime_format_options_freeFn c_g_mime_format_options_free; ///
private alias c_g_mime_format_options_get_newlineFn = extern(C) const(char)* function(GMimeFormatOptions* options) nothrow;
__gshared c_g_mime_format_options_get_newlineFn c_g_mime_format_options_get_newline; ///
private alias c_g_mime_format_options_get_newline_formatFn = extern(C) GMimeNewLineFormat function(GMimeFormatOptions* options) nothrow;
__gshared c_g_mime_format_options_get_newline_formatFn c_g_mime_format_options_get_newline_format; ///
private alias c_g_mime_format_options_get_param_encoding_methodFn = extern(C) GMimeParamEncodingMethod function(GMimeFormatOptions* options) nothrow;
__gshared c_g_mime_format_options_get_param_encoding_methodFn c_g_mime_format_options_get_param_encoding_method; ///
private alias c_g_mime_format_options_is_hidden_headerFn = extern(C) gboolean function(GMimeFormatOptions* options, const(char)* header) nothrow;
__gshared c_g_mime_format_options_is_hidden_headerFn c_g_mime_format_options_is_hidden_header; ///
private alias c_g_mime_format_options_remove_hidden_headerFn = extern(C) void function(GMimeFormatOptions* options, const(char)* header) nothrow;
__gshared c_g_mime_format_options_remove_hidden_headerFn c_g_mime_format_options_remove_hidden_header; ///
private alias c_g_mime_format_options_set_newline_formatFn = extern(C) void function(GMimeFormatOptions* options, GMimeNewLineFormat newline) nothrow;
__gshared c_g_mime_format_options_set_newline_formatFn c_g_mime_format_options_set_newline_format; ///
private alias c_g_mime_format_options_set_param_encoding_methodFn = extern(C) void function(GMimeFormatOptions* options, GMimeParamEncodingMethod method) nothrow;
__gshared c_g_mime_format_options_set_param_encoding_methodFn c_g_mime_format_options_set_param_encoding_method; ///
private alias c_g_mime_format_options_get_defaultFn = extern(C) GMimeFormatOptions* function() nothrow;
__gshared c_g_mime_format_options_get_defaultFn c_g_mime_format_options_get_default; ///

// GpgContext
private alias c_g_mime_gpg_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_gpg_context_get_typeFn c_g_mime_gpg_context_get_type; ///
private alias c_g_mime_gpg_context_newFn = extern(C) GMimeCryptoContext* function() nothrow;
__gshared c_g_mime_gpg_context_newFn c_g_mime_gpg_context_new; ///

// Header
private alias c_g_mime_header_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_header_get_typeFn c_g_mime_header_get_type; ///
private alias c_g_mime_header_format_addrlistFn = extern(C) char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_format_addrlistFn c_g_mime_header_format_addrlist; ///
private alias c_g_mime_header_format_content_dispositionFn = extern(C) char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_format_content_dispositionFn c_g_mime_header_format_content_disposition; ///
private alias c_g_mime_header_format_content_typeFn = extern(C) char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_format_content_typeFn c_g_mime_header_format_content_type; ///
private alias c_g_mime_header_format_defaultFn = extern(C) char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_format_defaultFn c_g_mime_header_format_default; ///
private alias c_g_mime_header_format_message_idFn = extern(C) char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_format_message_idFn c_g_mime_header_format_message_id; ///
private alias c_g_mime_header_format_newsgroupsFn = extern(C) char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_format_newsgroupsFn c_g_mime_header_format_newsgroups; ///
private alias c_g_mime_header_format_receivedFn = extern(C) char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_format_receivedFn c_g_mime_header_format_received; ///
private alias c_g_mime_header_format_referencesFn = extern(C) char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_format_referencesFn c_g_mime_header_format_references; ///
private alias c_g_mime_header_get_nameFn = extern(C) const(char)* function(GMimeHeader* header) nothrow;
__gshared c_g_mime_header_get_nameFn c_g_mime_header_get_name; ///
private alias c_g_mime_header_get_offsetFn = extern(C) long function(GMimeHeader* header) nothrow;
__gshared c_g_mime_header_get_offsetFn c_g_mime_header_get_offset; ///
private alias c_g_mime_header_get_raw_nameFn = extern(C) const(char)* function(GMimeHeader* header) nothrow;
__gshared c_g_mime_header_get_raw_nameFn c_g_mime_header_get_raw_name; ///
private alias c_g_mime_header_get_raw_valueFn = extern(C) const(char)* function(GMimeHeader* header) nothrow;
__gshared c_g_mime_header_get_raw_valueFn c_g_mime_header_get_raw_value; ///
private alias c_g_mime_header_get_valueFn = extern(C) const(char)* function(GMimeHeader* header) nothrow;
__gshared c_g_mime_header_get_valueFn c_g_mime_header_get_value; ///
private alias c_g_mime_header_set_raw_valueFn = extern(C) void function(GMimeHeader* header, const(char)* rawValue) nothrow;
__gshared c_g_mime_header_set_raw_valueFn c_g_mime_header_set_raw_value; ///
private alias c_g_mime_header_set_valueFn = extern(C) void function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_set_valueFn c_g_mime_header_set_value; ///
private alias c_g_mime_header_write_to_streamFn = extern(C) ptrdiff_t function(GMimeHeader* header, GMimeFormatOptions* options, GMimeStream* stream) nothrow;
__gshared c_g_mime_header_write_to_streamFn c_g_mime_header_write_to_stream; ///

// HeaderList
private alias c_g_mime_header_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_header_list_get_typeFn c_g_mime_header_list_get_type; ///
private alias c_g_mime_header_list_newFn = extern(C) GMimeHeaderList* function(GMimeParserOptions* options) nothrow;
__gshared c_g_mime_header_list_newFn c_g_mime_header_list_new; ///
private alias c_g_mime_header_list_appendFn = extern(C) void function(GMimeHeaderList* headers, const(char)* name, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_list_appendFn c_g_mime_header_list_append; ///
private alias c_g_mime_header_list_clearFn = extern(C) void function(GMimeHeaderList* headers) nothrow;
__gshared c_g_mime_header_list_clearFn c_g_mime_header_list_clear; ///
private alias c_g_mime_header_list_containsFn = extern(C) gboolean function(GMimeHeaderList* headers, const(char)* name) nothrow;
__gshared c_g_mime_header_list_containsFn c_g_mime_header_list_contains; ///
private alias c_g_mime_header_list_get_countFn = extern(C) int function(GMimeHeaderList* headers) nothrow;
__gshared c_g_mime_header_list_get_countFn c_g_mime_header_list_get_count; ///
private alias c_g_mime_header_list_get_headerFn = extern(C) GMimeHeader* function(GMimeHeaderList* headers, const(char)* name) nothrow;
__gshared c_g_mime_header_list_get_headerFn c_g_mime_header_list_get_header; ///
private alias c_g_mime_header_list_get_header_atFn = extern(C) GMimeHeader* function(GMimeHeaderList* headers, int index) nothrow;
__gshared c_g_mime_header_list_get_header_atFn c_g_mime_header_list_get_header_at; ///
private alias c_g_mime_header_list_prependFn = extern(C) void function(GMimeHeaderList* headers, const(char)* name, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_list_prependFn c_g_mime_header_list_prepend; ///
private alias c_g_mime_header_list_removeFn = extern(C) gboolean function(GMimeHeaderList* headers, const(char)* name) nothrow;
__gshared c_g_mime_header_list_removeFn c_g_mime_header_list_remove; ///
private alias c_g_mime_header_list_remove_atFn = extern(C) void function(GMimeHeaderList* headers, int index) nothrow;
__gshared c_g_mime_header_list_remove_atFn c_g_mime_header_list_remove_at; ///
private alias c_g_mime_header_list_setFn = extern(C) void function(GMimeHeaderList* headers, const(char)* name, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_header_list_setFn c_g_mime_header_list_set; ///
private alias c_g_mime_header_list_to_stringFn = extern(C) char* function(GMimeHeaderList* headers, GMimeFormatOptions* options) nothrow;
__gshared c_g_mime_header_list_to_stringFn c_g_mime_header_list_to_string; ///
private alias c_g_mime_header_list_write_to_streamFn = extern(C) ptrdiff_t function(GMimeHeaderList* headers, GMimeFormatOptions* options, GMimeStream* stream) nothrow;
__gshared c_g_mime_header_list_write_to_streamFn c_g_mime_header_list_write_to_stream; ///

// InternetAddress
private alias c_internet_address_get_typeFn = extern(C) GType function() nothrow;
__gshared c_internet_address_get_typeFn c_internet_address_get_type; ///
private alias c_internet_address_get_charsetFn = extern(C) const(char)* function(GMimeInternetAddress* ia) nothrow;
__gshared c_internet_address_get_charsetFn c_internet_address_get_charset; ///
private alias c_internet_address_get_nameFn = extern(C) const(char)* function(GMimeInternetAddress* ia) nothrow;
__gshared c_internet_address_get_nameFn c_internet_address_get_name; ///
private alias c_internet_address_set_charsetFn = extern(C) void function(GMimeInternetAddress* ia, const(char)* charset) nothrow;
__gshared c_internet_address_set_charsetFn c_internet_address_set_charset; ///
private alias c_internet_address_set_nameFn = extern(C) void function(GMimeInternetAddress* ia, const(char)* name) nothrow;
__gshared c_internet_address_set_nameFn c_internet_address_set_name; ///
private alias c_internet_address_to_stringFn = extern(C) char* function(GMimeInternetAddress* ia, GMimeFormatOptions* options, gboolean encode) nothrow;
__gshared c_internet_address_to_stringFn c_internet_address_to_string; ///

// InternetAddressGroup
private alias c_internet_address_group_get_typeFn = extern(C) GType function() nothrow;
__gshared c_internet_address_group_get_typeFn c_internet_address_group_get_type; ///
private alias c_internet_address_group_newFn = extern(C) GMimeInternetAddress* function(const(char)* name) nothrow;
__gshared c_internet_address_group_newFn c_internet_address_group_new; ///
private alias c_internet_address_group_add_memberFn = extern(C) int function(GMimeInternetAddressGroup* group, GMimeInternetAddress* member) nothrow;
__gshared c_internet_address_group_add_memberFn c_internet_address_group_add_member; ///
private alias c_internet_address_group_get_membersFn = extern(C) GMimeInternetAddressList* function(GMimeInternetAddressGroup* group) nothrow;
__gshared c_internet_address_group_get_membersFn c_internet_address_group_get_members; ///
private alias c_internet_address_group_set_membersFn = extern(C) void function(GMimeInternetAddressGroup* group, GMimeInternetAddressList* members) nothrow;
__gshared c_internet_address_group_set_membersFn c_internet_address_group_set_members; ///

// InternetAddressList
private alias c_internet_address_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_internet_address_list_get_typeFn c_internet_address_list_get_type; ///
private alias c_internet_address_list_newFn = extern(C) GMimeInternetAddressList* function() nothrow;
__gshared c_internet_address_list_newFn c_internet_address_list_new; ///
private alias c_internet_address_list_parseFn = extern(C) GMimeInternetAddressList* function(GMimeParserOptions* options, const(char)* str) nothrow;
__gshared c_internet_address_list_parseFn c_internet_address_list_parse; ///
private alias c_internet_address_list_addFn = extern(C) int function(GMimeInternetAddressList* list, GMimeInternetAddress* ia) nothrow;
__gshared c_internet_address_list_addFn c_internet_address_list_add; ///
private alias c_internet_address_list_appendFn = extern(C) void function(GMimeInternetAddressList* list, GMimeInternetAddressList* append) nothrow;
__gshared c_internet_address_list_appendFn c_internet_address_list_append; ///
private alias c_internet_address_list_append_parseFn = extern(C) void function(GMimeInternetAddressList* list, GMimeParserOptions* options, const(char)* str) nothrow;
__gshared c_internet_address_list_append_parseFn c_internet_address_list_append_parse; ///
private alias c_internet_address_list_clearFn = extern(C) void function(GMimeInternetAddressList* list) nothrow;
__gshared c_internet_address_list_clearFn c_internet_address_list_clear; ///
private alias c_internet_address_list_containsFn = extern(C) gboolean function(GMimeInternetAddressList* list, GMimeInternetAddress* ia) nothrow;
__gshared c_internet_address_list_containsFn c_internet_address_list_contains; ///
private alias c_internet_address_list_encodeFn = extern(C) void function(GMimeInternetAddressList* list, GMimeFormatOptions* options, GString* str) nothrow;
__gshared c_internet_address_list_encodeFn c_internet_address_list_encode; ///
private alias c_internet_address_list_get_addressFn = extern(C) GMimeInternetAddress* function(GMimeInternetAddressList* list, int index) nothrow;
__gshared c_internet_address_list_get_addressFn c_internet_address_list_get_address; ///
private alias c_internet_address_list_index_ofFn = extern(C) int function(GMimeInternetAddressList* list, GMimeInternetAddress* ia) nothrow;
__gshared c_internet_address_list_index_ofFn c_internet_address_list_index_of; ///
private alias c_internet_address_list_insertFn = extern(C) void function(GMimeInternetAddressList* list, int index, GMimeInternetAddress* ia) nothrow;
__gshared c_internet_address_list_insertFn c_internet_address_list_insert; ///
private alias c_internet_address_list_lengthFn = extern(C) int function(GMimeInternetAddressList* list) nothrow;
__gshared c_internet_address_list_lengthFn c_internet_address_list_length; ///
private alias c_internet_address_list_prependFn = extern(C) void function(GMimeInternetAddressList* list, GMimeInternetAddressList* prepend) nothrow;
__gshared c_internet_address_list_prependFn c_internet_address_list_prepend; ///
private alias c_internet_address_list_removeFn = extern(C) gboolean function(GMimeInternetAddressList* list, GMimeInternetAddress* ia) nothrow;
__gshared c_internet_address_list_removeFn c_internet_address_list_remove; ///
private alias c_internet_address_list_remove_atFn = extern(C) gboolean function(GMimeInternetAddressList* list, int index) nothrow;
__gshared c_internet_address_list_remove_atFn c_internet_address_list_remove_at; ///
private alias c_internet_address_list_set_addressFn = extern(C) void function(GMimeInternetAddressList* list, int index, GMimeInternetAddress* ia) nothrow;
__gshared c_internet_address_list_set_addressFn c_internet_address_list_set_address; ///
private alias c_internet_address_list_to_stringFn = extern(C) char* function(GMimeInternetAddressList* list, GMimeFormatOptions* options, gboolean encode) nothrow;
__gshared c_internet_address_list_to_stringFn c_internet_address_list_to_string; ///

// InternetAddressMailbox
private alias c_internet_address_mailbox_get_typeFn = extern(C) GType function() nothrow;
__gshared c_internet_address_mailbox_get_typeFn c_internet_address_mailbox_get_type; ///
private alias c_internet_address_mailbox_newFn = extern(C) GMimeInternetAddress* function(const(char)* name, const(char)* addr) nothrow;
__gshared c_internet_address_mailbox_newFn c_internet_address_mailbox_new; ///
private alias c_internet_address_mailbox_get_addrFn = extern(C) const(char)* function(GMimeInternetAddressMailbox* mailbox) nothrow;
__gshared c_internet_address_mailbox_get_addrFn c_internet_address_mailbox_get_addr; ///
private alias c_internet_address_mailbox_get_idn_addrFn = extern(C) const(char)* function(GMimeInternetAddressMailbox* mailbox) nothrow;
__gshared c_internet_address_mailbox_get_idn_addrFn c_internet_address_mailbox_get_idn_addr; ///
private alias c_internet_address_mailbox_set_addrFn = extern(C) void function(GMimeInternetAddressMailbox* mailbox, const(char)* addr) nothrow;
__gshared c_internet_address_mailbox_set_addrFn c_internet_address_mailbox_set_addr; ///

// Message
private alias c_g_mime_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_message_get_typeFn c_g_mime_message_get_type; ///
private alias c_g_mime_message_newFn = extern(C) GMimeMessage* function(gboolean prettyHeaders) nothrow;
__gshared c_g_mime_message_newFn c_g_mime_message_new; ///
private alias c_g_mime_message_add_mailboxFn = extern(C) void function(GMimeMessage* message, GMimeAddressType type, const(char)* name, const(char)* addr) nothrow;
__gshared c_g_mime_message_add_mailboxFn c_g_mime_message_add_mailbox; ///
private alias c_g_mime_message_foreachFn = extern(C) void function(GMimeMessage* message, GMimeObjectForeachFunc callback, void* userData) nothrow;
__gshared c_g_mime_message_foreachFn c_g_mime_message_foreach; ///
private alias c_g_mime_message_get_addressesFn = extern(C) GMimeInternetAddressList* function(GMimeMessage* message, GMimeAddressType type) nothrow;
__gshared c_g_mime_message_get_addressesFn c_g_mime_message_get_addresses; ///
private alias c_g_mime_message_get_all_recipientsFn = extern(C) GMimeInternetAddressList* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_all_recipientsFn c_g_mime_message_get_all_recipients; ///
private alias c_g_mime_message_get_autocrypt_gossip_headersFn = extern(C) GMimeAutocryptHeaderList* function(GMimeMessage* message, GDateTime* now, GMimeDecryptFlags flags, const(char)* sessionKey, GError** _err) nothrow;
__gshared c_g_mime_message_get_autocrypt_gossip_headersFn c_g_mime_message_get_autocrypt_gossip_headers; ///
private alias c_g_mime_message_get_autocrypt_gossip_headers_from_inner_partFn = extern(C) GMimeAutocryptHeaderList* function(GMimeMessage* message, GDateTime* now, GMimeObject* innerPart) nothrow;
__gshared c_g_mime_message_get_autocrypt_gossip_headers_from_inner_partFn c_g_mime_message_get_autocrypt_gossip_headers_from_inner_part; ///
private alias c_g_mime_message_get_autocrypt_headerFn = extern(C) GMimeAutocryptHeader* function(GMimeMessage* message, GDateTime* now) nothrow;
__gshared c_g_mime_message_get_autocrypt_headerFn c_g_mime_message_get_autocrypt_header; ///
private alias c_g_mime_message_get_bccFn = extern(C) GMimeInternetAddressList* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_bccFn c_g_mime_message_get_bcc; ///
private alias c_g_mime_message_get_bodyFn = extern(C) GMimeObject* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_bodyFn c_g_mime_message_get_body; ///
private alias c_g_mime_message_get_ccFn = extern(C) GMimeInternetAddressList* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_ccFn c_g_mime_message_get_cc; ///
private alias c_g_mime_message_get_dateFn = extern(C) GDateTime* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_dateFn c_g_mime_message_get_date; ///
private alias c_g_mime_message_get_fromFn = extern(C) GMimeInternetAddressList* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_fromFn c_g_mime_message_get_from; ///
private alias c_g_mime_message_get_message_idFn = extern(C) const(char)* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_message_idFn c_g_mime_message_get_message_id; ///
private alias c_g_mime_message_get_mime_partFn = extern(C) GMimeObject* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_mime_partFn c_g_mime_message_get_mime_part; ///
private alias c_g_mime_message_get_reply_toFn = extern(C) GMimeInternetAddressList* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_reply_toFn c_g_mime_message_get_reply_to; ///
private alias c_g_mime_message_get_senderFn = extern(C) GMimeInternetAddressList* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_senderFn c_g_mime_message_get_sender; ///
private alias c_g_mime_message_get_subjectFn = extern(C) const(char)* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_subjectFn c_g_mime_message_get_subject; ///
private alias c_g_mime_message_get_toFn = extern(C) GMimeInternetAddressList* function(GMimeMessage* message) nothrow;
__gshared c_g_mime_message_get_toFn c_g_mime_message_get_to; ///
private alias c_g_mime_message_partial_split_messageFn = extern(C) GMimeMessage** function(GMimeMessage* message, size_t maxSize, size_t* nparts) nothrow;
__gshared c_g_mime_message_partial_split_messageFn c_g_mime_message_partial_split_message; ///
private alias c_g_mime_message_set_dateFn = extern(C) void function(GMimeMessage* message, GDateTime* date) nothrow;
__gshared c_g_mime_message_set_dateFn c_g_mime_message_set_date; ///
private alias c_g_mime_message_set_message_idFn = extern(C) void function(GMimeMessage* message, const(char)* messageId) nothrow;
__gshared c_g_mime_message_set_message_idFn c_g_mime_message_set_message_id; ///
private alias c_g_mime_message_set_mime_partFn = extern(C) void function(GMimeMessage* message, GMimeObject* mimePart) nothrow;
__gshared c_g_mime_message_set_mime_partFn c_g_mime_message_set_mime_part; ///
private alias c_g_mime_message_set_subjectFn = extern(C) void function(GMimeMessage* message, const(char)* subject, const(char)* charset) nothrow;
__gshared c_g_mime_message_set_subjectFn c_g_mime_message_set_subject; ///

// MessagePart
private alias c_g_mime_message_part_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_message_part_get_typeFn c_g_mime_message_part_get_type; ///
private alias c_g_mime_message_part_newFn = extern(C) GMimeMessagePart* function(const(char)* subtype) nothrow;
__gshared c_g_mime_message_part_newFn c_g_mime_message_part_new; ///
private alias c_g_mime_message_part_new_with_messageFn = extern(C) GMimeMessagePart* function(const(char)* subtype, GMimeMessage* message) nothrow;
__gshared c_g_mime_message_part_new_with_messageFn c_g_mime_message_part_new_with_message; ///
private alias c_g_mime_message_part_get_messageFn = extern(C) GMimeMessage* function(GMimeMessagePart* part) nothrow;
__gshared c_g_mime_message_part_get_messageFn c_g_mime_message_part_get_message; ///
private alias c_g_mime_message_part_set_messageFn = extern(C) void function(GMimeMessagePart* part, GMimeMessage* message) nothrow;
__gshared c_g_mime_message_part_set_messageFn c_g_mime_message_part_set_message; ///

// MessagePartial
private alias c_g_mime_message_partial_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_message_partial_get_typeFn c_g_mime_message_partial_get_type; ///
private alias c_g_mime_message_partial_newFn = extern(C) GMimeMessagePartial* function(const(char)* id, int number, int total) nothrow;
__gshared c_g_mime_message_partial_newFn c_g_mime_message_partial_new; ///
private alias c_g_mime_message_partial_reconstruct_messageFn = extern(C) GMimeMessage* function(GMimeMessagePartial** partials, size_t num) nothrow;
__gshared c_g_mime_message_partial_reconstruct_messageFn c_g_mime_message_partial_reconstruct_message; ///
private alias c_g_mime_message_partial_get_idFn = extern(C) const(char)* function(GMimeMessagePartial* partial) nothrow;
__gshared c_g_mime_message_partial_get_idFn c_g_mime_message_partial_get_id; ///
private alias c_g_mime_message_partial_get_numberFn = extern(C) int function(GMimeMessagePartial* partial) nothrow;
__gshared c_g_mime_message_partial_get_numberFn c_g_mime_message_partial_get_number; ///
private alias c_g_mime_message_partial_get_totalFn = extern(C) int function(GMimeMessagePartial* partial) nothrow;
__gshared c_g_mime_message_partial_get_totalFn c_g_mime_message_partial_get_total; ///

// Multipart
private alias c_g_mime_multipart_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_multipart_get_typeFn c_g_mime_multipart_get_type; ///
private alias c_g_mime_multipart_newFn = extern(C) GMimeMultipart* function() nothrow;
__gshared c_g_mime_multipart_newFn c_g_mime_multipart_new; ///
private alias c_g_mime_multipart_new_with_subtypeFn = extern(C) GMimeMultipart* function(const(char)* subtype) nothrow;
__gshared c_g_mime_multipart_new_with_subtypeFn c_g_mime_multipart_new_with_subtype; ///
private alias c_g_mime_multipart_addFn = extern(C) void function(GMimeMultipart* multipart, GMimeObject* part) nothrow;
__gshared c_g_mime_multipart_addFn c_g_mime_multipart_add; ///
private alias c_g_mime_multipart_clearFn = extern(C) void function(GMimeMultipart* multipart) nothrow;
__gshared c_g_mime_multipart_clearFn c_g_mime_multipart_clear; ///
private alias c_g_mime_multipart_containsFn = extern(C) gboolean function(GMimeMultipart* multipart, GMimeObject* part) nothrow;
__gshared c_g_mime_multipart_containsFn c_g_mime_multipart_contains; ///
private alias c_g_mime_multipart_foreachFn = extern(C) void function(GMimeMultipart* multipart, GMimeObjectForeachFunc callback, void* userData) nothrow;
__gshared c_g_mime_multipart_foreachFn c_g_mime_multipart_foreach; ///
private alias c_g_mime_multipart_get_boundaryFn = extern(C) const(char)* function(GMimeMultipart* multipart) nothrow;
__gshared c_g_mime_multipart_get_boundaryFn c_g_mime_multipart_get_boundary; ///
private alias c_g_mime_multipart_get_countFn = extern(C) int function(GMimeMultipart* multipart) nothrow;
__gshared c_g_mime_multipart_get_countFn c_g_mime_multipart_get_count; ///
private alias c_g_mime_multipart_get_epilogueFn = extern(C) const(char)* function(GMimeMultipart* multipart) nothrow;
__gshared c_g_mime_multipart_get_epilogueFn c_g_mime_multipart_get_epilogue; ///
private alias c_g_mime_multipart_get_partFn = extern(C) GMimeObject* function(GMimeMultipart* multipart, int index) nothrow;
__gshared c_g_mime_multipart_get_partFn c_g_mime_multipart_get_part; ///
private alias c_g_mime_multipart_get_prologueFn = extern(C) const(char)* function(GMimeMultipart* multipart) nothrow;
__gshared c_g_mime_multipart_get_prologueFn c_g_mime_multipart_get_prologue; ///
private alias c_g_mime_multipart_get_subpart_from_content_idFn = extern(C) GMimeObject* function(GMimeMultipart* multipart, const(char)* contentId) nothrow;
__gshared c_g_mime_multipart_get_subpart_from_content_idFn c_g_mime_multipart_get_subpart_from_content_id; ///
private alias c_g_mime_multipart_index_ofFn = extern(C) int function(GMimeMultipart* multipart, GMimeObject* part) nothrow;
__gshared c_g_mime_multipart_index_ofFn c_g_mime_multipart_index_of; ///
private alias c_g_mime_multipart_insertFn = extern(C) void function(GMimeMultipart* multipart, int index, GMimeObject* part) nothrow;
__gshared c_g_mime_multipart_insertFn c_g_mime_multipart_insert; ///
private alias c_g_mime_multipart_removeFn = extern(C) gboolean function(GMimeMultipart* multipart, GMimeObject* part) nothrow;
__gshared c_g_mime_multipart_removeFn c_g_mime_multipart_remove; ///
private alias c_g_mime_multipart_remove_atFn = extern(C) GMimeObject* function(GMimeMultipart* multipart, int index) nothrow;
__gshared c_g_mime_multipart_remove_atFn c_g_mime_multipart_remove_at; ///
private alias c_g_mime_multipart_replaceFn = extern(C) GMimeObject* function(GMimeMultipart* multipart, int index, GMimeObject* replacement) nothrow;
__gshared c_g_mime_multipart_replaceFn c_g_mime_multipart_replace; ///
private alias c_g_mime_multipart_set_boundaryFn = extern(C) void function(GMimeMultipart* multipart, const(char)* boundary) nothrow;
__gshared c_g_mime_multipart_set_boundaryFn c_g_mime_multipart_set_boundary; ///
private alias c_g_mime_multipart_set_epilogueFn = extern(C) void function(GMimeMultipart* multipart, const(char)* epilogue) nothrow;
__gshared c_g_mime_multipart_set_epilogueFn c_g_mime_multipart_set_epilogue; ///
private alias c_g_mime_multipart_set_prologueFn = extern(C) void function(GMimeMultipart* multipart, const(char)* prologue) nothrow;
__gshared c_g_mime_multipart_set_prologueFn c_g_mime_multipart_set_prologue; ///

// MultipartEncrypted
private alias c_g_mime_multipart_encrypted_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_multipart_encrypted_get_typeFn c_g_mime_multipart_encrypted_get_type; ///
private alias c_g_mime_multipart_encrypted_newFn = extern(C) GMimeMultipartEncrypted* function() nothrow;
__gshared c_g_mime_multipart_encrypted_newFn c_g_mime_multipart_encrypted_new; ///
private alias c_g_mime_multipart_encrypted_encryptFn = extern(C) GMimeMultipartEncrypted* function(GMimeCryptoContext* ctx, GMimeObject* entity, gboolean sign, const(char)* userid, GMimeEncryptFlags flags, GPtrArray* recipients, GError** _err) nothrow;
__gshared c_g_mime_multipart_encrypted_encryptFn c_g_mime_multipart_encrypted_encrypt; ///
private alias c_g_mime_multipart_encrypted_decryptFn = extern(C) GMimeObject* function(GMimeMultipartEncrypted* encrypted, GMimeDecryptFlags flags, const(char)* sessionKey, GMimeDecryptResult** result, GError** _err) nothrow;
__gshared c_g_mime_multipart_encrypted_decryptFn c_g_mime_multipart_encrypted_decrypt; ///

// MultipartSigned
private alias c_g_mime_multipart_signed_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_multipart_signed_get_typeFn c_g_mime_multipart_signed_get_type; ///
private alias c_g_mime_multipart_signed_newFn = extern(C) GMimeMultipartSigned* function() nothrow;
__gshared c_g_mime_multipart_signed_newFn c_g_mime_multipart_signed_new; ///
private alias c_g_mime_multipart_signed_signFn = extern(C) GMimeMultipartSigned* function(GMimeCryptoContext* ctx, GMimeObject* entity, const(char)* userid, GError** _err) nothrow;
__gshared c_g_mime_multipart_signed_signFn c_g_mime_multipart_signed_sign; ///
private alias c_g_mime_multipart_signed_verifyFn = extern(C) GMimeSignatureList* function(GMimeMultipartSigned* mps, GMimeVerifyFlags flags, GError** _err) nothrow;
__gshared c_g_mime_multipart_signed_verifyFn c_g_mime_multipart_signed_verify; ///

// ObjectWrap
private alias c_g_mime_object_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_object_get_typeFn c_g_mime_object_get_type; ///
private alias c_g_mime_object_newFn = extern(C) GMimeObject* function(GMimeParserOptions* options, GMimeContentType* contentType) nothrow;
__gshared c_g_mime_object_newFn c_g_mime_object_new; ///
private alias c_g_mime_object_new_typeFn = extern(C) GMimeObject* function(GMimeParserOptions* options, const(char)* type, const(char)* subtype) nothrow;
__gshared c_g_mime_object_new_typeFn c_g_mime_object_new_type; ///
private alias c_g_mime_object_register_typeFn = extern(C) void function(const(char)* type, const(char)* subtype, GType objectType) nothrow;
__gshared c_g_mime_object_register_typeFn c_g_mime_object_register_type; ///
private alias c_g_mime_object_type_registry_initFn = extern(C) void function() nothrow;
__gshared c_g_mime_object_type_registry_initFn c_g_mime_object_type_registry_init; ///
private alias c_g_mime_object_type_registry_shutdownFn = extern(C) void function() nothrow;
__gshared c_g_mime_object_type_registry_shutdownFn c_g_mime_object_type_registry_shutdown; ///
private alias c_g_mime_object_append_headerFn = extern(C) void function(GMimeObject* object, const(char)* header, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_object_append_headerFn c_g_mime_object_append_header; ///
private alias c_g_mime_object_encodeFn = extern(C) void function(GMimeObject* object, GMimeEncodingConstraint constraint) nothrow;
__gshared c_g_mime_object_encodeFn c_g_mime_object_encode; ///
private alias c_g_mime_object_get_autocrypt_headersFn = extern(C) GMimeAutocryptHeaderList* function(GMimeObject* mimePart, GDateTime* effectiveDate, const(char)* matchheader, GMimeInternetAddressList* addresses, gboolean keepIncomplete) nothrow;
__gshared c_g_mime_object_get_autocrypt_headersFn c_g_mime_object_get_autocrypt_headers; ///
private alias c_g_mime_object_get_content_dispositionFn = extern(C) GMimeContentDisposition* function(GMimeObject* object) nothrow;
__gshared c_g_mime_object_get_content_dispositionFn c_g_mime_object_get_content_disposition; ///
private alias c_g_mime_object_get_content_disposition_parameterFn = extern(C) const(char)* function(GMimeObject* object, const(char)* name) nothrow;
__gshared c_g_mime_object_get_content_disposition_parameterFn c_g_mime_object_get_content_disposition_parameter; ///
private alias c_g_mime_object_get_content_idFn = extern(C) const(char)* function(GMimeObject* object) nothrow;
__gshared c_g_mime_object_get_content_idFn c_g_mime_object_get_content_id; ///
private alias c_g_mime_object_get_content_typeFn = extern(C) GMimeContentType* function(GMimeObject* object) nothrow;
__gshared c_g_mime_object_get_content_typeFn c_g_mime_object_get_content_type; ///
private alias c_g_mime_object_get_content_type_parameterFn = extern(C) const(char)* function(GMimeObject* object, const(char)* name) nothrow;
__gshared c_g_mime_object_get_content_type_parameterFn c_g_mime_object_get_content_type_parameter; ///
private alias c_g_mime_object_get_dispositionFn = extern(C) const(char)* function(GMimeObject* object) nothrow;
__gshared c_g_mime_object_get_dispositionFn c_g_mime_object_get_disposition; ///
private alias c_g_mime_object_get_headerFn = extern(C) const(char)* function(GMimeObject* object, const(char)* header) nothrow;
__gshared c_g_mime_object_get_headerFn c_g_mime_object_get_header; ///
private alias c_g_mime_object_get_header_listFn = extern(C) GMimeHeaderList* function(GMimeObject* object) nothrow;
__gshared c_g_mime_object_get_header_listFn c_g_mime_object_get_header_list; ///
private alias c_g_mime_object_get_headersFn = extern(C) char* function(GMimeObject* object, GMimeFormatOptions* options) nothrow;
__gshared c_g_mime_object_get_headersFn c_g_mime_object_get_headers; ///
private alias c_g_mime_object_prepend_headerFn = extern(C) void function(GMimeObject* object, const(char)* header, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_object_prepend_headerFn c_g_mime_object_prepend_header; ///
private alias c_g_mime_object_remove_headerFn = extern(C) gboolean function(GMimeObject* object, const(char)* header) nothrow;
__gshared c_g_mime_object_remove_headerFn c_g_mime_object_remove_header; ///
private alias c_g_mime_object_set_content_dispositionFn = extern(C) void function(GMimeObject* object, GMimeContentDisposition* disposition) nothrow;
__gshared c_g_mime_object_set_content_dispositionFn c_g_mime_object_set_content_disposition; ///
private alias c_g_mime_object_set_content_disposition_parameterFn = extern(C) void function(GMimeObject* object, const(char)* name, const(char)* value) nothrow;
__gshared c_g_mime_object_set_content_disposition_parameterFn c_g_mime_object_set_content_disposition_parameter; ///
private alias c_g_mime_object_set_content_idFn = extern(C) void function(GMimeObject* object, const(char)* contentId) nothrow;
__gshared c_g_mime_object_set_content_idFn c_g_mime_object_set_content_id; ///
private alias c_g_mime_object_set_content_typeFn = extern(C) void function(GMimeObject* object, GMimeContentType* contentType) nothrow;
__gshared c_g_mime_object_set_content_typeFn c_g_mime_object_set_content_type; ///
private alias c_g_mime_object_set_content_type_parameterFn = extern(C) void function(GMimeObject* object, const(char)* name, const(char)* value) nothrow;
__gshared c_g_mime_object_set_content_type_parameterFn c_g_mime_object_set_content_type_parameter; ///
private alias c_g_mime_object_set_dispositionFn = extern(C) void function(GMimeObject* object, const(char)* disposition) nothrow;
__gshared c_g_mime_object_set_dispositionFn c_g_mime_object_set_disposition; ///
private alias c_g_mime_object_set_headerFn = extern(C) void function(GMimeObject* object, const(char)* header, const(char)* value, const(char)* charset) nothrow;
__gshared c_g_mime_object_set_headerFn c_g_mime_object_set_header; ///
private alias c_g_mime_object_to_stringFn = extern(C) char* function(GMimeObject* object, GMimeFormatOptions* options) nothrow;
__gshared c_g_mime_object_to_stringFn c_g_mime_object_to_string; ///
private alias c_g_mime_object_write_content_to_streamFn = extern(C) ptrdiff_t function(GMimeObject* object, GMimeFormatOptions* options, GMimeStream* stream) nothrow;
__gshared c_g_mime_object_write_content_to_streamFn c_g_mime_object_write_content_to_stream; ///
private alias c_g_mime_object_write_to_streamFn = extern(C) ptrdiff_t function(GMimeObject* object, GMimeFormatOptions* options, GMimeStream* stream) nothrow;
__gshared c_g_mime_object_write_to_streamFn c_g_mime_object_write_to_stream; ///

// Param
private alias c_g_mime_param_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_param_get_typeFn c_g_mime_param_get_type; ///
private alias c_g_mime_param_get_charsetFn = extern(C) const(char)* function(GMimeParam* param) nothrow;
__gshared c_g_mime_param_get_charsetFn c_g_mime_param_get_charset; ///
private alias c_g_mime_param_get_encoding_methodFn = extern(C) GMimeParamEncodingMethod function(GMimeParam* param) nothrow;
__gshared c_g_mime_param_get_encoding_methodFn c_g_mime_param_get_encoding_method; ///
private alias c_g_mime_param_get_langFn = extern(C) const(char)* function(GMimeParam* param) nothrow;
__gshared c_g_mime_param_get_langFn c_g_mime_param_get_lang; ///
private alias c_g_mime_param_get_nameFn = extern(C) const(char)* function(GMimeParam* param) nothrow;
__gshared c_g_mime_param_get_nameFn c_g_mime_param_get_name; ///
private alias c_g_mime_param_get_valueFn = extern(C) const(char)* function(GMimeParam* param) nothrow;
__gshared c_g_mime_param_get_valueFn c_g_mime_param_get_value; ///
private alias c_g_mime_param_set_charsetFn = extern(C) void function(GMimeParam* param, const(char)* charset) nothrow;
__gshared c_g_mime_param_set_charsetFn c_g_mime_param_set_charset; ///
private alias c_g_mime_param_set_encoding_methodFn = extern(C) void function(GMimeParam* param, GMimeParamEncodingMethod method) nothrow;
__gshared c_g_mime_param_set_encoding_methodFn c_g_mime_param_set_encoding_method; ///
private alias c_g_mime_param_set_langFn = extern(C) void function(GMimeParam* param, const(char)* lang) nothrow;
__gshared c_g_mime_param_set_langFn c_g_mime_param_set_lang; ///
private alias c_g_mime_param_set_valueFn = extern(C) void function(GMimeParam* param, const(char)* value) nothrow;
__gshared c_g_mime_param_set_valueFn c_g_mime_param_set_value; ///

// ParamList
private alias c_g_mime_param_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_param_list_get_typeFn c_g_mime_param_list_get_type; ///
private alias c_g_mime_param_list_newFn = extern(C) GMimeParamList* function() nothrow;
__gshared c_g_mime_param_list_newFn c_g_mime_param_list_new; ///
private alias c_g_mime_param_list_parseFn = extern(C) GMimeParamList* function(GMimeParserOptions* options, const(char)* str) nothrow;
__gshared c_g_mime_param_list_parseFn c_g_mime_param_list_parse; ///
private alias c_g_mime_param_list_clearFn = extern(C) void function(GMimeParamList* list) nothrow;
__gshared c_g_mime_param_list_clearFn c_g_mime_param_list_clear; ///
private alias c_g_mime_param_list_encodeFn = extern(C) void function(GMimeParamList* list, GMimeFormatOptions* options, gboolean fold, GString* str) nothrow;
__gshared c_g_mime_param_list_encodeFn c_g_mime_param_list_encode; ///
private alias c_g_mime_param_list_get_parameterFn = extern(C) GMimeParam* function(GMimeParamList* list, const(char)* name) nothrow;
__gshared c_g_mime_param_list_get_parameterFn c_g_mime_param_list_get_parameter; ///
private alias c_g_mime_param_list_get_parameter_atFn = extern(C) GMimeParam* function(GMimeParamList* list, int index) nothrow;
__gshared c_g_mime_param_list_get_parameter_atFn c_g_mime_param_list_get_parameter_at; ///
private alias c_g_mime_param_list_lengthFn = extern(C) int function(GMimeParamList* list) nothrow;
__gshared c_g_mime_param_list_lengthFn c_g_mime_param_list_length; ///
private alias c_g_mime_param_list_removeFn = extern(C) gboolean function(GMimeParamList* list, const(char)* name) nothrow;
__gshared c_g_mime_param_list_removeFn c_g_mime_param_list_remove; ///
private alias c_g_mime_param_list_remove_atFn = extern(C) gboolean function(GMimeParamList* list, int index) nothrow;
__gshared c_g_mime_param_list_remove_atFn c_g_mime_param_list_remove_at; ///
private alias c_g_mime_param_list_set_parameterFn = extern(C) void function(GMimeParamList* list, const(char)* name, const(char)* value) nothrow;
__gshared c_g_mime_param_list_set_parameterFn c_g_mime_param_list_set_parameter; ///

// Parser
private alias c_g_mime_parser_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_parser_get_typeFn c_g_mime_parser_get_type; ///
private alias c_g_mime_parser_newFn = extern(C) GMimeParser* function() nothrow;
__gshared c_g_mime_parser_newFn c_g_mime_parser_new; ///
private alias c_g_mime_parser_new_with_streamFn = extern(C) GMimeParser* function(GMimeStream* stream) nothrow;
__gshared c_g_mime_parser_new_with_streamFn c_g_mime_parser_new_with_stream; ///
private alias c_g_mime_parser_construct_messageFn = extern(C) GMimeMessage* function(GMimeParser* parser, GMimeParserOptions* options) nothrow;
__gshared c_g_mime_parser_construct_messageFn c_g_mime_parser_construct_message; ///
private alias c_g_mime_parser_construct_partFn = extern(C) GMimeObject* function(GMimeParser* parser, GMimeParserOptions* options) nothrow;
__gshared c_g_mime_parser_construct_partFn c_g_mime_parser_construct_part; ///
private alias c_g_mime_parser_eosFn = extern(C) gboolean function(GMimeParser* parser) nothrow;
__gshared c_g_mime_parser_eosFn c_g_mime_parser_eos; ///
private alias c_g_mime_parser_get_formatFn = extern(C) GMimeFormat function(GMimeParser* parser) nothrow;
__gshared c_g_mime_parser_get_formatFn c_g_mime_parser_get_format; ///
private alias c_g_mime_parser_get_headers_beginFn = extern(C) long function(GMimeParser* parser) nothrow;
__gshared c_g_mime_parser_get_headers_beginFn c_g_mime_parser_get_headers_begin; ///
private alias c_g_mime_parser_get_headers_endFn = extern(C) long function(GMimeParser* parser) nothrow;
__gshared c_g_mime_parser_get_headers_endFn c_g_mime_parser_get_headers_end; ///
private alias c_g_mime_parser_get_mbox_markerFn = extern(C) char* function(GMimeParser* parser) nothrow;
__gshared c_g_mime_parser_get_mbox_markerFn c_g_mime_parser_get_mbox_marker; ///
private alias c_g_mime_parser_get_mbox_marker_offsetFn = extern(C) long function(GMimeParser* parser) nothrow;
__gshared c_g_mime_parser_get_mbox_marker_offsetFn c_g_mime_parser_get_mbox_marker_offset; ///
private alias c_g_mime_parser_get_persist_streamFn = extern(C) gboolean function(GMimeParser* parser) nothrow;
__gshared c_g_mime_parser_get_persist_streamFn c_g_mime_parser_get_persist_stream; ///
private alias c_g_mime_parser_get_respect_content_lengthFn = extern(C) gboolean function(GMimeParser* parser) nothrow;
__gshared c_g_mime_parser_get_respect_content_lengthFn c_g_mime_parser_get_respect_content_length; ///
private alias c_g_mime_parser_init_with_streamFn = extern(C) void function(GMimeParser* parser, GMimeStream* stream) nothrow;
__gshared c_g_mime_parser_init_with_streamFn c_g_mime_parser_init_with_stream; ///
private alias c_g_mime_parser_set_formatFn = extern(C) void function(GMimeParser* parser, GMimeFormat format) nothrow;
__gshared c_g_mime_parser_set_formatFn c_g_mime_parser_set_format; ///
private alias c_g_mime_parser_set_header_regexFn = extern(C) void function(GMimeParser* parser, const(char)* regex, GMimeParserHeaderRegexFunc headerCb, void* userData) nothrow;
__gshared c_g_mime_parser_set_header_regexFn c_g_mime_parser_set_header_regex; ///
private alias c_g_mime_parser_set_persist_streamFn = extern(C) void function(GMimeParser* parser, gboolean persist) nothrow;
__gshared c_g_mime_parser_set_persist_streamFn c_g_mime_parser_set_persist_stream; ///
private alias c_g_mime_parser_set_respect_content_lengthFn = extern(C) void function(GMimeParser* parser, gboolean respectContentLength) nothrow;
__gshared c_g_mime_parser_set_respect_content_lengthFn c_g_mime_parser_set_respect_content_length; ///
private alias c_g_mime_parser_tellFn = extern(C) long function(GMimeParser* parser) nothrow;
__gshared c_g_mime_parser_tellFn c_g_mime_parser_tell; ///

// ParserOptions
private alias c_g_mime_parser_options_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_parser_options_get_typeFn c_g_mime_parser_options_get_type; ///
private alias c_g_mime_parser_options_newFn = extern(C) GMimeParserOptions* function() nothrow;
__gshared c_g_mime_parser_options_newFn c_g_mime_parser_options_new; ///
private alias c_g_mime_parser_options_cloneFn = extern(C) GMimeParserOptions* function(GMimeParserOptions* options) nothrow;
__gshared c_g_mime_parser_options_cloneFn c_g_mime_parser_options_clone; ///
private alias c_g_mime_parser_options_freeFn = extern(C) void function(GMimeParserOptions* options) nothrow;
__gshared c_g_mime_parser_options_freeFn c_g_mime_parser_options_free; ///
private alias c_g_mime_parser_options_get_address_compliance_modeFn = extern(C) GMimeRfcComplianceMode function(GMimeParserOptions* options) nothrow;
__gshared c_g_mime_parser_options_get_address_compliance_modeFn c_g_mime_parser_options_get_address_compliance_mode; ///
private alias c_g_mime_parser_options_get_allow_addresses_without_domainFn = extern(C) gboolean function(GMimeParserOptions* options) nothrow;
__gshared c_g_mime_parser_options_get_allow_addresses_without_domainFn c_g_mime_parser_options_get_allow_addresses_without_domain; ///
private alias c_g_mime_parser_options_get_fallback_charsetsFn = extern(C) const(char*)* function(GMimeParserOptions* options) nothrow;
__gshared c_g_mime_parser_options_get_fallback_charsetsFn c_g_mime_parser_options_get_fallback_charsets; ///
private alias c_g_mime_parser_options_get_parameter_compliance_modeFn = extern(C) GMimeRfcComplianceMode function(GMimeParserOptions* options) nothrow;
__gshared c_g_mime_parser_options_get_parameter_compliance_modeFn c_g_mime_parser_options_get_parameter_compliance_mode; ///
private alias c_g_mime_parser_options_get_rfc2047_compliance_modeFn = extern(C) GMimeRfcComplianceMode function(GMimeParserOptions* options) nothrow;
__gshared c_g_mime_parser_options_get_rfc2047_compliance_modeFn c_g_mime_parser_options_get_rfc2047_compliance_mode; ///
private alias c_g_mime_parser_options_get_warning_callbackFn = extern(C) GMimeParserWarningFunc function(GMimeParserOptions* options) nothrow;
__gshared c_g_mime_parser_options_get_warning_callbackFn c_g_mime_parser_options_get_warning_callback; ///
private alias c_g_mime_parser_options_set_address_compliance_modeFn = extern(C) void function(GMimeParserOptions* options, GMimeRfcComplianceMode mode) nothrow;
__gshared c_g_mime_parser_options_set_address_compliance_modeFn c_g_mime_parser_options_set_address_compliance_mode; ///
private alias c_g_mime_parser_options_set_allow_addresses_without_domainFn = extern(C) void function(GMimeParserOptions* options, gboolean allow) nothrow;
__gshared c_g_mime_parser_options_set_allow_addresses_without_domainFn c_g_mime_parser_options_set_allow_addresses_without_domain; ///
private alias c_g_mime_parser_options_set_fallback_charsetsFn = extern(C) void function(GMimeParserOptions* options, const(char*)* charsets) nothrow;
__gshared c_g_mime_parser_options_set_fallback_charsetsFn c_g_mime_parser_options_set_fallback_charsets; ///
private alias c_g_mime_parser_options_set_parameter_compliance_modeFn = extern(C) void function(GMimeParserOptions* options, GMimeRfcComplianceMode mode) nothrow;
__gshared c_g_mime_parser_options_set_parameter_compliance_modeFn c_g_mime_parser_options_set_parameter_compliance_mode; ///
private alias c_g_mime_parser_options_set_rfc2047_compliance_modeFn = extern(C) void function(GMimeParserOptions* options, GMimeRfcComplianceMode mode) nothrow;
__gshared c_g_mime_parser_options_set_rfc2047_compliance_modeFn c_g_mime_parser_options_set_rfc2047_compliance_mode; ///
private alias c_g_mime_parser_options_set_warning_callbackFn = extern(C) void function(GMimeParserOptions* options, GMimeParserWarningFunc warningCb, void* userData, GDestroyNotify notify) nothrow;
__gshared c_g_mime_parser_options_set_warning_callbackFn c_g_mime_parser_options_set_warning_callback; ///
private alias c_g_mime_parser_options_get_defaultFn = extern(C) GMimeParserOptions* function() nothrow;
__gshared c_g_mime_parser_options_get_defaultFn c_g_mime_parser_options_get_default; ///

// Part
private alias c_g_mime_part_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_part_get_typeFn c_g_mime_part_get_type; ///
private alias c_g_mime_part_newFn = extern(C) GMimePart* function() nothrow;
__gshared c_g_mime_part_newFn c_g_mime_part_new; ///
private alias c_g_mime_part_new_with_typeFn = extern(C) GMimePart* function(const(char)* type, const(char)* subtype) nothrow;
__gshared c_g_mime_part_new_with_typeFn c_g_mime_part_new_with_type; ///
private alias c_g_mime_part_get_best_content_encodingFn = extern(C) GMimeContentEncoding function(GMimePart* mimePart, GMimeEncodingConstraint constraint) nothrow;
__gshared c_g_mime_part_get_best_content_encodingFn c_g_mime_part_get_best_content_encoding; ///
private alias c_g_mime_part_get_contentFn = extern(C) GMimeDataWrapper* function(GMimePart* mimePart) nothrow;
__gshared c_g_mime_part_get_contentFn c_g_mime_part_get_content; ///
private alias c_g_mime_part_get_content_descriptionFn = extern(C) const(char)* function(GMimePart* mimePart) nothrow;
__gshared c_g_mime_part_get_content_descriptionFn c_g_mime_part_get_content_description; ///
private alias c_g_mime_part_get_content_encodingFn = extern(C) GMimeContentEncoding function(GMimePart* mimePart) nothrow;
__gshared c_g_mime_part_get_content_encodingFn c_g_mime_part_get_content_encoding; ///
private alias c_g_mime_part_get_content_idFn = extern(C) const(char)* function(GMimePart* mimePart) nothrow;
__gshared c_g_mime_part_get_content_idFn c_g_mime_part_get_content_id; ///
private alias c_g_mime_part_get_content_locationFn = extern(C) const(char)* function(GMimePart* mimePart) nothrow;
__gshared c_g_mime_part_get_content_locationFn c_g_mime_part_get_content_location; ///
private alias c_g_mime_part_get_content_md5Fn = extern(C) const(char)* function(GMimePart* mimePart) nothrow;
__gshared c_g_mime_part_get_content_md5Fn c_g_mime_part_get_content_md5; ///
private alias c_g_mime_part_get_filenameFn = extern(C) const(char)* function(GMimePart* mimePart) nothrow;
__gshared c_g_mime_part_get_filenameFn c_g_mime_part_get_filename; ///
private alias c_g_mime_part_get_openpgp_dataFn = extern(C) GMimeOpenPGPData function(GMimePart* mimePart) nothrow;
__gshared c_g_mime_part_get_openpgp_dataFn c_g_mime_part_get_openpgp_data; ///
private alias c_g_mime_part_is_attachmentFn = extern(C) gboolean function(GMimePart* mimePart) nothrow;
__gshared c_g_mime_part_is_attachmentFn c_g_mime_part_is_attachment; ///
private alias c_g_mime_part_openpgp_decryptFn = extern(C) GMimeDecryptResult* function(GMimePart* mimePart, GMimeDecryptFlags flags, const(char)* sessionKey, GError** _err) nothrow;
__gshared c_g_mime_part_openpgp_decryptFn c_g_mime_part_openpgp_decrypt; ///
private alias c_g_mime_part_openpgp_encryptFn = extern(C) gboolean function(GMimePart* mimePart, gboolean sign, const(char)* userid, GMimeEncryptFlags flags, GPtrArray* recipients, GError** _err) nothrow;
__gshared c_g_mime_part_openpgp_encryptFn c_g_mime_part_openpgp_encrypt; ///
private alias c_g_mime_part_openpgp_signFn = extern(C) gboolean function(GMimePart* mimePart, const(char)* userid, GError** _err) nothrow;
__gshared c_g_mime_part_openpgp_signFn c_g_mime_part_openpgp_sign; ///
private alias c_g_mime_part_openpgp_verifyFn = extern(C) GMimeSignatureList* function(GMimePart* mimePart, GMimeVerifyFlags flags, GError** _err) nothrow;
__gshared c_g_mime_part_openpgp_verifyFn c_g_mime_part_openpgp_verify; ///
private alias c_g_mime_part_set_contentFn = extern(C) void function(GMimePart* mimePart, GMimeDataWrapper* content) nothrow;
__gshared c_g_mime_part_set_contentFn c_g_mime_part_set_content; ///
private alias c_g_mime_part_set_content_descriptionFn = extern(C) void function(GMimePart* mimePart, const(char)* description) nothrow;
__gshared c_g_mime_part_set_content_descriptionFn c_g_mime_part_set_content_description; ///
private alias c_g_mime_part_set_content_encodingFn = extern(C) void function(GMimePart* mimePart, GMimeContentEncoding encoding) nothrow;
__gshared c_g_mime_part_set_content_encodingFn c_g_mime_part_set_content_encoding; ///
private alias c_g_mime_part_set_content_idFn = extern(C) void function(GMimePart* mimePart, const(char)* contentId) nothrow;
__gshared c_g_mime_part_set_content_idFn c_g_mime_part_set_content_id; ///
private alias c_g_mime_part_set_content_locationFn = extern(C) void function(GMimePart* mimePart, const(char)* contentLocation) nothrow;
__gshared c_g_mime_part_set_content_locationFn c_g_mime_part_set_content_location; ///
private alias c_g_mime_part_set_content_md5Fn = extern(C) void function(GMimePart* mimePart, const(char)* contentMd5) nothrow;
__gshared c_g_mime_part_set_content_md5Fn c_g_mime_part_set_content_md5; ///
private alias c_g_mime_part_set_filenameFn = extern(C) void function(GMimePart* mimePart, const(char)* filename) nothrow;
__gshared c_g_mime_part_set_filenameFn c_g_mime_part_set_filename; ///
private alias c_g_mime_part_set_openpgp_dataFn = extern(C) void function(GMimePart* mimePart, GMimeOpenPGPData data) nothrow;
__gshared c_g_mime_part_set_openpgp_dataFn c_g_mime_part_set_openpgp_data; ///
private alias c_g_mime_part_verify_content_md5Fn = extern(C) gboolean function(GMimePart* mimePart) nothrow;
__gshared c_g_mime_part_verify_content_md5Fn c_g_mime_part_verify_content_md5; ///

// PartIter
private alias c_g_mime_part_iter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_part_iter_get_typeFn c_g_mime_part_iter_get_type; ///
private alias c_g_mime_part_iter_newFn = extern(C) GMimePartIter* function(GMimeObject* toplevel) nothrow;
__gshared c_g_mime_part_iter_newFn c_g_mime_part_iter_new; ///
private alias c_g_mime_part_iter_cloneFn = extern(C) GMimePartIter* function(GMimePartIter* iter) nothrow;
__gshared c_g_mime_part_iter_cloneFn c_g_mime_part_iter_clone; ///
private alias c_g_mime_part_iter_freeFn = extern(C) void function(GMimePartIter* iter) nothrow;
__gshared c_g_mime_part_iter_freeFn c_g_mime_part_iter_free; ///
private alias c_g_mime_part_iter_get_currentFn = extern(C) GMimeObject* function(GMimePartIter* iter) nothrow;
__gshared c_g_mime_part_iter_get_currentFn c_g_mime_part_iter_get_current; ///
private alias c_g_mime_part_iter_get_parentFn = extern(C) GMimeObject* function(GMimePartIter* iter) nothrow;
__gshared c_g_mime_part_iter_get_parentFn c_g_mime_part_iter_get_parent; ///
private alias c_g_mime_part_iter_get_pathFn = extern(C) char* function(GMimePartIter* iter) nothrow;
__gshared c_g_mime_part_iter_get_pathFn c_g_mime_part_iter_get_path; ///
private alias c_g_mime_part_iter_get_toplevelFn = extern(C) GMimeObject* function(GMimePartIter* iter) nothrow;
__gshared c_g_mime_part_iter_get_toplevelFn c_g_mime_part_iter_get_toplevel; ///
private alias c_g_mime_part_iter_is_validFn = extern(C) gboolean function(GMimePartIter* iter) nothrow;
__gshared c_g_mime_part_iter_is_validFn c_g_mime_part_iter_is_valid; ///
private alias c_g_mime_part_iter_jump_toFn = extern(C) gboolean function(GMimePartIter* iter, const(char)* path) nothrow;
__gshared c_g_mime_part_iter_jump_toFn c_g_mime_part_iter_jump_to; ///
private alias c_g_mime_part_iter_nextFn = extern(C) gboolean function(GMimePartIter* iter) nothrow;
__gshared c_g_mime_part_iter_nextFn c_g_mime_part_iter_next; ///
private alias c_g_mime_part_iter_prevFn = extern(C) gboolean function(GMimePartIter* iter) nothrow;
__gshared c_g_mime_part_iter_prevFn c_g_mime_part_iter_prev; ///
private alias c_g_mime_part_iter_removeFn = extern(C) gboolean function(GMimePartIter* iter) nothrow;
__gshared c_g_mime_part_iter_removeFn c_g_mime_part_iter_remove; ///
private alias c_g_mime_part_iter_replaceFn = extern(C) gboolean function(GMimePartIter* iter, GMimeObject* replacement) nothrow;
__gshared c_g_mime_part_iter_replaceFn c_g_mime_part_iter_replace; ///
private alias c_g_mime_part_iter_resetFn = extern(C) void function(GMimePartIter* iter) nothrow;
__gshared c_g_mime_part_iter_resetFn c_g_mime_part_iter_reset; ///

// Pkcs7Context
private alias c_g_mime_pkcs7_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_pkcs7_context_get_typeFn c_g_mime_pkcs7_context_get_type; ///
private alias c_g_mime_pkcs7_context_newFn = extern(C) GMimeCryptoContext* function() nothrow;
__gshared c_g_mime_pkcs7_context_newFn c_g_mime_pkcs7_context_new; ///

// References
private alias c_g_mime_references_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_references_get_typeFn c_g_mime_references_get_type; ///
private alias c_g_mime_references_newFn = extern(C) GMimeReferences* function() nothrow;
__gshared c_g_mime_references_newFn c_g_mime_references_new; ///
private alias c_g_mime_references_appendFn = extern(C) void function(GMimeReferences* refs, const(char)* msgid) nothrow;
__gshared c_g_mime_references_appendFn c_g_mime_references_append; ///
private alias c_g_mime_references_clearFn = extern(C) void function(GMimeReferences* refs) nothrow;
__gshared c_g_mime_references_clearFn c_g_mime_references_clear; ///
private alias c_g_mime_references_copyFn = extern(C) GMimeReferences* function(GMimeReferences* refs) nothrow;
__gshared c_g_mime_references_copyFn c_g_mime_references_copy; ///
private alias c_g_mime_references_freeFn = extern(C) void function(GMimeReferences* refs) nothrow;
__gshared c_g_mime_references_freeFn c_g_mime_references_free; ///
private alias c_g_mime_references_get_message_idFn = extern(C) const(char)* function(GMimeReferences* refs, int index) nothrow;
__gshared c_g_mime_references_get_message_idFn c_g_mime_references_get_message_id; ///
private alias c_g_mime_references_lengthFn = extern(C) int function(GMimeReferences* refs) nothrow;
__gshared c_g_mime_references_lengthFn c_g_mime_references_length; ///
private alias c_g_mime_references_set_message_idFn = extern(C) void function(GMimeReferences* refs, int index, const(char)* msgid) nothrow;
__gshared c_g_mime_references_set_message_idFn c_g_mime_references_set_message_id; ///
private alias c_g_mime_references_parseFn = extern(C) GMimeReferences* function(GMimeParserOptions* options, const(char)* text) nothrow;
__gshared c_g_mime_references_parseFn c_g_mime_references_parse; ///

// Signature
private alias c_g_mime_signature_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_signature_get_typeFn c_g_mime_signature_get_type; ///
private alias c_g_mime_signature_newFn = extern(C) GMimeSignature* function() nothrow;
__gshared c_g_mime_signature_newFn c_g_mime_signature_new; ///
private alias c_g_mime_signature_get_certificateFn = extern(C) GMimeCertificate* function(GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_get_certificateFn c_g_mime_signature_get_certificate; ///
private alias c_g_mime_signature_get_createdFn = extern(C) long function(GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_get_createdFn c_g_mime_signature_get_created; ///
private alias c_g_mime_signature_get_created64Fn = extern(C) long function(GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_get_created64Fn c_g_mime_signature_get_created64; ///
private alias c_g_mime_signature_get_expiresFn = extern(C) long function(GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_get_expiresFn c_g_mime_signature_get_expires; ///
private alias c_g_mime_signature_get_expires64Fn = extern(C) long function(GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_get_expires64Fn c_g_mime_signature_get_expires64; ///
private alias c_g_mime_signature_get_statusFn = extern(C) GMimeSignatureStatus function(GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_get_statusFn c_g_mime_signature_get_status; ///
private alias c_g_mime_signature_set_certificateFn = extern(C) void function(GMimeSignature* sig, GMimeCertificate* cert) nothrow;
__gshared c_g_mime_signature_set_certificateFn c_g_mime_signature_set_certificate; ///
private alias c_g_mime_signature_set_createdFn = extern(C) void function(GMimeSignature* sig, long created) nothrow;
__gshared c_g_mime_signature_set_createdFn c_g_mime_signature_set_created; ///
private alias c_g_mime_signature_set_expiresFn = extern(C) void function(GMimeSignature* sig, long expires) nothrow;
__gshared c_g_mime_signature_set_expiresFn c_g_mime_signature_set_expires; ///
private alias c_g_mime_signature_set_statusFn = extern(C) void function(GMimeSignature* sig, GMimeSignatureStatus status) nothrow;
__gshared c_g_mime_signature_set_statusFn c_g_mime_signature_set_status; ///

// SignatureList
private alias c_g_mime_signature_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_signature_list_get_typeFn c_g_mime_signature_list_get_type; ///
private alias c_g_mime_signature_list_newFn = extern(C) GMimeSignatureList* function() nothrow;
__gshared c_g_mime_signature_list_newFn c_g_mime_signature_list_new; ///
private alias c_g_mime_signature_list_addFn = extern(C) int function(GMimeSignatureList* list, GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_list_addFn c_g_mime_signature_list_add; ///
private alias c_g_mime_signature_list_clearFn = extern(C) void function(GMimeSignatureList* list) nothrow;
__gshared c_g_mime_signature_list_clearFn c_g_mime_signature_list_clear; ///
private alias c_g_mime_signature_list_containsFn = extern(C) gboolean function(GMimeSignatureList* list, GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_list_containsFn c_g_mime_signature_list_contains; ///
private alias c_g_mime_signature_list_get_signatureFn = extern(C) GMimeSignature* function(GMimeSignatureList* list, int index) nothrow;
__gshared c_g_mime_signature_list_get_signatureFn c_g_mime_signature_list_get_signature; ///
private alias c_g_mime_signature_list_index_ofFn = extern(C) int function(GMimeSignatureList* list, GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_list_index_ofFn c_g_mime_signature_list_index_of; ///
private alias c_g_mime_signature_list_insertFn = extern(C) void function(GMimeSignatureList* list, int index, GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_list_insertFn c_g_mime_signature_list_insert; ///
private alias c_g_mime_signature_list_lengthFn = extern(C) int function(GMimeSignatureList* list) nothrow;
__gshared c_g_mime_signature_list_lengthFn c_g_mime_signature_list_length; ///
private alias c_g_mime_signature_list_removeFn = extern(C) gboolean function(GMimeSignatureList* list, GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_list_removeFn c_g_mime_signature_list_remove; ///
private alias c_g_mime_signature_list_remove_atFn = extern(C) gboolean function(GMimeSignatureList* list, int index) nothrow;
__gshared c_g_mime_signature_list_remove_atFn c_g_mime_signature_list_remove_at; ///
private alias c_g_mime_signature_list_set_signatureFn = extern(C) void function(GMimeSignatureList* list, int index, GMimeSignature* sig) nothrow;
__gshared c_g_mime_signature_list_set_signatureFn c_g_mime_signature_list_set_signature; ///

// Stream
private alias c_g_mime_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_stream_get_typeFn c_g_mime_stream_get_type; ///
private alias c_g_mime_stream_buffer_getsFn = extern(C) ptrdiff_t function(GMimeStream* stream, ubyte* buf, size_t max) nothrow;
__gshared c_g_mime_stream_buffer_getsFn c_g_mime_stream_buffer_gets; ///
private alias c_g_mime_stream_buffer_readlnFn = extern(C) void function(GMimeStream* stream, GByteArray* buffer) nothrow;
__gshared c_g_mime_stream_buffer_readlnFn c_g_mime_stream_buffer_readln; ///
private alias c_g_mime_stream_closeFn = extern(C) int function(GMimeStream* stream) nothrow;
__gshared c_g_mime_stream_closeFn c_g_mime_stream_close; ///
private alias c_g_mime_stream_constructFn = extern(C) void function(GMimeStream* stream, long start, long end) nothrow;
__gshared c_g_mime_stream_constructFn c_g_mime_stream_construct; ///
private alias c_g_mime_stream_eosFn = extern(C) gboolean function(GMimeStream* stream) nothrow;
__gshared c_g_mime_stream_eosFn c_g_mime_stream_eos; ///
private alias c_g_mime_stream_flushFn = extern(C) int function(GMimeStream* stream) nothrow;
__gshared c_g_mime_stream_flushFn c_g_mime_stream_flush; ///
private alias c_g_mime_stream_lengthFn = extern(C) long function(GMimeStream* stream) nothrow;
__gshared c_g_mime_stream_lengthFn c_g_mime_stream_length; ///
private alias c_g_mime_stream_printfFn = extern(C) ptrdiff_t function(GMimeStream* stream, const(char)* fmt,  ...) nothrow;
__gshared c_g_mime_stream_printfFn c_g_mime_stream_printf; ///
private alias c_g_mime_stream_readFn = extern(C) ptrdiff_t function(GMimeStream* stream, ubyte* buf, size_t len) nothrow;
__gshared c_g_mime_stream_readFn c_g_mime_stream_read; ///
private alias c_g_mime_stream_resetFn = extern(C) int function(GMimeStream* stream) nothrow;
__gshared c_g_mime_stream_resetFn c_g_mime_stream_reset; ///
private alias c_g_mime_stream_seekFn = extern(C) long function(GMimeStream* stream, long offset, GMimeSeekWhence whence) nothrow;
__gshared c_g_mime_stream_seekFn c_g_mime_stream_seek; ///
private alias c_g_mime_stream_set_boundsFn = extern(C) void function(GMimeStream* stream, long start, long end) nothrow;
__gshared c_g_mime_stream_set_boundsFn c_g_mime_stream_set_bounds; ///
private alias c_g_mime_stream_substreamFn = extern(C) GMimeStream* function(GMimeStream* stream, long start, long end) nothrow;
__gshared c_g_mime_stream_substreamFn c_g_mime_stream_substream; ///
private alias c_g_mime_stream_tellFn = extern(C) long function(GMimeStream* stream) nothrow;
__gshared c_g_mime_stream_tellFn c_g_mime_stream_tell; ///
private alias c_g_mime_stream_writeFn = extern(C) ptrdiff_t function(GMimeStream* stream, const(ubyte)* buf, size_t len) nothrow;
__gshared c_g_mime_stream_writeFn c_g_mime_stream_write; ///
private alias c_g_mime_stream_write_stringFn = extern(C) ptrdiff_t function(GMimeStream* stream, const(char)* str) nothrow;
__gshared c_g_mime_stream_write_stringFn c_g_mime_stream_write_string; ///
private alias c_g_mime_stream_write_to_streamFn = extern(C) long function(GMimeStream* src, GMimeStream* dest) nothrow;
__gshared c_g_mime_stream_write_to_streamFn c_g_mime_stream_write_to_stream; ///
private alias c_g_mime_stream_writevFn = extern(C) long function(GMimeStream* stream, GMimeStreamIOVector* vector, size_t count) nothrow;
__gshared c_g_mime_stream_writevFn c_g_mime_stream_writev; ///

// StreamBuffer
private alias c_g_mime_stream_buffer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_stream_buffer_get_typeFn c_g_mime_stream_buffer_get_type; ///
private alias c_g_mime_stream_buffer_newFn = extern(C) GMimeStream* function(GMimeStream* source, GMimeStreamBufferMode mode) nothrow;
__gshared c_g_mime_stream_buffer_newFn c_g_mime_stream_buffer_new; ///

// StreamCat
private alias c_g_mime_stream_cat_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_stream_cat_get_typeFn c_g_mime_stream_cat_get_type; ///
private alias c_g_mime_stream_cat_newFn = extern(C) GMimeStream* function() nothrow;
__gshared c_g_mime_stream_cat_newFn c_g_mime_stream_cat_new; ///
private alias c_g_mime_stream_cat_add_sourceFn = extern(C) int function(GMimeStreamCat* cat, GMimeStream* source) nothrow;
__gshared c_g_mime_stream_cat_add_sourceFn c_g_mime_stream_cat_add_source; ///

// StreamFile
private alias c_g_mime_stream_file_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_stream_file_get_typeFn c_g_mime_stream_file_get_type; ///
private alias c_g_mime_stream_file_newFn = extern(C) GMimeStream* function(void* fp) nothrow;
__gshared c_g_mime_stream_file_newFn c_g_mime_stream_file_new; ///
private alias c_g_mime_stream_file_new_with_boundsFn = extern(C) GMimeStream* function(void* fp, long start, long end) nothrow;
__gshared c_g_mime_stream_file_new_with_boundsFn c_g_mime_stream_file_new_with_bounds; ///
private alias c_g_mime_stream_file_openFn = extern(C) GMimeStream* function(const(char)* path, const(char)* mode, GError** _err) nothrow;
__gshared c_g_mime_stream_file_openFn c_g_mime_stream_file_open; ///
private alias c_g_mime_stream_file_get_ownerFn = extern(C) gboolean function(GMimeStreamFile* stream) nothrow;
__gshared c_g_mime_stream_file_get_ownerFn c_g_mime_stream_file_get_owner; ///
private alias c_g_mime_stream_file_set_ownerFn = extern(C) void function(GMimeStreamFile* stream, gboolean owner) nothrow;
__gshared c_g_mime_stream_file_set_ownerFn c_g_mime_stream_file_set_owner; ///

// StreamFilter
private alias c_g_mime_stream_filter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_stream_filter_get_typeFn c_g_mime_stream_filter_get_type; ///
private alias c_g_mime_stream_filter_newFn = extern(C) GMimeStream* function(GMimeStream* stream) nothrow;
__gshared c_g_mime_stream_filter_newFn c_g_mime_stream_filter_new; ///
private alias c_g_mime_stream_filter_addFn = extern(C) int function(GMimeStreamFilter* stream, GMimeFilter* filter) nothrow;
__gshared c_g_mime_stream_filter_addFn c_g_mime_stream_filter_add; ///
private alias c_g_mime_stream_filter_get_ownerFn = extern(C) gboolean function(GMimeStreamFilter* stream) nothrow;
__gshared c_g_mime_stream_filter_get_ownerFn c_g_mime_stream_filter_get_owner; ///
private alias c_g_mime_stream_filter_removeFn = extern(C) void function(GMimeStreamFilter* stream, int id) nothrow;
__gshared c_g_mime_stream_filter_removeFn c_g_mime_stream_filter_remove; ///
private alias c_g_mime_stream_filter_set_ownerFn = extern(C) void function(GMimeStreamFilter* stream, gboolean owner) nothrow;
__gshared c_g_mime_stream_filter_set_ownerFn c_g_mime_stream_filter_set_owner; ///

// StreamFs
private alias c_g_mime_stream_fs_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_stream_fs_get_typeFn c_g_mime_stream_fs_get_type; ///
private alias c_g_mime_stream_fs_newFn = extern(C) GMimeStream* function(int fd) nothrow;
__gshared c_g_mime_stream_fs_newFn c_g_mime_stream_fs_new; ///
private alias c_g_mime_stream_fs_new_with_boundsFn = extern(C) GMimeStream* function(int fd, long start, long end) nothrow;
__gshared c_g_mime_stream_fs_new_with_boundsFn c_g_mime_stream_fs_new_with_bounds; ///
private alias c_g_mime_stream_fs_openFn = extern(C) GMimeStream* function(const(char)* path, int flags, int mode, GError** _err) nothrow;
__gshared c_g_mime_stream_fs_openFn c_g_mime_stream_fs_open; ///
private alias c_g_mime_stream_fs_get_ownerFn = extern(C) gboolean function(GMimeStreamFs* stream) nothrow;
__gshared c_g_mime_stream_fs_get_ownerFn c_g_mime_stream_fs_get_owner; ///
private alias c_g_mime_stream_fs_set_ownerFn = extern(C) void function(GMimeStreamFs* stream, gboolean owner) nothrow;
__gshared c_g_mime_stream_fs_set_ownerFn c_g_mime_stream_fs_set_owner; ///

// StreamGIO
private alias c_g_mime_stream_gio_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_stream_gio_get_typeFn c_g_mime_stream_gio_get_type; ///
private alias c_g_mime_stream_gio_newFn = extern(C) GMimeStream* function(GFile* file) nothrow;
__gshared c_g_mime_stream_gio_newFn c_g_mime_stream_gio_new; ///
private alias c_g_mime_stream_gio_new_with_boundsFn = extern(C) GMimeStream* function(GFile* file, long start, long end) nothrow;
__gshared c_g_mime_stream_gio_new_with_boundsFn c_g_mime_stream_gio_new_with_bounds; ///
private alias c_g_mime_stream_gio_get_ownerFn = extern(C) gboolean function(GMimeStreamGIO* stream) nothrow;
__gshared c_g_mime_stream_gio_get_ownerFn c_g_mime_stream_gio_get_owner; ///
private alias c_g_mime_stream_gio_set_ownerFn = extern(C) void function(GMimeStreamGIO* stream, gboolean owner) nothrow;
__gshared c_g_mime_stream_gio_set_ownerFn c_g_mime_stream_gio_set_owner; ///

// StreamMem
private alias c_g_mime_stream_mem_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_stream_mem_get_typeFn c_g_mime_stream_mem_get_type; ///
private alias c_g_mime_stream_mem_newFn = extern(C) GMimeStream* function() nothrow;
__gshared c_g_mime_stream_mem_newFn c_g_mime_stream_mem_new; ///
private alias c_g_mime_stream_mem_new_with_bufferFn = extern(C) GMimeStream* function(const(ubyte)* buffer, size_t len) nothrow;
__gshared c_g_mime_stream_mem_new_with_bufferFn c_g_mime_stream_mem_new_with_buffer; ///
private alias c_g_mime_stream_mem_new_with_byte_arrayFn = extern(C) GMimeStream* function(GByteArray* array) nothrow;
__gshared c_g_mime_stream_mem_new_with_byte_arrayFn c_g_mime_stream_mem_new_with_byte_array; ///
private alias c_g_mime_stream_mem_get_byte_arrayFn = extern(C) GByteArray* function(GMimeStreamMem* mem) nothrow;
__gshared c_g_mime_stream_mem_get_byte_arrayFn c_g_mime_stream_mem_get_byte_array; ///
private alias c_g_mime_stream_mem_get_ownerFn = extern(C) gboolean function(GMimeStreamMem* mem) nothrow;
__gshared c_g_mime_stream_mem_get_ownerFn c_g_mime_stream_mem_get_owner; ///
private alias c_g_mime_stream_mem_set_byte_arrayFn = extern(C) void function(GMimeStreamMem* mem, GByteArray* array) nothrow;
__gshared c_g_mime_stream_mem_set_byte_arrayFn c_g_mime_stream_mem_set_byte_array; ///
private alias c_g_mime_stream_mem_set_ownerFn = extern(C) void function(GMimeStreamMem* mem, gboolean owner) nothrow;
__gshared c_g_mime_stream_mem_set_ownerFn c_g_mime_stream_mem_set_owner; ///

// StreamMmap
private alias c_g_mime_stream_mmap_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_stream_mmap_get_typeFn c_g_mime_stream_mmap_get_type; ///
private alias c_g_mime_stream_mmap_newFn = extern(C) GMimeStream* function(int fd, int prot, int flags) nothrow;
__gshared c_g_mime_stream_mmap_newFn c_g_mime_stream_mmap_new; ///
private alias c_g_mime_stream_mmap_new_with_boundsFn = extern(C) GMimeStream* function(int fd, int prot, int flags, long start, long end) nothrow;
__gshared c_g_mime_stream_mmap_new_with_boundsFn c_g_mime_stream_mmap_new_with_bounds; ///
private alias c_g_mime_stream_mmap_get_ownerFn = extern(C) gboolean function(GMimeStreamMmap* stream) nothrow;
__gshared c_g_mime_stream_mmap_get_ownerFn c_g_mime_stream_mmap_get_owner; ///
private alias c_g_mime_stream_mmap_set_ownerFn = extern(C) void function(GMimeStreamMmap* stream, gboolean owner) nothrow;
__gshared c_g_mime_stream_mmap_set_ownerFn c_g_mime_stream_mmap_set_owner; ///

// StreamNull
private alias c_g_mime_stream_null_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_stream_null_get_typeFn c_g_mime_stream_null_get_type; ///
private alias c_g_mime_stream_null_newFn = extern(C) GMimeStream* function() nothrow;
__gshared c_g_mime_stream_null_newFn c_g_mime_stream_null_new; ///
private alias c_g_mime_stream_null_get_count_newlinesFn = extern(C) gboolean function(GMimeStreamNull* stream) nothrow;
__gshared c_g_mime_stream_null_get_count_newlinesFn c_g_mime_stream_null_get_count_newlines; ///
private alias c_g_mime_stream_null_set_count_newlinesFn = extern(C) void function(GMimeStreamNull* stream, gboolean count) nothrow;
__gshared c_g_mime_stream_null_set_count_newlinesFn c_g_mime_stream_null_set_count_newlines; ///

// StreamPipe
private alias c_g_mime_stream_pipe_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_stream_pipe_get_typeFn c_g_mime_stream_pipe_get_type; ///
private alias c_g_mime_stream_pipe_newFn = extern(C) GMimeStream* function(int fd) nothrow;
__gshared c_g_mime_stream_pipe_newFn c_g_mime_stream_pipe_new; ///
private alias c_g_mime_stream_pipe_get_ownerFn = extern(C) gboolean function(GMimeStreamPipe* stream) nothrow;
__gshared c_g_mime_stream_pipe_get_ownerFn c_g_mime_stream_pipe_get_owner; ///
private alias c_g_mime_stream_pipe_set_ownerFn = extern(C) void function(GMimeStreamPipe* stream, gboolean owner) nothrow;
__gshared c_g_mime_stream_pipe_set_ownerFn c_g_mime_stream_pipe_set_owner; ///

// TextPart
private alias c_g_mime_text_part_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mime_text_part_get_typeFn c_g_mime_text_part_get_type; ///
private alias c_g_mime_text_part_newFn = extern(C) GMimeTextPart* function() nothrow;
__gshared c_g_mime_text_part_newFn c_g_mime_text_part_new; ///
private alias c_g_mime_text_part_new_with_subtypeFn = extern(C) GMimeTextPart* function(const(char)* subtype) nothrow;
__gshared c_g_mime_text_part_new_with_subtypeFn c_g_mime_text_part_new_with_subtype; ///
private alias c_g_mime_text_part_get_charsetFn = extern(C) const(char)* function(GMimeTextPart* mimePart) nothrow;
__gshared c_g_mime_text_part_get_charsetFn c_g_mime_text_part_get_charset; ///
private alias c_g_mime_text_part_get_textFn = extern(C) char* function(GMimeTextPart* mimePart) nothrow;
__gshared c_g_mime_text_part_get_textFn c_g_mime_text_part_get_text; ///
private alias c_g_mime_text_part_set_charsetFn = extern(C) void function(GMimeTextPart* mimePart, const(char)* charset) nothrow;
__gshared c_g_mime_text_part_set_charsetFn c_g_mime_text_part_set_charset; ///
private alias c_g_mime_text_part_set_textFn = extern(C) void function(GMimeTextPart* mimePart, const(char)* text) nothrow;
__gshared c_g_mime_text_part_set_textFn c_g_mime_text_part_set_text; ///

// global
private alias c_g_mime_check_versionFn = extern(C) gboolean function(uint major, uint minor, uint micro) nothrow;
__gshared c_g_mime_check_versionFn c_g_mime_check_version; ///
private alias c_g_mime_content_encoding_from_stringFn = extern(C) GMimeContentEncoding function(const(char)* str) nothrow;
__gshared c_g_mime_content_encoding_from_stringFn c_g_mime_content_encoding_from_string; ///
private alias c_g_mime_content_encoding_to_stringFn = extern(C) const(char)* function(GMimeContentEncoding encoding) nothrow;
__gshared c_g_mime_content_encoding_to_stringFn c_g_mime_content_encoding_to_string; ///
private alias c_g_mime_iconv_closeFn = extern(C) int function(void* cd) nothrow;
__gshared c_g_mime_iconv_closeFn c_g_mime_iconv_close; ///
private alias c_g_mime_iconv_locale_to_utf8Fn = extern(C) char* function(const(char)* str) nothrow;
__gshared c_g_mime_iconv_locale_to_utf8Fn c_g_mime_iconv_locale_to_utf8; ///
private alias c_g_mime_iconv_locale_to_utf8_lengthFn = extern(C) char* function(const(char)* str, size_t n) nothrow;
__gshared c_g_mime_iconv_locale_to_utf8_lengthFn c_g_mime_iconv_locale_to_utf8_length; ///
private alias c_g_mime_iconv_openFn = extern(C) void* function(const(char)* to, const(char)* from) nothrow;
__gshared c_g_mime_iconv_openFn c_g_mime_iconv_open; ///
private alias c_g_mime_iconv_strdupFn = extern(C) char* function(void* cd, const(char)* str) nothrow;
__gshared c_g_mime_iconv_strdupFn c_g_mime_iconv_strdup; ///
private alias c_g_mime_iconv_strndupFn = extern(C) char* function(void* cd, const(char)* str, size_t n) nothrow;
__gshared c_g_mime_iconv_strndupFn c_g_mime_iconv_strndup; ///
private alias c_g_mime_iconv_utf8_to_localeFn = extern(C) char* function(const(char)* str) nothrow;
__gshared c_g_mime_iconv_utf8_to_localeFn c_g_mime_iconv_utf8_to_locale; ///
private alias c_g_mime_iconv_utf8_to_locale_lengthFn = extern(C) char* function(const(char)* str, size_t n) nothrow;
__gshared c_g_mime_iconv_utf8_to_locale_lengthFn c_g_mime_iconv_utf8_to_locale_length; ///
private alias c_g_mime_initFn = extern(C) void function() nothrow;
__gshared c_g_mime_initFn c_g_mime_init; ///
private alias c_g_mime_locale_charsetFn = extern(C) const(char)* function() nothrow;
__gshared c_g_mime_locale_charsetFn c_g_mime_locale_charset; ///
private alias c_g_mime_locale_languageFn = extern(C) const(char)* function() nothrow;
__gshared c_g_mime_locale_languageFn c_g_mime_locale_language; ///
private alias c_g_mime_shutdownFn = extern(C) void function() nothrow;
__gshared c_g_mime_shutdownFn c_g_mime_shutdown; ///
private alias c_g_mime_utils_best_encodingFn = extern(C) GMimeContentEncoding function(const(ubyte)* text, size_t len) nothrow;
__gshared c_g_mime_utils_best_encodingFn c_g_mime_utils_best_encoding; ///
private alias c_g_mime_utils_decode_8bitFn = extern(C) char* function(GMimeParserOptions* options, const(ubyte)* text, size_t len) nothrow;
__gshared c_g_mime_utils_decode_8bitFn c_g_mime_utils_decode_8bit; ///
private alias c_g_mime_utils_decode_message_idFn = extern(C) char* function(const(char)* messageId) nothrow;
__gshared c_g_mime_utils_decode_message_idFn c_g_mime_utils_decode_message_id; ///
private alias c_g_mime_utils_generate_message_idFn = extern(C) char* function(const(char)* fqdn) nothrow;
__gshared c_g_mime_utils_generate_message_idFn c_g_mime_utils_generate_message_id; ///
private alias c_g_mime_utils_header_decode_dateFn = extern(C) GDateTime* function(const(char)* str) nothrow;
__gshared c_g_mime_utils_header_decode_dateFn c_g_mime_utils_header_decode_date; ///
private alias c_g_mime_utils_header_decode_phraseFn = extern(C) char* function(GMimeParserOptions* options, const(char)* phrase) nothrow;
__gshared c_g_mime_utils_header_decode_phraseFn c_g_mime_utils_header_decode_phrase; ///
private alias c_g_mime_utils_header_decode_textFn = extern(C) char* function(GMimeParserOptions* options, const(char)* text) nothrow;
__gshared c_g_mime_utils_header_decode_textFn c_g_mime_utils_header_decode_text; ///
private alias c_g_mime_utils_header_encode_phraseFn = extern(C) char* function(GMimeFormatOptions* options, const(char)* phrase, const(char)* charset) nothrow;
__gshared c_g_mime_utils_header_encode_phraseFn c_g_mime_utils_header_encode_phrase; ///
private alias c_g_mime_utils_header_encode_textFn = extern(C) char* function(GMimeFormatOptions* options, const(char)* text, const(char)* charset) nothrow;
__gshared c_g_mime_utils_header_encode_textFn c_g_mime_utils_header_encode_text; ///
private alias c_g_mime_utils_header_format_dateFn = extern(C) char* function(GDateTime* date) nothrow;
__gshared c_g_mime_utils_header_format_dateFn c_g_mime_utils_header_format_date; ///
private alias c_g_mime_utils_header_printfFn = extern(C) char* function(GMimeParserOptions* options, GMimeFormatOptions* format, const(char)* text,  ...) nothrow;
__gshared c_g_mime_utils_header_printfFn c_g_mime_utils_header_printf; ///
private alias c_g_mime_utils_header_unfoldFn = extern(C) char* function(const(char)* value) nothrow;
__gshared c_g_mime_utils_header_unfoldFn c_g_mime_utils_header_unfold; ///
private alias c_g_mime_utils_quote_stringFn = extern(C) char* function(const(char)* str) nothrow;
__gshared c_g_mime_utils_quote_stringFn c_g_mime_utils_quote_string; ///
private alias c_g_mime_utils_structured_header_foldFn = extern(C) char* function(GMimeParserOptions* options, GMimeFormatOptions* format, const(char)* header) nothrow;
__gshared c_g_mime_utils_structured_header_foldFn c_g_mime_utils_structured_header_fold; ///
private alias c_g_mime_utils_text_is_8bitFn = extern(C) gboolean function(const(ubyte)* text, size_t len) nothrow;
__gshared c_g_mime_utils_text_is_8bitFn c_g_mime_utils_text_is_8bit; ///
private alias c_g_mime_utils_unquote_stringFn = extern(C) void function(char* str) nothrow;
__gshared c_g_mime_utils_unquote_stringFn c_g_mime_utils_unquote_string; ///
private alias c_g_mime_utils_unstructured_header_foldFn = extern(C) char* function(GMimeParserOptions* options, GMimeFormatOptions* format, const(char)* header) nothrow;
__gshared c_g_mime_utils_unstructured_header_foldFn c_g_mime_utils_unstructured_header_fold; ///
private alias c_g_mime_ydecode_stepFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* pcrc, uint* crc) nothrow;
__gshared c_g_mime_ydecode_stepFn c_g_mime_ydecode_step; ///
private alias c_g_mime_yencode_closeFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* pcrc, uint* crc) nothrow;
__gshared c_g_mime_yencode_closeFn c_g_mime_yencode_close; ///
private alias c_g_mime_yencode_stepFn = extern(C) size_t function(const(ubyte)* inbuf, size_t inlen, ubyte* outbuf, int* state, uint* pcrc, uint* crc) nothrow;
__gshared c_g_mime_yencode_stepFn c_g_mime_yencode_step; ///

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
  auto libs = gidResolveLibs(LIBS, "gid.gmime3", "GMime");

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
