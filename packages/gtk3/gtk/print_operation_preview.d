/// Module for [PrintOperationPreview] interface
module gtk.print_operation_preview;

public import gtk.print_operation_preview_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.page_setup;
import gtk.print_context;
import gtk.types;

/** */
interface PrintOperationPreview
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_print_operation_preview_get_type != &gidSymbolNotFound ? gtk_print_operation_preview_get_type() : cast(GType)0;
  }

  /**
      Ends a preview.
      
      This function must be called to finish a custom print preview.
  */
  void endPreview();

  /**
      Returns whether the given page is included in the set of pages that
      have been selected for printing.
  
      Params:
        pageNr = a page number
      Returns: true if the page has been selected for printing
  */
  bool isSelected(int pageNr);

  /**
      Renders a page to the preview, using the print context that
      was passed to the #GtkPrintOperation::preview handler together
      with preview.
      
      A custom iprint preview should use this function in its ::expose
      handler to render the currently selected page.
      
      Note that this function requires a suitable cairo context to
      be associated with the print context.
  
      Params:
        pageNr = the page to render
  */
  void renderPage(int pageNr);

  /**
      Connect to `GotPageSize` signal.
  
      The ::got-page-size signal is emitted once for each page
        that gets rendered to the preview.
        
        A handler for this signal should update the context
        according to page_setup and set up a suitable cairo
        context, using [gtk.print_context.PrintContext.setCairoContext].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.print_context.PrintContext context, gtk.page_setup.PageSetup pageSetup, gtk.print_operation_preview.PrintOperationPreview printOperationPreview))
  
          `context` the current #GtkPrintContext (optional)
  
          `pageSetup` the #GtkPageSetup for the current page (optional)
  
          `printOperationPreview` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGotPageSize(T)(T callback, Flag!"After" after = No.After);

  /**
      Connect to `Ready` signal.
  
      The ::ready signal gets emitted once per preview operation,
        before the first page is rendered.
        
        A handler for this signal can be used for setup tasks.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.print_context.PrintContext context, gtk.print_operation_preview.PrintOperationPreview printOperationPreview))
  
          `context` the current #GtkPrintContext (optional)
  
          `printOperationPreview` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectReady(T)(T callback, Flag!"After" after = No.After);
}
