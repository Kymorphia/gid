/// Module for [SignalAction] class
module gtk.signal_action;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.types;

/**
    A [gtk.shortcut.Shortcut]Action that emits a signal.
    
    Signals that are used in this way are referred to as keybinding signals,
    and they are expected to be defined with the `G_SIGNAL_ACTION` flag.
*/
class SignalAction : gtk.shortcut_action.ShortcutAction
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
    return cast(void function())gtk_signal_action_get_type != &gidSymbolNotFound ? gtk_signal_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SignalAction self()
  {
    return this;
  }

  /**
      Creates an action that when activated, emits the given action signal
      on the provided widget.
      
      It will also unpack the args into arguments passed to the signal.
  
      Params:
        signalName = name of the signal to emit
      Returns: a new [gtk.shortcut_action.ShortcutAction]
  */
  this(string signalName)
  {
    GtkShortcutAction* _cretval;
    const(char)* _signalName = signalName.toCString(No.Alloc);
    _cretval = gtk_signal_action_new(_signalName);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the name of the signal that will be emitted.
      Returns: the name of the signal to emit
  */
  string getSignalName()
  {
    const(char)* _cretval;
    _cretval = gtk_signal_action_get_signal_name(cast(GtkSignalAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
