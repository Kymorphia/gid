/// Module for [StaticCaps] class
module gst.static_caps;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.types;

/**
    Data structure to initialize #GstCaps from a string description usually
    used in conjunction with GST_STATIC_CAPS() and [gst.static_caps.StaticCaps.get] to
    instantiate a #GstCaps.
*/
class StaticCaps : gobject.boxed.Boxed
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
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_static_caps_get_type != &gidSymbolNotFound ? gst_static_caps_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
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
  @property gst.caps.Caps caps() nothrow
  {
    return cToD!(gst.caps.Caps)(cast(void*)(cast(GstStaticCaps*)this._cPtr).caps);
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
            [gst.caps.Caps.makeWritable] on the returned caps to modify it.
  */
  gst.caps.Caps get() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_static_caps_get(cast(GstStaticCaps*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
