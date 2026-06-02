/// Module for [DataStream] class
module arrowflight.data_stream;

public import gid.basictypes;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class DataStream : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_data_stream_get_type != &gidSymbolNotFound ? gaflight_data_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowflight.data_stream.DataStream]
      Returns: New builder object
  */
  static DataStreamGidBuilder builder() nothrow
  {
    return new DataStreamGidBuilder;
  }
}

/// Fluent builder implementation template for [arrowflight.data_stream.DataStream]
class DataStreamGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T stream(void* propval) nothrow
  {
    return setProperty("stream", propval);
  }
}

/// Fluent builder for [arrowflight.data_stream.DataStream]
final class DataStreamGidBuilder : DataStreamGidBuilderImpl!DataStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DataStream build() nothrow
  {
    return new DataStream(cast(void*)createGObject(DataStream._getGType), No.Take);
  }
}
