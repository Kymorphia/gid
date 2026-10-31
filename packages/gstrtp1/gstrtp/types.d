/// D types for gstrtp1 library
module gstrtp.types;

import gid.gid;
import gstrtp.c.functions;
import gstrtp.c.types;


// Enums

/** */
alias RTCPFBType = GstRTCPFBType;

/** */
alias RTCPSDESType = GstRTCPSDESType;

/** */
alias RTCPType = GstRTCPType;

/** */
alias RTCPXRType = GstRTCPXRType;

/** */
alias RTPBufferFlags = GstRTPBufferFlags;

/** */
alias RTPBufferMapFlags = GstRTPBufferMapFlags;

/** */
alias RTPHeaderExtensionDirection = GstRTPHeaderExtensionDirection;

/** */
alias RTPHeaderExtensionFlags = GstRTPHeaderExtensionFlags;

/** */
alias RTPPayload = GstRTPPayload;

/** */
alias RTPProfile = GstRTPProfile;

/**
    The maximum amount of SSRCs in a BYE packet.
*/
enum RTCP_MAX_BYE_SSRC_COUNT = 31;

/**
    The maximum amount of Receiver report blocks in RR and SR messages.
*/
enum RTCP_MAX_RB_COUNT = 31;

/**
    The maximum text length for an SDES item.
*/
enum RTCP_MAX_SDES = 255;

/**
    The maximum amount of SDES items.
*/
enum RTCP_MAX_SDES_ITEM_COUNT = 31;

/**
    Mask for version and packet type pair allowing reduced size
    packets, basically it accepts other types than RR and SR
*/
enum RTCP_REDUCED_SIZE_VALID_MASK = 49400;

/**
    Mask for version, padding bit and packet type pair
*/
enum RTCP_VALID_MASK = 57598;

/**
    Valid value for the first two bytes of an RTCP packet after applying
    #GST_RTCP_VALID_MASK to them.
*/
enum RTCP_VALID_VALUE = 32968;

/**
    The supported RTCP version 2.
*/
enum RTCP_VERSION = 2;

/** */
enum RTP_HDREXT_BASE = "urn:ietf:params:rtp-hdrext:";

/**
    Constant string used in element classification to signal that this element
    is a RTP header extension.
*/
enum RTP_HDREXT_ELEMENT_CLASS = "Network/Extension/RTPHeader";

/** */
enum RTP_HDREXT_NTP_56 = "ntp-56";

/** */
enum RTP_HDREXT_NTP_56_SIZE = 7;

/** */
enum RTP_HDREXT_NTP_64 = "ntp-64";

/** */
enum RTP_HDREXT_NTP_64_SIZE = 8;

/** */
enum RTP_HEADER_EXTENSION_URI_METADATA_KEY = "RTP-Header-Extension-URI";

/** */
enum RTP_PAYLOAD_1016_STRING = "1";

/** */
enum RTP_PAYLOAD_CELLB_STRING = "25";

/** */
enum RTP_PAYLOAD_CN_STRING = "13";

/** */
enum RTP_PAYLOAD_DVI4_11025_STRING = "16";

/** */
enum RTP_PAYLOAD_DVI4_16000_STRING = "6";

/** */
enum RTP_PAYLOAD_DVI4_22050_STRING = "17";

/** */
enum RTP_PAYLOAD_DVI4_8000_STRING = "5";

/** */
enum RTP_PAYLOAD_DYNAMIC_STRING = "[96, 127]";

/** */
enum RTP_PAYLOAD_G721_STRING = "2";

/** */
enum RTP_PAYLOAD_G722_STRING = "9";

/** */
enum RTP_PAYLOAD_G723_53 = 17;

/** */
enum RTP_PAYLOAD_G723_53_STRING = "17";

/** */
enum RTP_PAYLOAD_G723_63 = 16;

/** */
enum RTP_PAYLOAD_G723_63_STRING = "16";

/** */
enum RTP_PAYLOAD_G723_STRING = "4";

/** */
enum RTP_PAYLOAD_G728_STRING = "15";

/** */
enum RTP_PAYLOAD_G729_STRING = "18";

/** */
enum RTP_PAYLOAD_GSM_STRING = "3";

/** */
enum RTP_PAYLOAD_H261_STRING = "31";

/** */
enum RTP_PAYLOAD_H263_STRING = "34";

/** */
enum RTP_PAYLOAD_JPEG_STRING = "26";

/** */
enum RTP_PAYLOAD_L16_MONO_STRING = "11";

/** */
enum RTP_PAYLOAD_L16_STEREO_STRING = "10";

/** */
enum RTP_PAYLOAD_LPC_STRING = "7";

/** */
enum RTP_PAYLOAD_MP2T_STRING = "33";

/** */
enum RTP_PAYLOAD_MPA_STRING = "14";

/** */
enum RTP_PAYLOAD_MPV_STRING = "32";

/** */
enum RTP_PAYLOAD_NV_STRING = "28";

/** */
enum RTP_PAYLOAD_PCMA_STRING = "8";

/** */
enum RTP_PAYLOAD_PCMU_STRING = "0";

/** */
enum RTP_PAYLOAD_QCELP_STRING = "12";

/** */
enum RTP_PAYLOAD_TS41 = 19;

/** */
enum RTP_PAYLOAD_TS41_STRING = "19";

/** */
enum RTP_PAYLOAD_TS48 = 18;

/** */
enum RTP_PAYLOAD_TS48_STRING = "18";

/** */
enum RTP_SOURCE_META_MAX_CSRC_COUNT = 15;

/**
    The supported RTP version 2.
*/
enum RTP_VERSION = 2;
