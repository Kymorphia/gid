/// Module for [TracerRecord] class
module gid.gst1.tracer_record;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.object;
import gid.gst1.types;

/**
    Tracing modules will create instances of this class to announce the data they
    will log and create a log formatter.
*/
class TracerRecord : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_tracer_record_get_type != &gidSymbolNotFound ? gst_tracer_record_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstTracerRecord";
  }

  /** Returns `this`, for use in `with` statements. */
  override TracerRecord self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.tracer_record.TracerRecord]
      Returns: New builder object
  */
  static TracerRecordGidBuilder builder() nothrow
  {
    return new TracerRecordGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gst1.tracer_record.TracerRecord]
class TracerRecordGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.tracer_record.TracerRecord]
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
