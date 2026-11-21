/// Module for [PrintOperationPreview] interface
module gid.gtk3.print_operation_preview;

public import gid.core.basictypes;
public import gid.gtk3.print_operation_preview_iface_proxy;
import gid.core.gid;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.page_setup;
import gid.gtk3.print_context;
import gid.gtk3.types;

/** */
interface PrintOperationPreview : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
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
        context, using [gid.gtk4.print_context.PrintContext.setCairoContext].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.print_context.PrintContext context, gid.gtk3.page_setup.PageSetup pageSetup, gid.gtk3.print_operation_preview.PrintOperationPreview printOperationPreview)`
  
          `context` the current #GtkPrintContext (optional)
  
          `pageSetup` the #GtkPageSetup for the current page (optional)
  
          `printOperationPreview` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGotPageSize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.print_context.PrintContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.page_setup.PageSetup)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.print_operation_preview.PrintOperationPreview)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.print_operation_preview.PrintOperationPreview.gotPageSize");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("got-page-size", closure, after);
  }

  /**
      Connect to `Ready` signal.
  
      The ::ready signal gets emitted once per preview operation,
        before the first page is rendered.
        
        A handler for this signal can be used for setup tasks.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.print_context.PrintContext context, gid.gtk3.print_operation_preview.PrintOperationPreview printOperationPreview)`
  
          `context` the current #GtkPrintContext (optional)
  
          `printOperationPreview` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectReady(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.print_context.PrintContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.print_operation_preview.PrintOperationPreview)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.print_operation_preview.PrintOperationPreview.ready");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("ready", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.print_operation_preview.PrintOperationPreview]
interface PrintOperationPreviewGidBuilderImpl(T)
{
}
