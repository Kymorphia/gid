/// Module for [ISO8601TimestampParser] class
module arrow.iso8601_timestamp_parser;

import arrow.c.functions;
import arrow.c.types;
import arrow.timestamp_parser;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class ISO8601TimestampParser : arrow.timestamp_parser.TimestampParser
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_iso8601_timestamp_parser_get_type != &gidSymbolNotFound ? garrow_iso8601_timestamp_parser_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ISO8601TimestampParser self()
  {
    return this;
  }

  /**
      Get builder for [arrow.iso8601_timestamp_parser.ISO8601TimestampParser]
      Returns: New builder object
  */
  static ISO8601TimestampParserGidBuilder builder()
  {
    return new ISO8601TimestampParserGidBuilder;
  }

  /** */
  this()
  {
    GArrowISO8601TimestampParser* _cretval;
    _cretval = garrow_iso8601_timestamp_parser_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.iso8601_timestamp_parser.ISO8601TimestampParser]
class ISO8601TimestampParserGidBuilderImpl(T) : arrow.timestamp_parser.TimestampParserGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.iso8601_timestamp_parser.ISO8601TimestampParser]
final class ISO8601TimestampParserGidBuilder : ISO8601TimestampParserGidBuilderImpl!ISO8601TimestampParserGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ISO8601TimestampParser build()
  {
    return new ISO8601TimestampParser(cast(void*)createGObject(ISO8601TimestampParser._getGType), Yes.Take);
  }
}
