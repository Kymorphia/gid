/// C types for gmime3 library
module gmime.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import gio.c.types;

/**
    An address type.
*/
enum GMimeAddressType
{
  /**
      Represents the addresses in the Sender header.
  */
  Sender = 0,

  /**
      Represents the addresses in the From header.
  */
  From = 1,

  /**
      Represents the addresses in the Reply-To header.
  */
  ReplyTo = 2,

  /**
      Represents the recipients in the To header.
  */
  To = 3,

  /**
      Represents the recipients in the Cc header.
  */
  Cc = 4,

  /**
      Represents the recipients in the Bcc header.
  */
  Bcc = 5,
}

/**
    A description of the user's preference for encrypted messaging.
*/
enum GMimeAutocryptPreferEncrypt
{
  /**
      No preference stated.
  */
  None = 0,

  /**
      Please encrypt, if you also have this preference
  */
  Mutual = 1,
}

/**
    A cipher algorithm.
*/
enum GMimeCipherAlgo
{
  /**
      The default (or unknown) cipher.
  */
  Default = 0,

  /**
      The IDEA cipher.
  */
  Idea = 1,

  /**
      The 3DES cipher.
  */
  _3des = 2,

  /**
      The CAST5 cipher.
  */
  Cast5 = 3,

  /**
      The Blowfish cipher.
  */
  Blowfish = 4,

  /**
      The AES (aka RIJANDALE) cipher.
  */
  Aes = 7,

  /**
      The AES-192 cipher.
  */
  Aes192 = 8,

  /**
      The AES-256 cipher.
  */
  Aes256 = 9,

  /**
      The Twofish cipher.
  */
  Twofish = 10,

  /**
      The Camellia-128 cipher.
  */
  Camellia128 = 11,

  /**
      The Camellia-192 cipher.
  */
  Camellia192 = 12,

  /**
      The Camellia-256 cipher.
  */
  Camellia256 = 13,
}

/**
    A Content-Transfer-Encoding enumeration.
*/
enum GMimeContentEncoding
{
  /**
      Default transfer encoding.
  */
  Default = 0,

  /**
      7bit text transfer encoding.
  */
  _7bit = 1,

  /**
      8bit text transfer encoding.
  */
  _8bit = 2,

  /**
      Binary transfer encoding.
  */
  Binary = 3,

  /**
      Base64 transfer encoding.
  */
  Base64 = 4,

  /**
      Quoted-printable transfer encoding.
  */
  Quotedprintable = 5,

  /**
      Uuencode transfer encoding.
  */
  Uuencode = 6,
}

/**
    Decryption flags.
*/
enum GMimeDecryptFlags : uint
{
  /**
      No flags specified.
  */
  None = 0,

  /**
      Export the decryption session-key.
  */
  ExportSessionKey = 1,

  /**
      Disable signature verification.
  */
  NoVerify = 2,

  /**
      Enable OpenPGP keyserver lookups.
  */
  EnableKeyserverLookups = 32768,

  /**
      Enable CRL and OCSP checks that require network lookups.
  */
  EnableOnlineCertificateChecks = 32768,
}

/**
    A hash algorithm.
*/
enum GMimeDigestAlgo
{
  /**
      The default hash algorithm.
  */
  Default = 0,

  /**
      The MD5 hash algorithm.
  */
  Md5 = 1,

  /**
      The SHA-1 hash algorithm.
  */
  Sha1 = 2,

  /**
      The RIPEMD-160 hash algorithm.
  */
  Ripemd160 = 3,

  /**
      The MD2 hash algorithm.
  */
  Md2 = 5,

  /**
      The TIGER-192 hash algorithm.
  */
  Tiger192 = 6,

  /**
      The HAVAL-5-160 hash algorithm.
  */
  Haval5160 = 7,

  /**
      The SHA-256 hash algorithm.
  */
  Sha256 = 8,

  /**
      The SHA-384 hash algorithm.
  */
  Sha384 = 9,

  /**
      The SHA-512 hash algorithm.
  */
  Sha512 = 10,

  /**
      The SHA-224 hash algorithm.
  */
  Sha224 = 11,

  /**
      The MD4 hash algorithm.
  */
  Md4 = 301,

  /**
      The CRC32 hash algorithm.
  */
  Crc32 = 302,

  /**
      The rfc1510 CRC32 hash algorithm.
  */
  Crc32Rfc1510 = 303,

  /**
      The rfc2440 CRC32 hash algorithm.
  */
  Crc32Rfc2440 = 304,
}

/**
    Used with functions like [gmime.filter_best.FilterBest.encoding] and
    [gmime.object.ObjectWrap.encode] as the 'constraint' argument. These values
    provide a means of letting the filter know what the encoding
    constraints are for the stream.
*/
enum GMimeEncodingConstraint
{
  /**
      The stream data must fit within the 7bit ASCII range.
  */
  _7bit = 0,

  /**
      The stream data may have bytes with the high bit set, but no null bytes.
  */
  _8bit = 1,

  /**
      The stream may contain any binary data.
  */
  Binary = 2,
}

/**
    Encryption flags.
*/
enum GMimeEncryptFlags : uint
{
  /**
      No flags specified.
  */
  None = 0,

  /**
      Always trust the specified keys.
  */
  AlwaysTrust = 1,

  /**
      Don't compress the plaintext before encrypting.
  */
  NoCompress = 16,

  /**
      Encrypt symmetrically.
  */
  Symmetric = 32,

  /**
      Do not include the key ids in the ciphertext.
  */
  ThrowKeyids = 64,
}

/**
    Bit flags to enable charset and/or encoding scanning to make
    educated guesses as to what the best charset and/or encodings to
    use for the content passed through the filter.
*/
enum GMimeFilterBestFlags : uint
{
  /**
      Enable best-charset detection.
  */
  Charset = 1,

  /**
      Enable best-encoding detection.
  */
  Encoding = 2,
}

/**
    The mode for a #GMimeFilterFrom filter.
*/
enum GMimeFilterFromMode
{
  /**
      Default mode.
  */
  Default = 0,

  /**
      Escape 'From ' lines with a '>'
  */
  Escape = 0,

  /**
      QP-Encode 'From ' lines
  */
  Armor = 1,
}

/**
    The mode for the #GMimeFilterGZip filter.
*/
enum GMimeFilterGZipMode
{
  /**
      Compress (zip) mode.
  */
  Zip = 0,

