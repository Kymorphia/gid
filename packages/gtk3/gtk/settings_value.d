/// Module for [SettingsValue] class
module gtk.settings_value;

public import gid.basictypes;
import gid.gid;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class SettingsValue : StructWrap!(GtkSettingsValue)
{
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
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  private const(char)* _originRef; // Keeps borrowed GC string alive

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
    if (_refuseBorrowedStore("origin"))
      return;

    _originRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkSettingsValue*)this._cPtr).origin = cast(char*)_originRef;
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
