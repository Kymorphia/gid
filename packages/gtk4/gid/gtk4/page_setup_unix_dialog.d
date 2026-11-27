/// Module for [PageSetupUnixDialog] class
module gid.gtk4.page_setup_unix_dialog;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.dialog;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.page_setup;
import gid.gtk4.print_settings;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.types;
import gid.gtk4.window;

/**
    Presents a page setup dialog for platforms which don’t provide
    a native page setup dialog, like Unix.
    
    <picture>
      <source srcset="pagesetupdialog-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkPageSetupUnixDialog" src="pagesetupdialog.png">
    </picture>
    
    It can be used very much like any other GTK dialog, at the
    cost of the portability offered by the high-level printing
    API in [gid.gtk4.print_operation.PrintOperation].
    
    ## CSS nodes
    
    [gid.gtk4.page_setup_unix_dialog.PageSetupUnixDialog] has a single CSS node with the name `window` and
    style class `.pagesetup`.
*/
@gidGir("PageSetupUnixDialog")
class PageSetupUnixDialog : gid.gtk4.dialog.Dialog
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
    return cast(void function())gtk_page_setup_unix_dialog_get_type != &gidSymbolNotFound ? gtk_page_setup_unix_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPageSetupUnixDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override PageSetupUnixDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.page_setup_unix_dialog.PageSetupUnixDialog]
      Returns: New builder object
  */
  static PageSetupUnixDialogGidBuilder builder() nothrow
  {
    return new PageSetupUnixDialogGidBuilder;
  }

  /**
      Creates a new page setup dialog.
  
      Params:
        title = the title of the dialog
        parent = transient parent of the dialog
      Returns: the new [gid.gtk4.page_setup_unix_dialog.PageSetupUnixDialog]
  */
  this(string title = null, gid.gtk4.window.Window parent = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, title !is null || parent !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gtk_page_setup_unix_dialog_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the currently selected page setup from the dialog.
      Returns: the current page setup
  */
  gid.gtk4.page_setup.PageSetup getPageSetup() nothrow
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_page_setup_unix_dialog_get_page_setup(cast(GtkPageSetupUnixDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current print settings from the dialog.
      Returns: the current print settings
  */
  gid.gtk4.print_settings.PrintSettings getPrintSettings() nothrow
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_page_setup_unix_dialog_get_print_settings(cast(GtkPageSetupUnixDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the [gid.gtk4.page_setup.PageSetup] from which the page setup
      dialog takes its values.
  
      Params:
        pageSetup = a [gid.gtk4.page_setup.PageSetup]
  */
  void setPageSetup(gid.gtk4.page_setup.PageSetup pageSetup) nothrow
  {
    gtk_page_setup_unix_dialog_set_page_setup(cast(GtkPageSetupUnixDialog*)this._cPtr, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.gtk4.print_settings.PrintSettings] from which the page setup dialog
      takes its values.
  
      Params:
        printSettings = a [gid.gtk4.print_settings.PrintSettings]
  */
  void setPrintSettings(gid.gtk4.print_settings.PrintSettings printSettings = null) nothrow
  {
    gtk_page_setup_unix_dialog_set_print_settings(cast(GtkPageSetupUnixDialog*)this._cPtr, printSettings ? cast(GtkPrintSettings*)printSettings._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.page_setup_unix_dialog.PageSetupUnixDialog]
class PageSetupUnixDialogGidBuilderImpl(T) : gid.gtk4.dialog.DialogGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk4.page_setup_unix_dialog.PageSetupUnixDialog]
final class PageSetupUnixDialogGidBuilder : PageSetupUnixDialogGidBuilderImpl!PageSetupUnixDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PageSetupUnixDialog build() nothrow
  {
    return new PageSetupUnixDialog(cast(void*)createGObject(PageSetupUnixDialog._getGType), Yes.Take);
  }
}
