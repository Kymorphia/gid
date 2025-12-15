/// C types for arrow1 library
module arrow.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import gio.c.types;

/** */
alias GArrowTimePoint = long;

/**
    They are corresponding to `arrow::Compression::type` values.
*/
enum GArrowCompressionType
{
  /**
      Not compressed.
  */
  Uncompressed = 0,

  /**
      Snappy compression.
  */
  Snappy = 1,

  /**
      gzip compression.
  */
  Gzip = 2,

  /**
      Brotli compression.
  */
  Brotli = 3,

  /**
      Zstandard compression.
  */
  Zstd = 4,

  /**
      LZ4 compression.
  */
  Lz4 = 5,

  /**
      LZO compression.
  */
  Lzo = 6,

  /**
      bzip2 compression.
  */
  Bz2 = 7,
}

/**
    They correspond to the values of `arrow::compute::CountOptions::CountMode`.
*/
enum GArrowCountMode
{
  /**
      Only non-null values will be counted.
  */
  OnlyValid = 0,

  /**
      Only null values will be counted.
  */
  OnlyNull = 1,

  /**
      All will be counted.
  */
  All = 2,
}

/**
    The error codes are used by all arrow-glib functions.
    
    They are corresponding to `arrow::Status` values.
*/
enum GArrowError
{
  /**
      Out of memory error.
  */
  OutOfMemory = 1,

  /**
      Key error.
  */
  Key = 2,

  /**
      Type error.
  */
  Type = 3,

  /**
      Invalid value error.
  */
  Invalid = 4,

  /**
      IO error.
  */
  Io = 5,

  /**
      Capacity error.
  */
  Capacity = 6,

  /**
      Index error.
  */
  Index = 7,

  /**
      Unknown error.
  */
  Unknown = 9,

  /**
      The feature is not implemented.
  */
  NotImplemented = 10,

  /**
      Serialization error.
  */
  Serialization = 11,

  /**
      Error generating code for expression evaluation
        in Gandiva.
  */
  CodeGeneration = 40,

  /**
      Validation errors in expression given for code
      generation.
  */
  ExpressionValidation = 41,

  /**
      Execution error while evaluating the expression against a
      record batch.
  */
  Execution = 42,

  /**
      Item already exists error.
  */
  AlreadyExists = 45,
}

/**
    They are corresponding to `arrow::io::FileMode::type` values.
*/
enum GArrowFileMode
{
  /**
      For read.
  */
  Read = 0,

  /**
      For write.
  */
  Write = 1,

  /**
      For read-write.
  */
  Readwrite = 2,
}

/**
    They are corresponding to `arrow::fs::FileType` values.
*/
enum GArrowFileType
{
  /**
      Entry is not found
  */
  NotFound = 0,

  /**
      Entry exists but its type is unknown
  */
  Unknown = 1,

  /**
      Entry is a regular file
  */
  File = 2,

  /**
      Entry is a directory
  */
  Dir = 3,
}

/**
    They are corresponding to
    `arrow::compute::FilterOptions::NullSelectionBehavior` values.
*/
enum GArrowFilterNullSelectionBehavior
{
  /**
      Filtered value will be removed in the output.
  */
  Drop = 0,

  /**
      Filtered value will be null in the output.
  */
  EmitNull = 1,
}

/**
    They are corresponding to `arrow::IntervalType::type` values.
    
    Since 7.0.0
*/
enum GArrowIntervalType
{
  /**
      A number of months.
  */
  Month = 0,

  /**
      A number of days and
        milliseconds (fraction of day).
  */
  DayTime = 1,

  /**
      A number of months, days and
        nanoseconds between two dates.
  */
  MonthDayNano = 2,
}

/**
    They are corresponding to `arrow::json::UnexpectedFieldBehavior` values.
*/
enum GArrowJSONReadUnexpectedFieldBehavior
{
  /**
      Ignore other fields.
  */
  Ignore = 0,

  /**
      Return error.
  */
  Error = 1,

  /**
      Infer a type.
  */
  InferType = 2,
}

/**
    They correspond to the values of `arrow::compute::JoinType`.
*/
enum GArrowJoinType
{
  /** */
  LeftSemi = 0,

  /** */
  RightSemi = 1,

  /** */
  LeftAnti = 2,

  /** */
  RightAnti = 3,

  /** */
  Inner = 4,

  /** */
  LeftOuter = 5,

  /** */
  RightOuter = 6,

  /** */
  FullOuter = 7,
}

/**
    They are corresponding to `arrow::ipc::MetadataVersion::type`
    values.
*/
enum GArrowMetadataVersion
{
  /**
      Version 1.
  */
  V1 = 0,

  /**
      Version 2.
  */
  V2 = 1,

  /**
      Version 3.
  */
  V3 = 2,
}

/**
    They are corresponding to `arrow::compute::NullPlacement` values.
*/
enum GArrowNullPlacement
{
  /**
      Place nulls and NaNs before any non-null values.
        NaNs will come after nulls.
  */
  AtStart = 0,

  /**
      Place nulls and NaNs after any non-null values.
        NaNs will come before nulls.
  */
  AtEnd = 1,
}

/**
    They correspond to the values of
    `arrow::compute::QuantileOptions::Interpolation`.
*/
enum GArrowQuantileInterpolation
{
  /**
      Linear.
  */
  Linear = 0,

  /**
      Lower.
  */
  Lower = 1,

  /**
      Higher.
  */
  Higher = 2,

  /**
      Nearest.
  */
  Nearest = 3,

  /**
      Midpoint.
  */
  Midpoint = 4,
}

/** */
enum GArrowRankTiebreaker
{
  /** */
  Min = 0,

  /** */
  Max = 1,

  /** */
  First = 2,

  /** */
  Dense = 3,
}

/**
    They correspond to the values of `arrow::compute::RoundMode`.
*/
enum GArrowRoundMode
{
  /** */
  Down = 0,

  /** */
  Up = 1,

  /**
      Get the integral part without fractional digits (aka "trunc")
      @GARROW_ROUND_TOWARDS_INFINITY,
        Round negative values with @GARROW_ROUND_MODE_DOWN rule
        and positive values with UP rule (aka "away from zero")
      @GARROW_ROUND_HALF_DOWN,
        Round ties with @GARROW_ROUND_MODE_DOWN rule
        (also called "round half towards negative infinity")
      @GARROW_ROUND_HALF_UP,
        Round ties with @GARROW_ROUND_MODE_UP rule
        (also called "round half towards positive infinity")
      @GARROW_ROUND_HALF_TOWARDS_ZERO,
        Round ties with GARROW_ROUND_MODE_TOWARDS_ZERO rule
        (also called "round half away from infinity")
      @GARROW_ROUND_HALF_TOWARDS_INFINITY,
        Round ties with GARROW_ROUND_MODE_TOWARDS_INFINITY rule
        (also called "round half away from zero")
      @GARROW_ROUND_HALF_TO_EVEN,
        Round ties to nearest even integer
      @GARROW_ROUND_HALF_TO_ODD,
        Round ties to nearest odd integer
  */
  TowardsZero = 2,

