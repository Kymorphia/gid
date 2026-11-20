/// D types for arrow23 library
module arrow.types;

import arrow.c.functions;
import arrow.c.types;
import gid.gid;


// Aliases

/** */
alias TimePoint = GArrowTimePoint;

// Enums

/** */
alias AssumeTimezoneAmbiguous = GArrowAssumeTimezoneAmbiguous;

/** */
alias AssumeTimezoneNonexistent = GArrowAssumeTimezoneNonexistent;

/** */
alias CSVQuotingStyle = GArrowCSVQuotingStyle;

/** */
alias CalendarUnit = GArrowCalendarUnit;

/** */
alias CompressionType = GArrowCompressionType;

/** */
alias CountMode = GArrowCountMode;

/** */
alias DictionaryEncodeNullEncodingBehavior = GArrowDictionaryEncodeNullEncodingBehavior;

/** */
alias Error = GArrowError;

/** */
alias FileMode = GArrowFileMode;

/** */
alias FileType = GArrowFileType;

/** */
alias FilterNullSelectionBehavior = GArrowFilterNullSelectionBehavior;

/** */
alias IntervalType = GArrowIntervalType;

/** */
alias JSONReadUnexpectedFieldBehavior = GArrowJSONReadUnexpectedFieldBehavior;

/** */
alias JoinNullHandlingBehavior = GArrowJoinNullHandlingBehavior;

/** */
alias JoinType = GArrowJoinType;

/** */
alias ListSliceReturnFixedSizeList = GArrowListSliceReturnFixedSizeList;

/** */
alias MapLookupOccurrence = GArrowMapLookupOccurrence;

/** */
alias MetadataVersion = GArrowMetadataVersion;

/** */
alias NullPlacement = GArrowNullPlacement;

/** */
alias PivotWiderUnexpectedKeyBehavior = GArrowPivotWiderUnexpectedKeyBehavior;

/** */
alias QuantileInterpolation = GArrowQuantileInterpolation;

/** */
alias RankTiebreaker = GArrowRankTiebreaker;

/** */
alias RoundMode = GArrowRoundMode;

/** */
alias S3LogLevel = GArrowS3LogLevel;

/** */
alias SortOrder = GArrowSortOrder;

/** */
alias TimeUnit = GArrowTimeUnit;

/** */
alias Type = GArrowType;

/** */
alias UTF8NormalizeForm = GArrowUTF8NormalizeForm;

/**
    Sentinel value for the stop property in #GArrowListSliceOptions indicating
    that the stop value is not set. When this value is used, the slice will
    continue to the end of the list.
*/
enum LIST_SLICE_OPTIONS_STOP_UNSPECIFIED = -1;

/**
    The major version.
*/
enum VERSION_MAJOR = 23;

/**
    The micro version.
*/
enum VERSION_MICRO = 1;

/**
    The minor version.
*/
enum VERSION_MINOR = 0;

/**
    The version tag. Normally, it's an empty string. It's "SNAPSHOT"
    for snapshot version.
*/
enum VERSION_TAG = "";
