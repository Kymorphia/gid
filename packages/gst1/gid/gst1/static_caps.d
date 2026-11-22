/// Module for [StaticCaps] class
module gid.gst1.static_caps;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.caps;
import gid.gst1.types;

/**
    Data structure to initialize #GstCaps from a string description usually
    used in conjunction with GST_STATIC_CAPS() and [gid.gst1.static_caps.StaticCaps.get] to
    instantiate a #GstCaps.
*/
class StaticCaps : gid.gobject2.boxed.BoxedWrap!(gst_static_caps_get_type)
{
  /**
      Create a `static_caps.StaticCaps` boxed type.
  */
  this() nothrow
  {
    super(boxedNew!GstStaticCaps(_getGType), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override StaticCaps self() nothrow
  {
    return this;
  }

  /**
      Get `caps` field.
      Returns: the cached #GstCaps
  */
  @property gid.gst1.caps.Caps caps() nothrow
  {
    return cToD!(gid.gst1.caps.Caps)(cast(void*)(cast(GstStaticCaps*)this._cPtr).caps);
  }

  /**
      Get `string_` field.
      Returns: a string describing a caps
  */
  @property string string_() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstStaticCaps*)this._cPtr).string_);
  }

  /**
      Cleans up the cached caps contained in static_caps.
  */
  void cleanup() nothrow
  {
    gst_static_caps_cleanup(cast(GstStaticCaps*)this._cPtr);
  }

  /**
      Converts a #GstStaticCaps to a #GstCaps.
      Returns: a pointer to the #GstCaps. Since the
            core holds an additional ref to the returned caps, use
            [gid.gst1.caps.Caps.makeWritable] on the returned caps to modify it.
  */
  gid.gst1.caps.Caps get() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_static_caps_get(cast(GstStaticCaps*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
