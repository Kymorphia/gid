/// C types for gstrtsp1 library
module gstrtsp.c.types;

public import gid.basictypes;
public import gio.c.types;
public import gst.c.types;
public import gstbase.c.types;
public import gstsdp.c.types;

/**
    Authentication methods, ordered by strength
*/
enum GstRTSPAuthMethod
{
  /**
      no authentication
  */
  None = 0,

  /**
      basic authentication
  */
  Basic = 1,

  /**
      digest authentication
  */
  Digest = 2,
}

/**
    The possible events for the connection.
*/
enum GstRTSPEvent : uint
{
  /**
      connection is readable
  */
  Read = 1,

  /**
      connection is writable
  */
  Write = 2,
}

/**
    The possible network families.
*/
enum GstRTSPFamily
{
  /**
      unknown network family
  */
  None = 0,

  /**
      internet
  */
  Inet = 1,

  /**
      internet V6
  */
  Inet6 = 2,
}

/**
    Enumeration of rtsp header fields
*/
enum GstRTSPHeaderField
{
  /** */
  Invalid = 0,

  /** */
  Accept = 1,

  /** */
  AcceptEncoding = 2,

  /** */
  AcceptLanguage = 3,

  /** */
  Allow = 4,

  /** */
  Authorization = 5,

  /** */
  Bandwidth = 6,

  /** */
  Blocksize = 7,

  /** */
  CacheControl = 8,

  /** */
  Conference = 9,

  /** */
  Connection = 10,

  /** */
  ContentBase = 11,

  /** */
  ContentEncoding = 12,

  /** */
  ContentLanguage = 13,

  /** */
  ContentLength = 14,

  /** */
  ContentLocation = 15,

  /** */
  ContentType = 16,

  /** */
  Cseq = 17,

  /** */
  Date = 18,

  /** */
  Expires = 19,

  /** */
  From = 20,

  /** */
  IfModifiedSince = 21,

  /** */
  LastModified = 22,

  /** */
  ProxyAuthenticate = 23,

  /** */
  ProxyRequire = 24,

  /** */
  Public = 25,

  /** */
  Range = 26,

  /** */
  Referer = 27,

  /** */
  Require = 28,

  /** */
  RetryAfter = 29,

  /** */
  RtpInfo = 30,

  /** */
  Scale = 31,

  /** */
  Session = 32,

  /** */
  Server = 33,

  /** */
  Speed = 34,

  /** */
  Transport = 35,

  /** */
  Unsupported = 36,

  /** */
  UserAgent = 37,

  /** */
  Via = 38,

  /** */
  WwwAuthenticate = 39,

  /** */
  ClientChallenge = 40,

  /** */
  RealChallenge1 = 41,

  /** */
  RealChallenge2 = 42,

  /** */
  RealChallenge3 = 43,

  /** */
  Subscribe = 44,

  /** */
  Alert = 45,

  /** */
  ClientId = 46,

  /** */
  CompanyId = 47,

  /** */
  Guid = 48,

  /** */
  RegionData = 49,

  /** */
  MaxAsmWidth = 50,

  /** */
  Language = 51,

  /** */
  PlayerStartTime = 52,

  /** */
  Location = 53,

  /** */
  Etag = 54,

  /** */
  IfMatch = 55,

  /** */
  AcceptCharset = 56,

  /** */
  Supported = 57,

  /** */
  Vary = 58,

  /** */
  XAccelerateStreaming = 59,

  /** */
  XAcceptAuthent = 60,

  /** */
  XAcceptProxyAuthent = 61,

  /** */
  XBroadcastId = 62,

  /** */
  XBurstStreaming = 63,

  /** */
  XNotice = 64,

  /** */
  XPlayerLagTime = 65,

  /** */
  XPlaylist = 66,

  /** */
  XPlaylistChangeNotice = 67,

  /** */
  XPlaylistGenId = 68,

  /** */
  XPlaylistSeekId = 69,

  /** */
  XProxyClientAgent = 70,

  /** */
  XProxyClientVerb = 71,

  /** */
  XRecedingPlaylistchange = 72,

  /** */
  XRtpInfo = 73,

  /** */
  XStartupprofile = 74,