  /**
      Uncompress (unzip) mode.
  */
  Unzip = 1,
}

/**
    An enum of formats.
*/
enum GMimeFormat
{
  /**
      The stream contains a single message.
  */
  Message = 0,

  /**
      The stream is in the UNIX mbox format.
  */
  Mbox = 1,

  /**
      The stream is in the MMDF format.
  */
  Mmdf = 2,
}

/**
    There are two commonly used line-endings used by modern Operating Systems.
    Unix-based systems such as Linux and Mac OS use a single character ('\n' aka LF)
    to represent the end of line where-as Windows (or DOS) uses a sequence of two
    characters ("\r\n" aka CRLF). Most text-based network protocols such as SMTP,
    POP3, and IMAP use the CRLF sequence as well.
*/
enum GMimeNewLineFormat
{
  /**
      The Unix New-Line format ("\n").
  */
  Unix = 0,

  /**
      The DOS New-Line format ("\r\n").
  */
  Dos = 1,
}

/**
    The type of OpenPGP data found, if any.
*/
enum GMimeOpenPGPData
{
  /**
      No OpenPGP data found.
  */
  None = 0,

  /**
      The content contains OpenPGP encrypted data.
  */
  Encrypted = 1,

  /**
      The content contains OpenPGP signed data.
  */
  Signed = 2,

  /**
      The content contains OpenPGP public key data.
  */
  PublicKey = 3,

  /**
      The content contains OpenPGP private key data.
  */
  PrivateKey = 4,
}

/**
    The current state of the #GMimeFilterOpenPGP filter.
*/
enum GMimeOpenPGPState : uint
{
  /**
      No OpenPGP markers have been found (yet).
  */
  None = 0,

  /**
      The "-----BEGIN PGP MESSAGE-----" marker has been found.
  */
  BeginPgpMessage = 1,

  /**
      The "-----END PGP MESSAGE-----" marker has been found.
  */
  EndPgpMessage = 3,

  /**
      The "-----BEGIN PGP SIGNED MESSAGE-----" marker has been found.
  */
  BeginPgpSignedMessage = 4,

  /**
      The "-----BEGIN PGP SIGNATURE-----" marker has been found.
  */
  BeginPgpSignature = 12,

  /**
      The "-----END PGP SIGNATURE-----" marker has been found.
  */
  EndPgpSignature = 28,

  /**
      The "-----BEGIN PGP PUBLIC KEY BLOCK-----" marker has been found.
  */
  BeginPgpPublicKeyBlock = 32,

  /**
      The "-----END PGP PUBLIC KEY BLOCK-----" marker has been found.
  */
  EndPgpPublicKeyBlock = 96,

  /**
      The "-----BEGIN PGP PRIVATE KEY BLOCK-----" marker has been found.
  */
  BeginPgpPrivateKeyBlock = 128,

  /**
      The "-----END PGP PRIVATE KEY BLOCK-----" marker has been found.
  */
  EndPgpPrivateKeyBlock = 384,
}

/**
    The MIME specifications specify that the proper method for encoding Content-Type and
    Content-Disposition parameter values is the method described in
    <ulink url="https://tools.ietf.org/html/rfc2231">rfc2231</ulink>. However, it is common for
    some older email clients to improperly encode using the method described in
    <ulink url="https://tools.ietf.org/html/rfc2047">rfc2047</ulink> instead.
*/
enum GMimeParamEncodingMethod
{
  /**
      Use the default encoding method set on the #GMimeFormatOptions.
  */
  Default = 0,

  /**
      Use the encoding method described in rfc2231.
  */
  Rfc2231 = 1,

  /**
      Use the encoding method described in rfc2047.
  */
  Rfc2047 = 2,
}

/**
    Issues the @GMimeParser detects. Note that the `GMIME_CRIT_*` issues indicate that some parts of the @GMimeParser input may
    be ignored or will be interpreted differently by other software products.
*/
enum GMimeParserWarning
{
  /**
      Repeated exactly the same header which should exist only once.
  */
  WarnDuplicatedHeader = 1,

  /**
      Repeated exactly the same header parameter.
  */
  WarnDuplicatedParameter = 2,

  /**
      A header contains unencoded 8-bit characters.
  */
  WarnUnencoded8bitHeader = 3,

  /**
      Invalid content type, assuming `application/octet-stream`.
  */
  WarnInvalidContentType = 4,

  /**
      Invalid RFC 2047 encoded header value.
  */
  WarnInvalidRfc2047HeaderValue = 5,

  /**
      No child parts detected within a multipart.
  */
  WarnMalformedMultipart = 6,

  /**
      The message is truncated.
  */
  WarnTruncatedMessage = 7,

  /**
      The message is malformed.
  */
  WarnMalformedMessage = 8,

  /**
      Invalid header name, the parser may skip the message or parts of it.
  */
  CritInvalidHeaderName = 9,

  /**
      Conflicting header.
  */
  CritConflictingHeader = 10,

  /**
      Conflicting header parameter.
  */
  CritConflictingParameter = 11,

  /**
      A multipart lacks the required boundary parameter.
  */
  CritMultipartWithoutBoundary = 12,

  /**
      Invalid header parameter.
  */
  WarnInvalidParameter = 13,

  /**
      Invalid address list.
  */
  WarnInvalidAddressList = 14,

  /**
      The maximum MIME nesting level has been exceeded. This is very likely to be an attempt to exploit the MIME parser.
  */
  CritNestingOverflow = 15,

  /**
      A MIME part's headers were terminated by a boundary marker.
  */
  WarnPartWithoutContent = 16,

  /**
      A MIME part was encountered without any headers -or- content. This is very likely to be an attempt to exploit the MIME parser.
  */
  CritPartWithoutHeadersOrContent = 17,
}

/**
    A public-key algorithm.
*/
enum GMimePubKeyAlgo
{
  /**
      The default public-key algorithm.
  */
  Default = 0,

  /**
      The RSA algorithm.
  */
  Rsa = 1,

  /**
      An encryption-only RSA algorithm.
  */
  RsaE = 2,

  /**
      A signature-only RSA algorithm.
  */
  RsaS = 3,

  /**
      An encryption-only ElGamal algorithm.
  */
  ElgE = 16,

  /**
      The DSA algorithm.
  */
  Dsa = 17,