  /** */
  TowardsInfinity = 3,

  /** */
  HalfDown = 4,

  /** */
  HalfUp = 5,

  /** */
  HalfTowardsZero = 6,

  /** */
  HalfTowardsInfinity = 7,

  /** */
  HalfToEven = 8,

  /** */
  HalfToOdd = 9,
}

/**
    They are corresponding to `arrow::fs::S3LogLevel` values.
*/
enum GArrowS3LogLevel
{
  /**
      Off.
  */
  Off = 0,

  /**
      Fatal. This is the default.
  */
  Fatal = 1,

  /**
      Error.
  */
  Error = 2,

  /**
      Warn.
  */
  Warn = 3,

  /**
      Info.
  */
  Info = 4,

  /**
      Debug.
  */
  Debug = 5,

  /**
      Trace.
  */
  Trace = 6,
}

/**
    They are corresponding to `arrow::compute::SortOrder` values.
*/
enum GArrowSortOrder
{
  /**
      Sort in ascending order.
  */
  Ascending = 0,

  /**
      Sort in descending order.
  */
  Descending = 1,
}

/**
    They are corresponding to `arrow::TimeUnit::type` values.
*/
enum GArrowTimeUnit
{
  /**
      Second.
  */
  Second = 0,

  /**
      Millisecond.
  */
  Milli = 1,

  /**
      Microsecond.
  */
  Micro = 2,

  /**
      Nanosecond.
  */
  Nano = 3,
}

/**
    They are corresponding to `arrow::Type::type` values.
*/
enum GArrowType
{
  /**
      A degenerate NULL type represented as 0 bytes/bits.
  */
  Na = 0,

  /**
      A boolean value represented as 1-bit.
  */
  Boolean = 1,

  /**
      Little-endian 8-bit unsigned integer.
  */
  Uint8 = 2,

  /**
      Little-endian 8-bit signed integer.
  */
  Int8 = 3,

  /**
      Little-endian 16-bit unsigned integer.
  */
  Uint16 = 4,

  /**
      Little-endian 16-bit signed integer.
  */
  Int16 = 5,

  /**
      Little-endian 32-bit unsigned integer.
  */
  Uint32 = 6,

  /**
      Little-endian 32-bit signed integer.
  */
  Int32 = 7,

  /**
      Little-endian 64-bit unsigned integer.
  */
  Uint64 = 8,

  /**
      Little-endian 64-bit signed integer.
  */
  Int64 = 9,

  /**
      2-byte floating point value.
  */
  HalfFloat = 10,

  /**
      4-byte floating point value.
  */
  Float = 11,

  /**
      8-byte floating point value.
  */
  Double = 12,

  /**
      UTF-8 variable-length string.
  */
  String = 13,

  /**
      Variable-length bytes (no guarantee of UTF-8-ness).
  */
  Binary = 14,

  /**
      Fixed-size binary. Each value occupies
        the same number of bytes.
  */
  FixedSizeBinary = 15,

  /**
      int32 days since the UNIX epoch.
  */
  Date32 = 16,

  /**
      int64 milliseconds since the UNIX epoch.
  */
  Date64 = 17,

  /**
      Exact timestamp encoded with int64 since UNIX epoch.
        Default unit millisecond.
  */
  Timestamp = 18,

  /**
      Exact time encoded with int32, supporting seconds or milliseconds
  */
  Time32 = 19,

  /**
      Exact time encoded with int64, supporting micro- or nanoseconds
  */
  Time64 = 20,

  /**
      YEAR_MONTH interval in SQL style.
  */
  MonthInterval = 21,

  /**
      DAY_TIME interval in SQL style.
  */
  DayTimeInterval = 22,

  /**
      Precision- and scale-based decimal
        type with 128-bit. Storage type depends on the parameters.
  */
  Decimal128 = 23,

  /**
      Precision- and scale-based decimal
        type with 256-bit. Storage type depends on the parameters.
  */
  Decimal256 = 24,

  /**
      A list of some logical data type.
  */
  List = 25,

  /**
      Struct of logical types.
  */
  Struct = 26,

  /**
      Sparse unions of logical types.
  */
  SparseUnion = 27,

  /**
      Dense unions of logical types.
  */
  DenseUnion = 28,

  /**
      Dictionary aka Category type.
  */
  Dictionary = 29,

  /**
      A repeated struct logical type.
  */
  Map = 30,

  /**
      Custom data type, implemented by user.
  */
  Extension = 31,

  /**
      Fixed size list of some logical type.
  */
  FixedSizeList = 32,

  /**
      Measure of elapsed time in either seconds,
        milliseconds, microseconds or nanoseconds.
  */
  Duration = 33,

  /**
      64bit offsets UTF-8 variable-length string.
  */
  LargeString = 34,

  /**
      64bit offsets Variable-length bytes (no guarantee of
      UTF-8-ness).
  */
  LargeBinary = 35,

  /**
      A list of some logical data type with 64-bit offsets.
  */
  LargeList = 36,

  /**
      MONTH_DAY_NANO interval in SQL style.
  */
  MonthDayNanoInterval = 37,

  /**
      Run-end encoded data.
  */
  RunEndEncoded = 38,

  /**
      String (UTF8) view type with 4-byte prefix and inline small
        string optimization.
  */
  StringView = 39,

  /**
      Bytes view type with 4-byte prefix and inline small string
        optimization.
  */
  BinaryView = 40,

  /**
      Precision- and scale-based decimal
  */
  Decimal32 = 43,

  /**
      Precision- and scale-based decimal
        type with 64-bit. Storage type depends on the parameters.
  */
  Decimal64 = 44,
}

/**
    They correspond to the values of `arrow::compute::Utf8NormalizeOptions::Form`.
*/
enum GArrowUTF8NormalizeForm
{
  /**
      Normalization Form Canonical Composition.
  */
  Nfc = 0,

  /**
      Normalization Form Compatibility
        Composition.
  */
  Nfkc = 1,

  /**
      Normalization Form Canonical Decomposition.
  */
  Nfd = 2,

  /**
      Normalization Form Compatibility
        Decomposition.
  */
  Nfkd = 3,
}

/** */
struct GArrowAggregateNodeOptions
{
  /** */
  GArrowExecuteNodeOptions parentInstance;
}

/** */
struct GArrowAggregateNodeOptionsClass
{
  /** */
  GArrowExecuteNodeOptionsClass parentClass;
}

/** */
struct GArrowAggregation
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowAggregationClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowArray
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowArrayBuilder
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowArrayBuilderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowArrayClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowArrayDatum
{
  /** */
  GArrowDatum parentInstance;
}

