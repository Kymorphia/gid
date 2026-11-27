/// Module for [NeverTrigger] class
module gid.gtk4.never_trigger;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.shortcut_trigger;
import gid.gtk4.types;

/**
    A [gid.gtk4.shortcut_trigger.ShortcutTrigger] that never triggers.
*/
@gidGir("NeverTrigger", "NeverTriggerClass")
class NeverTrigger : gid.gtk4.shortcut_trigger.ShortcutTrigger
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_never_trigger_get_type != &gidSymbolNotFound ? gtk_never_trigger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkNeverTrigger";
  }

  /** Returns `this`, for use in `with` statements. */
  override NeverTrigger self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.never_trigger.NeverTrigger]
      Returns: New builder object
  */
  static NeverTriggerGidBuilder builder() nothrow
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
  static gid.gtk4.never_trigger.NeverTrigger get() nothrow
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_never_trigger_get();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.never_trigger.NeverTrigger)(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.never_trigger.NeverTrigger]
class NeverTriggerGidBuilderImpl(T) : gid.gtk4.shortcut_trigger.ShortcutTriggerGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.never_trigger.NeverTrigger]
final class NeverTriggerGidBuilder : NeverTriggerGidBuilderImpl!NeverTriggerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NeverTrigger build() nothrow
  {
    return new NeverTrigger(cast(void*)createGObject(NeverTrigger._getGType), Yes.Take);
  }
}
