/// Module for [RadioActionEntry] class
module gtk.radio_action_entry;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    #GtkRadioActionEntry structs are used with
    [gtk.action_group.ActionGroup.addRadioActions] to construct groups of radio actions.
*/
class RadioActionEntry
{
  GtkRadioActionEntry cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.radio_action_entry.RadioActionEntry");

    cInstance = *cast(GtkRadioActionEntry*)ptr;

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
    return cToD!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the action.
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GtkRadioActionEntry*)cPtr).name);
  }

  /**
      Get `stockId` field.
      Returns: The stock id for the action, or the name of an icon from the
       icon theme.
  */
  @property string stockId()
  {
    return cToD!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).stockId);
  }

  /**
      Set `stockId` field.
      Params:
        propval = The stock id for the action, or the name of an icon from the
         icon theme.
  */
  @property void stockId(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).stockId);
    dToC(propval, cast(void*)&(cast(GtkRadioActionEntry*)cPtr).stockId);
  }

  /**
      Get `label` field.
      Returns: The label for the action. This field should typically be marked
       for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property string label()
  {
    return cToD!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).label);
  }

  /**
      Set `label` field.
      Params:
        propval = The label for the action. This field should typically be marked
         for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property void label(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).label);
    dToC(propval, cast(void*)&(cast(GtkRadioActionEntry*)cPtr).label);
  }

  /**
      Get `accelerator` field.
      Returns: The accelerator for the action, in the format understood by
       [gtk.global.acceleratorParse].
  */
  @property string accelerator()
  {
    return cToD!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).accelerator);
  }

  /**
      Set `accelerator` field.
      Params:
        propval = The accelerator for the action, in the format understood by
         [gtk.global.acceleratorParse].
  */
  @property void accelerator(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).accelerator);
    dToC(propval, cast(void*)&(cast(GtkRadioActionEntry*)cPtr).accelerator);
  }

  /**
      Get `tooltip` field.
      Returns: The tooltip for the action. This field should typically be
       marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property string tooltip()
  {
    return cToD!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).tooltip);
  }

  /**
      Set `tooltip` field.
      Params:
        propval = The tooltip for the action. This field should typically be
         marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property void tooltip(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).tooltip);
    dToC(propval, cast(void*)&(cast(GtkRadioActionEntry*)cPtr).tooltip);
  }

  /**
      Get `value` field.
      Returns: The value to set on the radio action. See
       [gtk.radio_action.RadioAction.getCurrentValue].
  */
  @property int value()
  {
    return (cast(GtkRadioActionEntry*)cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = The value to set on the radio action. See
         [gtk.radio_action.RadioAction.getCurrentValue].
  */
  @property void value(int propval)
  {
    (cast(GtkRadioActionEntry*)cPtr).value = propval;
  }
}