/** */
struct GArrowArrayDatumClass
{
  /** */
  GArrowDatumClass parentClass;
}

/** */
struct GArrowArraySortOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowArraySortOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowAzureFileSystem
{
  /** */
  GArrowFileSystem parentInstance;
}

/** */
struct GArrowAzureFileSystemClass
{
  /** */
  GArrowFileSystemClass parentClass;
}

/** */
struct GArrowBaseBinaryScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowBaseBinaryScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowBaseListScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowBaseListScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowBinaryArray
{
  /** */
  GArrowArray parentInstance;
}

/** */
struct GArrowBinaryArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowBinaryArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowBinaryArrayClass
{
  /** */
  GArrowArrayClass parentClass;
}

/** */
struct GArrowBinaryDataType
{
  /** */
  GArrowDataType parentInstance;
}

/** */
struct GArrowBinaryDataTypeClass
{
  /** */
  GArrowDataTypeClass parentClass;
}

/** */
struct GArrowBinaryDictionaryArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowBinaryDictionaryArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowBinaryScalar
{
  /** */
  GArrowBaseBinaryScalar parentInstance;
}

/** */
struct GArrowBinaryScalarClass
{
  /** */
  GArrowBaseBinaryScalarClass parentClass;
}

/** */
struct GArrowBinaryViewDataType
{
  /** */
  GArrowDataType parentInstance;
}

/** */
struct GArrowBinaryViewDataTypeClass
{
  /** */
  GArrowDataTypeClass parentClass;
}

/** */
struct GArrowBooleanArray
{
  /** */
  GArrowPrimitiveArray parentInstance;
}

/** */
struct GArrowBooleanArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowBooleanArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowBooleanArrayClass
{
  /** */
  GArrowPrimitiveArrayClass parentClass;
}

/** */
struct GArrowBooleanDataType
{
  /** */
  GArrowFixedWidthDataType parentInstance;
}

/** */
struct GArrowBooleanDataTypeClass
{
  /** */
  GArrowFixedWidthDataTypeClass parentClass;
}

/** */
struct GArrowBooleanScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowBooleanScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowBuffer
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowBufferClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowBufferInputStream
{
  /** */
  GArrowSeekableInputStream parentInstance;
}

/** */
struct GArrowBufferInputStreamClass
{
  /** */
  GArrowSeekableInputStreamClass parentClass;
}

/** */
struct GArrowBufferOutputStream
{
  /** */
  GArrowOutputStream parentInstance;
}

/** */
struct GArrowBufferOutputStreamClass
{
  /** */
  GArrowOutputStreamClass parentClass;
}

/** */
struct GArrowCSVReadOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowCSVReadOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowCSVReader
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowCSVReaderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowCallExpression
{
  /** */
  GArrowExpression parentInstance;
}

/** */
struct GArrowCallExpressionClass
{
  /** */
  GArrowExpressionClass parentClass;
}

/** */
struct GArrowCastOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowCastOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowChunkedArray
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowChunkedArrayClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowChunkedArrayDatum
{
  /** */
  GArrowDatum parentInstance;
}

/** */
struct GArrowChunkedArrayDatumClass
{
  /** */
  GArrowDatumClass parentClass;
}

/** */
struct GArrowCodec
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowCodecClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowCompressedInputStream
{
  /** */
  GArrowInputStream parentInstance;
}

/** */
struct GArrowCompressedInputStreamClass
{
  /** */
  GArrowInputStreamClass parentClass;
}

/** */
struct GArrowCompressedOutputStream
{
  /** */
  GArrowOutputStream parentInstance;
}

/** */
struct GArrowCompressedOutputStreamClass
{
  /** */
  GArrowOutputStreamClass parentClass;
}

/** */
struct GArrowCountOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowCountOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowDataType
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowDataTypeClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowDate32Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowDate32ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowDate32ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowDate32ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowDate32DataType
{
  /** */
  GArrowTemporalDataType parentInstance;
}

/** */
struct GArrowDate32DataTypeClass
{
  /** */
  GArrowTemporalDataTypeClass parentClass;
}

/** */
struct GArrowDate32Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowDate32ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowDate64Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowDate64ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowDate64ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowDate64ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowDate64DataType
{
  /** */
  GArrowTemporalDataType parentInstance;
}

/** */
struct GArrowDate64DataTypeClass
{
  /** */
  GArrowTemporalDataTypeClass parentClass;
}

/** */
struct GArrowDate64Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowDate64ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowDatum
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowDatumClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowDayMillisecond
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowDayMillisecondClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowDayTimeIntervalArray
{
  /** */
  GArrowPrimitiveArray parentInstance;
}

/** */
struct GArrowDayTimeIntervalArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowDayTimeIntervalArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowDayTimeIntervalArrayClass
{
  /** */
  GArrowPrimitiveArrayClass parentClass;
}

/** */
struct GArrowDayTimeIntervalDataType
{
  /** */
  GArrowIntervalDataType parentInstance;
}

/** */
struct GArrowDayTimeIntervalDataTypeClass
{
  /** */
  GArrowIntervalDataTypeClass parentClass;
}

/** */
struct GArrowDayTimeIntervalScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowDayTimeIntervalScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowDecimal128
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowDecimal128Array
{
  /** */
  GArrowFixedSizeBinaryArray parentInstance;
}

/** */
struct GArrowDecimal128ArrayBuilder
{
  /** */
  GArrowFixedSizeBinaryArrayBuilder parentInstance;
}

/** */
struct GArrowDecimal128ArrayBuilderClass
{
  /** */
  GArrowFixedSizeBinaryArrayBuilderClass parentClass;
}

/** */
struct GArrowDecimal128ArrayClass
{
  /** */
  GArrowFixedSizeBinaryArrayClass parentClass;
}

/** */
struct GArrowDecimal128Class
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowDecimal128DataType
{
  /** */
  GArrowDecimalDataType parentInstance;
}

/** */
struct GArrowDecimal128DataTypeClass
{
  /** */
  GArrowDecimalDataTypeClass parentClass;
}

/** */
struct GArrowDecimal128Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowDecimal128ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowDecimal256
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowDecimal256Array
{
  /** */
  GArrowFixedSizeBinaryArray parentInstance;
}

/** */
struct GArrowDecimal256ArrayBuilder
{
  /** */
  GArrowFixedSizeBinaryArrayBuilder parentInstance;
}

/** */
struct GArrowDecimal256ArrayBuilderClass
{
  /** */
  GArrowFixedSizeBinaryArrayBuilderClass parentClass;
}

/** */
struct GArrowDecimal256ArrayClass
{
  /** */
  GArrowFixedSizeBinaryArrayClass parentClass;
}

/** */
struct GArrowDecimal256Class
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowDecimal256DataType
{
  /** */
  GArrowDecimalDataType parentInstance;
}

/** */
struct GArrowDecimal256DataTypeClass
{
  /** */
  GArrowDecimalDataTypeClass parentClass;
}

