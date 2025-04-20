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
  GtkToggleActionEntry cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.toggle_action_entry.ToggleActionEntry");

    cInstance = *cast(GtkToggleActionEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `name` field.
      Returns: The name of the action.
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the action.
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)cPtr).name);
  }

  /**
      Get `stockId` field.
      Returns: The stock id for the action, or the name of an icon from the
       icon theme.
  */
  @property string stockId()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).stockId);
  }

  /**
      Set `stockId` field.
      Params:
        propval = The stock id for the action, or the name of an icon from the
         icon theme.
  */
  @property void stockId(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).stockId);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)cPtr).stockId);
  }

  /**
      Get `label` field.
      Returns: The label for the action. This field should typically be marked
       for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property string label()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).label);
  }

  /**
      Set `label` field.
      Params:
        propval = The label for the action. This field should typically be marked
         for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property void label(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).label);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)cPtr).label);
  }

  /**
      Get `accelerator` field.
      Returns: The accelerator for the action, in the format understood by
       [gtk.global.acceleratorParse].
  */
  @property string accelerator()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).accelerator);
  }

  /**
      Set `accelerator` field.
      Params:
        propval = The accelerator for the action, in the format understood by
         [gtk.global.acceleratorParse].
  */
  @property void accelerator(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).accelerator);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)cPtr).accelerator);
  }

  /**
      Get `tooltip` field.
      Returns: The tooltip for the action. This field should typically be
       marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property string tooltip()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).tooltip);
  }

  /**
      Set `tooltip` field.
      Params:
        propval = The tooltip for the action. This field should typically be
         marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property void tooltip(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).tooltip);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)cPtr).tooltip);
  }

  /**
      Get `callback` field.
      Returns: The function to call when the action is activated.
  */
  @property GCallback callback()
  {
    return (cast(GtkToggleActionEntry*)cPtr).callback;
  }

  /**
      Set `callback` field.
      Params:
        propval = The function to call when the action is activated.
  */

  @property void callback(GCallback propval)
  {
    (cast(GtkToggleActionEntry*)cPtr).callback = propval;
  }

  /**
      Get `isActive` field.
      Returns: The initial state of the toggle action.
  */
  @property bool isActive()
  {
    return (cast(GtkToggleActionEntry*)cPtr).isActive;
  }

  /**
      Set `isActive` field.
      Params:
        propval = The initial state of the toggle action.
  */
  @property void isActive(bool propval)
  {
    (cast(GtkToggleActionEntry*)cPtr).isActive = propval;
  }
}
