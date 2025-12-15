/// Module for [ShortcutTrigger] class
module gtk.shortcut_trigger;

import gdk.display;
import gdk.event;
import gdk.types;
import gid.gid;
import glib.string_;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.shortcut_trigger.ShortcutTrigger] tracks how a [gtk.shortcut.Shortcut] should be activated.
    
    To find out if a [gtk.shortcut_trigger.ShortcutTrigger] triggers, you can call
    [gtk.shortcut_trigger.ShortcutTrigger.trigger] on a [gdk.event.Event].
    
    `GtkShortcutTriggers` contain functions that allow easy presentation
    to end users as well as being printed for debugging.
    
    All `GtkShortcutTriggers` are immutable, you can only specify their
    properties during construction. If you want to change a trigger, you
    have to replace it with a new one.
*/
class ShortcutTrigger : gobject.object.ObjectWrap
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
    return cast(void function())gtk_shortcut_trigger_get_type != &gidSymbolNotFound ? gtk_shortcut_trigger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutTrigger self()
  {
    return this;
  }

  /**
      Tries to parse the given string into a trigger.
      
      On success, the parsed trigger is returned.
      When parsing failed, null is returned.
      
      The accepted strings are:
      
        $(LIST
            * `never`, for [gtk.never_trigger.NeverTrigger]
            * a string parsed by [gtk.global.acceleratorParse], for a [gtk.keyval_trigger.KeyvalTrigger], e.g. `<Control>C`
            * underscore, followed by a single character, for [gtk.mnemonic_trigger.MnemonicTrigger], e.g. `_l`
            * two valid trigger strings, separated by a `|` character, for a
              [gtk.alternative_trigger.AlternativeTrigger]: `<Control>q|<Control>w`
        )
          
      Note that you will have to escape the `<` and `>` characters when specifying
      triggers in XML files, such as GtkBuilder ui files. Use `&lt;` instead of
      `<` and `&gt;` instead of `>`.
  
      Params:
        string_ = the string to parse
      Returns: a new [gtk.shortcut_trigger.ShortcutTrigger]
  */
  static gtk.shortcut_trigger.ShortcutTrigger parseString(string string_)
  {
    GtkShortcutTrigger* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gtk_shortcut_trigger_parse_string(_string_);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.shortcut_trigger.ShortcutTrigger)(cast(GtkShortcutTrigger*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      The types of trigger1 and trigger2 are `gconstpointer` only to allow
      use of this function as a [glib.types.CompareFunc].
      
      They must each be a [gtk.shortcut_trigger.ShortcutTrigger].
  
      Params:
        trigger2 = a [gtk.shortcut_trigger.ShortcutTrigger]
      Returns: An integer less than, equal to, or greater than zero if
          trigger1 is found, respectively, to be less than, to match,
          or be greater than trigger2.
  */
  int compare(gtk.shortcut_trigger.ShortcutTrigger trigger2)
  {
    int _retval;
    _retval = gtk_shortcut_trigger_compare(cast(GtkShortcutTrigger*)this._cPtr, trigger2 ? cast(GtkShortcutTrigger*)trigger2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if trigger1 and trigger2 trigger under the same conditions.
      
      The types of one and two are `gconstpointer` only to allow use of this
      function with [glib.hash_table.HashTable]. They must each be a [gtk.shortcut_trigger.ShortcutTrigger].
  
      Params:
        trigger2 = a [gtk.shortcut_trigger.ShortcutTrigger]
      Returns: true if trigger1 and trigger2 are equal
  */
  bool equal(gtk.shortcut_trigger.ShortcutTrigger trigger2)
  {
    bool _retval;
    _retval = cast(bool)gtk_shortcut_trigger_equal(cast(GtkShortcutTrigger*)this._cPtr, trigger2 ? cast(GtkShortcutTrigger*)trigger2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Generates a hash value for a [gtk.shortcut_trigger.ShortcutTrigger].
      
      The output of this function is guaranteed to be the same for a given
      value only per-process. It may change between different processor
      architectures or even different versions of GTK. Do not use this
      function as a basis for building protocols or file formats.
      
      The types of trigger is `gconstpointer` only to allow use of this
      function with [glib.hash_table.HashTable]. They must each be a [gtk.shortcut_trigger.ShortcutTrigger].
      Returns: a hash value corresponding to trigger
  */
  uint hash()
  {
    uint _retval;
    _retval = gtk_shortcut_trigger_hash(cast(GtkShortcutTrigger*)this._cPtr);
    return _retval;
  }

  /**
      Prints the given trigger into a string for the developer.
      This is meant for debugging and logging.
      
      The form of the representation may change at any time
      and is not guaranteed to stay identical.
  
      Params:
        string_ = a [glib.string_.String] to print into
  */
  void print(glib.string_.String string_)
  {
    gtk_shortcut_trigger_print(cast(GtkShortcutTrigger*)this._cPtr, string_ ? cast(GString*)string_._cPtr(No.Dup) : null);
  }

  /**
      Prints the given trigger into a string.
      
      This function is returning a translated string for presentation
      to end users for example in menu items or in help texts.
      
      The display in use may influence the resulting string in
      various forms, such as resolving hardware keycodes or by
      causing display-specific modifier names.
      
      The form of the representation may change at any time and is
      not guaranteed to stay identical.
  
      Params:
        display = [gdk.display.Display] to print for
        string_ = a [glib.string_.String] to print into
      Returns: true if something was printed or false if the
          trigger did not have a textual representation suitable
          for end users.
  */
  bool printLabel(gdk.display.Display display, glib.string_.String string_)
  {
    bool _retval;
    _retval = cast(bool)gtk_shortcut_trigger_print_label(cast(GtkShortcutTrigger*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, string_ ? cast(GString*)string_._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets textual representation for the given trigger.
      
      This function is returning a translated string for
      presentation to end users for example in menu items
      or in help texts.
      
      The display in use may influence the resulting string in
      various forms, such as resolving hardware keycodes or by
      causing display-specific modifier names.
      
      The form of the representation may change at any time and is
      not guaranteed to stay identical.
  
      Params:
        display = [gdk.display.Display] to print for
      Returns: a new string
  */
  string toLabel(gdk.display.Display display)
  {
    char* _cretval;
    _cretval = gtk_shortcut_trigger_to_label(cast(GtkShortcutTrigger*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Prints the given trigger into a human-readable string.
      
      This is a small wrapper around [gtk.shortcut_trigger.ShortcutTrigger.print]
      to help when debugging.
      Returns: a new string
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gtk_shortcut_trigger_to_string(cast(GtkShortcutTrigger*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Checks if the given event triggers self.
  
      Params:
        event = the event to check
        enableMnemonics = true if mnemonics should trigger. Usually the
            value of this property is determined by checking that the passed
            in event is a Key event and has the right modifiers set.
      Returns: Whether the event triggered the shortcut
  */
  gdk.types.KeyMatch trigger(gdk.event.Event event, bool enableMnemonics)
  {
    GdkKeyMatch _cretval;
    _cretval = gtk_shortcut_trigger_trigger(cast(GtkShortcutTrigger*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, enableMnemonics);
    gdk.types.KeyMatch _retval = cast(gdk.types.KeyMatch)_cretval;
    return _retval;
  }
}