/** */
struct GArrowDecimal256Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowDecimal256ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowDecimal32
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowDecimal32Array
{
  /** */
  GArrowFixedSizeBinaryArray parentInstance;
}

/** */
struct GArrowDecimal32ArrayBuilder
{
  /** */
  GArrowFixedSizeBinaryArrayBuilder parentInstance;
}

/** */
struct GArrowDecimal32ArrayBuilderClass
{
  /** */
  GArrowFixedSizeBinaryArrayBuilderClass parentClass;
}

/** */
struct GArrowDecimal32ArrayClass
{
  /** */
  GArrowFixedSizeBinaryArrayClass parentClass;
}

/** */
struct GArrowDecimal32Class
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowDecimal32DataType
{
  /** */
  GArrowDecimalDataType parentInstance;
}

/** */
struct GArrowDecimal32DataTypeClass
{
  /** */
  GArrowDecimalDataTypeClass parentClass;
}

/** */
struct GArrowDecimal32Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowDecimal32ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowDecimal64
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowDecimal64Array
{
  /** */
  GArrowFixedSizeBinaryArray parentInstance;
}

/** */
struct GArrowDecimal64ArrayBuilder
{
  /** */
  GArrowFixedSizeBinaryArrayBuilder parentInstance;
}

/** */
struct GArrowDecimal64ArrayBuilderClass
{
  /** */
  GArrowFixedSizeBinaryArrayBuilderClass parentClass;
}

/** */
struct GArrowDecimal64ArrayClass
{
  /** */
  GArrowFixedSizeBinaryArrayClass parentClass;
}

/** */
struct GArrowDecimal64Class
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowDecimal64DataType
{
  /** */
  GArrowDecimalDataType parentInstance;
}

/** */
struct GArrowDecimal64DataTypeClass
{
  /** */
  GArrowDecimalDataTypeClass parentClass;
}

/** */
struct GArrowDecimal64Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowDecimal64ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowDecimalDataType
{
  /** */
  GArrowFixedSizeBinaryDataType parentInstance;
}

/** */
struct GArrowDecimalDataTypeClass
{
  /** */
  GArrowFixedSizeBinaryDataTypeClass parentClass;
}

/** */
struct GArrowDenseUnionArray
{
  /** */
  GArrowUnionArray parentInstance;
}

/** */
struct GArrowDenseUnionArrayBuilder
{
  /** */
  GArrowUnionArrayBuilder parentInstance;
}

/** */
struct GArrowDenseUnionArrayBuilderClass
{
  /** */
  GArrowUnionArrayBuilderClass parentClass;
}

/** */
struct GArrowDenseUnionArrayClass
{
  /** */
  GArrowUnionArrayClass parentClass;
}

/** */
struct GArrowDenseUnionDataType
{
  /** */
  GArrowUnionDataType parentInstance;
}

/** */
struct GArrowDenseUnionDataTypeClass
{
  /** */
  GArrowUnionDataTypeClass parentClass;
}

/** */
struct GArrowDenseUnionScalar
{
  /** */
  GArrowUnionScalar parentInstance;
}

/** */
struct GArrowDenseUnionScalarClass
{
  /** */
  GArrowUnionScalarClass parentClass;
}

/** */
struct GArrowDictionaryArray
{
  /** */
  GArrowArray parentInstance;
}

/** */
struct GArrowDictionaryArrayClass
{
  /** */
  GArrowArrayClass parentClass;
}

/** */
struct GArrowDictionaryDataType
{
  /** */
  GArrowFixedWidthDataType parentInstance;
}

/** */
struct GArrowDictionaryDataTypeClass
{
  /** */
  GArrowFixedWidthDataTypeClass parentClass;
}

/** */
struct GArrowDoubleArray
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowDoubleArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowDoubleArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowDoubleArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowDoubleDataType
{
  /** */
  GArrowFloatingPointDataType parentInstance;
}

/** */
struct GArrowDoubleDataTypeClass
{
  /** */
  GArrowFloatingPointDataTypeClass parentClass;
}

/** */
struct GArrowDoubleScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowDoubleScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowEqualOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowEqualOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowExecuteContext
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowExecuteContextClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowExecuteNode
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowExecuteNodeClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowExecuteNodeOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowExecuteNodeOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowExecutePlan
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowExecutePlanClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowExpression
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowExpressionClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowExtensionArray
{
  /** */
  GArrowArray parentInstance;
}

/** */
struct GArrowExtensionArrayClass
{
  /** */
  GArrowArrayClass parentClass;
}

/** */
struct GArrowExtensionDataType
{
  /** */
  GArrowDataType parentInstance;
}

/** */
struct GArrowExtensionDataTypeClass
{
  /** */
  GArrowDataTypeClass parentClass;

  /**
      It must returns the name of this extension data type.
  */
  extern(C) char* function(GArrowExtensionDataType* dataType) getExtensionName;

  /**
      It must returns true only when the both data types equal, false
        otherwise.
  */
  extern(C) gboolean function(GArrowExtensionDataType* dataType, GArrowExtensionDataType* otherDataType) equal;

  /**
      It must returns a serialized #GArrowDataType from the given
        `serialized_data`.
  */
  extern(C) GArrowDataType* function(GArrowExtensionDataType* dataType, GArrowDataType* storageDataType, GBytes* serializedData, GError** _err) deserialize;

  /**
      It must returns a serialized data of this extension data type
        to deserialize later.
  */
  extern(C) GBytes* function(GArrowExtensionDataType* dataType) serialize;

  /**
      It must returns #GType for corresponding extension array
        class.
  */
  extern(C) GType function(GArrowExtensionDataType* dataType) getArrayGtype;
}

/** */
struct GArrowExtensionDataTypeRegistry
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowExtensionDataTypeRegistryClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowExtensionScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowExtensionScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowFeatherFileReader
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowFeatherFileReaderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowFeatherWriteProperties
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowFeatherWritePropertiesClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowField
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowFieldClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowFieldExpression
{
  /** */
  GArrowExpression parentInstance;
}

/** */
struct GArrowFieldExpressionClass
{
  /** */
  GArrowExpressionClass parentClass;
}

/** */
struct GArrowFile;

/** */
struct GArrowFileInfo
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowFileInfoClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowFileInputStream
{
  /** */
  GArrowSeekableInputStream parentInstance;
}

/** */
struct GArrowFileInputStreamClass
{
  /** */
  GArrowSeekableInputStreamClass parentClass;
}

/** */
struct GArrowFileInterface;

/** */
struct GArrowFileOutputStream
{
  /** */
  GArrowOutputStream parentInstance;
}

/** */
struct GArrowFileOutputStreamClass
{
  /** */
  GArrowOutputStreamClass parentClass;
}

