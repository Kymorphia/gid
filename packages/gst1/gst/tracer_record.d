/// Module for [TracerRecord] class
module gst.tracer_record;

import gid.gid;
import gobject.gid_builder;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.types;

/**
    Tracing modules will create instances of this class to announce the data they
    will log and create a log formatter.
*/
class TracerRecord : gst.object.ObjectWrap
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
    return cast(void function())gst_tracer_record_get_type != &gidSymbolNotFound ? gst_tracer_record_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TracerRecord self()
  {
    return this;
  }

  /**
  Get builder for [gst.tracer_record.TracerRecord]
  Returns: New builder object
  */
  static TracerRecordGidBuilder builder()
  {
    return new TracerRecordGidBuilder;
  }
}

class TracerRecordGidBuilderImpl(T) : gst.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gst.tracer_record.TracerRecord]
final class TracerRecordGidBuilder : TracerRecordGidBuilderImpl!TracerRecordGidBuilder
{
  TracerRecord build()
  {
    return new TracerRecord(cast(void*)createGObject(TracerRecord._getGType), Yes.Take);
  }
}