  /** */
  Timestamp = 75,

  /** */
  AuthenticationInfo = 76,

  /** */
  Host = 77,

  /** */
  Pragma = 78,

  /** */
  XServerIpAddress = 79,

  /** */
  XSessioncookie = 80,

  /** */
  RtcpInterval = 81,

  /** */
  Keymgmt = 82,

  /** */
  PipelinedRequests = 83,

  /** */
  MediaProperties = 84,

  /** */
  SeekStyle = 85,

  /** */
  AcceptRanges = 86,

  /** */
  Frames = 87,

  /** */
  RateControl = 88,

  /** */
  Last = 89,
}

/**
    The different transport methods.
*/
enum GstRTSPLowerTrans : uint
{
  /**
      invalid transport flag
  */
  Unknown = 0,

  /**
      stream data over UDP
  */
  Udp = 1,

  /**
      stream data over UDP multicast
  */
  UdpMcast = 2,

  /**
      stream data over TCP
  */
  Tcp = 4,

  /**
      stream data tunneled over HTTP.
  */
  Http = 16,

  /**
      encrypt TCP and HTTP with TLS
  */
  Tls = 32,
}

/**
    The different supported RTSP methods.
*/
enum GstRTSPMethod : uint
{
  /**
      invalid method
  */
  Invalid = 0,

  /**
      the DESCRIBE method
  */
  Describe = 1,

  /**
      the ANNOUNCE method
  */
  Announce = 2,

  /**
      the GET_PARAMETER method
  */
  GetParameter = 4,

  /**
      the OPTIONS method
  */
  Options = 8,

  /**
      the PAUSE method
  */
  Pause = 16,

  /**
      the PLAY method
  */
  Play = 32,

  /**
      the RECORD method
  */
  Record = 64,

  /**
      the REDIRECT method
  */
  Redirect = 128,

  /**
      the SETUP method
  */
  Setup = 256,

  /**
      the SET_PARAMETER method
  */
  SetParameter = 512,

  /**
      the TEARDOWN method
  */
  Teardown = 1024,

  /**
      the GET method (HTTP).
  */
  Get = 2048,

  /**
      the POST method (HTTP).
  */
  Post = 4096,
}

/**
    The type of a message.
*/
enum GstRTSPMsgType
{
  /**
      invalid message type
  */
  Invalid = 0,

  /**
      RTSP request message
  */
  Request = 1,

  /**
      RTSP response message
  */
  Response = 2,

  /**
      HTTP request message.
  */
  HttpRequest = 3,

  /**
      HTTP response message.
  */
  HttpResponse = 4,

  /**
      data message
  */
  Data = 5,
}

/**
    The transfer profile to use.
*/
enum GstRTSPProfile : uint
{
  /**
      invalid profile
  */
  Unknown = 0,

  /**
      the Audio/Visual profile (RFC 3551)
  */
  Avp = 1,

  /**
      the secure Audio/Visual profile (RFC 3711)
  */
  Savp = 2,

  /**
      the Audio/Visual profile with feedback (RFC 4585)
  */
  Avpf = 4,

  /**
      the secure Audio/Visual profile with feedback (RFC 5124)
  */
  Savpf = 8,
}

/**
    Different possible time range units.
*/
enum GstRTSPRangeUnit
{
  /**
      SMPTE timecode
  */
  Smpte = 0,

  /**
      29.97 frames per second
  */
  Smpte30Drop = 1,

  /**
      25 frames per second
  */
  Smpte25 = 2,

  /**
      Normal play time
  */
  Npt = 3,

  /**
      Absolute time expressed as ISO 8601 timestamps
  */
  Clock = 4,
}

/**
    Result codes from the RTSP functions.
*/
enum GstRTSPResult
{
  /**
      no error
  */
  Ok = 0,

  /**
      RTSP request is successful, but was redirected.
  */
  OkRedirect = 1,

  /**
      some unspecified error occurred
  */
  Error = -1,

  /**
      invalid arguments were provided to a function
  */
  Einval = -2,

  /**
      an operation was canceled
  */
  Eintr = -3,

  /**
      no memory was available for the operation
  */
  Enomem = -4,

  /**
      a host resolve error occurred
  */
  Eresolv = -5,

