/// Module for [ToggleActionEntry] class
module gtk.toggle_action_entry;

import gid.gid;
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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.toggle_action_entry.ToggleActionEntry");

    _cInstance = *cast(GtkToggleActionEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `name` field.
      Returns: The name of the action.
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the action.
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)this._cPtr).name);
  }

  /**
      Get `stockId` field.
      Returns: The stock id for the action, or the name of an icon from the
         icon theme.
  */
  @property string stockId()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).stockId);
  }

  /**
      Set `stockId` field.
      Params:
        propval = The stock id for the action, or the name of an icon from the
           icon theme.
  */
  @property void stockId(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).stockId);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)this._cPtr).stockId);
  }

  /**
      Get `label` field.
      Returns: The label for the action. This field should typically be marked
         for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property string label()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).label);
  }

  /**
      Set `label` field.
      Params:
        propval = The label for the action. This field should typically be marked
           for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property void label(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).label);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)this._cPtr).label);
  }

  /**
      Get `accelerator` field.
      Returns: The accelerator for the action, in the format understood by
         [gtk.global.acceleratorParse].
  */
  @property string accelerator()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).accelerator);
  }

  /**
      Set `accelerator` field.
      Params:
        propval = The accelerator for the action, in the format understood by
           [gtk.global.acceleratorParse].
  */
  @property void accelerator(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).accelerator);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)this._cPtr).accelerator);
  }

  /**
      Get `tooltip` field.
      Returns: The tooltip for the action. This field should typically be
         marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property string tooltip()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).tooltip);
  }

  /**
      Set `tooltip` field.
      Params:
        propval = The tooltip for the action. This field should typically be
           marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property void tooltip(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)this._cPtr).tooltip);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)this._cPtr).tooltip);
  }

  /**
      Get `callback` field.
      Returns: The function to call when the action is activated.
  */
  @property GCallback callback()
  {
    return (cast(GtkToggleActionEntry*)this._cPtr).callback;
  }

  /**
      Set `callback` field.
      Params:
        propval = The function to call when the action is activated.
  */

  @property void callback(GCallback propval)
  {
    (cast(GtkToggleActionEntry*)this._cPtr).callback = propval;
  }

  /**
      Get `isActive` field.
      Returns: The initial state of the toggle action.
  */
  @property bool isActive()
  {
    return cast(bool)(cast(GtkToggleActionEntry*)this._cPtr).isActive;
  }

  /**
      Set `isActive` field.
      Params:
        propval = The initial state of the toggle action.
  */
  @property void isActive(bool propval)
  {
    (cast(GtkToggleActionEntry*)this._cPtr).isActive = propval;
  }
}
