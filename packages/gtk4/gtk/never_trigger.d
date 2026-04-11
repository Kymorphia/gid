/// Module for [NeverTrigger] class
module gtk.never_trigger;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_trigger;
import gtk.types;

/**
    A [gtk.shortcut_trigger.ShortcutTrigger] that never triggers.
*/
class NeverTrigger : gtk.shortcut_trigger.ShortcutTrigger
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
    return cast(void function())gtk_never_trigger_get_type != &gidSymbolNotFound ? gtk_never_trigger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NeverTrigger self()
  {
    return this;
  }

  /**
      Get builder for [gtk.never_trigger.NeverTrigger]
      Returns: New builder object
  */
  static NeverTriggerGidBuilder builder()
  {
    return new NeverTriggerGidBuilder;
  }

  /**
      Gets the never trigger.
      
      This is a singleton for a trigger that never triggers.
      Use this trigger instead of null because it implements
      all virtual functions.
      Returns: The never trigger
  */
  static gtk.never_trigger.NeverTrigger get()
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_never_trigger_get();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.never_trigger.NeverTrigger)(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.never_trigger.NeverTrigger]
class NeverTriggerGidBuilderImpl(T) : gtk.shortcut_trigger.ShortcutTriggerGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.never_trigger.NeverTrigger]
final class NeverTriggerGidBuilder : NeverTriggerGidBuilderImpl!NeverTriggerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NeverTrigger build()
  {
    return new NeverTrigger(cast(void*)createGObject(NeverTrigger._getGType), No.Take);
  }
}