  /**
      The Eliptic Curve algorithm.
  */
  Ecc = 18,

  /**
      The ElGamal algorithm.
  */
  Elg = 20,

  /**
      The Eliptic Curve + DSA algorithm.
  */
  Ecdsa = 301,

  /**
      The Eliptic Curve + Diffie Helman algorithm.
  */
  Ecdh = 302,

  /**
      The Eliptic Curve + DSA algorithm.
  */
  Eddsa = 303,
}

/**
    An RFC compliance mode.
*/
enum GMimeRfcComplianceMode
{
  /**
      Attempt to be much more liberal accepting broken and/or invalid formatting.
  */
  Loose = 0,

  /**
      Do not attempt to be overly liberal in accepting broken and/or invalid formatting.
  */
  Strict = 1,
}

/**
    The S/MIME data type.
*/
enum GMimeSecureMimeType
{
  /**
      The S/MIME content contains compressed data.
  */
  CompressedData = 0,

  /**
      The S/MIME content contains enveloped data.
  */
  EnvelopedData = 1,

  /**
      The S/MIME content contains signed data.
  */
  SignedData = 2,

  /**
      The S/MIME content contains only certificates.
  */
  CertsOnly = 3,

  /**
      The S/MIME content is unknown.
  */
  Unknown = 4,
}

/**
    Relative seek position.
*/
enum GMimeSeekWhence
{
  /**
      Seek relative to the beginning of the stream.
  */
  Set = 0,

  /**
      Seek relative to the current position in the stream.
  */
  Cur = 1,

  /**
      Seek relative to the end of the stream.
  */
  End = 2,
}

/**
    A value representing the signature status bit flags for a particular
    #GMimeSignature.
*/
enum GMimeSignatureStatus
{
  /**
      The signature is fully valid.
  */
  Valid = 1,

  /**
      The signature is good.
  */
  Green = 2,

  /**
      The signature is bad.
  */
  Red = 4,

  /**
      The key has been revoked.
  */
  KeyRevoked = 16,

  /**
      The key has expired.
  */
  KeyExpired = 32,

  /**
      The signature has expired.
  */
  SigExpired = 64,

  /**
      Can't verify due to missing key.
  */
  KeyMissing = 128,

  /**
      CRL not available.
  */
  CrlMissing = 256,

  /**
      Available CRL is too old.
  */
  CrlTooOld = 512,

  /**
      A policy was not met.
  */
  BadPolicy = 1024,

  /**
      A system error occurred.
  */
  SysError = 2048,

  /**
      Tofu conflict detected.
  */
  TofuConflict = 4096,
}

/**
    The buffering mode for a #GMimeStreamBuffer stream.
*/
enum GMimeStreamBufferMode
{
  /**
      Read in 4k blocks.
  */
  Read = 0,

  /**
      Write in 4k blocks.
  */
  Write = 1,
}

/**
    The trust level of a certificate.  Trust level tries to answer the
    question: "How much is the user willing to rely on cryptographic
    identity assertions made by the owner of this certificate?"
    
    By way of comparison with web browser X.509 certificate validation
    stacks, the certificate of a "Root CA" has @GMIME_TRUST_ULTIMATE,
    while the certificate of an intermediate CA has @GMIME_TRUST_FULL,
    and an end-entity certificate (e.g., with CA:FALSE set) would have
    @GMIME_TRUST_NEVER.
*/
enum GMimeTrust
{
  /**
      We do not know whether to rely on identity assertions made by the certificate.
  */
  Unknown = 0,

  /**
      We do not have enough information to decide whether to rely on identity assertions made by the certificate.
  */
  Undefined = 1,

  /**
      We should never rely on identity assertions made by the certificate.
  */
  Never = 2,

  /**
      We can rely on identity assertions made by this certificate as long as they are corroborated by other marginally-trusted certificates.
  */
  Marginal = 3,

  /**
      We can rely on identity assertions made by this certificate.
  */
  Full = 4,

  /**
      This certificate is an undeniable root of trust (e.g. normally, this is a certificate controlled by the user themselves).
  */
  Ultimate = 5,
}

/**
    The validity level of a certificate's User ID.  Validity level
    tries to answer the question: "How strongly do we believe that this
    certificate belongs to the party it says it belongs to?"
    
    Note that some OpenPGP certificates have multiple User IDs, and
    each User ID may have a different validity level (e.g. depending on
    which third parties have certified which User IDs, and which third
    parties the local user has chosen to trust).
    
    Similarly, an X.509 certificate can have multiple SubjectAltNames,
    and each name may also have a different validity level (e.g. if the
    issuing CA is bound by name constraints).
    
    Note that the GMime API currently only exposes the highest-validty
    User ID for any given certificate.
*/
enum GMimeValidity
{
  /**
      The User ID of the certificate is of unknown validity.
  */
  Unknown = 0,

  /**
      The User ID of the certificate is undefined.
  */
  Undefined = 1,

  /**
      The User ID of the certificate is never to be treated as valid.
  */
  Never = 2,

  /**
      The User ID of the certificate is marginally valid (e.g. it has been certified by only one marginally-trusted party).
  */
  Marginal = 3,

  /**
      The User ID of the certificate is fully valid.
  */
  Full = 4,

  /**
      The User ID of the certificate is ultimately valid (i.e., usually the certificate belongs to the local user themselves).
  */
  Ultimate = 5,
}

/**
    Signature verification flags.
*/
enum GMimeVerifyFlags : uint
{
  /**
      No flags specified.
  */
  None = 0,

  /**
      Enable OpenPGP keyserver lookups.
  */
  EnableKeyserverLookups = 32768,

  /**
      Enable CRL and OCSP checks that require network lookups.
  */
  EnableOnlineCertificateChecks = 32768,
}

/**
    An application/pkcs7-mime MIME part.
*/
struct GMimeApplicationPkcs7Mime
{
  /**
      parent #GMimePart object
  */
  GMimePart parentObject;

  /**
      The smime-type Content-Type parameter.
  */
  GMimeSecureMimeType smimeType;
}

/** */
struct GMimeApplicationPkcs7MimeClass
{
  /** */
  GMimePartClass parentClass;
}

