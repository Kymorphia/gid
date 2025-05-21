/// Module for [AlternativeTrigger] class
module gtk.alternative_trigger;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_trigger;
import gtk.types;

/**
    A [gtk.shortcut_trigger.ShortcutTrigger] that combines two triggers.
    
    The [gtk.alternative_trigger.AlternativeTrigger] triggers when either of two trigger.
    
    This can be cascaded to combine more than two triggers.
*/
class AlternativeTrigger : gtk.shortcut_trigger.ShortcutTrigger
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_alternative_trigger_get_type != &gidSymbolNotFound ? gtk_alternative_trigger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AlternativeTrigger self()
  {
    return this;
  }

  /**
      Creates a [gtk.shortcut_trigger.ShortcutTrigger] that will trigger whenever
      either of the two given triggers gets triggered.
      
      Note that nesting is allowed, so if you want more than two
      alternative, create a new alternative trigger for each option.
  
      Params:
        first = The first trigger that may trigger
        second = The second trigger that may trigger
      Returns: a new [gtk.shortcut_trigger.ShortcutTrigger]
  */
  this(gtk.shortcut_trigger.ShortcutTrigger first, gtk.shortcut_trigger.ShortcutTrigger second)
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_alternative_trigger_new(first ? cast(GtkShortcutTrigger*)first._cPtr(Yes.Dup) : null, second ? cast(GtkShortcutTrigger*)second._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the first of the two alternative triggers that may
      trigger self.
      
      [gtk.alternative_trigger.AlternativeTrigger.getSecond] will return
      the other one.
      Returns: the first alternative trigger
  */
  gtk.shortcut_trigger.ShortcutTrigger getFirst()
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_alternative_trigger_get_first(cast(GtkAlternativeTrigger*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.shortcut_trigger.ShortcutTrigger)(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the second of the two alternative triggers that may
      trigger self.
      
      [gtk.alternative_trigger.AlternativeTrigger.getFirst] will return
      the other one.
      Returns: the second alternative trigger
  */
  gtk.shortcut_trigger.ShortcutTrigger getSecond()
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_alternative_trigger_get_second(cast(GtkAlternativeTrigger*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.shortcut_trigger.ShortcutTrigger)(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }
}