  /**
      function not implemented
  */
  Enotimpl = -6,

  /**
      a system error occurred, errno contains more details
  */
  Esys = -7,

  /**
      a parsing error occurred
  */
  Eparse = -8,

  /**
      windows networking could not start
  */
  Ewsastart = -9,

  /**
      windows networking stack has wrong version
  */
  Ewsaversion = -10,

  /**
      end-of-file was reached
  */
  Eeof = -11,

  /**
      a network problem occurred, h_errno contains more details
  */
  Enet = -12,

  /**
      the host is not an IP host
  */
  Enotip = -13,

  /**
      a timeout occurred
  */
  Etimeout = -14,

  /**
      the tunnel GET request has been performed
  */
  Etget = -15,

  /**
      the tunnel POST request has been performed
  */
  Etpost = -16,

  /**
      last error
  */
  Elast = -17,
}

/**
    The different RTSP states.
*/
enum GstRTSPState
{
  /**
      invalid state
  */
  Invalid = 0,

  /**
      initializing
  */
  Init = 1,

  /**
      ready for operation
  */
  Ready = 2,

  /**
      seeking in progress
  */
  Seeking = 3,

  /**
      playing
  */
  Playing = 4,

  /**
      recording
  */
  Recording = 5,
}

/**
    Enumeration of rtsp status codes
*/
enum GstRTSPStatusCode
{
  /** */
  Invalid = 0,

  /** */
  Continue = 100,

  /** */
  Ok = 200,

  /** */
  Created = 201,

  /** */
  LowOnStorage = 250,

  /** */
  MultipleChoices = 300,

  /** */
  MovedPermanently = 301,

  /** */
  MoveTemporarily = 302,

  /** */
  SeeOther = 303,

  /** */
  NotModified = 304,

  /** */
  UseProxy = 305,

  /**
      RTSP request is temporarily redirected
  */
  RedirectTemporarily = 307,

  /**
      RTSP request is permanently redirected
  */
  RedirectPermanently = 308,

  /** */
  BadRequest = 400,

  /** */
  Unauthorized = 401,

  /** */
  PaymentRequired = 402,

  /** */
  Forbidden = 403,

  /** */
  NotFound = 404,

  /** */
  MethodNotAllowed = 405,

  /** */
  NotAcceptable = 406,

  /** */
  ProxyAuthRequired = 407,

  /** */
  RequestTimeout = 408,

  /** */
  Gone = 410,

  /** */
  LengthRequired = 411,

  /** */
  PreconditionFailed = 412,

  /** */
  RequestEntityTooLarge = 413,

  /** */
  RequestUriTooLarge = 414,

  /** */
  UnsupportedMediaType = 415,

  /** */
  ParameterNotUnderstood = 451,

  /** */
  ConferenceNotFound = 452,

  /** */
  NotEnoughBandwidth = 453,

  /** */
  SessionNotFound = 454,

  /** */
  MethodNotValidInThisState = 455,

  /** */
  HeaderFieldNotValidForResource = 456,

  /** */
  InvalidRange = 457,

  /** */
  ParameterIsReadonly = 458,

  /** */
  AggregateOperationNotAllowed = 459,

  /** */
  OnlyAggregateOperationAllowed = 460,

  /** */
  UnsupportedTransport = 461,

  /** */
  DestinationUnreachable = 462,

  /** */
  KeyManagementFailure = 463,

  /** */
  InternalServerError = 500,

  /** */
  NotImplemented = 501,

  /** */
  BadGateway = 502,

  /** */
  ServiceUnavailable = 503,

  /** */
  GatewayTimeout = 504,

  /** */
  RtspVersionNotSupported = 505,

  /** */
  OptionNotSupported = 551,
}

/**
    Possible time types.
*/
enum GstRTSPTimeType
{
  /**
      seconds
  */
  Seconds = 0,

  /**
      now
  */
  Now = 1,

  /**
      end
  */
  End = 2,

  /**
      frames and subframes
  */
  Frames = 3,

  /**
      UTC time
  */
  Utc = 4,
}

/**
    The transfer mode to use.
*/
enum GstRTSPTransMode : uint
{
  /**
      invalid tansport mode
  */
  Unknown = 0,

