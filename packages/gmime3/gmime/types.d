/// D types for gmime3 library
module gmime.types;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.crypto_context;
import gmime.format_options;
import gmime.header;
import gmime.object;
import gmime.parser;
import gmime.stream;


// Enums

/** */
alias AddressType = GMimeAddressType;

/** */
alias AutocryptPreferEncrypt = GMimeAutocryptPreferEncrypt;

/** */
alias CipherAlgo = GMimeCipherAlgo;

/** */
alias ContentEncoding = GMimeContentEncoding;

/** */
alias DecryptFlags = GMimeDecryptFlags;

/** */
alias DigestAlgo = GMimeDigestAlgo;

/** */
alias EncodingConstraint = GMimeEncodingConstraint;

/** */
alias EncryptFlags = GMimeEncryptFlags;

/** */
alias FilterBestFlags = GMimeFilterBestFlags;

/** */
alias FilterFromMode = GMimeFilterFromMode;

/** */
alias FilterGZipMode = GMimeFilterGZipMode;

/** */
alias Format = GMimeFormat;

/** */
alias NewLineFormat = GMimeNewLineFormat;

/** */
alias OpenPGPData = GMimeOpenPGPData;

/** */
alias OpenPGPState = GMimeOpenPGPState;

/** */
alias ParamEncodingMethod = GMimeParamEncodingMethod;

/** */
alias ParserWarning = GMimeParserWarning;

/** */
alias PubKeyAlgo = GMimePubKeyAlgo;

/** */
alias RfcComplianceMode = GMimeRfcComplianceMode;

/** */
alias SecureMimeType = GMimeSecureMimeType;

/** */
alias SeekWhence = GMimeSeekWhence;

/** */
alias SignatureStatus = GMimeSignatureStatus;

/** */
alias StreamBufferMode = GMimeStreamBufferMode;

/** */
alias Trust = GMimeTrust;

/** */
alias Validity = GMimeValidity;

/** */
alias VerifyFlags = GMimeVerifyFlags;

// Structs

/** */
alias StreamIOVector = GMimeStreamIOVector;

// Callbacks

/**
    Function callback for encoding and formatting a header value.

    Params:
      header = a #GMimeHeader
      options = a #GMimeFormatOptions
      value = an unencoded header value
      charset = a charset
    Returns: the encoded and formatted raw header value.
*/
alias HeaderRawValueFormatter = string delegate(gmime.header.Header header, gmime.format_options.FormatOptions options, string value, string charset);

/**
    The function signature for a callback to [gmime.message.Message.foreach_]
    and [gmime.multipart.Multipart.foreach_].

    Params:
      parent = parent #GMimeObject
      part = a #GMimeObject
*/
alias ObjectForeachFunc = void delegate(gmime.object.ObjectWrap parent, gmime.object.ObjectWrap part);

/**
    Function signature for the callback to
    [gmime.parser.Parser.setHeaderRegex].

    Params:
      parser = The #GMimeParser object.
      header = The header field matched.
      value = The header field value.
      offset = The header field offset.
*/
alias ParserHeaderRegexFunc = void delegate(gmime.parser.Parser parser, string header, string value, long offset);

/**
    The function signature for a callback to [gmime.parser_options.ParserOptions.setWarningCallback].

    Params:
      offset = parser offset where the issue has been detected, or -1 if it is unknown
      errcode = a #GMimeParserWarning
      item = a NUL-terminated string containing the value causing the issue, may be null
*/
alias ParserWarningFunc = void delegate(long offset, gmime.types.ParserWarning errcode, string item);

/**
    A password request callback allowing a #GMimeCryptoContext to
    prompt the user for a password for a given key.

    Params:
      ctx = the #GMimeCryptoContext making the request
      userId = the user_id of the password being requested
      prompt = a string containing some helpful context for the prompt
      reprompt = true if this password request is a reprompt due to a previously bad password response
      response = a stream for the application to write the password to (followed by a newline '\n' character)
    Returns: true on success or false on error.
    Throws: [ErrorWrap]
*/
alias PasswordRequestFunc = bool delegate(gmime.crypto_context.CryptoContext ctx, string userId, string prompt, bool reprompt, gmime.stream.Stream response, GError **_err);

