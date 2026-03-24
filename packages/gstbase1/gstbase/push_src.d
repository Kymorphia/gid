/// Module for [PushSrc] class
module gstbase.push_src;

import gid.gid;
import gobject.gid_builder;
import gstbase.base_src;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

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
class PushSrc : gstbase.base_src.BaseSrc
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
    return cast(void function())gst_push_src_get_type != &gidSymbolNotFound ? gst_push_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PushSrc self()
  {
    return this;
  }

  /**
  Get builder for [gstbase.push_src.PushSrc]
  Returns: New builder object
  */
  static PushSrcGidBuilder builder()
  {
    return new PushSrcGidBuilder;
  }
}

class PushSrcGidBuilderImpl(T) : gstbase.base_src.BaseSrcGidBuilderImpl!T
{
}

/// Fluent builder for [gstbase.push_src.PushSrc]
final class PushSrcGidBuilder : PushSrcGidBuilderImpl!PushSrcGidBuilder
{
  PushSrc build()
  {
    return new PushSrc(cast(void*)createGObject(PushSrc._getGType), No.Take);
  }
}
