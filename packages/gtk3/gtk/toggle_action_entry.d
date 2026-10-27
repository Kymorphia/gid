/// Module for [ToggleActionEntry] class
module gtk.toggle_action_entry;

public import gid.basictypes;
import gid.gid;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    #GtkToggleActionEntry structs are used with
    [gtk.action_group.ActionGroup.addToggleActions] to construct toggle actions.
*/
class ToggleActionEntry
{
  GtkToggleActionEntry _cInstance;

  /**
      Create a `toggle_action_entry.ToggleActionEntry` wrap type.
      Params:
        name = The name of the action.
        stockId = The stock id for the action, or the name of an icon from the
           icon theme.
        label = The label for the action. This field should typically be marked
           for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
        accelerator = The accelerator for the action, in the format understood by
           [gtk.global.acceleratorParse].
        tooltip = The tooltip for the action. This field should typically be
           marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
        callback = The function to call when the action is activated.
        isActive = The initial state of the toggle action.
  */
  this(string name = string.init, string stockId = string.init, string label = string.init, string accelerator = string.init, string tooltip = string.init, GCallback callback = GCallback.init, bool isActive = bool.init) nothrow
  {
    this.name = name;
    this.stockId = stockId;
    this.label = label;
    this.accelerator = accelerator;
    this.tooltip = tooltip;
    this.callback = callback;
    this.isActive = isActive;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkToggleActionEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `name` field.
      Returns: The name of the action.
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the action.
  */
  @property void name(string propval) nothrow
  {
    (cast(GtkToggleActionEntry*)this._cPtr).name = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `stockId` field.
      Returns: The stock id for the action, or the name of an icon from the
         icon theme.
  */
  @property string stockId() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).stockId);
  }

  /**
      Set `stockId` field.
      Params:
        propval = The stock id for the action, or the name of an icon from the
           icon theme.
  */
  @property void stockId(string propval) nothrow
  {
    (cast(GtkToggleActionEntry*)this._cPtr).stockId = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `label` field.
      Returns: The label for the action. This field should typically be marked
         for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property string label() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).label);
  }

  /**
      Set `label` field.
      Params:
        propval = The label for the action. This field should typically be marked
           for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property void label(string propval) nothrow
  {
    (cast(GtkToggleActionEntry*)this._cPtr).label = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `accelerator` field.
      Returns: The accelerator for the action, in the format understood by
         [gtk.global.acceleratorParse].
  */
  @property string accelerator() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).accelerator);
  }

  /**
      Set `accelerator` field.
      Params:
        propval = The accelerator for the action, in the format understood by
           [gtk.global.acceleratorParse].
  */
  @property void accelerator(string propval) nothrow
  {
    (cast(GtkToggleActionEntry*)this._cPtr).accelerator = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `tooltip` field.
      Returns: The tooltip for the action. This field should typically be
         marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property string tooltip() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).tooltip);
  }

  /**
      Set `tooltip` field.
      Params:
        propval = The tooltip for the action. This field should typically be
           marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property void tooltip(string propval) nothrow
  {
    (cast(GtkToggleActionEntry*)this._cPtr).tooltip = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `callback` field.
      Returns: The function to call when the action is activated.
  */
  @property GCallback callback() nothrow
  {
    return (cast(GtkToggleActionEntry*)this._cPtr).callback;
  }

  /**
      Set `callback` field.
      Params:
        propval = The function to call when the action is activated.
  */

  @property void callback(GCallback propval) nothrow
  {
    (cast(GtkToggleActionEntry*)this._cPtr).callback = propval;
  }

  /**
      Get `isActive` field.
      Returns: The initial state of the toggle action.
  */
  @property bool isActive() nothrow
  {
    return cast(bool)(cast(GtkToggleActionEntry*)this._cPtr).isActive;
  }

  /**
      Set `isActive` field.
      Params:
        propval = The initial state of the toggle action.
  */
  @property void isActive(bool propval) nothrow
  {
    (cast(GtkToggleActionEntry*)this._cPtr).isActive = propval;
  }
}
