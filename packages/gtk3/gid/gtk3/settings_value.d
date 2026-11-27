/// Module for [SettingsValue] class
module gid.gtk3.settings_value;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.value;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/** */
@gidGir("SettingsValue")
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
  @property gid.gobject2.value.Value value() nothrow
  {
    return cToD!(gid.gobject2.value.Value)(cast(void*)&(cast(GtkSettingsValue*)this._cPtr).value);
  }
}
