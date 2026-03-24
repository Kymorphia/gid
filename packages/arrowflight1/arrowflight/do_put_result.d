/// Module for [DoPutResult] class
module arrowflight.do_put_result;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.metadata_reader;
import arrowflight.stream_writer;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class DoPutResult : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_do_put_result_get_type != &gidSymbolNotFound ? gaflight_do_put_result_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DoPutResult self()
  {
    return this;
  }

  /**
  Get builder for [arrowflight.do_put_result.DoPutResult]
  Returns: New builder object
  */
  static DoPutResultGidBuilder builder()
  {
    return new DoPutResultGidBuilder;
  }

  /**
      Get `reader` property.
      Returns: A reader for application metadata from the server.
  */
  @property arrowflight.metadata_reader.MetadataReader reader()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowflight.metadata_reader.MetadataReader)("reader");
  }

  /**
      Get `writer` property.
      Returns: A writer to write record batches to.
  */
  @property arrowflight.stream_writer.StreamWriter writer()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowflight.stream_writer.StreamWriter)("writer");
  }
}

class DoPutResultGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T result(void* propval)
  {
    return setProperty("result", propval);
  }
}

/// Fluent builder for [arrowflight.do_put_result.DoPutResult]
final class DoPutResultGidBuilder : DoPutResultGidBuilderImpl!DoPutResultGidBuilder
{
  DoPutResult build()
  {
    return new DoPutResult(cast(void*)createGObject(DoPutResult._getGType), No.Take);
  }
}