/**
    An object containing Autocrypt information about a given e-mail
    address, as derived from a message header.
    
    See https://autocrypt.org/ for details and motivation.
*/
struct GMimeAutocryptHeader
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      the #InternetAddressMailbox associated with this Autocrypt header.
  */
  GMimeInternetAddressMailbox* address;

  /**
      a #GMimeAutocryptPreferEncrypt value (defaults to @GMIME_AUTOCRYPT_PREFER_ENCRYPT_NONE).
  */
  GMimeAutocryptPreferEncrypt preferEncrypt;

  /**
      the raw binary form of the encoded key.
  */
  GBytes* keydata;

  /**
      the date associated with the Autocrypt header in this message.
  */
  GDateTime* effectiveDate;
}

/** */
struct GMimeAutocryptHeaderClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A list of Autocrypt headers, typically extracted from a GMimeMessage.
*/
struct GMimeAutocryptHeaderList
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      Array of #GMimeAutocryptHeader items.
  */
  GPtrArray* array;
}

/** */
struct GMimeAutocryptHeaderListClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An object containing useful information about a certificate.
*/
struct GMimeCertificate
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      The public-key algorithm used by the certificate, if known.
  */
  GMimePubKeyAlgo pubkeyAlgo;

  /**
      The digest algorithm used by the certificate, if known.
  */
  GMimeDigestAlgo digestAlgo;

  /**
      The level of trust assigned to this certificate.
  */
  GMimeTrust trust;

  /**
      The issuer of the certificate, if known.
  */
  char* issuerSerial;

  /**
      The issuer of the certificate, if known.
  */
  char* issuerName;

  /**
      A hex string representing the certificate's fingerprint.
  */
  char* fingerprint;

  /**
      The creation date of the certificate.
  */
  long created;

  /**
      The expiration date of the certificate.
  */
  long expires;

  /**
      The certificate's key id.
  */
  char* keyid;

  /**
      The email address of the person or entity.
  */
  char* email;

  /**
      The name of the person or entity.
  */
  char* name;

  /**
      The full User ID of the certificate.
  */
  char* userId;

  /**
      the validity of the email address, name, and User ID.
  */
  GMimeValidity idValidity;
}

/** */
struct GMimeCertificateClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A collection of #GMimeCertificate objects.
*/
struct GMimeCertificateList
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      An array of #GMimeCertificate objects.
  */
  GPtrArray* array;
}

/** */
struct GMimeCertificateListClass
{
  /** */
  GObjectClass parentClass;
}

/**
    State used by [gmime.charset.Charset.best] and [gmime.charset.Charset.bestName].
*/
struct GMimeCharset
{
  /**
      charset mask
  */
  uint mask;

  /**
      charset level
  */
  uint level;
}

/**
    A data structure representing a Content-Disposition.
*/
struct GMimeContentDisposition
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      disposition
  */
  char* disposition;

  /**
      a #GMimeParam list
  */
  GMimeParamList* params;

  /** */
  void* changed;
}

/** */
struct GMimeContentDispositionClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A data structure representing a Content-Type.
*/
struct GMimeContentType
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      media type
  */
  char* type;

  /**
      media subtype
  */
  char* subtype;

  /**
      a #GMimeParam list
  */
  GMimeParamList* params;

  /** */
  void* changed;
}

/** */
struct GMimeContentTypeClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A crypto context for use with MIME.
*/
struct GMimeCryptoContext
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      a callback for requesting a password
  */
  GMimePasswordRequestFunc requestPasswd;
}

/** */
struct GMimeCryptoContextClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) GMimeDigestAlgo function(GMimeCryptoContext* ctx, const(char)* name) digestId;

  /** */
  extern(C) const(char)* function(GMimeCryptoContext* ctx, GMimeDigestAlgo digest) digestName;

  /** */
  extern(C) const(char)* function(GMimeCryptoContext* ctx) getSignatureProtocol;

  /** */
  extern(C) const(char)* function(GMimeCryptoContext* ctx) getEncryptionProtocol;

  /** */
  extern(C) const(char)* function(GMimeCryptoContext* ctx) getKeyExchangeProtocol;

  /** */
  extern(C) int function(GMimeCryptoContext* ctx, bool detach, const(char)* userid, GMimeStream* istream, GMimeStream* ostream, GError** _err) sign;

  /** */
  extern(C) GMimeSignatureList* function(GMimeCryptoContext* ctx, GMimeVerifyFlags flags, GMimeStream* istream, GMimeStream* sigstream, GMimeStream* ostream, GError** _err) verify;

  /** */
  extern(C) int function(GMimeCryptoContext* ctx, bool sign, const(char)* userid, GMimeEncryptFlags flags, GPtrArray* recipients, GMimeStream* istream, GMimeStream* ostream, GError** _err) encrypt;

  /** */
  extern(C) GMimeDecryptResult* function(GMimeCryptoContext* ctx, GMimeDecryptFlags flags, const(char)* sessionKey, GMimeStream* istream, GMimeStream* ostream, GError** _err) decrypt;

  /** */
  extern(C) int function(GMimeCryptoContext* ctx, GMimeStream* istream, GError** _err) importKeys;

  /** */
  extern(C) int function(GMimeCryptoContext* ctx, const(char*)* keys, GMimeStream* ostream, GError** _err) exportKeys;
}

/**
    A wrapper for a stream which may be encoded.
*/
struct GMimeDataWrapper
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      the encoding of the content
  */
  GMimeContentEncoding encoding;

  /**
      content stream
  */
  GMimeStream* stream;
}

/** */
struct GMimeDataWrapperClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) ptrdiff_t function(GMimeDataWrapper* wrapper, GMimeStream* stream) writeToStream;
}

/**
    An object containing the results from decrypting an encrypted stream.
*/
struct GMimeDecryptResult
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      A #GMimeCertificateList
  */
  GMimeCertificateList* recipients;

  /**
      A #GMimeSignatureList if signed or null otherwise.
  */
  GMimeSignatureList* signatures;

  /**
      The cipher algorithm used to encrypt the stream.
  */
  GMimeCipherAlgo cipher;

  /**
      The MDC digest algorithm used, if any.
  */
  GMimeDigestAlgo mdc;

  /**
      The session key if requested or null otherwise.
  */
  char* sessionKey;
}

/** */
struct GMimeDecryptResultClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A context used for encoding or decoding data.
*/
struct GMimeEncoding
{
  /**
      the type of encoding
  */
  GMimeContentEncoding encoding;

  /**
      a temporary buffer needed when uuencoding data
  */
  ubyte[60] uubuf;

