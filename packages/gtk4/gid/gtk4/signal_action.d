/// Module for [SignalAction] class
module gid.gtk4.signal_action;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.shortcut_action;
import gid.gtk4.types;

/**
    Emits a signal on a widget.
    
    Signals that are used in this way are referred to as keybinding signals,
    and they are expected to be defined with the [gid.gobject2.types.SignalFlags.Action] flag.
*/
@gidGir("SignalAction", "SignalActionClass")
class SignalAction : gid.gtk4.shortcut_action.ShortcutAction
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
    return cast(void function())gtk_signal_action_get_type != &gidSymbolNotFound ? gtk_signal_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSignalAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override SignalAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.signal_action.SignalAction]
      Returns: New builder object
  */
  static SignalActionGidBuilder builder() nothrow
  {
    return new SignalActionGidBuilder;
  }

  /**
      Get `signalName` property.
      Returns: The name of the signal to emit.
  */
  @property string signalName() nothrow
  {
    return getSignalName();
  }

  /**
      Creates an action that when activated, emits the given action signal
      on the provided widget.
      
      It will also unpack the args into arguments passed to the signal.
  
      Params:
        signalName = name of the signal to emit
      Returns: a new [gid.gtk4.shortcut_action.ShortcutAction]
  */
  this(string signalName) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkShortcutAction* _cretval;
      const(char)* _signalName = signalName.toCString!(No.Malloc, No.Nullable);
      _cretval = gtk_signal_action_new(_signalName);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the name of the signal that will be emitted.
      Returns: the name of the signal to emit
  */
  string getSignalName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_signal_action_get_signal_name(cast(GtkSignalAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.signal_action.SignalAction]
class SignalActionGidBuilderImpl(T) : gid.gtk4.shortcut_action.ShortcutActionGidBuilderImpl!T
{

  /**
      Set `signalName` property.
      Params:
        propval = The name of the signal to emit.
      Returns: Builder instance for fluent chaining
  */
  T signalName(string propval) nothrow
  {
    return setProperty("signal-name", propval);
  }
}

/// Fluent builder for [gid.gtk4.signal_action.SignalAction]
final class SignalActionGidBuilder : SignalActionGidBuilderImpl!SignalActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SignalAction build() nothrow
  {
    return new SignalAction(cast(void*)createGObject(SignalAction._getGType), Yes.Take);
  }
}
