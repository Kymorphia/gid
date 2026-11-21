/// Module for [AlternativeTrigger] class
module gid.gtk4.alternative_trigger;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.shortcut_trigger;
import gid.gtk4.types;

/**
    Combines two shortcut triggers.
    
    The [gid.gtk4.alternative_trigger.AlternativeTrigger] triggers when either of the two trigger.
    
    This can be cascaded to combine more than two triggers.
*/
class AlternativeTrigger : gid.gtk4.shortcut_trigger.ShortcutTrigger
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_alternative_trigger_get_type != &gidSymbolNotFound ? gtk_alternative_trigger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkAlternativeTrigger";
  }

  /** Returns `this`, for use in `with` statements. */
  override AlternativeTrigger self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.alternative_trigger.AlternativeTrigger]
      Returns: New builder object
  */
  static AlternativeTriggerGidBuilder builder() nothrow
  {
    return new AlternativeTriggerGidBuilder;
  }

  /**
      Get `first` property.
      Returns: The first [gid.gtk4.shortcut_trigger.ShortcutTrigger] to check.
  */
  @property gid.gtk4.shortcut_trigger.ShortcutTrigger first() nothrow
  {
    return getFirst();
  }

  /**
      Get `second` property.
      Returns: The second [gid.gtk4.shortcut_trigger.ShortcutTrigger] to check.
  */
  @property gid.gtk4.shortcut_trigger.ShortcutTrigger second() nothrow
  {
    return getSecond();
  }

  /**
      Creates a [gid.gtk4.shortcut_trigger.ShortcutTrigger] that will trigger whenever
      either of the two given triggers gets triggered.
      
      Note that nesting is allowed, so if you want more than two
      alternative, create a new alternative trigger for each option.
  
      Params:
        first = The first trigger that may trigger
        second = The second trigger that may trigger
      Returns: a new [gid.gtk4.shortcut_trigger.ShortcutTrigger]
  */
  this(gid.gtk4.shortcut_trigger.ShortcutTrigger first, gid.gtk4.shortcut_trigger.ShortcutTrigger second) nothrow
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_alternative_trigger_new(first ? cast(GtkShortcutTrigger*)first._cPtr(Yes.Dup) : null, second ? cast(GtkShortcutTrigger*)second._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the first of the two alternative triggers that may
      trigger self.
      
      [gid.gtk4.alternative_trigger.AlternativeTrigger.getSecond] will return
      the other one.
      Returns: the first alternative trigger
  */
  gid.gtk4.shortcut_trigger.ShortcutTrigger getFirst() nothrow
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_alternative_trigger_get_first(cast(GtkAlternativeTrigger*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.shortcut_trigger.ShortcutTrigger)(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the second of the two alternative triggers that may
      trigger self.
      
      [gid.gtk4.alternative_trigger.AlternativeTrigger.getFirst] will return
      the other one.
      Returns: the second alternative trigger
  */
  gid.gtk4.shortcut_trigger.ShortcutTrigger getSecond() nothrow
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_alternative_trigger_get_second(cast(GtkAlternativeTrigger*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.shortcut_trigger.ShortcutTrigger)(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.alternative_trigger.AlternativeTrigger]
class AlternativeTriggerGidBuilderImpl(T) : gid.gtk4.shortcut_trigger.ShortcutTriggerGidBuilderImpl!T
{

  /**
      Set `first` property.
      Params:
        propval = The first [gid.gtk4.shortcut_trigger.ShortcutTrigger] to check.
      Returns: Builder instance for fluent chaining
  */
  T first(gid.gtk4.shortcut_trigger.ShortcutTrigger propval) nothrow
  {
    return setProperty("first", propval);
  }

  /**
      Set `second` property.
      Params:
        propval = The second [gid.gtk4.shortcut_trigger.ShortcutTrigger] to check.
      Returns: Builder instance for fluent chaining
  */
  T second(gid.gtk4.shortcut_trigger.ShortcutTrigger propval) nothrow
  {
    return setProperty("second", propval);
  }
}

/// Fluent builder for [gid.gtk4.alternative_trigger.AlternativeTrigger]
final class AlternativeTriggerGidBuilder : AlternativeTriggerGidBuilderImpl!AlternativeTriggerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AlternativeTrigger build() nothrow
  {
    return new AlternativeTrigger(cast(void*)createGObject(AlternativeTrigger._getGType), Yes.Take);
  }
}
