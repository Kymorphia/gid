/// C types for gstsdp1 library
module gstsdp.c.types;

public import gid.basictypes;
public import gst.c.types;

/**
    The different cache types
*/
enum GstMIKEYCacheType
{
  /**
      The envelope key MUST NOT be cached
  */
  None = 0,

  /**
      The envelope key MUST be cached
  */
  Always = 1,

  /**
      The envelope key MUST be cached, but only
                                to be used for the specific CSB.
  */
  ForCsb = 2,
}

/**
    The encryption algorithm used to encrypt the Encr data field
*/
enum GstMIKEYEncAlg
{
  /**
      no encryption
  */
  Null = 0,

  /**
      AES-CM using a 128-bit key
  */
  AesCm128 = 1,

  /**
      AES Key Wrap using a 128-bit key
  */
  AesKw128 = 2,

  /**
      AES-GCM using a 128-bit key (Since: 1.16)
  */
  AesGcm128 = 6,
}

/**
    The key validity type
*/
enum GstMIKEYKVType
{
  /**
      No specific usage rule
  */
  Null = 0,

  /**
      The key is associated with the SPI/MKI
  */
  Spi = 1,

  /**
      The key has a start and expiration time
  */
  Interval = 2,
}

/**
    The type of key.
*/
enum GstMIKEYKeyDataType
{
  /**
      a TEK Generation Key
  */
  Tgk = 0,

  /**
      Traffic-Encrypting Key
  */
  Tek = 2,
}

/**
    Specifies the authentication algorithm used
*/
enum GstMIKEYMacAlg
{
  /**
      no authentication
  */
  Null = 0,

  /**
      HMAC-SHA-1-160
  */
  HmacSha1160 = 1,
}

/**
    Specifies the method of uniquely mapping Crypto Sessions to the security
    protocol sessions.
*/
enum GstMIKEYMapType
{
  /**
      SRTP
  */
  MikeyMapTypeSrtp = 0,
}

/**
    The PRF function that has been/will be used for key derivation
*/
enum GstMIKEYPRFFunc
{
  /**
      MIKEY-1 PRF function
  */
  MikeyPrfMikey1 = 0,
}

/**
    Different MIKEY Payload types.
*/
enum GstMIKEYPayloadType
{
  /**
      Last payload
  */
  Last = 0,

  /**
      Key data transport payload
  */
  Kemac = 1,

  /**
      Envelope data payload
  */
  Pke = 2,

  /**
      DH data payload
  */
  Dh = 3,

  /**
      Signature payload
  */
  Sign = 4,

  /**
      Timestamp payload
  */
  T = 5,

  /**
      ID payload
  */
  Id = 6,

  /**
      Certificate Payload
  */
  Cert = 7,

  /**
      Cert hash payload
  */
  Chash = 8,

  /**
      Verification message payload
  */
  V = 9,

  /**
      Security Policy payload
  */
  Sp = 10,

  /**
      RAND payload
  */
  Rand = 11,

  /**
      Error payload
  */
  Err = 12,

  /**
      Key data sub-payload
  */
  KeyData = 20,

  /**
      General Extension Payload
  */
  GenExt = 21,
}

/**
    Specifies the security protocol
*/
enum GstMIKEYSecProto
{
  /**
      SRTP
  */
  MikeySecProtoSrtp = 0,
}

/**
    This policy specifies the parameters for SRTP and SRTCP
*/
enum GstMIKEYSecSRTP
{
  /**
      Encryption algorithm
  */
  EncAlg = 0,

  /**
      Session Encr. key length
  */
  EncKeyLen = 1,

  /**
      Authentication algorithm
  */
  AuthAlg = 2,

  /**
      Session Auth. key length
  */
  AuthKeyLen = 3,

  /**
      Session Salt key length
  */
  SaltKeyLen = 4,

  /**
      SRTP Pseudo Random Function
  */
  Prf = 5,

  /**
      Key derivation rate
  */
  KeyDerivRate = 6,

  /**
      SRTP encryption off/on, 0 if off, 1 if on
  */
  SrtpEnc = 7,

  /**
      SRTCP encryption off/on, 0 if off, 1 if on
  */
  SrtcpEnc = 8,

  /**
      sender's FEC order
  */
  FecOrder = 9,

  /**
      SRTP authentication off/on, 0 if off, 1 if on
  */
  SrtpAuth = 10,

  /**
      Authentication tag length
  */
  AuthTagLen = 11,

  /**
      SRTP prefix length
  */
  SrtpPrefixLen = 12,

  /**
      AEAD authentication tag length (Since: 1.16)
  */
  AeadAuthTagLen = 20,
}

/**
    Specifies the timestamp type.
*/
enum GstMIKEYTSType
{
  /**
      an NTP time in UTC timezone
  */
  NtpUtc = 0,

  /**
      an NTP time
  */
  Ntp = 1,

  /**
      a counter
  */
  Counter = 2,
}

/**
    Different MIKEY data types.
*/
enum GstMIKEYType
{
  /**
      Invalid type
  */
  Invalid = -1,

  /**
      Initiator's pre-shared key message
  */
  PskInit = 0,

