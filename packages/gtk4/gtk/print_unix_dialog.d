/// Module for [PrintUnixDialog] class
module gtk.print_unix_dialog;

import gid.gid;
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
    
    $(LIST
      * [gtk.types.ResponseType.Ok]: for the “Print” button
      * [gtk.types.ResponseType.Apply]: for the “Preview” button
      * [gtk.types.ResponseType.Cancel]: for the “Cancel” button
    )
      
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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_print_unix_dialog_get_type != &gidSymbolNotFound ? gtk_print_unix_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PrintUnixDialog self()
  {
    return this;
  }

  /**
      Get `currentPage` property.
      Returns: The current page in the document.
  */
  @property int currentPage()
  {
    return getCurrentPage();
  }

  /**
      Set `currentPage` property.
      Params:
        propval = The current page in the document.
  */
  @property void currentPage(int propval)
  {
    return setCurrentPage(propval);
  }

  /**
      Get `embedPageSetup` property.
      Returns: true if the page setup controls are embedded.
  */
  @property bool embedPageSetup()
  {
    return getEmbedPageSetup();
  }

  /**
      Set `embedPageSetup` property.
      Params:
        propval = true if the page setup controls are embedded.
  */
  @property void embedPageSetup(bool propval)
  {
    return setEmbedPageSetup(propval);
  }

  /**
      Get `hasSelection` property.
      Returns: Whether the application has a selection.
  */
  @property bool hasSelection()
  {
    return getHasSelection();
  }

  /**
      Set `hasSelection` property.
      Params:
        propval = Whether the application has a selection.
  */
  @property void hasSelection(bool propval)
  {
    return setHasSelection(propval);
  }

  /**
      Get `manualCapabilities` property.
      Returns: Capabilities the application can handle.
  */
  @property gtk.types.PrintCapabilities manualCapabilities()
  {
    return getManualCapabilities();
  }

  /**
      Set `manualCapabilities` property.
      Params:
        propval = Capabilities the application can handle.
  */
  @property void manualCapabilities(gtk.types.PrintCapabilities propval)
  {
    return setManualCapabilities(propval);
  }

  /**
      Get `pageSetup` property.
      Returns: The [gtk.page_setup.PageSetup] object to use.
  */
  @property gtk.page_setup.PageSetup pageSetup()
  {
    return getPageSetup();
  }

  /**
      Set `pageSetup` property.
      Params:
        propval = The [gtk.page_setup.PageSetup] object to use.
  */
  @property void pageSetup(gtk.page_setup.PageSetup propval)
  {
    return setPageSetup(propval);
  }

  /**
      Get `printSettings` property.
      Returns: The [gtk.print_settings.PrintSettings] object used for this dialog.
  */
  @property gtk.print_settings.PrintSettings printSettings()
  {
    return getSettings();
  }

  /**
      Set `printSettings` property.
      Params:
        propval = The [gtk.print_settings.PrintSettings] object used for this dialog.
  */
  @property void printSettings(gtk.print_settings.PrintSettings propval)
  {
    return setSettings(propval);
  }

  /**
      Get `selectedPrinter` property.
      Returns: The [gtk.printer.Printer] which is selected.
  */
  @property gtk.printer.Printer selectedPrinter()
  {
    return getSelectedPrinter();
  }

  /**
      Get `supportSelection` property.
      Returns: Whether the dialog supports selection.
  */
  @property bool supportSelection()
  {
    return getSupportSelection();
  }

  /**
      Set `supportSelection` property.
      Params:
        propval = Whether the dialog supports selection.
  */
  @property void supportSelection(bool propval)
  {
    return setSupportSelection(propval);
  }

  /**
      Creates a new [gtk.print_unix_dialog.PrintUnixDialog].
  
      Params:
        title = Title of the dialog
        parent = Transient parent of the dialog
      Returns: a new [gtk.print_unix_dialog.PrintUnixDialog]
  */
  this(string title = null, gtk.window.Window parent = null)
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
  void addCustomTab(gtk.widget.Widget child, gtk.widget.Widget tabLabel)
  {
    gtk_print_unix_dialog_add_custom_tab(cast(GtkPrintUnixDialog*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel._cPtr(No.Dup) : null);
  }

  /**
      Gets the current page of the [gtk.print_unix_dialog.PrintUnixDialog].
      Returns: the current page of dialog
  */
  int getCurrentPage()
  {
    int _retval;
    _retval = gtk_print_unix_dialog_get_current_page(cast(GtkPrintUnixDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether to embed the page setup.
      Returns: whether to embed the page setup
  */
  bool getEmbedPageSetup()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_unix_dialog_get_embed_page_setup(cast(GtkPrintUnixDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether there is a selection.
      Returns: whether there is a selection
  */
  bool getHasSelection()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_unix_dialog_get_has_selection(cast(GtkPrintUnixDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the capabilities that have been set on this [gtk.print_unix_dialog.PrintUnixDialog].
      Returns: the printing capabilities
  */
  gtk.types.PrintCapabilities getManualCapabilities()
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
  gtk.page_setup.PageSetup getPageSetup()
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
  bool getPageSetupSet()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_unix_dialog_get_page_setup_set(cast(GtkPrintUnixDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently selected printer.
      Returns: the currently selected printer
  */
  gtk.printer.Printer getSelectedPrinter()
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
  gtk.print_settings.PrintSettings getSettings()
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
  bool getSupportSelection()
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
  void setCurrentPage(int currentPage)
  {
    gtk_print_unix_dialog_set_current_page(cast(GtkPrintUnixDialog*)this._cPtr, currentPage);
  }

  /**
      Embed page size combo box and orientation combo box into page setup page.
  
      Params:
        embed = embed page setup selection
  */
  void setEmbedPageSetup(bool embed)
  {
    gtk_print_unix_dialog_set_embed_page_setup(cast(GtkPrintUnixDialog*)this._cPtr, embed);
  }

  /**
      Sets whether a selection exists.
  
      Params:
        hasSelection = true indicates that a selection exists
  */
  void setHasSelection(bool hasSelection)
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
  void setManualCapabilities(gtk.types.PrintCapabilities capabilities)
  {
    gtk_print_unix_dialog_set_manual_capabilities(cast(GtkPrintUnixDialog*)this._cPtr, capabilities);
  }

  /**
      Sets the page setup of the [gtk.print_unix_dialog.PrintUnixDialog].
  
      Params:
        pageSetup = a [gtk.page_setup.PageSetup]
  */
  void setPageSetup(gtk.page_setup.PageSetup pageSetup)
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
  void setSettings(gtk.print_settings.PrintSettings settings = null)
  {
    gtk_print_unix_dialog_set_settings(cast(GtkPrintUnixDialog*)this._cPtr, settings ? cast(GtkPrintSettings*)settings._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the print dialog allows user to print a selection.
  
      Params:
        supportSelection = true to allow print selection
  */
  void setSupportSelection(bool supportSelection)
  {
    gtk_print_unix_dialog_set_support_selection(cast(GtkPrintUnixDialog*)this._cPtr, supportSelection);
  }
}