  /**
      transfer RTP data
  */
  Rtp = 1,

  /**
      transfer RDT (RealMedia) data
  */
  Rdt = 2,
}

/**
    The supported RTSP versions.
*/
enum GstRTSPVersion
{
  /**
      unknown/invalid version
  */
  Invalid = 0,

  /**
      version 1.0
  */
  _10 = 16,

  /**
      version 1.1.
  */
  _11 = 17,

  /**
      version 2.0.
  */
  _20 = 32,
}

/**
    RTSP Authentication credentials
*/
struct GstRTSPAuthCredential
{
  /**
      a #GstRTSPAuthMethod
  */
  GstRTSPAuthMethod scheme;

  /**
      A NULL-terminated array of #GstRTSPAuthParam
  */
  GstRTSPAuthParam** params;

  /**
      The authorization for the basic schem
  */
  char* authorization;
}

/**
    RTSP Authentication parameter
*/
struct GstRTSPAuthParam
{
  /**
      The name of the parameter
  */
  char* name;

  /**
      The value of the parameter
  */
  char* value;
}

/**
    This object manages the RTSP connection to the server. It provides function
    to receive and send bytes and messages.
*/
struct GstRTSPConnection;

/**
    This interface is implemented e.g. by the Windows Media Streaming RTSP
     exentension (rtspwms) and the RealMedia RTSP extension (rtspreal).
*/
struct GstRTSPExtension;

/**
    An interface representing RTSP extensions.
*/
struct GstRTSPExtensionInterface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) gboolean function(GstRTSPExtension* ext, GstRTSPMessage* resp) detectServer;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req) beforeSend;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req, GstRTSPMessage* resp) afterSend;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstSDPMessage* sdp, GstStructure* s) parseSdp;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstSDPMedia* media) setupMedia;

  /** */
  extern(C) gboolean function(GstRTSPExtension* ext, GstCaps* caps) configureStream;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPLowerTrans protocols, char** transport) getTransports;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPUrl* url) streamSelect;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req, GstRTSPMessage* resp) send;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req) receiveRequest;

  /** */
  void*[4] GstReserved;
}

/**
    Provides methods for creating and parsing request, response and data messages.
*/
struct GstRTSPMessage
{
  /**
      the message type
  */
  GstRTSPMsgType type;

  /** */
  /** */
  union TypeDataType
  {
    /** */
    /** */
    struct RequestType
    {
      /** */
      GstRTSPMethod method;

      /** */
      char* uri;

      /** */
      GstRTSPVersion version_;
    }

    RequestType request;

    /** */
    /** */
    struct ResponseType
    {
      /** */
      GstRTSPStatusCode code;

      /** */
      char* reason;

      /** */
      GstRTSPVersion version_;
    }

    ResponseType response;

    /** */
    /** */
    struct DataType
    {
      /** */
      ubyte channel;
    }

    DataType data;
  }

  TypeDataType typeData;

  /** */
  GArray* hdrFields;

  /** */
  ubyte* body_;

  /** */
  uint bodySize;

  /** */
  GstBuffer* bodyBuffer;

  /** */
  void*[3] GstReserved;
}

/**
    Provides helper functions to deal with time ranges.
*/
struct GstRTSPRange
{
  /**
      minimum value of the range
  */
  int min;

  /**
      maximum value of the range
  */
  int max;
}

/**
    A time indication.
*/
struct GstRTSPTime
{
  /**
      the time of the time
  */
  GstRTSPTimeType type;

  /**
      seconds when @type is GST_RTSP_TIME_SECONDS,
                GST_RTSP_TIME_UTC and GST_RTSP_TIME_FRAMES
  */
  double seconds;
}

/**
    Extra fields for a time indication.
*/
struct GstRTSPTime2
{
  /**
      frames and subframes when type in GstRTSPTime is
               GST_RTSP_TIME_FRAMES
  */
  double frames;

  /**
      year when type is GST_RTSP_TIME_UTC
  */
  uint year;

  /**
      month when type is GST_RTSP_TIME_UTC
  */
  uint month;

  /**
      day when type is GST_RTSP_TIME_UTC
  */
  uint day;
}

