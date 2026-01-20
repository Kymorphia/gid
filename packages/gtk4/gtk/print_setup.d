/// Module for [PrintSetup] class
module gtk.print_setup;

import gid.gid;
import gobject.boxed;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.page_setup;
import gtk.print_settings;
import gtk.types;

/**
    A [gtk.print_setup.PrintSetup] is an auxiliary object for printing that allows decoupling
    the setup from the printing.
    
    A print setup is obtained by calling [gtk.print_dialog.PrintDialog.setup],
    and can later be passed to print functions such as [gtk.print_dialog.PrintDialog.print].
    
    Print setups can be reused for multiple print calls.
    
    Applications may wish to store the page_setup and print_settings from the print setup
    and copy them to the PrintDialog if they want to keep using them.
*/
class PrintSetup : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_print_setup_get_type != &gidSymbolNotFound ? gtk_print_setup_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PrintSetup self()
  {
    return this;
  }

  /**
      Returns the page setup of setup.
      
      It may be different from the [gtk.print_dialog.PrintDialog]'s page setup
      if the user changed it during the setup process.
      Returns: the page setup, or `NULL`
  */
  gtk.page_setup.PageSetup getPageSetup()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_print_setup_get_page_setup(cast(GtkPrintSetup*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the print settings of setup.
      
      They may be different from the [gtk.print_dialog.PrintDialog]'s settings
      if the user changed them during the setup process.
      Returns: the print settings, or `NULL`
  */
  gtk.print_settings.PrintSettings getPrintSettings()
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_print_setup_get_print_settings(cast(GtkPrintSetup*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, No.Take);
    return _retval;
  }
}