/** */
struct GArrowFileSelector
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowFileSelectorClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowFileSystem
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowFileSystemClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowFilterNodeOptions
{
  /** */
  GArrowExecuteNodeOptions parentInstance;
}

/** */
struct GArrowFilterNodeOptionsClass
{
  /** */
  GArrowExecuteNodeOptionsClass parentClass;
}

/** */
struct GArrowFilterOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowFilterOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowFixedSizeBinaryArray
{
  /** */
  GArrowPrimitiveArray parentInstance;
}

/** */
struct GArrowFixedSizeBinaryArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowFixedSizeBinaryArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowFixedSizeBinaryArrayClass
{
  /** */
  GArrowPrimitiveArrayClass parentClass;
}

/** */
struct GArrowFixedSizeBinaryDataType
{
  /** */
  GArrowDataType parentInstance;
}

/** */
struct GArrowFixedSizeBinaryDataTypeClass
{
  /** */
  GArrowFixedWidthDataTypeClass parentClass;
}

/** */
struct GArrowFixedSizeBinaryScalar
{
  /** */
  GArrowBaseBinaryScalar parentInstance;
}

/** */
struct GArrowFixedSizeBinaryScalarClass
{
  /** */
  GArrowBaseBinaryScalarClass parentClass;
}

/** */
struct GArrowFixedWidthDataType
{
  /** */
  GArrowDataType parentInstance;
}

/** */
struct GArrowFixedWidthDataTypeClass
{
  /** */
  GArrowDataTypeClass parentClass;
}

/** */
struct GArrowFloatArray
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowFloatArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowFloatArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowFloatArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowFloatDataType
{
  /** */
  GArrowFloatingPointDataType parentInstance;
}

/** */
struct GArrowFloatDataTypeClass
{
  /** */
  GArrowFloatingPointDataTypeClass parentClass;
}

/** */
struct GArrowFloatScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowFloatScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowFloatingPointDataType
{
  /** */
  GArrowNumericDataType parentInstance;
}

/** */
struct GArrowFloatingPointDataTypeClass
{
  /** */
  GArrowNumericDataTypeClass parentClass;
}

/** */
struct GArrowFunction
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowFunctionClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowFunctionDoc
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowFunctionDocClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowFunctionOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowFunctionOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowGCSFileSystem
{
  /** */
  GArrowFileSystem parentInstance;
}

/** */
struct GArrowGCSFileSystemClass
{
  /** */
  GArrowFileSystemClass parentClass;
}

/** */
struct GArrowGIOInputStream
{
  /** */
  GArrowSeekableInputStream parentInstance;
}

/** */
struct GArrowGIOInputStreamClass
{
  /** */
  GArrowSeekableInputStreamClass parentClass;
}

/** */
struct GArrowGIOOutputStream
{
  /** */
  GArrowOutputStream parentInstance;
}

/** */
struct GArrowGIOOutputStreamClass
{
  /** */
  GArrowOutputStreamClass parentClass;
}

/** */
struct GArrowHDFSFileSystem
{
  /** */
  GArrowFileSystem parentInstance;
}

/** */
struct GArrowHDFSFileSystemClass
{
  /** */
  GArrowFileSystemClass parentClass;
}

/** */
struct GArrowHalfFloatArray
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowHalfFloatArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowHalfFloatArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowHalfFloatArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowHalfFloatDataType
{
  /** */
  GArrowFloatingPointDataType parentInstance;
}

/** */
struct GArrowHalfFloatDataTypeClass
{
  /** */
  GArrowFloatingPointDataTypeClass parentClass;
}

/** */
struct GArrowHalfFloatScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowHalfFloatScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowHashJoinNodeOptions
{
  /** */
  GArrowExecuteNodeOptions parentInstance;
}

/** */
struct GArrowHashJoinNodeOptionsClass
{
  /** */
  GArrowExecuteNodeOptionsClass parentClass;
}

/** */
struct GArrowISO8601TimestampParser
{
  /** */
  GArrowTimestampParser parentInstance;
}

/** */
struct GArrowISO8601TimestampParserClass
{
  /** */
  GArrowTimestampParserClass parentClass;
}

/** */
struct GArrowIndexOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowIndexOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowInputStream
{
  /** */
  GInputStream parentInstance;
}

/** */
struct GArrowInputStreamClass
{
  /** */
  GInputStreamClass parentClass;
}

/** */
struct GArrowInt16Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowInt16ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowInt16ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowInt16ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowInt16DataType
{
  /** */
  GArrowIntegerDataType parentInstance;
}

/** */
struct GArrowInt16DataTypeClass
{
  /** */
  GArrowIntegerDataTypeClass parentClass;
}

/** */
struct GArrowInt16Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowInt16ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowInt32Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowInt32ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowInt32ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowInt32ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowInt32DataType
{
  /** */
  GArrowIntegerDataType parentInstance;
}

/** */
struct GArrowInt32DataTypeClass
{
  /** */
  GArrowIntegerDataTypeClass parentClass;
}

/** */
struct GArrowInt32Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowInt32ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowInt64Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowInt64ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowInt64ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowInt64ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowInt64DataType
{
  /** */
  GArrowIntegerDataType parentInstance;
}

/** */
struct GArrowInt64DataTypeClass
{
  /** */
  GArrowIntegerDataTypeClass parentClass;
}

/** */
struct GArrowInt64Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowInt64ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowInt8Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowInt8ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowInt8ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowInt8ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowInt8DataType
{
  /** */
  GArrowIntegerDataType parentInstance;
}

/** */
struct GArrowInt8DataTypeClass
{
  /** */
  GArrowIntegerDataTypeClass parentClass;
}

/** */
struct GArrowInt8Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowInt8ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowIntArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowIntArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowIntegerDataType
{
  /** */
  GArrowNumericDataType parentInstance;
}

/** */
struct GArrowIntegerDataTypeClass
{
  /** */
  GArrowNumericDataTypeClass parentClass;
}

/** */
struct GArrowIntervalDataType
{
  /** */
  GArrowTimeDataType parentInstance;
}

/** */
struct GArrowIntervalDataTypeClass
{
  /** */
  GArrowTimeDataTypeClass parentClass;
}

/** */
struct GArrowJSONReadOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowJSONReadOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowJSONReader
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowJSONReaderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowLargeBinaryArray
{
  /** */
  GArrowArray parentInstance;
}

/** */
struct GArrowLargeBinaryArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowLargeBinaryArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowLargeBinaryArrayClass
{
  /** */
  GArrowArrayClass parentClass;
}

/** */
struct GArrowLargeBinaryDataType
{
  /** */
  GArrowDataType parentInstance;
}

/** */
struct GArrowLargeBinaryDataTypeClass
{
  /** */
  GArrowDataTypeClass parentClass;
}

/** */
struct GArrowLargeBinaryScalar
{
  /** */
  GArrowBaseBinaryScalar parentInstance;
}

/** */
struct GArrowLargeBinaryScalarClass
{
  /** */
  GArrowBaseBinaryScalarClass parentClass;
}

