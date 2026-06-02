/// Module for [SettingsValue] class
module gtk.settings_value;

public import gid.basictypes;
import gid.gid;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class SettingsValue
{
  GtkSettingsValue _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkSettingsValue*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `origin` field.
      Returns: Origin should be something like “filename:linenumber” for
           rc files, or e.g. “XProperty” for other sources.
  */
  @property string origin() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkSettingsValue*)this._cPtr).origin);
  }

  /**
      Set `origin` field.
      Params:
        propval = Origin should be something like “filename:linenumber” for
             rc files, or e.g. “XProperty” for other sources.
  */
  @property void origin(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GtkSettingsValue*)this._cPtr).origin);
    dToC(propval, cast(void*)&(cast(GtkSettingsValue*)this._cPtr).origin);
  }

  /**
      Get `value` field.
      Returns: Valid types are LONG, DOUBLE and STRING corresponding to
           the token parsed, or a GSTRING holding an unparsed statement
  */
  @property gobject.value.Value value() nothrow
  {
    return cToD!(gobject.value.Value)(cast(void*)&(cast(GtkSettingsValue*)this._cPtr).value);
  }
}
