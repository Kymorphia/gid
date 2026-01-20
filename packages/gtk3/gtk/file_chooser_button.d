/// Module for [FileChooserButton] class
module gtk.file_chooser_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.dialog;
import gtk.file_chooser;
import gtk.file_chooser_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    The #GtkFileChooserButton is a widget that lets the user select a
    file.  It implements the #GtkFileChooser interface.  Visually, it is a
    file name with a button to bring up a #GtkFileChooserDialog.
    The user can then use that dialog to change the file associated with
    that button.  This widget does not support setting the
    #GtkFileChooser:select-multiple property to true.
    
    ## Create a button to let the user select a file in /etc
    
    ```c
    {
      GtkWidget *button;
    
      button = gtk_file_chooser_button_new (_("Select a file"),
                                            GTK_FILE_CHOOSER_ACTION_OPEN);
      gtk_file_chooser_set_current_folder (GTK_FILE_CHOOSER (button),
                                           "/etc");
    }
    ```
    
    The #GtkFileChooserButton supports the #GtkFileChooserActions
    [gtk.types.FileChooserAction.Open] and [gtk.types.FileChooserAction.SelectFolder].
    
    > The #GtkFileChooserButton will ellipsize the label, and will thus
    > request little horizontal space.  To give the button more space,
    > you should call [gtk.widget.Widget.getPreferredSize],
    > [gtk.file_chooser_button.FileChooserButton.setWidthChars], or pack the button in
    > such a way that other interface elements give space to the
    > widget.
    
    # CSS nodes
    
    GtkFileChooserButton has a CSS node with name “filechooserbutton”, containing
    a subnode for the internal button with name “button” and style class “.file”.
*/
class FileChooserButton : gtk.box.Box, gtk.file_chooser.FileChooser
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
    return cast(void function())gtk_file_chooser_button_get_type != &gidSymbolNotFound ? gtk_file_chooser_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileChooserButton self()
  {
    return this;
  }

  /**
      Get `title` property.
      Returns: Title to put on the #GtkFileChooserDialog associated with the button.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = Title to put on the #GtkFileChooserDialog associated with the button.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Get `widthChars` property.
      Returns: The width of the entry and label inside the button, in characters.
  */
  @property int widthChars()
  {
    return getWidthChars();
  }

  /**
      Set `widthChars` property.
      Params:
        propval = The width of the entry and label inside the button, in characters.
  */
  @property void widthChars(int propval)
  {
    return setWidthChars(propval);
  }

  mixin FileChooserT!();

  /**
      Creates a new file-selecting button widget.
  
      Params:
        title = the title of the browse dialog.
        action = the open mode for the widget.
      Returns: a new button widget.
  */
  this(string title, gtk.types.FileChooserAction action)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_file_chooser_button_new(_title, action);
    this(_cretval, No.Take);
  }

  /**
      Creates a #GtkFileChooserButton widget which uses dialog as its
      file-picking window.
      
      Note that dialog must be a #GtkDialog (or subclass) which
      implements the #GtkFileChooser interface and must not have
      [gtk.types.DialogFlags.DestroyWithParent] set.
      
      Also note that the dialog needs to have its confirmative button
      added with response [gtk.types.ResponseType.Accept] or [gtk.types.ResponseType.Ok] in
      order for the button to take over the file selected in the dialog.
  
      Params:
        dialog = the widget to use as dialog
      Returns: a new button widget.
  */
  static gtk.file_chooser_button.FileChooserButton newWithDialog(gtk.dialog.Dialog dialog)
  {
    GtkWidget* _cretval;
    _cretval = gtk_file_chooser_button_new_with_dialog(dialog ? cast(GtkWidget*)dialog._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.file_chooser_button.FileChooserButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the button grabs focus when it is clicked with the mouse.
      See [gtk.file_chooser_button.FileChooserButton.setFocusOnClick].
      Returns: true if the button grabs focus when it is clicked with
                      the mouse.
  
      Deprecated: Use [gtk.widget.Widget.getFocusOnClick] instead
  */
  override bool getFocusOnClick()
  {
    bool _retval;
    _retval = cast(bool)gtk_file_chooser_button_get_focus_on_click(cast(GtkFileChooserButton*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the title of the browse dialog used by button. The returned value
      should not be modified or freed.
      Returns: a pointer to the browse dialog’s title.
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_file_chooser_button_get_title(cast(GtkFileChooserButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the width in characters of the button widget’s entry and/or label.
      Returns: an integer width (in characters) that the button will use to size itself.
  */
  int getWidthChars()
  {
    int _retval;
    _retval = gtk_file_chooser_button_get_width_chars(cast(GtkFileChooserButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether the button will grab focus when it is clicked with the mouse.
      Making mouse clicks not grab focus is useful in places like toolbars where
      you don’t want the keyboard focus removed from the main area of the
      application.
  
      Params:
        focusOnClick = whether the button grabs focus when clicked with the mouse
  
      Deprecated: Use [gtk.widget.Widget.setFocusOnClick] instead
  */
  override void setFocusOnClick(bool focusOnClick)
  {
    gtk_file_chooser_button_set_focus_on_click(cast(GtkFileChooserButton*)this._cPtr, focusOnClick);
  }

  /**
      Modifies the title of the browse dialog used by button.
  
      Params:
        title = the new browse dialog title.
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_file_chooser_button_set_title(cast(GtkFileChooserButton*)this._cPtr, _title);
  }

  /**
      Sets the width (in characters) that button will use to n_chars.
  
      Params:
        nChars = the new width, in characters.
  */
  void setWidthChars(int nChars)
  {
    gtk_file_chooser_button_set_width_chars(cast(GtkFileChooserButton*)this._cPtr, nChars);
  }

  /**
      Connect to `FileSet` signal.
  
      The ::file-set signal is emitted when the user selects a file.
        
        Note that this signal is only emitted when the user
        changes the file.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser_button.FileChooserButton fileChooserButton))
  
          `fileChooserButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFileSet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser_button.FileChooserButton)))
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
    return connectSignalClosure("file-set", closure, after);
  }
}
