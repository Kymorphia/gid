/// Module for [TimestampParser] class
module arrow.timestamp_parser;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class TimestampParser : gobject.object.ObjectWrap
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
    return cast(void function())garrow_timestamp_parser_get_type != &gidSymbolNotFound ? garrow_timestamp_parser_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimestampParser self()
  {
    return this;
  }

  /**
  Get builder for [arrow.timestamp_parser.TimestampParser]
  Returns: New builder object
  */
  static TimestampParserGidBuilder builder()
  {
    return new TimestampParserGidBuilder;
  }

  /** */
  string getKind()
  {
    const(char)* _cretval;
    _cretval = garrow_timestamp_parser_get_kind(cast(GArrowTimestampParser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}

class TimestampParserGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T parser(void* propval)
  {
    return setProperty("parser", propval);
  }
}

/// Fluent builder for [arrow.timestamp_parser.TimestampParser]
final class TimestampParserGidBuilder : TimestampParserGidBuilderImpl!TimestampParserGidBuilder
{
  TimestampParser build()
  {
    return new TimestampParser(cast(void*)createGObject(TimestampParser._getGType), No.Take);
  }
}
