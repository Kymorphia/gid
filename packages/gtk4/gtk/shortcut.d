/// Module for [Shortcut] class
module gtk.shortcut;

import gid.gid;
import glib.variant;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.shortcut_trigger;
import gtk.types;

/**
    A [gtk.shortcut.Shortcut] describes a keyboard shortcut.
    
    It contains a description of how to trigger the shortcut via a
    [gtk.shortcut_trigger.ShortcutTrigger] and a way to activate the shortcut
    on a widget via a [gtk.shortcut_action.ShortcutAction].
    
    The actual work is usually done via [gtk.shortcut_controller.ShortcutController],
    which decides if and when to activate a shortcut. Using that controller
    directly however is rarely necessary as various higher level
    convenience APIs exist on [gtk.widget.Widget]s that make it easier to use
    shortcuts in GTK.
    
    [gtk.shortcut.Shortcut] does provide functionality to make it easy for users
    to work with shortcuts, either by providing informational strings
    for display purposes or by allowing shortcuts to be configured.
*/
class Shortcut : gobject.object.ObjectWrap
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
    return cast(void function())gtk_shortcut_get_type != &gidSymbolNotFound ? gtk_shortcut_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Shortcut self()
  {
    return this;
  }

  /**
      Get builder for [gtk.shortcut.Shortcut]
      Returns: New builder object
  */
  static ShortcutGidBuilder builder()
  {
    return new ShortcutGidBuilder;
  }

  /**
      Get `action` property.
      Returns: The action that gets activated by this shortcut.
  */
  @property gtk.shortcut_action.ShortcutAction action()
  {
    return getAction();
  }

  /**
      Set `action` property.
      Params:
        propval = The action that gets activated by this shortcut.
  */
  @property void action(gtk.shortcut_action.ShortcutAction propval)
  {
    setAction(propval);
  }

  /**
      Get `arguments` property.
      Returns: Arguments passed to activation.
  */
  @property glib.variant.Variant arguments()
  {
    return getArguments();
  }

  /**
      Set `arguments` property.
      Params:
        propval = Arguments passed to activation.
  */
  @property void arguments(glib.variant.Variant propval)
  {
    setArguments(propval);
  }

  /**
      Get `trigger` property.
      Returns: The trigger that triggers this shortcut.
  */
  @property gtk.shortcut_trigger.ShortcutTrigger trigger()
  {
    return getTrigger();
  }

  /**
      Set `trigger` property.
      Params:
        propval = The trigger that triggers this shortcut.
  */
  @property void trigger(gtk.shortcut_trigger.ShortcutTrigger propval)
  {
    setTrigger(propval);
  }

  /**
      Creates a new [gtk.shortcut.Shortcut] that is triggered by
      trigger and then activates action.
  
      Params:
        trigger = The trigger that will trigger the shortcut
        action = The action that will be activated upon
             triggering
      Returns: a new [gtk.shortcut.Shortcut]
  */
  this(gtk.shortcut_trigger.ShortcutTrigger trigger = null, gtk.shortcut_action.ShortcutAction action = null)
  {
    GtkShortcut* _cretval;
    _cretval = gtk_shortcut_new(trigger ? cast(GtkShortcutTrigger*)trigger._cPtr(Yes.Dup) : null, action ? cast(GtkShortcutAction*)action._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the action that is activated by this shortcut.
      Returns: the action
  */
  gtk.shortcut_action.ShortcutAction getAction()
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_shortcut_get_action(cast(GtkShortcut*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.shortcut_action.ShortcutAction)(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the arguments that are passed when activating the shortcut.
      Returns: the arguments
  */
  glib.variant.Variant getArguments()
  {
    GVariant* _cretval;
    _cretval = gtk_shortcut_get_arguments(cast(GtkShortcut*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the trigger used to trigger self.
      Returns: the trigger used
  */
  gtk.shortcut_trigger.ShortcutTrigger getTrigger()
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_shortcut_get_trigger(cast(GtkShortcut*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.shortcut_trigger.ShortcutTrigger)(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the new action for self to be action.
  
      Params:
        action = The new action.
            If the action is null, the nothing action will be used.
  */
  void setAction(gtk.shortcut_action.ShortcutAction action = null)
  {
    gtk_shortcut_set_action(cast(GtkShortcut*)this._cPtr, action ? cast(GtkShortcutAction*)action._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the arguments to pass when activating the shortcut.
  
      Params:
        args = arguments to pass when activating self
  */
  void setArguments(glib.variant.Variant args = null)
  {
    gtk_shortcut_set_arguments(cast(GtkShortcut*)this._cPtr, args ? cast(GVariant*)args._cPtr(No.Dup) : null);
  }

  /**
      Sets the new trigger for self to be trigger.
  
      Params:
        trigger = The new trigger.
            If the trigger is null, the never trigger will be used.
  */
  void setTrigger(gtk.shortcut_trigger.ShortcutTrigger trigger = null)
  {
    gtk_shortcut_set_trigger(cast(GtkShortcut*)this._cPtr, trigger ? cast(GtkShortcutTrigger*)trigger._cPtr(Yes.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.shortcut.Shortcut]
class ShortcutGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `action` property.
      Params:
        propval = The action that gets activated by this shortcut.
      Returns: Builder instance for fluent chaining
  */
  T action(gtk.shortcut_action.ShortcutAction propval)
  {
    return setProperty("action", propval);
  }

  /**
      Set `arguments` property.
      Params:
        propval = Arguments passed to activation.
      Returns: Builder instance for fluent chaining
  */
  T arguments(glib.variant.Variant propval)
  {
    return setProperty("arguments", propval);
  }

  /**
      Set `trigger` property.
      Params:
        propval = The trigger that triggers this shortcut.
      Returns: Builder instance for fluent chaining
  */
  T trigger(gtk.shortcut_trigger.ShortcutTrigger propval)
  {
    return setProperty("trigger", propval);
  }
}

/// Fluent builder for [gtk.shortcut.Shortcut]
final class ShortcutGidBuilder : ShortcutGidBuilderImpl!ShortcutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Shortcut build()
  {
    return new Shortcut(cast(void*)createGObject(Shortcut._getGType), Yes.Take);
  }
}