  /**
      true if encoding or false if decoding
  */
  bool encode;

  /**
      saved bytes from the previous step
  */
  uint save;

  /**
      current encder/decoder state
  */
  int state;
}

/**
    Base class for filters used by #GMimeStreamFilter.
*/
struct GMimeFilter
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      private state data
  */
  void* priv;

  /** */
  char* outreal;

  /** */
  char* outbuf;

  /** */
  char* outptr;

  /** */
  size_t outsize;

  /** */
  size_t outpre;

  /** */
  char* backbuf;

  /** */
  size_t backsize;

  /** */
  size_t backlen;
}

/**
    A basic encoder/decoder filter for the MIME encodings.
*/
struct GMimeFilterBasic
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      #GMimeEncoding state
  */
  GMimeEncoding encoder;
}

/** */
struct GMimeFilterBasicClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter for calculating the best encoding and/or charset to encode
    the data passed through it.
*/
struct GMimeFilterBest
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      #GMimeFilterBestFlags
  */
  GMimeFilterBestFlags flags;

  /**
      #GMimeCharset state
  */
  GMimeCharset charset;

  /**
      count of nul-bytes passed through the filter
  */
  uint count0;

  /**
      count of 8bit bytes passed through the filter
  */
  uint count8;

  /**
      total number of bytes passed through the filter
  */
  uint total;

  /**
      the length of the longest line passed through the filter
  */
  uint maxline;

  /**
      current line length
  */
  uint linelen;

  /**
      buffer for checking From_ lines
  */
  ubyte[6] frombuf;

  /**
      length of bytes in @frombuf
  */
  uint fromlen;

  /**
      true if any line started with "From "
  */
  uint hadfrom;

  /**
      start line state
  */
  uint startline;

  /**
      mid-line state
  */
  uint midline;
}

/** */
struct GMimeFilterBestClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter to convert between charsets.
*/
struct GMimeFilterCharset
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      charset that the filter is converting from
  */
  char* fromCharset;

  /**
      charset the filter is converting to
  */
  char* toCharset;

  /**
      charset conversion state
  */
}

/** */
struct GMimeFilterCharsetClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter for calculating the checksum of a stream.
*/
struct GMimeFilterChecksum
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      The checksum context
  */
  GChecksum* checksum;
}

/** */
struct GMimeFilterChecksumClass
{
  /** */
  GMimeFilterClass parentClass;
}

/** */
struct GMimeFilterClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) GMimeFilter* function(GMimeFilter* filter) copy;

  /** */
  extern(C) void function(GMimeFilter* filter, ubyte* inbuf, size_t inlen, size_t prespace, ubyte** outbuf, size_t* outlen, size_t* outprespace) filter;

  /** */
  extern(C) void function(GMimeFilter* filter, ubyte* inbuf, size_t inlen, size_t prespace, ubyte** outbuf, size_t* outlen, size_t* outprespace) complete;

  /** */
  extern(C) void function(GMimeFilter* filter) reset;
}

/**
    A filter to convert a stream from Windows/DOS line endings to Unix line endings.
*/
struct GMimeFilterDos2Unix
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      true if the filter should ensure that the stream ends with a new line
  */
  bool ensureNewline;

  /**
      the previous character encountered
  */
  char pc;
}

/** */
struct GMimeFilterDos2UnixClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter for converting text/enriched or text/richtext textual
    streams into text/html.
*/
struct GMimeFilterEnriched
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      bit flags
  */
  uint flags;

  /**
      nofill tag state
  */
  int nofill;
}

/** */
struct GMimeFilterEnrichedClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter for armoring or escaping lines beginning with "From ".
*/
struct GMimeFilterFrom
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      #GMimeFilterFromMode
  */
  GMimeFilterFromMode mode;

  /**
      true if in the middle of a line
  */
  bool midline;
}

/** */
struct GMimeFilterFromClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter for compresing or decompressing a gzip stream.
*/
struct GMimeFilterGZip
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      private state data
  */
  void* priv;

  /**
      #GMimeFilterGZipMode
  */
  GMimeFilterGZipMode mode;

  /**
      compression level
  */
  int level;
}

/** */
struct GMimeFilterGZipClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter for converting text/plain into text/html.
*/
struct GMimeFilterHTML
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      URL scanner state
  */
  void* scanner;

  /**
      flags specifying HTML conversion rules
  */
  uint flags;

  /**
      cite colour
  */
  uint colour;

  /**
      current column
  */
  uint column;

  /**
      currently inside of a 'pre' tag.
  */
  uint preOpen;

  /**
      current citation depth level.
  */
  uint citationDepth;
}

/** */
struct GMimeFilterHTMLClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter to detect OpenPGP markers.
*/
struct GMimeFilterOpenPGP
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /** */
  GMimeOpenPGPState state;

  /** */
  bool seenEndMarker;

  /** */
  bool midline;

  /** */
  long beginOffset;

  /** */
  long endOffset;

  /** */
  long position;

  /** */
  uint next;
}

/** */
struct GMimeFilterOpenPGPClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter to byte-stuff SMTP DATA.
*/
struct GMimeFilterSmtpData
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      beginning-of-line state.
  */
  bool bol;
}

/** */
struct GMimeFilterSmtpDataClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter for stripping whitespace from the end of lines.
*/
struct GMimeFilterStrip
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /** */
  void* lwsp;
}

/** */
struct GMimeFilterStripClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter to convert a stream from Windows/DOS line endings to Unix line endings.
*/
struct GMimeFilterUnix2Dos
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      true if the filter should ensure that the stream ends with a new line
  */
  bool ensureNewline;

  /**
      the previous character encountered
  */
  char pc;
}

/** */
struct GMimeFilterUnix2DosClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter for detecting whether or not a text stream claimed to be
    iso-8859-X is really that charset or if it is really a
    Windows-CP125x charset.
*/
struct GMimeFilterWindows
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      true if the stream is detected to be a windows-cp125x charset
  */
  bool isWindows;

  /**
      charset the text stream is claimed to be
  */
  char* claimedCharset;
}

/** */
struct GMimeFilterWindowsClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    A filter for yEncoding or yDecoding a stream.
*/
struct GMimeFilterYenc
{
  /**
      parent #GMimeFilter
  */
  GMimeFilter parentObject;

