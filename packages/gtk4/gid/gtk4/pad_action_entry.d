/// Module for [PadActionEntry] class
module gid.gtk4.pad_action_entry;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Struct defining a pad action entry.
*/
class PadActionEntry : StructWrap!(GtkPadActionEntry)
{
  /**
      Create a `pad_action_entry.PadActionEntry` wrap type.
      Params:
        type = the type of pad feature that will trigger this action entry.
        index = the 0-indexed button/ring/strip/dial number that will trigger this action
            entry.
        mode = the mode that will trigger this action entry, or -1 for all modes.
        label = Human readable description of this action entry, this string should
            be deemed user-visible.
        actionName = action name that will be activated in the [gid.gio2.action_group.ActionGroup].
  */
  this(gid.gtk4.types.PadActionType type = gid.gtk4.types.PadActionType.init, int index = int.init, int mode = int.init, string label = string.init, string actionName = string.init) nothrow
  {
    this.type = type;
    this.index = index;
    this.mode = mode;
    this.label = label;
    this.actionName = actionName;
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

  /**
      Get `type` field.
      Returns: the type of pad feature that will trigger this action entry.
  */
  @property gid.gtk4.types.PadActionType type() nothrow
  {
    return cast(gid.gtk4.types.PadActionType)(cast(GtkPadActionEntry*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of pad feature that will trigger this action entry.
  */
  @property void type(gid.gtk4.types.PadActionType propval) nothrow
  {
    (cast(GtkPadActionEntry*)this._cPtr).type = cast(GtkPadActionType)propval;
  }

  /**
      Get `index` field.
      Returns: the 0-indexed button/ring/strip/dial number that will trigger this action
          entry.
  */
  @property int index() nothrow
  {
    return (cast(GtkPadActionEntry*)this._cPtr).index;
  }

  /**
      Set `index` field.
      Params:
        propval = the 0-indexed button/ring/strip/dial number that will trigger this action
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

  private const(char)* _labelRef; // Keeps borrowed GC string alive

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
    if (_refuseBorrowedStore("label"))
      return;

    _labelRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkPadActionEntry*)this._cPtr).label = cast(const(char)*)_labelRef;
  }

  private const(char)* _actionNameRef; // Keeps borrowed GC string alive

  /**
      Get `actionName` field.
      Returns: action name that will be activated in the [gid.gio2.action_group.ActionGroup].
  */
  @property string actionName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkPadActionEntry*)this._cPtr).actionName);
  }

  /**
      Set `actionName` field.
      Params:
        propval = action name that will be activated in the [gid.gio2.action_group.ActionGroup].
  */
  @property void actionName(string propval) nothrow
  {
    if (_refuseBorrowedStore("actionName"))
      return;

    _actionNameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkPadActionEntry*)this._cPtr).actionName = cast(const(char)*)_actionNameRef;
  }
}
