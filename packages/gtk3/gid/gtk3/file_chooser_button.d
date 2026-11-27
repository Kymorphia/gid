/// Module for [FileChooserButton] class
module gid.gtk3.file_chooser_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.box;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.dialog;
import gid.gtk3.file_chooser;
import gid.gtk3.file_chooser_mixin;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;

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
    [gid.gtk4.types.FileChooserAction.Open] and [gid.gtk4.types.FileChooserAction.SelectFolder].
    
    > The #GtkFileChooserButton will ellipsize the label, and will thus
    > request little horizontal space.  To give the button more space,
    > you should call [gid.gtk4.widget.Widget.getPreferredSize],
    > [gid.gtk3.file_chooser_button.FileChooserButton.setWidthChars], or pack the button in
    > such a way that other interface elements give space to the
    > widget.
    
    # CSS nodes
    
    GtkFileChooserButton has a CSS node with name “filechooserbutton”, containing
    a subnode for the internal button with name “button” and style class “.file”.
*/
@gidGir("FileChooserButton", "FileChooserButtonClass")
class FileChooserButton : gid.gtk3.box.Box, gid.gtk3.file_chooser.FileChooser
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
    return cast(void function())gtk_file_chooser_button_get_type != &gidSymbolNotFound ? gtk_file_chooser_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFileChooserButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileChooserButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.file_chooser_button.FileChooserButton]
      Returns: New builder object
  */
  static FileChooserButtonGidBuilder builder() nothrow
  {
    return new FileChooserButtonGidBuilder;
  }

  /**
      Get `title` property.
      Returns: Title to put on the #GtkFileChooserDialog associated with the button.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = Title to put on the #GtkFileChooserDialog associated with the button.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Get `widthChars` property.
      Returns: The width of the entry and label inside the button, in characters.
  */
  @property int widthChars() nothrow
  {
    return getWidthChars();
  }

  /**
      Set `widthChars` property.
      Params:
        propval = The width of the entry and label inside the button, in characters.
  */
  @property void widthChars(int propval) nothrow
  {
    setWidthChars(propval);
  }

  mixin FileChooserT!();

  /**
      Creates a new file-selecting button widget.
  
      Params:
        title = the title of the browse dialog.
        action = the open mode for the widget.
      Returns: a new button widget.
  */
  this(string title, gid.gtk3.types.FileChooserAction action) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
      _cretval = gtk_file_chooser_button_new(_title, action);
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a #GtkFileChooserButton widget which uses dialog as its
      file-picking window.
      
      Note that dialog must be a #GtkDialog (or subclass) which
      implements the #GtkFileChooser interface and must not have
      [gid.gtk4.types.DialogFlags.DestroyWithParent] set.
      
      Also note that the dialog needs to have its confirmative button
      added with response [gid.gtk4.types.ResponseType.Accept] or [gid.gtk4.types.ResponseType.Ok] in
      order for the button to take over the file selected in the dialog.
  
      Params:
        dialog = the widget to use as dialog
      Returns: a new button widget.
  */
  static gid.gtk3.file_chooser_button.FileChooserButton newWithDialog(gid.gtk3.dialog.Dialog dialog) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_file_chooser_button_new_with_dialog(dialog ? cast(GtkWidget*)dialog._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.file_chooser_button.FileChooserButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Signal emitted when the user selects a file.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFileSet` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncFileSet()
  {
    auto _klass = cast(GtkFileChooserButtonClass*)_vfuncClass;
    if (!_klass.fileSet)
      return;

    _klass.fileSet(cast(GtkFileChooserButton*)this._cPtr);
  }

  /**
      Returns whether the button grabs focus when it is clicked with the mouse.
      See [gid.gtk3.file_chooser_button.FileChooserButton.setFocusOnClick].
      Returns: true if the button grabs focus when it is clicked with
                      the mouse.
  
      Deprecated: Use [gid.gtk4.widget.Widget.getFocusOnClick] instead
  */
  override bool getFocusOnClick() nothrow
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
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_file_chooser_button_get_title(cast(GtkFileChooserButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the width in characters of the button widget’s entry and/or label.
      Returns: an integer width (in characters) that the button will use to size itself.
  */
  int getWidthChars() nothrow
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
  
      Deprecated: Use [gid.gtk4.widget.Widget.setFocusOnClick] instead
  */
  override void setFocusOnClick(bool focusOnClick) nothrow
  {
    gtk_file_chooser_button_set_focus_on_click(cast(GtkFileChooserButton*)this._cPtr, focusOnClick);
  }

  /**
      Modifies the title of the browse dialog used by button.
  
      Params:
        title = the new browse dialog title.
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    gtk_file_chooser_button_set_title(cast(GtkFileChooserButton*)this._cPtr, _title);
  }

  /**
      Sets the width (in characters) that button will use to n_chars.
  
      Params:
        nChars = the new width, in characters.
  */
  void setWidthChars(int nChars) nothrow
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
  
          `void callback(gid.gtk3.file_chooser_button.FileChooserButton fileChooserButton)`
  
          `fileChooserButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFileSet(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.file_chooser_button.FileChooserButton)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.file_chooser_button.FileChooserButton.fileSet");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("file-set", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from FileChooserButton
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.file_chooser_button.FileChooserButton), T.stringof ~ " is not derived from gid.gtk3.file_chooser_button.FileChooserButton");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFileSet", true)[0]) == gid.gtk3.file_chooser_button.FileChooserButton))
      _installVfunc(klass, "file_set");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkFileChooserButtonClass*)klass;

    switch (vfunc)
    {
      case "file_set":
      {
        static extern(C) void _vfuncFileSetTramp(GtkFileChooserButton* fc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.file_chooser_button.FileChooserButton)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fc);
          if (!_obj)
          {
            auto _klass = cast(GtkFileChooserButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fc);
            if (_klass.fileSet)
              return (cast(typeof(&_vfuncFileSetTramp))_klass.fileSet)(fc);
            return;
          }

          try
          {
            _obj.vfuncFileSet();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.file_chooser_button.FileChooserButton.vfuncFileSet");
          }
        }

        _klass.fileSet = cast(typeof(_klass.fileSet))&_vfuncFileSetTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.file_chooser_button.FileChooserButton]
class FileChooserButtonGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T, gid.gtk3.file_chooser.FileChooserGidBuilderImpl!T
{

  mixin FileChooserGidBuilderT!();

  /**
      Set `dialog` property.
      Params:
        propval = Instance of the #GtkFileChooserDialog associated with the button.
      Returns: Builder instance for fluent chaining
  */
  T dialog(gid.gtk3.file_chooser.FileChooser propval) nothrow
  {
    return setProperty("dialog", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = Title to put on the #GtkFileChooserDialog associated with the button.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `widthChars` property.
      Params:
        propval = The width of the entry and label inside the button, in characters.
      Returns: Builder instance for fluent chaining
  */
  T widthChars(int propval) nothrow
  {
    return setProperty("width-chars", propval);
  }
}

/// Fluent builder for [gid.gtk3.file_chooser_button.FileChooserButton]
final class FileChooserButtonGidBuilder : FileChooserButtonGidBuilderImpl!FileChooserButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileChooserButton build() nothrow
  {
    return new FileChooserButton(cast(void*)createGObject(FileChooserButton._getGType), Yes.Take);
  }
}
