/// D types for gstrtsp1 library
module gid.gstrtsp1.types;

import gid.core.utils;
import gid.gio2.tls_certificate;
import gid.gio2.tls_connection;
import gid.gio2.types;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;


// Enums

/** */
alias RTSPAuthMethod = GstRTSPAuthMethod;

/** */
alias RTSPEvent = GstRTSPEvent;

/** */
alias RTSPFamily = GstRTSPFamily;

/** */
alias RTSPHeaderField = GstRTSPHeaderField;

/** */
alias RTSPLowerTrans = GstRTSPLowerTrans;

/** */
alias RTSPMethod = GstRTSPMethod;

/** */
alias RTSPMsgType = GstRTSPMsgType;

/** */
alias RTSPProfile = GstRTSPProfile;

/** */
alias RTSPRangeUnit = GstRTSPRangeUnit;

/** */
alias RTSPResult = GstRTSPResult;

/** */
alias RTSPState = GstRTSPState;

/** */
alias RTSPStatusCode = GstRTSPStatusCode;

/** */
alias RTSPTimeType = GstRTSPTimeType;

/** */
alias RTSPTransMode = GstRTSPTransMode;

/** */
alias RTSPVersion = GstRTSPVersion;

// Structs

/** */
alias RTSPTime = GstRTSPTime;

/** */
alias RTSPTime2 = GstRTSPTime2;

/** */
alias RTSPWatchFuncs = GstRTSPWatchFuncs;

// Callbacks

/** */
alias RTSPConnectionAcceptCertificateFunc = bool delegate(gid.gio2.tls_connection.TlsConnection conn, gid.gio2.tls_certificate.TlsCertificate peerCert, gid.gio2.types.TlsCertificateFlags errors);

/**
    The default RTSP port to connect to.
*/
enum RTSP_DEFAULT_PORT = 554;