/**
    A time range.
*/
struct GstRTSPTimeRange
{
  /**
      the time units used
  */
  GstRTSPRangeUnit unit;

  /**
      the minimum interval
  */
  GstRTSPTime min;

  /**
      the maximum interval
  */
  GstRTSPTime max;

  /**
      extra fields in the minimum interval (Since: 1.2)
  */
  GstRTSPTime2 min2;

  /**
      extra fields in the maximum interval (Since: 1.2)
  */
  GstRTSPTime2 max2;
}

/**
    Provides helper functions to deal with RTSP transport strings.
*/
struct GstRTSPTransport
{
  /**
      the transport mode
  */
  GstRTSPTransMode trans;

  /**
      the tansport profile
  */
  GstRTSPProfile profile;

  /**
      the lower transport
  */
  GstRTSPLowerTrans lowerTransport;

  /**
      the destination ip/hostname
  */
  char* destination;

  /**
      the source ip/hostname
  */
  char* source;

  /**
      the number of layers
  */
  uint layers;

  /**
      if play mode was selected
  */
  gboolean modePlay;

  /**
      if record mode was selected
  */
  gboolean modeRecord;

  /**
      is append mode was selected
  */
  gboolean append;

  /**
      the interleave range
  */
  GstRTSPRange interleaved;

  /**
      the time to live for multicast UDP
  */
  uint ttl;

  /**
      the port pair for multicast sessions
  */
  GstRTSPRange port;

  /**
      the client port pair for receiving data. For TCP
        based transports, applications can use this field to store the
        sender and receiver ports of the client.
  */
  GstRTSPRange clientPort;

  /**
      the server port pair for receiving data. For TCP
        based transports, applications can use this field to store the
        sender and receiver ports of the server.
  */
  GstRTSPRange serverPort;

  /**
      the ssrc that the sender/receiver will use
  */
  uint ssrc;

  /** */
  void*[4] GstReserved;
}

/**
    Provides helper functions to handle RTSP urls.
*/
struct GstRTSPUrl
{
  /**
      the transports allowed
  */
  GstRTSPLowerTrans transports;

  /**
      the family
  */
  GstRTSPFamily family;

  /**
      the user
  */
  char* user;

  /**
      the password
  */
  char* passwd;

  /**
      the host
  */
  char* host;

  /**
      the port
  */
  ushort port;

  /**
      the absolute path
  */
  char* abspath;

  /**
      additional query parameters
  */
  char* query;
}

/**
    Opaque RTSP watch object that can be used for asynchronous RTSP
    operations.
*/
struct GstRTSPWatch;

/**
    Callback functions from a #GstRTSPWatch.
*/
struct GstRTSPWatchFuncs
{
  /**
      callback when a message was received
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, GstRTSPMessage* message, void* userData) messageReceived;

  /**
      callback when a message was sent
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, uint id, void* userData) messageSent;

  /**
      callback when the connection is closed
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, void* userData) closed;

  /**
      callback when an error occurred
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, GstRTSPResult result, void* userData) error;

  /**
      a client started a tunneled connection. The tunnelid of the
        connection must be saved.
  */
  extern(C) GstRTSPStatusCode function(GstRTSPWatch* watch, void* userData) tunnelStart;

  /**
      a client finished a tunneled connection. In this callback
        you usually pair the tunnelid of this connection with the saved one using
        [gstrtsp.rtspconnection.RTSPConnection.doTunnel].
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, void* userData) tunnelComplete;

  /**
      callback when an error occurred with more information than
        the @error callback.
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, GstRTSPResult result, GstRTSPMessage* message, uint id, void* userData) errorFull;

  /**
      callback when the post connection of a tunnel is closed.
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, void* userData) tunnelLost;

  /**
      callback when an HTTP response to the GET request
        is about to be sent for a tunneled connection. The response can be
        modified in the callback. Since: 1.4.
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, GstRTSPMessage* request, GstRTSPMessage* response, void* userData) tunnelHttpResponse;

  /** */
  void*[3] GstReserved;
}

alias extern(C) gboolean function(GTlsConnection* conn, GTlsCertificate* peerCert, GTlsCertificateFlags errors, void* userData) GstRTSPConnectionAcceptCertificateFunc;