  /**
      encode vs decode
  */
  bool encode;

  /**
      part id
  */
  int part;

  /**
      encode/decode state
  */
  int state;

  /**
      part crc
  */
  uint pcrc;

  /**
      full crc
  */
  uint crc;
}

/** */
struct GMimeFilterYencClass
{
  /** */
  GMimeFilterClass parentClass;
}

/**
    Format options for serializing various GMime objects.
*/
struct GMimeFormatOptions;

/**
    A GnuPG crypto context.
*/
struct GMimeGpgContext;

/** */
struct GMimeGpgContextClass;

/**
    A message or mime-part header.
*/
struct GMimeHeader
{
  /** */
  GObject parentObject;

  /**
      the name of the header
  */
  char* name;

  /**
      the unfolded value of the header
  */
  char* value;

  /** */
  GMimeHeaderRawValueFormatter formatter;

  /** */
  GMimeParserOptions* options;

  /** */
  bool reformat;

  /** */
  void* changed;

  /** */
  char* rawValue;

  /** */
  char* rawName;

  /** */
  char* charset;

  /** */
  long offset;
}

/** */
struct GMimeHeaderClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A list of message or mime-part headers.
*/
struct GMimeHeaderList
{
  /** */
  GObject parentObject;

  /** */
  GMimeParserOptions* options;

  /** */
  void* changed;

  /** */
  GHashTable* hash;

  /** */
  GPtrArray* array;
}

/** */
struct GMimeHeaderListClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An RFC 2822 Address object.
*/
struct GMimeInternetAddress
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      the charset used for encoding the name
  */
  char* charset;

  /**
      display name
  */
  char* name;

  /** */
  void* changed;
}

/** */
struct InternetAddressClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GMimeInternetAddress* ia, GMimeFormatOptions* options, uint flags, size_t* linelen, GString* str) toString_;
}

/**
    An RFC 2822 Group address.
*/
struct GMimeInternetAddressGroup
{
  /**
      parent #InternetAddress
  */
  GMimeInternetAddress parentObject;

  /**
      a #InternetAddressList of group members
  */
  GMimeInternetAddressList* members;
}

/** */
struct InternetAddressGroupClass
{
  /** */
  InternetAddressClass parentClass;
}

/**
    A collection of #InternetAddress objects.
*/
struct GMimeInternetAddressList
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      The array of #InternetAddress objects.
  */
  GPtrArray* array;

  /** */
  void* changed;
}

/** */
struct InternetAddressListClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An RFC 2822 Mailbox address.
*/
struct GMimeInternetAddressMailbox
{
  /**
      parent #InternetAddress
  */
  GMimeInternetAddress parentObject;

  /**
      the ascii-encoded version of @addr
  */
  char* idnAddr;

  /**
      the address string
  */
  char* addr;

  /**
      the index of the '@' character
  */
  int at;
}

/** */
struct InternetAddressMailboxClass
{
  /** */
  InternetAddressClass parentClass;
}

/**
    A MIME Message object.
*/
struct GMimeMessage
{
  /**
      parent #GMimeObject
  */
  GMimeObject parentObject;

  /**
      a table of address lists
  */
  GMimeInternetAddressList** addrlists;

  /**
      toplevel MIME part
  */
  GMimeObject* mimePart;

  /**
      Message-Id string
  */
  char* messageId;

  /**
      Date value
  */
  GDateTime* date;

  /**
      Subject string
  */
  char* subject;

  /** */
  char* marker;
}

/** */
struct GMimeMessageClass
{
  /** */
  GMimeObjectClass parentClass;
}

/**
    A message/rfc822 or message/news MIME part.
*/
struct GMimeMessagePart
{
  /**
      parent #GMimeObject
  */
  GMimeObject parentObject;

  /**
      child #GMimeMessage
  */
  GMimeMessage* message;
}

/** */
struct GMimeMessagePartClass
{
  /** */
  GMimeObjectClass parentClass;
}

/**
    A message/partial MIME part.
*/
struct GMimeMessagePartial
{
  /**
      parent #GMimePart object
  */
  GMimePart parentObject;

  /**
      the part number
  */
  int number;

  /**
      the total number of message/partials that make up the whole message/rfc822
  */
  int total;

  /**
      message/partial id
  */
  char* id;
}

/** */
struct GMimeMessagePartialClass
{
  /** */
  GMimePartClass parentClass;
}

/**
    A base MIME multipart object.
*/
struct GMimeMultipart
{
  /**
      parent #GMimeObject
  */
  GMimeObject parentObject;

  /**
      array of MIME sub-parts
  */
  GPtrArray* children;

  /**
      MIME boundary
  */
  char* boundary;

  /**
      multipart prologue
  */
  char* prologue;

  /**
      multipart epilogue
  */
  char* epilogue;

  /** */
  bool writeEndBoundary;
}

/** */
struct GMimeMultipartClass
{
  /** */
  GMimeObjectClass parentClass;

  /** */
  extern(C) void function(GMimeMultipart* multipart) clear;

  /** */
  extern(C) void function(GMimeMultipart* multipart, GMimeObject* part) add;

  /** */
  extern(C) void function(GMimeMultipart* multipart, int index, GMimeObject* part) insert;

  /** */
  extern(C) bool function(GMimeMultipart* multipart, GMimeObject* part) remove;

  /** */
  extern(C) GMimeObject* function(GMimeMultipart* multipart, int index) removeAt;

  /** */
  extern(C) GMimeObject* function(GMimeMultipart* multipart, int index) getPart;

  /** */
  extern(C) bool function(GMimeMultipart* multipart, GMimeObject* part) contains;

  /** */
  extern(C) int function(GMimeMultipart* multipart, GMimeObject* part) indexOf;

  /** */
  extern(C) int function(GMimeMultipart* multipart) getCount;

  /** */
  extern(C) void function(GMimeMultipart* multipart, const(char)* boundary) setBoundary;

  /** */
  extern(C) const(char)* function(GMimeMultipart* multipart) getBoundary;
}

/**
    A multipart/encrypted MIME part.
*/
struct GMimeMultipartEncrypted
{
  /**
      parent #GMimeMultipart
  */
  GMimeMultipart parentObject;
}

/** */
struct GMimeMultipartEncryptedClass
{
  /** */
  GMimeMultipartClass parentClass;
}

