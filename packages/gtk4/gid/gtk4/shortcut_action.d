/// Module for [ShortcutAction] class
module gid.gtk4.shortcut_action;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.string_;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Encodes an action that can be triggered by a keyboard shortcut.
    
    `GtkShortcutActions` contain functions that allow easy presentation
    to end users as well as being printed for debugging.
    
    All `GtkShortcutActions` are immutable, you can only specify their
    properties during construction. If you want to change a action, you
    have to replace it with a new one. If you need to pass arguments to
    an action, these are specified by the higher-level [gid.gtk4.shortcut.Shortcut] object.
    
    To activate a [gid.gtk4.shortcut_action.ShortcutAction] manually, [gid.gtk4.shortcut_action.ShortcutAction.activate]
    can be called.
    
    GTK provides various actions:
    
     - [gid.gtk4.mnemonic_action.MnemonicAction]: a shortcut action that calls
       [gid.gtk4.widget.Widget.mnemonicActivate]
     - [gid.gtk4.callback_action.CallbackAction]: a shortcut action that invokes
       a given callback
     - [gid.gtk4.signal_action.SignalAction]: a shortcut action that emits a
       given signal
     - [gid.gtk4.activate_action.ActivateAction]: a shortcut action that calls
       [gid.gtk4.widget.Widget.activate]
     - [gid.gtk4.named_action.NamedAction]: a shortcut action that calls
       [gid.gtk4.widget.Widget.activateAction]
     - [gid.gtk4.nothing_action.NothingAction]: a shortcut action that does nothing
*/
class ShortcutAction : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_shortcut_action_get_type != &gidSymbolNotFound ? gtk_shortcut_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkShortcutAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.shortcut_action.ShortcutAction]
      Returns: New builder object
  */
  static ShortcutActionGidBuilder builder() nothrow
  {
    return new ShortcutActionGidBuilder;
  }

  /**
      Tries to parse the given string into an action.
      
      On success, the parsed action is returned. When parsing
      failed, null is returned.
      
      The accepted strings are:
      
      - `nothing`, for [gid.gtk4.nothing_action.NothingAction]
      - `activate`, for [gid.gtk4.activate_action.ActivateAction]
      - `mnemonic-activate`, for [gid.gtk4.mnemonic_action.MnemonicAction]
      - `action(NAME)`, for a [gid.gtk4.named_action.NamedAction] for the action named `NAME`
      - `signal(NAME)`, for a [gid.gtk4.signal_action.SignalAction] for the signal `NAME`
  
      Params:
        string_ = the string to parse
      Returns: a new [gid.gtk4.shortcut_action.ShortcutAction]
  */
  static gid.gtk4.shortcut_action.ShortcutAction parseString(string string_) nothrow
  {
    GtkShortcutAction* _cretval;
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_shortcut_action_parse_string(_string_);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.shortcut_action.ShortcutAction)(cast(GtkShortcutAction*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Activates the action on the widget with the given args.
      
      Note that some actions ignore the passed in flags, widget or args.
      
      Activation of an action can fail for various reasons. If the action
      is not supported by the widget, if the args don't match the action
      or if the activation otherwise had no effect, false will be returned.
  
      Params:
        flags = flags to activate with
        widget = Target of the activation
        args = arguments to pass
      Returns: true if this action was activated successfully
  */
  bool activate(gid.gtk4.types.ShortcutActionFlags flags, gid.gtk4.widget.Widget widget, gid.glib2.variant.Variant args = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_shortcut_action_activate(cast(GtkShortcutAction*)this._cPtr, flags, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, args ? cast(GVariant*)args._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Prints the given action into a string for the developer.
      
      This is meant for debugging and logging.
      
      The form of the representation may change at any time and is
      not guaranteed to stay identical.
  
      Params:
        string_ = a [gid.glib2.string_.String] to print into
  */
  void print(gid.glib2.string_.String string_) nothrow
  {
    gtk_shortcut_action_print(cast(GtkShortcutAction*)this._cPtr, string_ ? cast(GString*)string_._cPtr(No.Dup) : null);
  }

  /**
      Prints the given action into a human-readable string.
      
      This is a small wrapper around [gid.gtk4.shortcut_action.ShortcutAction.print]
      to help when debugging.
      Returns: a new string
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = gtk_shortcut_action_to_string(cast(GtkShortcutAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.shortcut_action.ShortcutAction]
class ShortcutActionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.shortcut_action.ShortcutAction]
final class ShortcutActionGidBuilder : ShortcutActionGidBuilderImpl!ShortcutActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShortcutAction build() nothrow
  {
    return new ShortcutAction(cast(void*)createGObject(ShortcutAction._getGType), Yes.Take);
  }
}