/** */
struct GArrowLargeListArray
{
  /** */
  GArrowArray parentInstance;
}

/** */
struct GArrowLargeListArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowLargeListArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowLargeListArrayClass
{
  /** */
  GArrowArrayClass parentClass;
}

/** */
struct GArrowLargeListDataType
{
  /** */
  GArrowDataType parentInstance;
}

/** */
struct GArrowLargeListDataTypeClass
{
  /** */
  GArrowDataTypeClass parentClass;
}

/** */
struct GArrowLargeListScalar
{
  /** */
  GArrowBaseListScalar parentInstance;
}

/** */
struct GArrowLargeListScalarClass
{
  /** */
  GArrowBaseListScalarClass parentClass;
}

/** */
struct GArrowLargeStringArray
{
  /** */
  GArrowLargeBinaryArray parentInstance;
}

/** */
struct GArrowLargeStringArrayBuilder
{
  /** */
  GArrowLargeBinaryArrayBuilder parentInstance;
}

/** */
struct GArrowLargeStringArrayBuilderClass
{
  /** */
  GArrowLargeBinaryArrayBuilderClass parentClass;
}

/** */
struct GArrowLargeStringArrayClass
{
  /** */
  GArrowLargeBinaryArrayClass parentClass;
}

/** */
struct GArrowLargeStringDataType
{
  /** */
  GArrowLargeBinaryDataType parentInstance;
}

/** */
struct GArrowLargeStringDataTypeClass
{
  /** */
  GArrowLargeBinaryDataTypeClass parentClass;
}

/** */
struct GArrowLargeStringScalar
{
  /** */
  GArrowBaseBinaryScalar parentInstance;
}

/** */
struct GArrowLargeStringScalarClass
{
  /** */
  GArrowBaseBinaryScalarClass parentClass;
}

/** */
struct GArrowListArray
{
  /** */
  GArrowArray parentInstance;
}

/** */
struct GArrowListArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowListArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowListArrayClass
{
  /** */
  GArrowArrayClass parentClass;
}

/** */
struct GArrowListDataType
{
  /** */
  GArrowDataType parentInstance;
}

/** */
struct GArrowListDataTypeClass
{
  /** */
  GArrowDataTypeClass parentClass;
}

/** */
struct GArrowListScalar
{
  /** */
  GArrowBaseListScalar parentInstance;
}

/** */
struct GArrowListScalarClass
{
  /** */
  GArrowBaseListScalarClass parentClass;
}

/** */
struct GArrowLiteralExpression
{
  /** */
  GArrowExpression parentInstance;
}

/** */
struct GArrowLiteralExpressionClass
{
  /** */
  GArrowExpressionClass parentClass;
}

/** */
struct GArrowLocalFileSystem
{
  /** */
  GArrowFileSystem parentInstance;
}

/** */
struct GArrowLocalFileSystemClass
{
  /** */
  GArrowFileSystemClass parentClass;
}

/** */
struct GArrowLocalFileSystemOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowLocalFileSystemOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowMapArray
{
  /** */
  GArrowListArray parentInstance;
}

/** */
struct GArrowMapArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowMapArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowMapArrayClass
{
  /** */
  GArrowListArrayClass parentClass;
}

/** */
struct GArrowMapDataType
{
  /** */
  GArrowListDataType parentInstance;
}

/** */
struct GArrowMapDataTypeClass
{
  /** */
  GArrowListDataTypeClass parentClass;
}

/** */
struct GArrowMapScalar
{
  /** */
  GArrowBaseListScalar parentInstance;
}

/** */
struct GArrowMapScalarClass
{
  /** */
  GArrowBaseListScalarClass parentClass;
}

/** */
struct GArrowMatchSubstringOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowMatchSubstringOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowMemoryMappedInputStream
{
  /** */
  GArrowSeekableInputStream parentInstance;
}

/** */
struct GArrowMemoryMappedInputStreamClass
{
  /** */
  GArrowSeekableInputStreamClass parentClass;
}

/** */
struct GArrowMemoryPool
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowMemoryPoolClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowMockFileSystem
{
  /** */
  GArrowFileSystem parentInstance;
}

/** */
struct GArrowMockFileSystemClass
{
  /** */
  GArrowFileSystemClass parentClass;
}

/** */
struct GArrowMonthDayNano
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowMonthDayNanoClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowMonthDayNanoIntervalArray
{
  /** */
  GArrowPrimitiveArray parentInstance;
}

/** */
struct GArrowMonthDayNanoIntervalArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowMonthDayNanoIntervalArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowMonthDayNanoIntervalArrayClass
{
  /** */
  GArrowPrimitiveArrayClass parentClass;
}

/** */
struct GArrowMonthDayNanoIntervalDataType
{
  /** */
  GArrowIntervalDataType parentInstance;
}

/** */
struct GArrowMonthDayNanoIntervalDataTypeClass
{
  /** */
  GArrowIntervalDataTypeClass parentClass;
}

/** */
struct GArrowMonthDayNanoIntervalScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowMonthDayNanoIntervalScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowMonthIntervalArray
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowMonthIntervalArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowMonthIntervalArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowMonthIntervalArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowMonthIntervalDataType
{
  /** */
  GArrowIntervalDataType parentInstance;
}

/** */
struct GArrowMonthIntervalDataTypeClass
{
  /** */
  GArrowIntervalDataTypeClass parentClass;
}

/** */
struct GArrowMonthIntervalScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowMonthIntervalScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowMutableBuffer
{
  /** */
  GArrowBuffer parentInstance;
}

/** */
struct GArrowMutableBufferClass
{
  /** */
  GArrowBufferClass parentClass;
}

/** */
struct GArrowNullArray
{
  /** */
  GArrowArray parentInstance;
}

/** */
struct GArrowNullArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowNullArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowNullArrayClass
{
  /** */
  GArrowArrayClass parentClass;
}

/** */
struct GArrowNullDataType
{
  /** */
  GArrowDataType parentInstance;
}

/** */
struct GArrowNullDataTypeClass
{
  /** */
  GArrowDataTypeClass parentClass;
}

/** */
struct GArrowNullScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowNullScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowNumericArray
{
  /** */
  GArrowPrimitiveArray parentInstance;
}

/** */
struct GArrowNumericArrayClass
{
  /** */
  GArrowPrimitiveArrayClass parentClass;
}

/** */
struct GArrowNumericDataType
{
  /** */
  GArrowFixedWidthDataType parentInstance;
}

/** */
struct GArrowNumericDataTypeClass
{
  /** */
  GArrowFixedWidthDataTypeClass parentClass;
}

/** */
struct GArrowOutputStream
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowOutputStreamClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowPrimitiveArray
{
  /** */
  GArrowArray parentInstance;
}

