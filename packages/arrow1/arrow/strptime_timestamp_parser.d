/// Module for [StrptimeTimestampParser] class
module arrow.strptime_timestamp_parser;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.timestamp_parser;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class StrptimeTimestampParser : arrow.timestamp_parser.TimestampParser
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_strptime_timestamp_parser_get_type != &gidSymbolNotFound ? garrow_strptime_timestamp_parser_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StrptimeTimestampParser self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.strptime_timestamp_parser.StrptimeTimestampParser]
      Returns: New builder object
  */
  static StrptimeTimestampParserGidBuilder builder() nothrow
  {
    return new StrptimeTimestampParserGidBuilder;
  }

  /** */
  this(string format) nothrow
  {
    GArrowStrptimeTimestampParser* _cretval;
    const(char)* _format = format.toCString(No.Alloc);
    _cretval = garrow_strptime_timestamp_parser_new(_format);
    this(_cretval, Yes.Take);
  }

  /** */
  string getFormat() nothrow
  {
    const(char)* _cretval;
    _cretval = garrow_strptime_timestamp_parser_get_format(cast(GArrowStrptimeTimestampParser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.strptime_timestamp_parser.StrptimeTimestampParser]
class StrptimeTimestampParserGidBuilderImpl(T) : arrow.timestamp_parser.TimestampParserGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.strptime_timestamp_parser.StrptimeTimestampParser]
final class StrptimeTimestampParserGidBuilder : StrptimeTimestampParserGidBuilderImpl!StrptimeTimestampParserGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StrptimeTimestampParser build() nothrow
  {
    return new StrptimeTimestampParser(cast(void*)createGObject(StrptimeTimestampParser._getGType), Yes.Take);
  }
}
