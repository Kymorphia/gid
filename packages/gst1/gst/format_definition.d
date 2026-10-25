/// Module for [FormatDefinition] class
module gst.format_definition;

public import gid.basictypes;
import gid.gid;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A format definition
*/
class FormatDefinition
{
  GstFormatDefinition _cInstance;

  /**
      Create a `format_definition.FormatDefinition` wrap type.
      Params:
        value = The unique id of this format
        nick = A short nick of the format
        description = A longer description of the format
        quark = A quark for the nick
  */
  this(gst.types.Format value = gst.types.Format.init, string nick = string.init, string description = string.init, glib.types.Quark quark = glib.types.Quark.init) nothrow
  {
    this.value = value;
    this.nick = nick;
    this.description = description;
    this.quark = quark;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstFormatDefinition*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `value` field.
      Returns: The unique id of this format
  */
  @property gst.types.Format value() nothrow
  {
    return cast(gst.types.Format)(cast(GstFormatDefinition*)this._cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = The unique id of this format
  */
  @property void value(gst.types.Format propval) nothrow
  {
    (cast(GstFormatDefinition*)this._cPtr).value = cast(GstFormat)propval;
  }

  /**
      Get `nick` field.
      Returns: A short nick of the format
  */
  @property string nick() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstFormatDefinition*)this._cPtr).nick);
  }

  /**
      Set `nick` field.
      Params:
        propval = A short nick of the format
  */
  @property void nick(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GstFormatDefinition*)this._cPtr).nick);
    dToC(propval, cast(void*)&(cast(GstFormatDefinition*)this._cPtr).nick);
  }

  /**
      Get `description` field.
      Returns: A longer description of the format
  */
  @property string description() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstFormatDefinition*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = A longer description of the format
  */
  @property void description(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GstFormatDefinition*)this._cPtr).description);
    dToC(propval, cast(void*)&(cast(GstFormatDefinition*)this._cPtr).description);
  }

  /**
      Get `quark` field.
      Returns: A quark for the nick
  */
  @property glib.types.Quark quark() nothrow
  {
    return (cast(GstFormatDefinition*)this._cPtr).quark;
  }

  /**
      Set `quark` field.
      Params:
        propval = A quark for the nick
  */
  @property void quark(glib.types.Quark propval) nothrow
  {
    (cast(GstFormatDefinition*)this._cPtr).quark = propval;
  }
}