/** */
struct GArrowPrimitiveArrayClass
{
  /** */
  GArrowArrayClass parentClass;
}

/** */
struct GArrowProjectNodeOptions
{
  /** */
  GArrowExecuteNodeOptions parentInstance;
}

/** */
struct GArrowProjectNodeOptionsClass
{
  /** */
  GArrowExecuteNodeOptionsClass parentClass;
}

/** */
struct GArrowQuantileOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowQuantileOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowRankOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowRankOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowReadOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowReadOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowReadable;

/** */
struct GArrowReadableInterface;

/** */
struct GArrowRecordBatch
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowRecordBatchBuilder
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowRecordBatchBuilderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowRecordBatchClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowRecordBatchDatum
{
  /** */
  GArrowDatum parentInstance;
}

/** */
struct GArrowRecordBatchDatumClass
{
  /** */
  GArrowDatumClass parentClass;
}

/** */
struct GArrowRecordBatchFileReader
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowRecordBatchFileReaderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowRecordBatchFileWriter
{
  /** */
  GArrowRecordBatchStreamWriter parentInstance;
}

/** */
struct GArrowRecordBatchFileWriterClass
{
  /** */
  GArrowRecordBatchStreamWriterClass parentClass;
}

/** */
struct GArrowRecordBatchIterator
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowRecordBatchIteratorClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowRecordBatchReader
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowRecordBatchReaderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowRecordBatchStreamReader
{
  /** */
  GArrowRecordBatchReader parentInstance;
}

/** */
struct GArrowRecordBatchStreamReaderClass
{
  /** */
  GArrowRecordBatchReaderClass parentClass;
}

/** */
struct GArrowRecordBatchStreamWriter
{
  /** */
  GArrowRecordBatchWriter parentInstance;
}

/** */
struct GArrowRecordBatchStreamWriterClass
{
  /** */
  GArrowRecordBatchWriterClass parentClass;
}

/** */
struct GArrowRecordBatchWriter
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowRecordBatchWriterClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowResizableBuffer
{
  /** */
  GArrowMutableBuffer parentInstance;
}

/** */
struct GArrowResizableBufferClass
{
  /** */
  GArrowMutableBufferClass parentClass;
}

/** */
struct GArrowRoundOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowRoundOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowRoundToMultipleOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowRoundToMultipleOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowRunEndEncodeOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowRunEndEncodeOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowRunEndEncodedArray
{
  /** */
  GArrowArray parentInstance;
}

/** */
struct GArrowRunEndEncodedArrayClass
{
  /** */
  GArrowArrayClass parentClass;
}

/** */
struct GArrowRunEndEncodedDataType
{
  /** */
  GArrowFixedWidthDataType parentInstance;
}

/** */
struct GArrowRunEndEncodedDataTypeClass
{
  /** */
  GArrowFixedWidthDataTypeClass parentClass;
}

/** */
struct GArrowS3FileSystem
{
  /** */
  GArrowFileSystem parentInstance;
}

/** */
struct GArrowS3FileSystemClass
{
  /** */
  GArrowFileSystemClass parentClass;
}

/** */
struct GArrowS3GlobalOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowS3GlobalOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowScalar
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowScalarAggregateOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowScalarAggregateOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowScalarClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowScalarDatum
{
  /** */
  GArrowDatum parentInstance;
}

/** */
struct GArrowScalarDatumClass
{
  /** */
  GArrowDatumClass parentClass;
}

/** */
struct GArrowSchema
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowSchemaClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowSeekableInputStream
{
  /** */
  GArrowInputStream parentInstance;
}

/** */
struct GArrowSeekableInputStreamClass
{
  /** */
  GArrowInputStreamClass parentClass;
}

/** */
struct GArrowSetLookupOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowSetLookupOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowSinkNodeOptions
{
  /** */
  GArrowExecuteNodeOptions parentInstance;
}

/** */
struct GArrowSinkNodeOptionsClass
{
  /** */
  GArrowExecuteNodeOptionsClass parentClass;
}

/** */
struct GArrowSlowFileSystem
{
  /** */
  GArrowFileSystem parentInstance;
}

/** */
struct GArrowSlowFileSystemClass
{
  /** */
  GArrowFileSystemClass parentClass;
}

/** */
struct GArrowSortKey
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowSortKeyClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowSortOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowSortOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowSourceNodeOptions
{
  /** */
  GArrowExecuteNodeOptions parentInstance;
}

/** */
struct GArrowSourceNodeOptionsClass
{
  /** */
  GArrowExecuteNodeOptionsClass parentClass;
}

/** */
struct GArrowSparseUnionArray
{
  /** */
  GArrowUnionArray parentInstance;
}

/** */
struct GArrowSparseUnionArrayBuilder
{
  /** */
  GArrowUnionArrayBuilder parentInstance;
}

/** */
struct GArrowSparseUnionArrayBuilderClass
{
  /** */
  GArrowUnionArrayBuilderClass parentClass;
}

/** */
struct GArrowSparseUnionArrayClass
{
  /** */
  GArrowUnionArrayClass parentClass;
}

/** */
struct GArrowSparseUnionDataType
{
  /** */
  GArrowUnionDataType parentInstance;
}

/** */
struct GArrowSparseUnionDataTypeClass
{
  /** */
  GArrowUnionDataTypeClass parentClass;
}

/** */
struct GArrowSparseUnionScalar
{
  /** */
  GArrowUnionScalar parentInstance;
}

/** */
struct GArrowSparseUnionScalarClass
{
  /** */
  GArrowUnionScalarClass parentClass;
}

/** */
struct GArrowSplitPatternOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowSplitPatternOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowStreamDecoder
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowStreamDecoderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowStreamListener
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowStreamListenerClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GArrowStreamListener* listener, GError** _err) onEos;

  /** */
  extern(C) gboolean function(GArrowStreamListener* listener, GArrowRecordBatch* recordBatch, GHashTable* metadata, GError** _err) onRecordBatchDecoded;

  /** */
  extern(C) gboolean function(GArrowStreamListener* listener, GArrowSchema* schema, GArrowSchema* filteredSchema, GError** _err) onSchemaDecoded;
}

/** */
struct GArrowStrftimeOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowStrftimeOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowStringArray
{
  /** */
  GArrowBinaryArray parentInstance;
}

/** */
struct GArrowStringArrayBuilder
{
  /** */
  GArrowBinaryArrayBuilder parentInstance;
}

/** */
struct GArrowStringArrayBuilderClass
{
  /** */
  GArrowBinaryArrayBuilderClass parentClass;
}

/** */
struct GArrowStringArrayClass
{
  /** */
  GArrowBinaryArrayClass parentClass;
}

/** */
struct GArrowStringDataType
{
  /** */
  GArrowBinaryDataType parentInstance;
}

/** */
struct GArrowStringDataTypeClass
{
  /** */
  GArrowBinaryDataTypeClass parentClass;
}