  /**
      Verification message of a Pre-shared key message
  */
  PskVerify = 1,

  /**
      Initiator's public-key transport message
  */
  PkInit = 2,

  /**
      Verification message of a public-key message
  */
  PkVerify = 3,

  /**
      Initiator's DH exchange message
  */
  DhInit = 4,

  /**
      Responder's DH exchange message
  */
  DhResp = 5,

  /**
      Error message
  */
  Error = 6,
}

/**
    Return values for the SDP functions.
*/
enum GstSDPResult
{
  /**
      A successful return value
  */
  Ok = 0,

  /**
      a function was given invalid parameters
  */
  Einval = -1,
}

/** */
struct GstMIKEYDecryptInfo;

/** */
struct GstMIKEYEncryptInfo;

/**
    The Security policy Map item for SRTP
*/
struct GstMIKEYMapSRTP
{
  /**
      The security policy applied for the stream with @ssrc
  */
  ubyte policy;

  /**
      the SSRC that must be used for the stream
  */
  uint ssrc;

  /**
      current rollover counter
  */
  uint roc;
}

/**
    Structure holding the information of the MIKEY message
*/
struct GstMIKEYMessage
{
  /** */
  GstMiniObject miniObject;

  /**
      the version
  */
  ubyte version_;

  /**
      the #GstMIKEYType message type
  */
  GstMIKEYType type;

  /**
      verify flag
  */
  gboolean V;

  /**
      a #GstMIKEYPRFFunc
  */
  GstMIKEYPRFFunc prfFunc;

  /**
      Identifies the Crypto Session Bundle
  */
  uint CSBId;

  /**
      a #GstMIKEYMapType
  */
  GstMIKEYMapType mapType;

  /**
      map info array of type depending on @map_type
  */
  GArray* mapInfo;

  /**
      the payload array of #GstMIKEYPayload
  */
  GArray* payloads;
}

/**
    Hold the common fields for all payloads
*/
struct GstMIKEYPayload
{
  /** */
  GstMiniObject miniObject;

  /**
      the payload type
  */
  GstMIKEYPayloadType type;

  /**
      length of the payload
  */
  uint len;
}

/**
    A structure holding the KEMAC payload
*/
struct GstMIKEYPayloadKEMAC
{
  /**
      the common #GstMIKEYPayload
  */
  GstMIKEYPayload pt;

  /**
      the #GstMIKEYEncAlg
  */
  GstMIKEYEncAlg encAlg;

  /**
      the #GstMIKEYMacAlg
  */
  GstMIKEYMacAlg macAlg;

  /**
      the subpayloads
  */
  GArray* subpayloads;
}

/**
    The Key data payload contains key material. It should be added as sub
    payload to the KEMAC.
*/
struct GstMIKEYPayloadKeyData
{
  /**
      the payload header
  */
  GstMIKEYPayload pt;

  /**
      the #GstMIKEYKeyDataType of @key_data
  */
  GstMIKEYKeyDataType keyType;

  /**
      length of @key_data
  */
  ushort keyLen;

  /**
      the key data
  */
  ubyte* keyData;

  /**
      the length of @salt_data, can be 0
  */
  ushort saltLen;

  /**
      salt data
  */
  ubyte* saltData;

  /**
      the Key Validity type
  */
  GstMIKEYKVType kvType;

  /**
      length of @kv_data
  */
  ubyte[2] kvLen;

  /**
      key validity data
  */
  ubyte*[2] kvData;
}

/**
    The Envelope data payload contains the encrypted envelope key that is
    used in the public-key transport to protect the data in the Key data
    transport payload.  The encryption algorithm used is implicit from
    the certificate/public key used.
*/
struct GstMIKEYPayloadPKE
{
  /**
      the common #GstMIKEYPayload
  */
  GstMIKEYPayload pt;

  /**
      envelope key cache indicator
  */
  GstMIKEYCacheType C;

  /**
      length of @data
  */
  ushort dataLen;

  /**
      the encrypted envelope key
  */
  ubyte* data;
}

/**
    The RAND payload consists of a (pseudo-)random bit-string
*/
struct GstMIKEYPayloadRAND
{
  /**
      the payload header
  */
  GstMIKEYPayload pt;

  /**
      the length of @rand
  */
  ubyte len;

  /**
      random values
  */
  ubyte* rand;
}

/**
    The Security Policy payload defines a set of policies that apply to a
    specific security protocol
*/
struct GstMIKEYPayloadSP
{
  /**
      the payload header
  */
  GstMIKEYPayload pt;

  /**
      the policy number
  */
  uint policy;

  /**
      the security protocol
  */
  GstMIKEYSecProto proto;

  /**
      array of #GstMIKEYPayloadSPParam
  */
  GArray* params;
}

/**
    A Type/Length/Value field for security parameters
*/
struct GstMIKEYPayloadSPParam
{
  /**
      specifies the type of the parameter
  */
  ubyte type;

  /**
      specifies the length of @val
  */
  ubyte len;

  /**
      specifies the value of the parameter
  */
  ubyte* val;
}

