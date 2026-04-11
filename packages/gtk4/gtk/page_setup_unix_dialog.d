/// Module for [PageSetupUnixDialog] class
module gtk.page_setup_unix_dialog;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.dialog;
import gtk.native;
import gtk.native_mixin;
import gtk.page_setup;
import gtk.print_settings;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.window;

/**
    [gtk.page_setup_unix_dialog.PageSetupUnixDialog] implements a page setup dialog for platforms
    which don’t provide a native page setup dialog, like Unix.
    
    ![An example GtkPageSetupUnixDialog](pagesetupdialog.png)
    
    It can be used very much like any other GTK dialog, at the
    cost of the portability offered by the high-level printing
    API in [gtk.print_operation.PrintOperation].
    
    ## CSS nodes
    
    [gtk.page_setup_unix_dialog.PageSetupUnixDialog] has a single CSS node with the name `window` and
    style class `.pagesetup`.
*/
class PageSetupUnixDialog : gtk.dialog.Dialog
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
    return cast(void function())gtk_page_setup_unix_dialog_get_type != &gidSymbolNotFound ? gtk_page_setup_unix_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PageSetupUnixDialog self()
  {
    return this;
  }

  /**
      Get builder for [gtk.page_setup_unix_dialog.PageSetupUnixDialog]
      Returns: New builder object
  */
  static PageSetupUnixDialogGidBuilder builder()
  {
    return new PageSetupUnixDialogGidBuilder;
  }

  /**
      Creates a new page setup dialog.
  
      Params:
        title = the title of the dialog
        parent = transient parent of the dialog
      Returns: the new [gtk.page_setup_unix_dialog.PageSetupUnixDialog]
  */
  this(string title = null, gtk.window.Window parent = null)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_page_setup_unix_dialog_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Gets the currently selected page setup from the dialog.
      Returns: the current page setup
  */
  gtk.page_setup.PageSetup getPageSetup()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_page_setup_unix_dialog_get_page_setup(cast(GtkPageSetupUnixDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current print settings from the dialog.
      Returns: the current print settings
  */
  gtk.print_settings.PrintSettings getPrintSettings()
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_page_setup_unix_dialog_get_print_settings(cast(GtkPageSetupUnixDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the [gtk.page_setup.PageSetup] from which the page setup
      dialog takes its values.
  
      Params:
        pageSetup = a [gtk.page_setup.PageSetup]
  */
  void setPageSetup(gtk.page_setup.PageSetup pageSetup)
  {
    gtk_page_setup_unix_dialog_set_page_setup(cast(GtkPageSetupUnixDialog*)this._cPtr, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.print_settings.PrintSettings] from which the page setup dialog
      takes its values.
  
      Params:
        printSettings = a [gtk.print_settings.PrintSettings]
  */
  void setPrintSettings(gtk.print_settings.PrintSettings printSettings = null)
  {
    gtk_page_setup_unix_dialog_set_print_settings(cast(GtkPageSetupUnixDialog*)this._cPtr, printSettings ? cast(GtkPrintSettings*)printSettings._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.page_setup_unix_dialog.PageSetupUnixDialog]
class PageSetupUnixDialogGidBuilderImpl(T) : gtk.dialog.DialogGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.page_setup_unix_dialog.PageSetupUnixDialog]
final class PageSetupUnixDialogGidBuilder : PageSetupUnixDialogGidBuilderImpl!PageSetupUnixDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PageSetupUnixDialog build()
  {
    return new PageSetupUnixDialog(cast(void*)createGObject(PageSetupUnixDialog._getGType), No.Take);
  }
}
