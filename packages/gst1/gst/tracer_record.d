/// Module for [TracerRecord] class
module gst.tracer_record;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_tracer_record_get_type != &gidSymbolNotFound ? gst_tracer_record_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TracerRecord self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gst.tracer_record.TracerRecord]
      Returns: New builder object
  */
  static TracerRecordGidBuilder builder() nothrow
  {
    return new TracerRecordGidBuilder;
  }
}

/// Fluent builder implementation template for [gst.tracer_record.TracerRecord]
class TracerRecordGidBuilderImpl(T) : gst.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gst.tracer_record.TracerRecord]
final class TracerRecordGidBuilder : TracerRecordGidBuilderImpl!TracerRecordGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TracerRecord build() nothrow
  {
    return new TracerRecord(cast(void*)createGObject(TracerRecord._getGType), Yes.Take);
  }
}