/** */
struct GArrowStringDictionaryArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowStringDictionaryArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowStringScalar
{
  /** */
  GArrowBaseBinaryScalar parentInstance;
}

/** */
struct GArrowStringScalarClass
{
  /** */
  GArrowBaseBinaryScalarClass parentClass;
}

/** */
struct GArrowStringViewDataType
{
  /** */
  GArrowBinaryViewDataType parentInstance;
}

/** */
struct GArrowStringViewDataTypeClass
{
  /** */
  GArrowBinaryViewDataTypeClass parentClass;
}

/** */
struct GArrowStrptimeOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowStrptimeOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowStrptimeTimestampParser
{
  /** */
  GArrowTimestampParser parentInstance;
}

/** */
struct GArrowStrptimeTimestampParserClass
{
  /** */
  GArrowTimestampParserClass parentClass;
}

/** */
struct GArrowStructArray
{
  /** */
  GArrowArray parentInstance;
}

/** */
struct GArrowStructArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowStructArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowStructArrayClass
{
  /** */
  GArrowArrayClass parentClass;
}

/** */
struct GArrowStructDataType
{
  /** */
  GArrowDataType parentInstance;
}

/** */
struct GArrowStructDataTypeClass
{
  /** */
  GArrowDataTypeClass parentClass;
}

/** */
struct GArrowStructFieldOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowStructFieldOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowStructScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowStructScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowSubTreeFileSystem
{
  /** */
  GArrowFileSystem parentInstance;
}

/** */
struct GArrowSubTreeFileSystemClass
{
  /** */
  GArrowFileSystemClass parentClass;
}

/** */
struct GArrowTable
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowTableBatchReader
{
  /** */
  GArrowRecordBatchReader parentInstance;
}

/** */
struct GArrowTableBatchReaderClass
{
  /** */
  GArrowRecordBatchReaderClass parentClass;
}

/** */
struct GArrowTableClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowTableConcatenateOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowTableConcatenateOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowTableDatum
{
  /** */
  GArrowDatum parentInstance;
}

/** */
struct GArrowTableDatumClass
{
  /** */
  GArrowDatumClass parentClass;
}

/** */
struct GArrowTakeOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowTakeOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowTemporalDataType
{
  /** */
  GArrowFixedWidthDataType parentInstance;
}

/** */
struct GArrowTemporalDataTypeClass
{
  /** */
  GArrowFixedWidthDataTypeClass parentClass;
}

/** */
struct GArrowTensor
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowTensorClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowTime32Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowTime32ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowTime32ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowTime32ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowTime32DataType
{
  /** */
  GArrowTimeDataType parentInstance;
}

/** */
struct GArrowTime32DataTypeClass
{
  /** */
  GArrowTimeDataTypeClass parentClass;
}

/** */
struct GArrowTime32Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowTime32ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowTime64Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowTime64ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowTime64ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowTime64ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowTime64DataType
{
  /** */
  GArrowTimeDataType parentInstance;
}

/** */
struct GArrowTime64DataTypeClass
{
  /** */
  GArrowTimeDataTypeClass parentClass;
}

/** */
struct GArrowTime64Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowTime64ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowTimeDataType
{
  /** */
  GArrowTemporalDataType parentInstance;
}

/** */
struct GArrowTimeDataTypeClass
{
  /** */
  GArrowTemporalDataTypeClass parentClass;
}

/** */
struct GArrowTimestampArray
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowTimestampArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowTimestampArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowTimestampArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowTimestampDataType
{
  /** */
  GArrowTemporalDataType parentInstance;
}

/** */
struct GArrowTimestampDataTypeClass
{
  /** */
  GArrowTemporalDataTypeClass parentClass;
}

/** */
struct GArrowTimestampParser
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowTimestampParserClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GArrowTimestampScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowTimestampScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowUInt16Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowUInt16ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowUInt16ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowUInt16ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowUInt16DataType
{
  /** */
  GArrowIntegerDataType parentInstance;
}

/** */
struct GArrowUInt16DataTypeClass
{
  /** */
  GArrowIntegerDataTypeClass parentClass;
}

/** */
struct GArrowUInt16Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowUInt16ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowUInt32Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowUInt32ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowUInt32ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowUInt32ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowUInt32DataType
{
  /** */
  GArrowIntegerDataType parentInstance;
}

/** */
struct GArrowUInt32DataTypeClass
{
  /** */
  GArrowIntegerDataTypeClass parentClass;
}

/** */
struct GArrowUInt32Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowUInt32ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowUInt64Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowUInt64ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowUInt64ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowUInt64ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowUInt64DataType
{
  /** */
  GArrowIntegerDataType parentInstance;
}

/** */
struct GArrowUInt64DataTypeClass
{
  /** */
  GArrowIntegerDataTypeClass parentClass;
}

/** */
struct GArrowUInt64Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowUInt64ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowUInt8Array
{
  /** */
  GArrowNumericArray parentInstance;
}

/** */
struct GArrowUInt8ArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowUInt8ArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowUInt8ArrayClass
{
  /** */
  GArrowNumericArrayClass parentClass;
}

/** */
struct GArrowUInt8DataType
{
  /** */
  GArrowIntegerDataType parentInstance;
}

/** */
struct GArrowUInt8DataTypeClass
{
  /** */
  GArrowIntegerDataTypeClass parentClass;
}

/** */
struct GArrowUInt8Scalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowUInt8ScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowUIntArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowUIntArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowUTF8NormalizeOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowUTF8NormalizeOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowUnionArray
{
  /** */
  GArrowArray parentInstance;
}

/** */
struct GArrowUnionArrayBuilder
{
  /** */
  GArrowArrayBuilder parentInstance;
}

/** */
struct GArrowUnionArrayBuilderClass
{
  /** */
  GArrowArrayBuilderClass parentClass;
}

/** */
struct GArrowUnionArrayClass
{
  /** */
  GArrowArrayClass parentClass;
}

/** */
struct GArrowUnionDataType
{
  /** */
  GArrowDataType parentInstance;
}

/** */
struct GArrowUnionDataTypeClass
{
  /** */
  GArrowDataTypeClass parentClass;
}

/** */
struct GArrowUnionScalar
{
  /** */
  GArrowScalar parentInstance;
}

/** */
struct GArrowUnionScalarClass
{
  /** */
  GArrowScalarClass parentClass;
}

/** */
struct GArrowVarianceOptions
{
  /** */
  GArrowFunctionOptions parentInstance;
}

/** */
struct GArrowVarianceOptionsClass
{
  /** */
  GArrowFunctionOptionsClass parentClass;
}

/** */
struct GArrowWritable;

/** */
struct GArrowWritableFile;

/** */
struct GArrowWritableFileInterface;

/** */
struct GArrowWritableInterface;

/** */
struct GArrowWriteOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GArrowWriteOptionsClass
{
  /** */
  GObjectClass parentClass;
}

