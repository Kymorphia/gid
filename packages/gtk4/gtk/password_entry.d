/// Module for [PasswordEntry] class
module gtk.password_entry;

import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.password_entry.PasswordEntry] is an entry that has been tailored for entering secrets.
    
    ![An example GtkPasswordEntry](password-entry.png)
    
    It does not show its contents in clear text, does not allow to copy it
    to the clipboard, and it shows a warning when Caps Lock is engaged. If
    the underlying platform allows it, [gtk.password_entry.PasswordEntry] will also place
    the text in a non-pageable memory area, to avoid it being written out
    to disk by the operating system.
    
    Optionally, it can offer a way to reveal the contents in clear text.
    
    [gtk.password_entry.PasswordEntry] provides only minimal API and should be used with
    the [gtk.editable.Editable] API.
    
    # CSS Nodes
    
    ```
    entry.password
    ╰── text
        ├── image.caps-lock-indicator
        ┊
    ```
    
    [gtk.password_entry.PasswordEntry] has a single CSS node with name entry that carries
    a .passwordstyle class. The text Css node below it has a child with
    name image and style class .caps-lock-indicator for the Caps Lock
    icon, and possibly other children.
    
    # Accessibility
    
    [gtk.password_entry.PasswordEntry] uses the [gtk.types.AccessibleRole.TextBox] role.
*/
class PasswordEntry : gtk.widget.Widget, gtk.editable.Editable
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
    return cast(void function())gtk_password_entry_get_type != &gidSymbolNotFound ? gtk_password_entry_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PasswordEntry self()
  {
    return this;
  }

  /**
      Get `activatesDefault` property.
      Returns: Whether to activate the default widget when Enter is pressed.
  */
  @property bool activatesDefault()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("activates-default");
  }

  /**
      Set `activatesDefault` property.
      Params:
        propval = Whether to activate the default widget when Enter is pressed.
  */
  @property void activatesDefault(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("activates-default", propval);
  }

  /**
      Get `extraMenu` property.
      Returns: A menu model whose contents will be appended to
      the context menu.
  */
  @property gio.menu_model.MenuModel extraMenu()
  {
    return getExtraMenu();
  }

  /**
      Set `extraMenu` property.
      Params:
        propval = A menu model whose contents will be appended to
        the context menu.
  */
  @property void extraMenu(gio.menu_model.MenuModel propval)
  {
    return setExtraMenu(propval);
  }

  /**
      Get `placeholderText` property.
      Returns: The text that will be displayed in the [gtk.password_entry.PasswordEntry]
      when it is empty and unfocused.
  */
  @property string placeholderText()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("placeholder-text");
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the [gtk.password_entry.PasswordEntry]
        when it is empty and unfocused.
  */
  @property void placeholderText(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("placeholder-text", propval);
  }

  /**
      Get `showPeekIcon` property.
      Returns: Whether to show an icon for revealing the content.
  */
  @property bool showPeekIcon()
  {
    return getShowPeekIcon();
  }

  /**
      Set `showPeekIcon` property.
      Params:
        propval = Whether to show an icon for revealing the content.
  */
  @property void showPeekIcon(bool propval)
  {
    return setShowPeekIcon(propval);
  }

  mixin EditableT!();

  /**
      Creates a [gtk.password_entry.PasswordEntry].
      Returns: a new [gtk.password_entry.PasswordEntry]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_password_entry_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the menu model set with [gtk.password_entry.PasswordEntry.setExtraMenu].
      Returns: the menu model
  */
  gio.menu_model.MenuModel getExtraMenu()
  {
    GMenuModel* _cretval;
    _cretval = gtk_password_entry_get_extra_menu(cast(GtkPasswordEntry*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the entry is showing an icon to
      reveal the contents.
      Returns: true if an icon is shown
  */
  bool getShowPeekIcon()
  {
    bool _retval;
    _retval = cast(bool)gtk_password_entry_get_show_peek_icon(cast(GtkPasswordEntry*)this._cPtr);
    return _retval;
  }

  /**
      Sets a menu model to add when constructing
      the context menu for entry.
  
      Params:
        model = a [gio.menu_model.MenuModel]
  */
  void setExtraMenu(gio.menu_model.MenuModel model = null)
  {
    gtk_password_entry_set_extra_menu(cast(GtkPasswordEntry*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the entry should have a clickable icon
      to reveal the contents.
      
      Setting this to false also hides the text again.
  
      Params:
        showPeekIcon = whether to show the peek icon
  */
  void setShowPeekIcon(bool showPeekIcon)
  {
    gtk_password_entry_set_show_peek_icon(cast(GtkPasswordEntry*)this._cPtr, showPeekIcon);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when the entry is activated.
      
      The keybindings for this signal are all forms of the Enter key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.password_entry.PasswordEntry passwordEntry))
  
          `passwordEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.password_entry.PasswordEntry)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
