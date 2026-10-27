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

  /**
      Create a `settings_value.SettingsValue` wrap type.
      Params:
        origin = Origin should be something like “filename:linenumber” for
             rc files, or e.g. “XProperty” for other sources.
  */
  this(string origin = string.init) nothrow
  {
    this.origin = origin;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkSettingsValue*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
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
    (cast(GtkSettingsValue*)this._cPtr).origin = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
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