/**
    GMime's binary age.
*/
enum BINARY_AGE = 215;

/**
    Standard attachment disposition.
*/
enum DISPOSITION_ATTACHMENT = "attachment";

/**
    Standard inline disposition.
*/
enum DISPOSITION_INLINE = "inline";

/**
    A bit flag for [gmime.filter_enriched.FilterEnriched.new_] which signifies that
    the filter should expect Rich Text (aka RTF).
*/
enum FILTER_ENRICHED_IS_RICHTEXT = 1;

/**
    Enclose citation text in blockquotes.
*/
enum FILTER_HTML_BLOCKQUOTE_CITATION = 256;

/**
    Cites text by prepending "&gt; " to each cited line.
*/
enum FILTER_HTML_CITE = 128;

/**
    Wrap email addresses in "mailto:" href tags.
*/
enum FILTER_HTML_CONVERT_ADDRESSES = 32;

/**
    Convert new-lines ('\n') into &lt;br&gt; tags.
*/
enum FILTER_HTML_CONVERT_NL = 2;

/**
    Preserve whitespace by converting spaces into their appropriate
    html entities.
*/
enum FILTER_HTML_CONVERT_SPACES = 4;

/**
    Wrap detected URLs in &lt;a href=...&gt; tags.
*/
enum FILTER_HTML_CONVERT_URLS = 8;

/**
    Converts 8bit characters to '?'.
*/
enum FILTER_HTML_ESCAPE_8BIT = 64;

/**
    Change the colour of citation text.
*/
enum FILTER_HTML_MARK_CITATION = 16;

/**
    Wrap stream in &lt;pre&gt; and &lt;/pre&gt; tags.
*/
enum FILTER_HTML_PRE = 1;

/**
    GMime's interface age.
*/
enum INTERFACE_AGE = 1;

/**
    GMime's major version.
*/
enum MAJOR_VERSION = 3;

/**
    GMime's micro version.
*/
enum MICRO_VERSION = 15;

/**
    GMime's minor version.
*/
enum MINOR_VERSION = 2;

/**
    A convenience macro for masking out the non-error bit flags.
*/
enum SIGNATURE_STATUS_ERROR_MASK = -8;

/**
    State for the [gmime.encoding.Encoding.uudecodeStep] function, denoting that
    the 'begin' line has been found.
*/
enum UUDECODE_STATE_BEGIN = 65536;

/**
    State for the [gmime.encoding.Encoding.uudecodeStep] function, denoting that
    the end of the UU encoded block has been found.
*/
enum UUDECODE_STATE_END = 131072;

/**
    Initial state for the [gmime.encoding.Encoding.uudecodeStep] function.
*/
enum UUDECODE_STATE_INIT = 0;

/** */
enum UUDECODE_STATE_MASK = 0;

/**
    State bit that denotes the yEnc filter has found the =ybegin line.
*/
enum YDECODE_STATE_BEGIN = 4096;

/**
    State bit that denotes yEnc filter has begun decoding the actual
    yencoded content and will continue to do so until an =yend line is
    found (or until there is nothing left to decode).
*/
enum YDECODE_STATE_DECODE = 16384;

/**
    State bit that denoates that [gmime.global.ydecodeStep] has finished
    decoding.
*/
enum YDECODE_STATE_END = 32768;

/**
    State bit that denotes the yEnc filter has reached an end-of-line.
    
    This state is for internal use only.
*/
enum YDECODE_STATE_EOLN = 256;

/**
    State bit that denotes the yEnc filter has reached an escape
    sequence.
    
    This state is for internal use only.
*/
enum YDECODE_STATE_ESCAPE = 512;

/**
    Initial state for the [gmime.global.ydecodeStep] function.
*/
enum YDECODE_STATE_INIT = 0;

/**
    State bit that denotes the yEnc filter has found the =ypart
    line. (Note: not all yencoded blocks have one)
*/
enum YDECODE_STATE_PART = 8192;

/**
    Initial state for the crc and pcrc state variables.
*/
enum YENCODE_CRC_INIT = -1;

/**
    Initial state for the [gmime.global.ydecodeStep] function.
*/
enum YENCODE_STATE_INIT = 0;
