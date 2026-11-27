/// Module for [StaticPadTemplate] class
module gid.gst1.static_pad_template;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.caps;
import gid.gst1.pad_template;
import gid.gst1.static_caps;
import gid.gst1.types;

/**
    Structure describing the #GstStaticPadTemplate.
*/
@gidGir("StaticPadTemplate")
class StaticPadTemplate : gid.gobject2.boxed.BoxedWrap!(gst_static_pad_template_get_type)
{
  /**
      Create a `static_pad_template.StaticPadTemplate` boxed type.
      Params:
        direction = the direction of the template
        presence = the presence of the template
  */
  this(gid.gst1.types.PadDirection direction = gid.gst1.types.PadDirection.init, gid.gst1.types.PadPresence presence = gid.gst1.types.PadPresence.init) nothrow
  {
    super(boxedNew!GstStaticPadTemplate(_getGType), Yes.Take);
    this.direction = direction;
    this.presence = presence;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override StaticPadTemplate self() nothrow
  {
    return this;
  }

  /**
      Get `nameTemplate` field.
      Returns: the name of the template
  */
  @property string nameTemplate() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstStaticPadTemplate*)this._cPtr).nameTemplate);
  }

  /**
      Get `direction` field.
      Returns: the direction of the template
  */
  @property gid.gst1.types.PadDirection direction() nothrow
  {
    return cast(gid.gst1.types.PadDirection)(cast(GstStaticPadTemplate*)this._cPtr).direction;
  }

  /**
      Set `direction` field.
      Params:
        propval = the direction of the template
  */
  @property void direction(gid.gst1.types.PadDirection propval) nothrow
  {
    (cast(GstStaticPadTemplate*)this._cPtr).direction = cast(GstPadDirection)propval;
  }

  /**
      Get `presence` field.
      Returns: the presence of the template
  */
  @property gid.gst1.types.PadPresence presence() nothrow
  {
    return cast(gid.gst1.types.PadPresence)(cast(GstStaticPadTemplate*)this._cPtr).presence;
  }

  /**
      Set `presence` field.
      Params:
        propval = the presence of the template
  */
  @property void presence(gid.gst1.types.PadPresence propval) nothrow
  {
    (cast(GstStaticPadTemplate*)this._cPtr).presence = cast(GstPadPresence)propval;
  }

  /**
      Get `staticCaps` field.
      Returns: the caps of the template.
  */
  @property gid.gst1.static_caps.StaticCaps staticCaps() nothrow
  {
    return cToD!(gid.gst1.static_caps.StaticCaps)(cast(void*)&(cast(GstStaticPadTemplate*)this._cPtr).staticCaps);
  }

  /**
      Converts a #GstStaticPadTemplate into a #GstPadTemplate.
      Returns: a new #GstPadTemplate.
  */
  gid.gst1.pad_template.PadTemplate get() nothrow
  {
    GstPadTemplate* _cretval;
    _cretval = gst_static_pad_template_get(cast(GstStaticPadTemplate*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad_template.PadTemplate)(cast(GstPadTemplate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the capabilities of the static pad template.
      Returns: the #GstCaps of the static pad template.
        Unref after usage. Since the core holds an additional
        ref to the returned caps, use [gid.gst1.caps.Caps.makeWritable]
        on the returned caps to modify it.
  */
  gid.gst1.caps.Caps getCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_static_pad_template_get_caps(cast(GstStaticPadTemplate*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
