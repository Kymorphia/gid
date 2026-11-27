/// Module for [AppChooserDialog] class
module gid.gtk3.app_chooser_dialog;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gio2.file;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.app_chooser;
import gid.gtk3.app_chooser_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.dialog;
import gid.gtk3.types;
import gid.gtk3.widget;
import gid.gtk3.window;

/**
    #GtkAppChooserDialog shows a #GtkAppChooserWidget inside a #GtkDialog.
    
    Note that #GtkAppChooserDialog does not have any interesting methods
    of its own. Instead, you should get the embedded #GtkAppChooserWidget
    using [gid.gtk4.app_chooser_dialog.AppChooserDialog.getWidget] and call its methods if
    the generic #GtkAppChooser interface is not sufficient for your needs.
    
    To set the heading that is shown above the #GtkAppChooserWidget,
    use [gid.gtk4.app_chooser_dialog.AppChooserDialog.setHeading].
*/
@gidGir("AppChooserDialog", "AppChooserDialogClass")
class AppChooserDialog : gid.gtk3.dialog.Dialog, gid.gtk3.app_chooser.AppChooser
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
    return cast(void function())gtk_app_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_app_chooser_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkAppChooserDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override AppChooserDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.app_chooser_dialog.AppChooserDialog]
      Returns: New builder object
  */
  static AppChooserDialogGidBuilder builder() nothrow
  {
    return new AppChooserDialogGidBuilder;
  }

  /**
      Get `gfile` property.
      Returns: The GFile used by the #GtkAppChooserDialog.
        The dialog's #GtkAppChooserWidget content type will be guessed from the
        file, if present.
  */
  @property gid.gio2.file.File gfile() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.file.File)("gfile");
  }

  /**
      Get `heading` property.
      Returns: The text to show at the top of the dialog.
        The string may contain Pango markup.
  */
  @property string heading() nothrow
  {
    return getHeading();
  }

  /**
      Set `heading` property.
      Params:
        propval = The text to show at the top of the dialog.
          The string may contain Pango markup.
  */
  @property void heading(string propval) nothrow
  {
    setHeading(propval);
  }

  mixin AppChooserT!();

  /**
      Creates a new #GtkAppChooserDialog for the provided #GFile,
      to allow the user to select an application for it.
  
      Params:
        parent = a #GtkWindow, or null
        flags = flags for this dialog
        file = a #GFile
      Returns: a newly created #GtkAppChooserDialog
  */
  this(gid.gtk3.window.Window parent, gid.gtk3.types.DialogFlags flags, gid.gio2.file.File file) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_app_chooser_dialog_new(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, flags, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkAppChooserDialog for the provided content type,
      to allow the user to select an application for it.
  
      Params:
        parent = a #GtkWindow, or null
        flags = flags for this dialog
        contentType = a content type string
      Returns: a newly created #GtkAppChooserDialog
  */
  static gid.gtk3.app_chooser_dialog.AppChooserDialog newForContentType(gid.gtk3.window.Window parent, gid.gtk3.types.DialogFlags flags, string contentType) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_app_chooser_dialog_new_for_content_type(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, flags, _contentType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.app_chooser_dialog.AppChooserDialog)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the text to display at the top of the dialog.
      Returns: the text to display at the top of the dialog, or null, in which
            case a default text is displayed
  */
  string getHeading() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_app_chooser_dialog_get_heading(cast(GtkAppChooserDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the #GtkAppChooserWidget of this dialog.
      Returns: the #GtkAppChooserWidget of self
  */
  gid.gtk3.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_app_chooser_dialog_get_widget(cast(GtkAppChooserDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the text to display at the top of the dialog.
      If the heading is not set, the dialog displays a default text.
  
      Params:
        heading = a string containing Pango markup
  */
  void setHeading(string heading) nothrow
  {
    const(char)* _heading = heading.toCString!(No.Malloc, No.Nullable);
    gtk_app_chooser_dialog_set_heading(cast(GtkAppChooserDialog*)this._cPtr, _heading);
  }
}

/// Fluent builder implementation template for [gid.gtk3.app_chooser_dialog.AppChooserDialog]
class AppChooserDialogGidBuilderImpl(T) : gid.gtk3.dialog.DialogGidBuilderImpl!T, gid.gtk3.app_chooser.AppChooserGidBuilderImpl!T
{

  mixin AppChooserGidBuilderT!();

  /**
      Set `gfile` property.
      Params:
        propval = The GFile used by the #GtkAppChooserDialog.
          The dialog's #GtkAppChooserWidget content type will be guessed from the
          file, if present.
      Returns: Builder instance for fluent chaining
  */
  T gfile(gid.gio2.file.File propval) nothrow
  {
    return setProperty("gfile", propval);
  }

  /**
      Set `heading` property.
      Params:
        propval = The text to show at the top of the dialog.
          The string may contain Pango markup.
      Returns: Builder instance for fluent chaining
  */
  T heading(string propval) nothrow
  {
    return setProperty("heading", propval);
  }
}

/// Fluent builder for [gid.gtk3.app_chooser_dialog.AppChooserDialog]
final class AppChooserDialogGidBuilder : AppChooserDialogGidBuilderImpl!AppChooserDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AppChooserDialog build() nothrow
  {
    return new AppChooserDialog(cast(void*)createGObject(AppChooserDialog._getGType), Yes.Take);
  }
}
