/// Module for [PrintUnixDialog] class
module gtk.print_unix_dialog;

public import gid.basictypes;
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
import gtk.printer;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.widget;
import gtk.window;

/**
    [gtk.print_unix_dialog.PrintUnixDialog] implements a print dialog for platforms
    which don’t provide a native print dialog, like Unix.
    
    ![An example GtkPrintUnixDialog](printdialog.png)
    
    It can be used very much like any other GTK dialog, at the cost of
    the portability offered by the high-level printing API with
    [gtk.print_operation.PrintOperation].
    
    In order to print something with [gtk.print_unix_dialog.PrintUnixDialog], you need to
    use [gtk.print_unix_dialog.PrintUnixDialog.getSelectedPrinter] to obtain a
    [gtk.printer.Printer] object and use it to construct a [gtk.print_job.PrintJob]
    using [gtk.print_job.PrintJob.new_].
    
    [gtk.print_unix_dialog.PrintUnixDialog] uses the following response values:
    
    - [gtk.types.ResponseType.Ok]: for the “Print” button
    - [gtk.types.ResponseType.Apply]: for the “Preview” button
    - [gtk.types.ResponseType.Cancel]: for the “Cancel” button
    
    # GtkPrintUnixDialog as GtkBuildable
    
    The [gtk.print_unix_dialog.PrintUnixDialog] implementation of the [gtk.buildable.Buildable] interface
    exposes its @notebook internal children with the name “notebook”.
    
    An example of a [gtk.print_unix_dialog.PrintUnixDialog] UI definition fragment:
    
    ```xml
    <object class="GtkPrintUnixDialog" id="dialog1">
      <child internal-child="notebook">
        <object class="GtkNotebook" id="notebook">
          <child>
            <object type="GtkNotebookPage">
              <property name="tab_expand">False</property>
              <property name="tab_fill">False</property>
              <property name="tab">
                <object class="GtkLabel" id="tablabel">
                  <property name="label">Tab label</property>
                </object>
              </property>
              <property name="child">
                <object class="GtkLabel" id="tabcontent">
                  <property name="label">Content on notebook tab</property>
                </object>
              </property>
            </object>
          </child>
        </object>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    [gtk.print_unix_dialog.PrintUnixDialog] has a single CSS node with name window. The style classes
    dialog and print are added.
*/
class PrintUnixDialog : gtk.dialog.Dialog
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_print_unix_dialog_get_type != &gidSymbolNotFound ? gtk_print_unix_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PrintUnixDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.print_unix_dialog.PrintUnixDialog]
      Returns: New builder object
  */
  static PrintUnixDialogGidBuilder builder() nothrow
  {
    return new PrintUnixDialogGidBuilder;
  }

  /**
      Get `currentPage` property.
      Returns: The current page in the document.
  */
  @property int currentPage() nothrow
  {
    return getCurrentPage();
  }

  /**
      Set `currentPage` property.
      Params:
        propval = The current page in the document.
  */
  @property void currentPage(int propval) nothrow
  {
    setCurrentPage(propval);
  }

  /**
      Get `embedPageSetup` property.
      Returns: true if the page setup controls are embedded.
  */
  @property bool embedPageSetup() nothrow
  {
    return getEmbedPageSetup();
  }

  /**
      Set `embedPageSetup` property.
      Params:
        propval = true if the page setup controls are embedded.
  */
  @property void embedPageSetup(bool propval) nothrow
  {
    setEmbedPageSetup(propval);
  }

  /**
      Get `hasSelection` property.
      Returns: Whether the application has a selection.
  */
  @property bool hasSelection() nothrow
  {
    return getHasSelection();
  }

  /**
      Set `hasSelection` property.
      Params:
        propval = Whether the application has a selection.
  */
  @property void hasSelection(bool propval) nothrow
  {
    setHasSelection(propval);
  }

  /**
      Get `manualCapabilities` property.
      Returns: Capabilities the application can handle.
  */
  @property gtk.types.PrintCapabilities manualCapabilities() nothrow
  {
    return getManualCapabilities();
  }

  /**
      Set `manualCapabilities` property.
      Params:
        propval = Capabilities the application can handle.
  */
  @property void manualCapabilities(gtk.types.PrintCapabilities propval) nothrow
  {
    setManualCapabilities(propval);
  }

  /**
      Get `pageSetup` property.
      Returns: The [gtk.page_setup.PageSetup] object to use.
  */
  @property gtk.page_setup.PageSetup pageSetup() nothrow
  {
    return getPageSetup();
  }

  /**
      Set `pageSetup` property.
      Params:
        propval = The [gtk.page_setup.PageSetup] object to use.
  */
  @property void pageSetup(gtk.page_setup.PageSetup propval) nothrow
  {
    setPageSetup(propval);
  }

  /**
      Get `printSettings` property.
      Returns: The [gtk.print_settings.PrintSettings] object used for this dialog.
  */
  @property gtk.print_settings.PrintSettings printSettings() nothrow
  {
    return getSettings();
  }

  /**
      Set `printSettings` property.
      Params:
        propval = The [gtk.print_settings.PrintSettings] object used for this dialog.
  */
  @property void printSettings(gtk.print_settings.PrintSettings propval) nothrow
  {
    setSettings(propval);
  }

  /**
      Get `selectedPrinter` property.
      Returns: The [gtk.printer.Printer] which is selected.
  */
  @property gtk.printer.Printer selectedPrinter() nothrow
  {
    return getSelectedPrinter();
  }

  /**
      Get `supportSelection` property.
      Returns: Whether the dialog supports selection.
  */
  @property bool supportSelection() nothrow
  {
    return getSupportSelection();
  }

  /**
      Set `supportSelection` property.
      Params:
        propval = Whether the dialog supports selection.
  */
  @property void supportSelection(bool propval) nothrow
  {
    setSupportSelection(propval);
  }

  /**
      Creates a new [gtk.print_unix_dialog.PrintUnixDialog].
  
      Params:
        title = Title of the dialog
        parent = Transient parent of the dialog
      Returns: a new [gtk.print_unix_dialog.PrintUnixDialog]
  */
  this(string title = null, gtk.window.Window parent = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_print_unix_dialog_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Adds a custom tab to the print dialog.
  
      Params:
        child = the widget to put in the custom tab
        tabLabel = the widget to use as tab label
  */
  void addCustomTab(gtk.widget.Widget child, gtk.widget.Widget tabLabel) nothrow
  {
    gtk_print_unix_dialog_add_custom_tab(cast(GtkPrintUnixDialog*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel._cPtr(No.Dup) : null);
  }

  /**
      Gets the current page of the [gtk.print_unix_dialog.PrintUnixDialog].
      Returns: the current page of dialog
  */
  int getCurrentPage() nothrow
  {
    int _retval;
    _retval = gtk_print_unix_dialog_get_current_page(cast(GtkPrintUnixDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether to embed the page setup.
      Returns: whether to embed the page setup
  */
  bool getEmbedPageSetup() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_print_unix_dialog_get_embed_page_setup(cast(GtkPrintUnixDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether there is a selection.
      Returns: whether there is a selection
  */
  bool getHasSelection() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_print_unix_dialog_get_has_selection(cast(GtkPrintUnixDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the capabilities that have been set on this [gtk.print_unix_dialog.PrintUnixDialog].
      Returns: the printing capabilities
  */
  gtk.types.PrintCapabilities getManualCapabilities() nothrow
  {
    GtkPrintCapabilities _cretval;
    _cretval = gtk_print_unix_dialog_get_manual_capabilities(cast(GtkPrintUnixDialog*)this._cPtr);
    gtk.types.PrintCapabilities _retval = cast(gtk.types.PrintCapabilities)_cretval;
    return _retval;
  }

  /**
      Gets the page setup that is used by the [gtk.print_unix_dialog.PrintUnixDialog].
      Returns: the page setup of dialog.
  */
  gtk.page_setup.PageSetup getPageSetup() nothrow
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_print_unix_dialog_get_page_setup(cast(GtkPrintUnixDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether a page setup was set by the user.
      Returns: whether a page setup was set by user.
  */
  bool getPageSetupSet() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_print_unix_dialog_get_page_setup_set(cast(GtkPrintUnixDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently selected printer.
      Returns: the currently selected printer
  */
  gtk.printer.Printer getSelectedPrinter() nothrow
  {
    GtkPrinter* _cretval;
    _cretval = gtk_print_unix_dialog_get_selected_printer(cast(GtkPrintUnixDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.printer.Printer)(cast(GtkPrinter*)_cretval, No.Take);
    return _retval;
  }

  alias getSettings = gtk.widget.Widget.getSettings;

  /**
      Gets a new [gtk.print_settings.PrintSettings] object that represents the
      current values in the print dialog.
      
      Note that this creates a new object, and you need to unref
      it if don’t want to keep it.
      Returns: a new [gtk.print_settings.PrintSettings] object with the values from dialog
  */
  gtk.print_settings.PrintSettings getSettings() nothrow
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_print_unix_dialog_get_settings(cast(GtkPrintUnixDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets whether the print dialog allows user to print a selection.
      Returns: whether the application supports print of selection
  */
  bool getSupportSelection() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_print_unix_dialog_get_support_selection(cast(GtkPrintUnixDialog*)this._cPtr);
    return _retval;
  }

  /**
      Sets the current page number.
      
      If current_page is not -1, this enables the current page choice
      for the range of pages to print.
  
      Params:
        currentPage = the current page number.
  */
  void setCurrentPage(int currentPage) nothrow
  {
    gtk_print_unix_dialog_set_current_page(cast(GtkPrintUnixDialog*)this._cPtr, currentPage);
  }

  /**
      Embed page size combo box and orientation combo box into page setup page.
  
      Params:
        embed = embed page setup selection
  */
  void setEmbedPageSetup(bool embed) nothrow
  {
    gtk_print_unix_dialog_set_embed_page_setup(cast(GtkPrintUnixDialog*)this._cPtr, embed);
  }

  /**
      Sets whether a selection exists.
  
      Params:
        hasSelection = true indicates that a selection exists
  */
  void setHasSelection(bool hasSelection) nothrow
  {
    gtk_print_unix_dialog_set_has_selection(cast(GtkPrintUnixDialog*)this._cPtr, hasSelection);
  }

  /**
      This lets you specify the printing capabilities your application
      supports.
      
      For instance, if you can handle scaling the output then you pass
      [gtk.types.PrintCapabilities.Scale]. If you don’t pass that, then the dialog
      will only let you select the scale if the printing system automatically
      handles scaling.
  
      Params:
        capabilities = the printing capabilities of your application
  */
  void setManualCapabilities(gtk.types.PrintCapabilities capabilities) nothrow
  {
    gtk_print_unix_dialog_set_manual_capabilities(cast(GtkPrintUnixDialog*)this._cPtr, capabilities);
  }

  /**
      Sets the page setup of the [gtk.print_unix_dialog.PrintUnixDialog].
  
      Params:
        pageSetup = a [gtk.page_setup.PageSetup]
  */
  void setPageSetup(gtk.page_setup.PageSetup pageSetup) nothrow
  {
    gtk_print_unix_dialog_set_page_setup(cast(GtkPrintUnixDialog*)this._cPtr, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.print_settings.PrintSettings] for the [gtk.print_unix_dialog.PrintUnixDialog].
      
      Typically, this is used to restore saved print settings
      from a previous print operation before the print dialog
      is shown.
  
      Params:
        settings = a [gtk.print_settings.PrintSettings]
  */
  void setSettings(gtk.print_settings.PrintSettings settings = null) nothrow
  {
    gtk_print_unix_dialog_set_settings(cast(GtkPrintUnixDialog*)this._cPtr, settings ? cast(GtkPrintSettings*)settings._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the print dialog allows user to print a selection.
  
      Params:
        supportSelection = true to allow print selection
  */
  void setSupportSelection(bool supportSelection) nothrow
  {
    gtk_print_unix_dialog_set_support_selection(cast(GtkPrintUnixDialog*)this._cPtr, supportSelection);
  }
}

/// Fluent builder implementation template for [gtk.print_unix_dialog.PrintUnixDialog]
class PrintUnixDialogGidBuilderImpl(T) : gtk.dialog.DialogGidBuilderImpl!T
{


  /**
      Set `currentPage` property.
      Params:
        propval = The current page in the document.
      Returns: Builder instance for fluent chaining
  */
  T currentPage(int propval) nothrow
  {
    return setProperty("current-page", propval);
  }

  /**
      Set `embedPageSetup` property.
      Params:
        propval = true if the page setup controls are embedded.
      Returns: Builder instance for fluent chaining
  */
  T embedPageSetup(bool propval) nothrow
  {
    return setProperty("embed-page-setup", propval);
  }

  /**
      Set `hasSelection` property.
      Params:
        propval = Whether the application has a selection.
      Returns: Builder instance for fluent chaining
  */
  T hasSelection(bool propval) nothrow
  {
    return setProperty("has-selection", propval);
  }

  /**
      Set `manualCapabilities` property.
      Params:
        propval = Capabilities the application can handle.
      Returns: Builder instance for fluent chaining
  */
  T manualCapabilities(gtk.types.PrintCapabilities propval) nothrow
  {
    return setProperty("manual-capabilities", propval);
  }

  /**
      Set `pageSetup` property.
      Params:
        propval = The [gtk.page_setup.PageSetup] object to use.
      Returns: Builder instance for fluent chaining
  */
  T pageSetup(gtk.page_setup.PageSetup propval) nothrow
  {
    return setProperty("page-setup", propval);
  }

  /**
      Set `printSettings` property.
      Params:
        propval = The [gtk.print_settings.PrintSettings] object used for this dialog.
      Returns: Builder instance for fluent chaining
  */
  T printSettings(gtk.print_settings.PrintSettings propval) nothrow
  {
    return setProperty("print-settings", propval);
  }

  /**
      Set `supportSelection` property.
      Params:
        propval = Whether the dialog supports selection.
      Returns: Builder instance for fluent chaining
  */
  T supportSelection(bool propval) nothrow
  {
    return setProperty("support-selection", propval);
  }
}

/// Fluent builder for [gtk.print_unix_dialog.PrintUnixDialog]
final class PrintUnixDialogGidBuilder : PrintUnixDialogGidBuilderImpl!PrintUnixDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PrintUnixDialog build() nothrow
  {
    return new PrintUnixDialog(cast(void*)createGObject(PrintUnixDialog._getGType), No.Take);
  }
}
