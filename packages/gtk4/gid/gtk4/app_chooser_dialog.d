/// Module for [AppChooserDialog] class
module gid.gtk4.app_chooser_dialog;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.file;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.app_chooser;
import gid.gtk4.app_chooser_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.dialog;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;
import gid.gtk4.window;

/**
    [gid.gtk4.app_chooser_dialog.AppChooserDialog] shows a [gid.gtk4.app_chooser_widget.AppChooserWidget] inside a [gid.gtk4.dialog.Dialog].
    
    <picture>
      <source srcset="appchooserdialog-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkAppChooserDialog" src="appchooserdialog.png">
    </picture>
    
    Note that [gid.gtk4.app_chooser_dialog.AppChooserDialog] does not have any interesting methods
    of its own. Instead, you should get the embedded [gid.gtk4.app_chooser_widget.AppChooserWidget]
    using [gid.gtk4.app_chooser_dialog.AppChooserDialog.getWidget] and call its methods if
    the generic [gid.gtk4.app_chooser.AppChooser] interface is not sufficient for
    your needs.
    
    To set the heading that is shown above the [gid.gtk4.app_chooser_widget.AppChooserWidget],
    use [gid.gtk4.app_chooser_dialog.AppChooserDialog.setHeading].
    
    ## CSS nodes
    
    [gid.gtk4.app_chooser_dialog.AppChooserDialog] has a single CSS node with the name `window` and style
    class `.appchooser`.

    Deprecated: The application selection widgets should be
        implemented according to the design of each platform and/or
        application requiring them.
*/
class AppChooserDialog : gid.gtk4.dialog.Dialog, gid.gtk4.app_chooser.AppChooser
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
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
      Get builder for [gid.gtk4.app_chooser_dialog.AppChooserDialog]
      Returns: New builder object
  */
  static AppChooserDialogGidBuilder builder() nothrow
  {
    return new AppChooserDialogGidBuilder;
  }

  /**
      Get `gfile` property.
      Returns: The GFile used by the [gid.gtk4.app_chooser_dialog.AppChooserDialog].
        
        The dialog's [gid.gtk4.app_chooser_widget.AppChooserWidget] content type will
        be guessed from the file, if present.
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
      Creates a new [gid.gtk4.app_chooser_dialog.AppChooserDialog] for the provided [gid.gio2.file.File].
      
      The dialog will show applications that can open the file.
  
      Params:
        parent = a [gid.gtk4.window.Window]
        flags = flags for this dialog
        file = a [gid.gio2.file.File]
      Returns: a newly created [gid.gtk4.app_chooser_dialog.AppChooserDialog]
  
      Deprecated: This widget will be removed in GTK 5
  */
  this(gid.gtk4.window.Window parent, gid.gtk4.types.DialogFlags flags, gid.gio2.file.File file) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
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
      Creates a new [gid.gtk4.app_chooser_dialog.AppChooserDialog] for the provided content type.
      
      The dialog will show applications that can open the content type.
  
      Params:
        parent = a [gid.gtk4.window.Window]
        flags = flags for this dialog
        contentType = a content type string
      Returns: a newly created [gid.gtk4.app_chooser_dialog.AppChooserDialog]
  
      Deprecated: This widget will be removed in GTK 5
  */
  static gid.gtk4.app_chooser_dialog.AppChooserDialog newForContentType(gid.gtk4.window.Window parent, gid.gtk4.types.DialogFlags flags, string contentType) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_app_chooser_dialog_new_for_content_type(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, flags, _contentType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.app_chooser_dialog.AppChooserDialog)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the text to display at the top of the dialog.
      Returns: the text to display at the top of the dialog,
          or null, in which case a default text is displayed
  
      Deprecated: This widget will be removed in GTK 5
  */
  string getHeading() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_app_chooser_dialog_get_heading(cast(GtkAppChooserDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the [gid.gtk4.app_chooser_widget.AppChooserWidget] of this dialog.
      Returns: the [gid.gtk4.app_chooser_widget.AppChooserWidget] of self
  
      Deprecated: This widget will be removed in GTK 5
  */
  gid.gtk4.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_app_chooser_dialog_get_widget(cast(GtkAppChooserDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the text to display at the top of the dialog.
      
      If the heading is not set, the dialog displays a default text.
  
      Params:
        heading = a string containing Pango markup
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setHeading(string heading) nothrow
  {
    const(char)* _heading = heading.toCString!(No.Malloc, No.Nullable);
    gtk_app_chooser_dialog_set_heading(cast(GtkAppChooserDialog*)this._cPtr, _heading);
  }
}

/// Fluent builder implementation template for [gid.gtk4.app_chooser_dialog.AppChooserDialog]
class AppChooserDialogGidBuilderImpl(T) : gid.gtk4.dialog.DialogGidBuilderImpl!T, gid.gtk4.app_chooser.AppChooserGidBuilderImpl!T
{

  mixin AppChooserGidBuilderT!();

  /**
      Set `gfile` property.
      Params:
        propval = The GFile used by the [gid.gtk4.app_chooser_dialog.AppChooserDialog].
          
          The dialog's [gid.gtk4.app_chooser_widget.AppChooserWidget] content type will
          be guessed from the file, if present.
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

/// Fluent builder for [gid.gtk4.app_chooser_dialog.AppChooserDialog]
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
