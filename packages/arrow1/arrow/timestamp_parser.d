/// Module for [TimestampParser] class
module arrow.timestamp_parser;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_timestamp_parser_get_type != &gidSymbolNotFound ? garrow_timestamp_parser_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimestampParser self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.timestamp_parser.TimestampParser]
      Returns: New builder object
  */
  static TimestampParserGidBuilder builder() nothrow
  {
    return new TimestampParserGidBuilder;
  }

  /** */
  string getKind() nothrow
  {
    const(char)* _cretval;
    _cretval = garrow_timestamp_parser_get_kind(cast(GArrowTimestampParser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.timestamp_parser.TimestampParser]
class TimestampParserGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T parser(void* propval) nothrow
  {
    return setProperty("parser", propval);
  }
}

/// Fluent builder for [arrow.timestamp_parser.TimestampParser]
final class TimestampParserGidBuilder : TimestampParserGidBuilderImpl!TimestampParserGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TimestampParser build() nothrow
  {
    return new TimestampParser(cast(void*)createGObject(TimestampParser._getGType), No.Take);
  }
}
