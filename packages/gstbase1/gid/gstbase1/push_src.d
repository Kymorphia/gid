/// Module for [PushSrc] class
module gid.gstbase1.push_src;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gstbase1.base_src;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

/**
    This class is mostly useful for elements that cannot do
    random access, or at least very slowly. The source usually
    prefers to push out a fixed size buffer.
    
    Subclasses usually operate in a format that is different from the
    default GST_FORMAT_BYTES format of #GstBaseSrc.
    
    Classes extending this base class will usually be scheduled
    in a push based mode. If the peer accepts to operate without
    offsets and within the limits of the allowed block size, this
    class can operate in getrange based mode automatically. To make
    this possible, the subclass should implement and override the
    SCHEDULING query.
    
    The subclass should extend the methods from the baseclass in
    addition to the ::create method.
    
    Seeking, flushing, scheduling and sync is all handled by this
    base class.
*/
class PushSrc : gid.gstbase1.base_src.BaseSrc
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_push_src_get_type != &gidSymbolNotFound ? gst_push_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstPushSrc";
  }

  /** Returns `this`, for use in `with` statements. */
  override PushSrc self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstbase1.push_src.PushSrc]
      Returns: New builder object
  */
  static PushSrcGidBuilder builder() nothrow
  {
    return new PushSrcGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstbase1.push_src.PushSrc]
class PushSrcGidBuilderImpl(T) : gid.gstbase1.base_src.BaseSrcGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstbase1.push_src.PushSrc]
final class PushSrcGidBuilder : PushSrcGidBuilderImpl!PushSrcGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PushSrc build() nothrow
  {
    return new PushSrc(cast(void*)createGObject(PushSrc._getGType), Yes.Take);
  }
}
