/// Module for [PadActionEntry] class
module gtk.pad_action_entry;

public import gid.basictypes;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Struct defining a pad action entry.
*/
class PadActionEntry
{
  GtkPadActionEntry _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkPadActionEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `type` field.
      Returns: the type of pad feature that will trigger this action entry.
  */
  @property gtk.types.PadActionType type() nothrow
  {
    return cast(gtk.types.PadActionType)(cast(GtkPadActionEntry*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of pad feature that will trigger this action entry.
  */
  @property void type(gtk.types.PadActionType propval) nothrow
  {
    (cast(GtkPadActionEntry*)this._cPtr).type = cast(GtkPadActionType)propval;
  }

  /**
      Get `index` field.
      Returns: the 0-indexed button/ring/strip number that will trigger this action
          entry.
  */
  @property int index() nothrow
  {
    return (cast(GtkPadActionEntry*)this._cPtr).index;
  }

  /**
      Set `index` field.
      Params:
        propval = the 0-indexed button/ring/strip number that will trigger this action
            entry.
  */
  @property void index(int propval) nothrow
  {
    (cast(GtkPadActionEntry*)this._cPtr).index = propval;
  }

  /**
      Get `mode` field.
      Returns: the mode that will trigger this action entry, or -1 for all modes.
  */
  @property int mode() nothrow
  {
    return (cast(GtkPadActionEntry*)this._cPtr).mode;
  }

  /**
      Set `mode` field.
      Params:
        propval = the mode that will trigger this action entry, or -1 for all modes.
  */
  @property void mode(int propval) nothrow
  {
    (cast(GtkPadActionEntry*)this._cPtr).mode = propval;
  }

  /**
      Get `label` field.
      Returns: Human readable description of this action entry, this string should
          be deemed user-visible.
  */
  @property string label() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkPadActionEntry*)this._cPtr).label);
  }

  /**
      Set `label` field.
      Params:
        propval = Human readable description of this action entry, this string should
            be deemed user-visible.
  */
  @property void label(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GtkPadActionEntry*)this._cPtr).label);
    dToC(propval, cast(void*)&(cast(GtkPadActionEntry*)this._cPtr).label);
  }

  /**
      Get `actionName` field.
      Returns: action name that will be activated in the [gio.action_group.ActionGroup].
  */
  @property string actionName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkPadActionEntry*)this._cPtr).actionName);
  }

  /**
      Set `actionName` field.
      Params:
        propval = action name that will be activated in the [gio.action_group.ActionGroup].
  */
  @property void actionName(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GtkPadActionEntry*)this._cPtr).actionName);
    dToC(propval, cast(void*)&(cast(GtkPadActionEntry*)this._cPtr).actionName);
  }
}
