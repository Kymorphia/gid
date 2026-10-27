/// Module for [StaticPadTemplate] class
module gst.static_pad_template;

public import gid.basictypes;
import gid.gid;
import gobject.object;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.pad_template;
import gst.static_caps;
import gst.types;

/**
    Structure describing the #GstStaticPadTemplate.
*/
class StaticPadTemplate
{
  GstStaticPadTemplate _cInstance;

  /**
      Create a `static_pad_template.StaticPadTemplate` wrap type.
      Params:
        nameTemplate = the name of the template
        direction = the direction of the template
        presence = the presence of the template
  */
  this(string nameTemplate = string.init, gst.types.PadDirection direction = gst.types.PadDirection.init, gst.types.PadPresence presence = gst.types.PadPresence.init) nothrow
  {
    this.nameTemplate = nameTemplate;
    this.direction = direction;
    this.presence = presence;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstStaticPadTemplate*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
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
      Set `nameTemplate` field.
      Params:
        propval = the name of the template
  */
  @property void nameTemplate(string propval) nothrow
  {
    (cast(GstStaticPadTemplate*)this._cPtr).nameTemplate = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `direction` field.
      Returns: the direction of the template
  */
  @property gst.types.PadDirection direction() nothrow
  {
    return cast(gst.types.PadDirection)(cast(GstStaticPadTemplate*)this._cPtr).direction;
  }

  /**
      Set `direction` field.
      Params:
        propval = the direction of the template
  */
  @property void direction(gst.types.PadDirection propval) nothrow
  {
    (cast(GstStaticPadTemplate*)this._cPtr).direction = cast(GstPadDirection)propval;
  }

  /**
      Get `presence` field.
      Returns: the presence of the template
  */
  @property gst.types.PadPresence presence() nothrow
  {
    return cast(gst.types.PadPresence)(cast(GstStaticPadTemplate*)this._cPtr).presence;
  }

  /**
      Set `presence` field.
      Params:
        propval = the presence of the template
  */
  @property void presence(gst.types.PadPresence propval) nothrow
  {
    (cast(GstStaticPadTemplate*)this._cPtr).presence = cast(GstPadPresence)propval;
  }

  /**
      Get `staticCaps` field.
      Returns: the caps of the template.
  */
  @property gst.static_caps.StaticCaps staticCaps() nothrow
  {
    return new gst.static_caps.StaticCaps(cast(GstStaticCaps*)&(cast(GstStaticPadTemplate*)this._cPtr).staticCaps, No.Take);
  }

  /**
      Converts a #GstStaticPadTemplate into a #GstPadTemplate.
      Returns: a new #GstPadTemplate.
  */
  gst.pad_template.PadTemplate get() nothrow
  {
    GstPadTemplate* _cretval;
    _cretval = gst_static_pad_template_get(cast(GstStaticPadTemplate*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad_template.PadTemplate)(cast(GstPadTemplate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the capabilities of the static pad template.
      Returns: the #GstCaps of the static pad template.
        Unref after usage. Since the core holds an additional
        ref to the returned caps, use gst_caps_make_writable()
        on the returned caps to modify it.
  */
  gst.caps.Caps getCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_static_pad_template_get_caps(cast(GstStaticPadTemplate*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