/**
    The timestamp payload carries the timestamp information
*/
struct GstMIKEYPayloadT
{
  /**
      the payload header
  */
  GstMIKEYPayload pt;

  /**
      a #GstMIKEYTSType
  */
  GstMIKEYTSType type;

  /**
      the timestamp value
  */
  ubyte* tsValue;
}

/**
    The contents of the SDP "a=" field which contains a key/value pair.
*/
struct GstSDPAttribute
{
  /**
      the attribute key
  */
  char* key;

  /**
      the attribute value or NULL when it was a property attribute
  */
  char* value;
}

/**
    The contents of the SDP "b=" field which specifies the proposed bandwidth to
    be used by the session or media.
*/
struct GstSDPBandwidth
{
  /**
      the bandwidth modifier type
  */
  char* bwtype;

  /**
      the bandwidth in kilobits per second
  */
  uint bandwidth;
}

/**
    The contents of the SDP "c=" field which contains connection data.
*/
struct GstSDPConnection
{
  /**
      the type of network. "IN" is defined to have the meaning
         "Internet".
  */
  char* nettype;

  /**
      the type of @address.
  */
  char* addrtype;

  /**
      the address
  */
  char* address;

  /**
      the time to live of the address
  */
  uint ttl;

  /**
      the number of layers
  */
  uint addrNumber;
}

/**
    The contents of the SDP "k=" field which is used to convey encryption
    keys.
*/
struct GstSDPKey
{
  /**
      the encryption type
  */
  char* type;

  /**
      the encryption data
  */
  char* data;
}

/**
    The contents of the SDP "m=" field with all related fields.
*/
struct GstSDPMedia
{
  /**
      the media type
  */
  char* media;

  /**
      the transport port to which the media stream will be sent
  */
  uint port;

  /**
      the number of ports or -1 if only one port was specified
  */
  uint numPorts;

  /**
      the transport protocol
  */
  char* proto;

  /**
      an array of #gchar formats
  */
  GArray* fmts;

  /**
      the media title
  */
  char* information;

  /**
      array of #GstSDPConnection with media connection information
  */
  GArray* connections;

  /**
      array of #GstSDPBandwidth with media bandwidth information
  */
  GArray* bandwidths;

  /**
      the encryption key
  */
  GstSDPKey key;

  /**
      array of #GstSDPAttribute with the additional media attributes
  */
  GArray* attributes;
}

/**
    The GstSDPMessage helper functions makes it easy to parse and create SDP
    messages.
*/
struct GstSDPMessage
{
  /**
      the protocol version
  */
  char* version_;

  /**
      owner/creator and session identifier
  */
  GstSDPOrigin origin;

  /**
      session name
  */
  char* sessionName;

  /**
      session information
  */
  char* information;

  /**
      URI of description
  */
  char* uri;

  /**
      array of #gchar with email addresses
  */
  GArray* emails;

  /**
      array of #gchar with phone numbers
  */
  GArray* phones;

  /**
      connection information for the session
  */
  GstSDPConnection connection;

  /**
      array of #GstSDPBandwidth with bandwidth information
  */
  GArray* bandwidths;

  /**
      array of #GstSDPTime with time descriptions
  */
  GArray* times;

  /**
      array of #GstSDPZone with time zone adjustments
  */
  GArray* zones;

  /**
      encryption key
  */
  GstSDPKey key;

  /**
      array of #GstSDPAttribute with session attributes
  */
  GArray* attributes;

  /**
      array of #GstSDPMedia with media descriptions
  */
  GArray* medias;
}

/**
    The contents of the SDP "o=" field which gives the originator of the session
    (their username and the address of the user's host) plus a session id and
    session version number.
*/
struct GstSDPOrigin
{
  /**
      the user's login on the originating host, or it is "-"
         if the originating host does not support the concept of user ids.
  */
  char* username;

  /**
      is a numeric string such that the tuple of @username, @sess_id,
         @nettype, @addrtype and @addr form a globally unique identifier for the
         session.
  */
  char* sessId;

  /**
      a version number for this announcement
  */
  char* sessVersion;

  /**
      the type of network. "IN" is defined to have the meaning
         "Internet".
  */
  char* nettype;

  /**
      the type of @addr.
  */
  char* addrtype;

  /**
      the globally unique address of the machine from which the session was
          created.
  */
  char* addr;
}

/**
    The contents of the SDP "t=" field which specify the start and stop times for
    a conference session.
*/
struct GstSDPTime
{
  /**
      start time for the conference. The value is the decimal
          representation of Network Time Protocol (NTP) time values in seconds
  */
  char* start;

  /**
      stop time for the conference. The value is the decimal
          representation of Network Time Protocol (NTP) time values in seconds
  */
  char* stop;

  /**
      repeat times for a session
  */
  GArray* repeat;
}

/**
    The contents of the SDP "z=" field which allows the sender to
    specify a list of time zone adjustments and offsets from the base
    time.
*/
struct GstSDPZone
{
  /**
      the NTP time that a time zone adjustment happens
  */
  char* time;

  /**
      the offset from the time when the session was first scheduled
  */
  char* typedTime;
}

