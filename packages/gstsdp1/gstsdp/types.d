/// D types for gstsdp1 library
module gstsdp.types;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;


// Enums

/** */
alias MIKEYCacheType = GstMIKEYCacheType;

/** */
alias MIKEYEncAlg = GstMIKEYEncAlg;

/** */
alias MIKEYKVType = GstMIKEYKVType;

/** */
alias MIKEYKeyDataType = GstMIKEYKeyDataType;

/** */
alias MIKEYMacAlg = GstMIKEYMacAlg;

/** */
alias MIKEYMapType = GstMIKEYMapType;

/** */
alias MIKEYPRFFunc = GstMIKEYPRFFunc;

/** */
alias MIKEYPayloadType = GstMIKEYPayloadType;

/** */
alias MIKEYSecProto = GstMIKEYSecProto;

/** */
alias MIKEYSecSRTP = GstMIKEYSecSRTP;

/** */
alias MIKEYTSType = GstMIKEYTSType;

/** */
alias MIKEYType = GstMIKEYType;

/** */
alias SDPResult = GstSDPResult;

// Structs

/** */
alias MIKEYDecryptInfo = GstMIKEYDecryptInfo*;

/** */
alias MIKEYEncryptInfo = GstMIKEYEncryptInfo*;

/** */
alias MIKEYMapSRTP = GstMIKEYMapSRTP;

/**
    The supported MIKEY version 1.
*/
enum MIKEY_VERSION = 1;

/**
    The Application-Specific Maximum bandwidth modifier.
*/
enum SDP_BWTYPE_AS = "AS";

/**
    The Conference Total bandwidth modifier.
*/
enum SDP_BWTYPE_CT = "CT";

/**
    The extension prefix bandwidth modifier.
*/
enum SDP_BWTYPE_EXT_PREFIX = "X-";

/**
    RTCP bandwidth allocated to data receivers (RFC 3556).
*/
enum SDP_BWTYPE_RR = "RR";

/**
    RTCP bandwidth allocated to active data senders (RFC 3556).
*/
enum SDP_BWTYPE_RS = "RS";

/**
    Transport Independent Application Specific Maximum bandwidth (RFC 3890).
*/
enum SDP_BWTYPE_TIAS = "TIAS";
