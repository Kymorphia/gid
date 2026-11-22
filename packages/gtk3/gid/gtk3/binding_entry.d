/// Module for [BindingEntry] class
module gid.gtk3.binding_entry;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.types;
import gid.glib2.types;
import gid.gtk3.binding_arg;
import gid.gtk3.binding_set;
import gid.gtk3.binding_signal;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    Each key binding element of a binding sets binding list is
    represented by a GtkBindingEntry.
*/
class BindingEntry : StructWrap!(GtkBindingEntry)
{
  /**
      Create a `binding_entry.BindingEntry` wrap type.
      Params:
        keyval = key value to match
        modifiers = key modifiers to match
        destroyed = implementation detail
        inEmission = implementation detail
        marksUnbound = implementation detail
  */
  this(uint keyval = uint.init, gid.gdk3.types.ModifierType modifiers = gid.gdk3.types.ModifierType.init, uint destroyed = uint.init, uint inEmission = uint.init, uint marksUnbound = uint.init) nothrow
  {
    this.keyval = keyval;
    this.modifiers = modifiers;
    this.destroyed = destroyed;
    this.inEmission = inEmission;
    this.marksUnbound = marksUnbound;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `keyval` field.
      Returns: key value to match
  */
  @property uint keyval() nothrow
  {
    return (cast(GtkBindingEntry*)this._cPtr).keyval;
  }

  /**
      Set `keyval` field.
      Params:
        propval = key value to match
  */
  @property void keyval(uint propval) nothrow
  {
    (cast(GtkBindingEntry*)this._cPtr).keyval = propval;
  }

  /**
      Get `modifiers` field.
      Returns: key modifiers to match
  */
  @property gid.gdk3.types.ModifierType modifiers() nothrow
  {
    return cast(gid.gdk3.types.ModifierType)(cast(GtkBindingEntry*)this._cPtr).modifiers;
  }

  /**
      Set `modifiers` field.
      Params:
        propval = key modifiers to match
  */
  @property void modifiers(gid.gdk3.types.ModifierType propval) nothrow
  {
    (cast(GtkBindingEntry*)this._cPtr).modifiers = cast(GdkModifierType)propval;
  }

  /**
      Get `bindingSet` field.
      Returns: binding set this entry belongs to
  */
  @property gid.gtk3.binding_set.BindingSet bindingSet() nothrow
  {
    return (cast(GtkBindingEntry*)this._cPtr).bindingSet ? new gid.gtk3.binding_set.BindingSet(cast(GtkBindingSet*)(cast(GtkBindingEntry*)this._cPtr).bindingSet, this) : null;
  }

  /**
      Get `destroyed` field.
      Returns: implementation detail
  */
  @property uint destroyed() nothrow
  {
    return (cast(GtkBindingEntry*)this._cPtr).destroyed;
  }

  /**
      Set `destroyed` field.
      Params:
        propval = implementation detail
  */
  @property void destroyed(uint propval) nothrow
  {
    (cast(GtkBindingEntry*)this._cPtr).destroyed = propval;
  }

  /**
      Get `inEmission` field.
      Returns: implementation detail
  */
  @property uint inEmission() nothrow
  {
    return (cast(GtkBindingEntry*)this._cPtr).inEmission;
  }

  /**
      Set `inEmission` field.
      Params:
        propval = implementation detail
  */
  @property void inEmission(uint propval) nothrow
  {
    (cast(GtkBindingEntry*)this._cPtr).inEmission = propval;
  }

  /**
      Get `marksUnbound` field.
      Returns: implementation detail
  */
  @property uint marksUnbound() nothrow
  {
    return (cast(GtkBindingEntry*)this._cPtr).marksUnbound;
  }

  /**
      Set `marksUnbound` field.
      Params:
        propval = implementation detail
  */
  @property void marksUnbound(uint propval) nothrow
  {
    (cast(GtkBindingEntry*)this._cPtr).marksUnbound = propval;
  }

  /**
      Get `setNext` field.
      Returns: linked list of entries maintained by binding set
  */
  @property gid.gtk3.binding_entry.BindingEntry setNext() nothrow
  {
    return (cast(GtkBindingEntry*)this._cPtr).setNext ? new gid.gtk3.binding_entry.BindingEntry(cast(GtkBindingEntry*)(cast(GtkBindingEntry*)this._cPtr).setNext, this) : null;
  }

  /**
      Get `hashNext` field.
      Returns: implementation detail
  */
  @property gid.gtk3.binding_entry.BindingEntry hashNext() nothrow
  {
    return (cast(GtkBindingEntry*)this._cPtr).hashNext ? new gid.gtk3.binding_entry.BindingEntry(cast(GtkBindingEntry*)(cast(GtkBindingEntry*)this._cPtr).hashNext, this) : null;
  }

  /**
      Get `signals` field.
      Returns: action signals of this entry
  */
  @property gid.gtk3.binding_signal.BindingSignal signals() nothrow
  {
    return (cast(GtkBindingEntry*)this._cPtr).signals ? new gid.gtk3.binding_signal.BindingSignal(cast(GtkBindingSignal*)(cast(GtkBindingEntry*)this._cPtr).signals, this) : null;
  }

  /**
      Parses a signal description from signal_desc and incorporates
      it into binding_set.
      
      Signal descriptions may either bind a key combination to
      one or more signals:
      ```
        bind "key" {
          "signalname" (param, ...)
          ...
        }
      ```
      
      Or they may also unbind a key combination:
      ```
        unbind "key"
      ```
      
      Key combinations must be in a format that can be parsed by
      [gid.gtk4.global.acceleratorParse].
  
      Params:
        bindingSet = a #GtkBindingSet
        signalDesc = a signal description
      Returns: [gid.glib2.types.TokenType.None] if the signal was successfully parsed and added,
            the expected token otherwise
  */
  static gid.glib2.types.TokenType addSignalFromString(gid.gtk3.binding_set.BindingSet bindingSet, string signalDesc) nothrow
  {
    GTokenType _cretval;
    const(char)* _signalDesc = signalDesc.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_binding_entry_add_signal_from_string(bindingSet ? cast(GtkBindingSet*)bindingSet._cPtr : null, _signalDesc);
    gid.glib2.types.TokenType _retval = cast(gid.glib2.types.TokenType)_cretval;
    return _retval;
  }

  /**
      Override or install a new key binding for keyval with modifiers on
      binding_set.
  
      Params:
        bindingSet = a #GtkBindingSet to add a signal to
        keyval = key value
        modifiers = key modifier
        signalName = signal name to be bound
        bindingArgs = list of #GtkBindingArg signal arguments
  */
  static void addSignall(gid.gtk3.binding_set.BindingSet bindingSet, uint keyval, gid.gdk3.types.ModifierType modifiers, string signalName, gid.gtk3.binding_arg.BindingArg[] bindingArgs) nothrow
  {
    const(char)* _signalName = signalName.toCString!(No.Malloc, No.Nullable);
    auto _bindingArgs = gSListFromD!(gid.gtk3.binding_arg.BindingArg)(bindingArgs);
    scope(exit) containerFree!(GSList*, gid.gtk3.binding_arg.BindingArg, GidOwnership.None)(_bindingArgs);
    gtk_binding_entry_add_signall(bindingSet ? cast(GtkBindingSet*)bindingSet._cPtr : null, keyval, modifiers, _signalName, _bindingArgs);
  }

  /**
      Remove a binding previously installed via
      [gid.gtk3.binding_entry.BindingEntry.addSignal] on binding_set.
  
      Params:
        bindingSet = a #GtkBindingSet to remove an entry of
        keyval = key value of binding to remove
        modifiers = key modifier of binding to remove
  */
  static void remove(gid.gtk3.binding_set.BindingSet bindingSet, uint keyval, gid.gdk3.types.ModifierType modifiers) nothrow
  {
    gtk_binding_entry_remove(bindingSet ? cast(GtkBindingSet*)bindingSet._cPtr : null, keyval, modifiers);
  }

  /**
      Install a binding on binding_set which causes key lookups
      to be aborted, to prevent bindings from lower priority sets
      to be activated.
  
      Params:
        bindingSet = a #GtkBindingSet to skip an entry of
        keyval = key value of binding to skip
        modifiers = key modifier of binding to skip
  */
  static void skip(gid.gtk3.binding_set.BindingSet bindingSet, uint keyval, gid.gdk3.types.ModifierType modifiers) nothrow
  {
    gtk_binding_entry_skip(bindingSet ? cast(GtkBindingSet*)bindingSet._cPtr : null, keyval, modifiers);
  }
}
