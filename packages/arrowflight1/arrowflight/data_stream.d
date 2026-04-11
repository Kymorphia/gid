/// Module for [DataStream] class
module arrowflight.data_stream;

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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_data_stream_get_type != &gidSymbolNotFound ? gaflight_data_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataStream self()
  {
    return this;
  }

  /**
      Get builder for [arrowflight.data_stream.DataStream]
      Returns: New builder object
  */
  static DataStreamGidBuilder builder()
  {
    return new DataStreamGidBuilder;
  }
}

/// Fluent builder implementation template for [arrowflight.data_stream.DataStream]
class DataStreamGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T stream(void* propval)
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
  DataStream build()
  {
    return new DataStream(cast(void*)createGObject(DataStream._getGType), No.Take);
  }
}
