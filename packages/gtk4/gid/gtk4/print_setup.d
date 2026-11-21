/// Module for [PrintSetup] class
module gid.gtk4.print_setup;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.page_setup;
import gid.gtk4.print_settings;
import gid.gtk4.types;

/**
    An auxiliary object for printing that allows decoupling the setup from the printing.
    
    A print setup is obtained by calling [gid.gtk4.print_dialog.PrintDialog.setup],
    and can later be passed to print functions such as [gid.gtk4.print_dialog.PrintDialog.print].
    
    Print setups can be reused for multiple print calls.
    
    Applications may wish to store the page_setup and print_settings from the print setup
    and copy them to the PrintDialog if they want to keep using them.
*/
class PrintSetup : gid.gobject2.boxed.BoxedWrap!(gtk_print_setup_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override PrintSetup self() nothrow
  {
    return this;
  }

  /**
      Returns the page setup of setup.
      
      It may be different from the [gid.gtk4.print_dialog.PrintDialog]'s page setup
      if the user changed it during the setup process.
      Returns: the page setup, or `NULL`
  */
  gid.gtk4.page_setup.PageSetup getPageSetup() nothrow
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_print_setup_get_page_setup(cast(GtkPrintSetup*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the print settings of setup.
      
      They may be different from the [gid.gtk4.print_dialog.PrintDialog]'s settings
      if the user changed them during the setup process.
      Returns: the print settings, or `NULL`
  */
  gid.gtk4.print_settings.PrintSettings getPrintSettings() nothrow
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_print_setup_get_print_settings(cast(GtkPrintSetup*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, No.Take);
    return _retval;
  }
}