/**
    A multipart/signed MIME part.
*/
struct GMimeMultipartSigned
{
  /**
      parent #GMimeMultipart
  */
  GMimeMultipart parentObject;
}

/** */
struct GMimeMultipartSignedClass
{
  /** */
  GMimeMultipartClass parentClass;
}

/** */
struct GMimeObjectClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GMimeObject* object, GMimeHeader* header) headerAdded;

  /** */
  extern(C) void function(GMimeObject* object, GMimeHeader* header) headerChanged;

  /** */
  extern(C) void function(GMimeObject* object, GMimeHeader* header) headerRemoved;

  /** */
  extern(C) void function(GMimeObject* object) headersCleared;

  /** */
  extern(C) void function(GMimeObject* object, GMimeContentType* contentType) setContentType;

  /** */
  extern(C) char* function(GMimeObject* object, GMimeFormatOptions* options) getHeaders;

  /** */
  extern(C) ptrdiff_t function(GMimeObject* object, GMimeFormatOptions* options, bool contentOnly, GMimeStream* stream) writeToStream;

  /** */
  extern(C) void function(GMimeObject* object, GMimeEncodingConstraint constraint) encode;
}

/**
    Base class for all MIME parts.
*/
struct GMimeObject
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      a #GMimeContentDisposition
  */
  GMimeContentDisposition* disposition;

  /**
      a #GMimeContentType
  */
  GMimeContentType* contentType;

  /**
      a #GMimeHeaderList
  */
  GMimeHeaderList* headers;

  /**
      a Content-Id
  */
  char* contentId;

  /** */
  bool ensureNewline;
}

/**
    An OpenPGP marker for use with GMime's internal state machines used for detecting OpenPGP blocks.
*/
struct GMimeOpenPGPMarker
{
  /**
      The OpenPGP marker.
  */
  const(char)* marker;

  /**
      The length of the OpenPGP marker.
  */
  size_t len;

  /**
      The #GMimeOpenPGPState that the state machine must be in before encountering this marker.
  */
  GMimeOpenPGPState before;

  /**
      The #GMimeOpenPGPState that the state machine will transition into once this marker is found.
  */
  GMimeOpenPGPState after;

  /**
      true if the marker is an end marker; otherwise, false.
  */
  bool isEndMarker;
}

/**
    A parameter name/value pair as used in the Content-Type and Content-Disposition headers.
*/
struct GMimeParam
{
  /** */
  GObject parentObject;

  /**
      The encoding method used for the parameter value.
  */
  GMimeParamEncodingMethod method;

  /**
      The charset to use when encoding the parameter value.
  */
  char* charset;

  /**
      the language specifier to use when encoding the value.
  */
  char* lang;

  /**
      The parameter name.
  */
  char* name;

  /**
      The parameter value.
  */
  char* value;

  /** */
  void* changed;
}

/** */
struct GMimeParamClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A list of Content-Type or Content-Disposition parameters.
*/
struct GMimeParamList
{
  /** */
  GObject parentObject;

  /** */
  GPtrArray* array;

  /** */
  void* changed;
}

/** */
struct GMimeParamListClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A MIME parser context.
*/
struct GMimeParser
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      private parser state
  */
  void* priv;
}

/** */
struct GMimeParserClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A set of parser options used by #GMimeParser and various other parsing functions.
*/
struct GMimeParserOptions;

/**
    A leaf-node MIME part object.
*/
struct GMimePart
{
  /**
      parent #GMimeObject
  */
  GMimeObject parentObject;

  /**
      a #GMimeContentEncoding
  */
  GMimeContentEncoding encoding;

  /**
      a #GMimeOpenPGPData
  */
  GMimeOpenPGPData openpgp;

  /**
      Content-Description string
  */
  char* contentDescription;

  /**
      Content-Location string
  */
  char* contentLocation;

  /**
      Content-MD5 string
  */
  char* contentMd5;

  /**
      a #GMimeDataWrapper representing the MIME part's content
  */
  GMimeDataWrapper* content;
}

/** */
struct GMimePartClass
{
  /** */
  GMimeObjectClass parentClass;

  /** */
  extern(C) void function(GMimePart* mimePart, GMimeDataWrapper* content) setContent;
}

/**
    A MIME part iterator.
*/
struct GMimePartIter;

/**
    A PKCS7 crypto context.
*/
struct GMimePkcs7Context;

/** */
struct GMimePkcs7ContextClass;

/**
    A List of references, as per the References or In-Reply-To header
    fields.
*/
struct GMimeReferences
{
  /**
      the array of message-id references
  */
  GPtrArray* array;
}

/**
    An object containing useful information about a signature.
*/
struct GMimeSignature
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /**
      A bitfield of #GMimeSignatureStatus values.
  */
  GMimeSignatureStatus status;

  /**
      The #GMimeCertificate used in the signature.
  */
  GMimeCertificate* cert;

  /**
      The creation date of the signature.
  */
  long created;

  /**
      The expiration date of the signature.
  */
  long expires;
}

/** */
struct GMimeSignatureClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A collection of #GMimeSignature objects.
*/
struct GMimeSignatureList
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /** */
  GPtrArray* array;
}

/** */
struct GMimeSignatureListClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Abstract I/O stream class.
*/
struct GMimeStream
{
  /**
      parent #GObject
  */
  GObject parentObject;

  /** */
  GMimeStream* superStream;

  /** */
  long position;

  /** */
  long boundStart;

  /** */
  long boundEnd;
}

/**
    A buffered stream wrapper around any #GMimeStream object.
*/
struct GMimeStreamBuffer
{
  /**
      parent #GMimeStream
  */
  GMimeStream parentObject;

  /**
      buffering mode
  */
  GMimeStreamBufferMode mode;

  /**
      source stream
  */
  GMimeStream* source;

  /**
      internal buffer
  */
  char* buffer;

  /**
      current position in the buffer
  */
  char* bufptr;

  /**
      end of the buffer
  */
  char* bufend;

  /**
      buffer length
  */
  size_t buflen;
}

/** */
struct GMimeStreamBufferClass
{
  /** */
  GMimeStreamClass parentClass;
}

/**
    A concatenation of other #GMimeStream objects.
*/
struct GMimeStreamCat
{
  /**
      parent #GMimeStream
  */
  GMimeStream parentObject;

  /**
      list of sources
  */
  void* sources;

  /**
      current source
  */
  void* current;
}

/** */
struct GMimeStreamCatClass
{
  /** */
  GMimeStreamClass parentClass;
}

/** */
struct GMimeStreamClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) ptrdiff_t function(GMimeStream* stream, ubyte* buf, size_t len) read;

  /** */
  extern(C) ptrdiff_t function(GMimeStream* stream, const(ubyte)* buf, size_t len) write;

  /** */
  extern(C) int function(GMimeStream* stream) flush;

  /** */
  extern(C) int function(GMimeStream* stream) close;

  /** */
  extern(C) bool function(GMimeStream* stream) eos;

  /** */
  extern(C) int function(GMimeStream* stream) reset;

  /** */
  extern(C) long function(GMimeStream* stream, long offset, GMimeSeekWhence whence) seek;

  /** */
  extern(C) long function(GMimeStream* stream) tell;

  /** */
  extern(C) long function(GMimeStream* stream) length;

  /** */
  extern(C) GMimeStream* function(GMimeStream* stream, long start, long end) substream;
}

/**
    A #GMimeStream wrapper around standard-c FILE pointers.
*/
struct GMimeStreamFile
{
  /**
      parent #GMimeStream
  */
  GMimeStream parentObject;

  /**
      true if this stream owns @fd
  */
  bool owner;

  /**
      standard-c FILE pointer
  */
  void* fp;
}

/** */
struct GMimeStreamFileClass
{
  /** */
  GMimeStreamClass parentClass;
}

/**
    A #GMimeStream which passes data through any #GMimeFilter objects.
*/
struct GMimeStreamFilter
{
  /**
      parent #GMimeStream
  */
  GMimeStream parentObject;

  /**
      private state data
  */
  void* priv;

  /**
      source stream
  */
  GMimeStream* source;

  /** */
  bool owner;
}

/** */
struct GMimeStreamFilterClass
{
  /** */
  GMimeStreamClass parentClass;
}

/**
    A #GMimeStream wrapper around POSIX file descriptors.
*/
struct GMimeStreamFs
{
  /**
      parent #GMimeStream
  */
  GMimeStream parentObject;

  /**
      true if this stream owns @fd
  */
  bool owner;

  /**
      true if end-of-stream
  */
  bool eos;

  /**
      file descriptor
  */
  int fd;
}

/** */
struct GMimeStreamFsClass
{
  /** */
  GMimeStreamClass parentClass;
}

/**
    A #GMimeStream wrapper around GLib's GIO streams.
*/
struct GMimeStreamGIO
{
  /**
      parent #GMimeStream
  */
  GMimeStream parentObject;

  /**
      a #GOutputStream
  */
  GOutputStream* ostream;

  /**
      a #GInputStream
  */
  GInputStream* istream;

  /**
      a #GFile
  */
  GFile* file;

  /**
      true if this stream owns the #GFile or false otherwise
  */
  bool owner;

  /**
      true if the end of the stream has been reached or false otherwise
  */
  bool eos;
}

/** */
struct GMimeStreamGIOClass
{
  /** */
  GMimeStreamClass parentClass;
}

/**
    An I/O vector for use with [gmime.stream.Stream.writev].
*/
struct GMimeStreamIOVector
{
  /**
      data to pass to the I/O function.
  */
  void* data;

  /**
      length of the data, in bytes.
  */
  size_t len;
}

/**
    A memory-backed #GMimeStream.
*/
struct GMimeStreamMem
{
  /**
      parent #GMimeStream
  */
  GMimeStream parentObject;

  /**
      a memory buffer
  */
  GByteArray* buffer;

  /**
      true if this stream owns the memory buffer
  */
  bool owner;
}

/** */
struct GMimeStreamMemClass
{
  /** */
  GMimeStreamClass parentClass;
}

/**
    A memory-mapped #GMimeStream.
*/
struct GMimeStreamMmap
{
  /**
      parent #GMimeStream
  */
  GMimeStream parentObject;

  /**
      true if this stream owns the memory map
  */
  bool owner;

  /**
      true if end-of-stream
  */
  bool eos;

  /**
      file descriptor
  */
  int fd;

  /**
      memory map
  */
  char* map;

  /**
      length of the memory map
  */
  size_t maplen;
}

/** */
struct GMimeStreamMmapClass
{
  /** */
  GMimeStreamClass parentClass;
}

/**
    A #GMimeStream which has no backing store.
*/
struct GMimeStreamNull
{
  /**
      parent #GMimeStream
  */
  GMimeStream parentObject;

  /**
      number of bytes written to this stream
  */
  size_t written;

  /**
      the number of newlines written to this stream
  */
  size_t newlines;

  /**
      whether or not the stream should count newlines
  */
  bool countNewlines;
}

/** */
struct GMimeStreamNullClass
{
  /** */
  GMimeStreamClass parentClass;
}

/**
    A #GMimeStream wrapper around pipes.
*/
struct GMimeStreamPipe
{
  /**
      parent #GMimeStream
  */
  GMimeStream parentObject;

  /**
      true if this stream owns @fd
  */
  bool owner;

  /**
      true if end-of-stream
  */
  bool eos;

  /**
      pipe descriptor
  */
  int fd;
}

/** */
struct GMimeStreamPipeClass
{
  /** */
  GMimeStreamClass parentClass;
}

/**
    A text MIME part object.
*/
struct GMimeTextPart
{
  /**
      parent #GMimePart
  */
  GMimePart parentObject;
}

/** */
struct GMimeTextPartClass
{
  /** */
  GMimePartClass parentClass;
}

alias extern(C) GMimeCryptoContext* function() GMimeCryptoContextNewFunc;

alias extern(C) char* function(GMimeHeader* header, GMimeFormatOptions* options, const(char)* value, const(char)* charset) GMimeHeaderRawValueFormatter;

alias extern(C) void function(GMimeObject* parent, GMimeObject* part, void* userData) GMimeObjectForeachFunc;

alias extern(C) void function(GMimeParser* parser, const(char)* header, const(char)* value, long offset, void* userData) GMimeParserHeaderRegexFunc;

alias extern(C) void function(long offset, GMimeParserWarning errcode, const(char)* item, void* userData) GMimeParserWarningFunc;

alias extern(C) bool function(GMimeCryptoContext* ctx, const(char)* userId, const(char)* prompt, bool reprompt, GMimeStream* response, GError** _err) GMimePasswordRequestFunc;

