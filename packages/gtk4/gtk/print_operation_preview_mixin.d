/// Module for [PrintOperationPreview] interface mixin
module gtk.print_operation_preview_mixin;

public import gtk.print_operation_preview_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.page_setup;
public import gtk.print_context;
public import gtk.types;

/**
    [gtk.print_operation_preview.PrintOperationPreview] is the interface that is used to
    implement print preview.
    
    A [gtk.print_operation_preview.PrintOperationPreview] object is passed to the
    [gtk.print_operation.PrintOperation.preview] signal by
    [gtk.print_operation.PrintOperation].
*/
template PrintOperationPreviewT()
{

  /**
      Ends a preview.
      
      This function must be called to finish a custom print preview.
  */
  override void endPreview()
  {
    gtk_print_operation_preview_end_preview(cast(GtkPrintOperationPreview*)this._cPtr);
  }

  /**
      Returns whether the given page is included in the set of pages that
      have been selected for printing.
  
      Params:
        pageNr = a page number
      Returns: true if the page has been selected for printing
  */
  override bool isSelected(int pageNr)
  {
    bool _retval;
    _retval = cast(bool)gtk_print_operation_preview_is_selected(cast(GtkPrintOperationPreview*)this._cPtr, pageNr);
    return _retval;
  }

  /**
      Renders a page to the preview.
      
      This is using the print context that was passed to the
      [gtk.print_operation.PrintOperation.preview] handler together
      with preview.
      
      A custom print preview should use this function to render
      the currently selected page.
      
      Note that this function requires a suitable cairo context to
      be associated with the print context.
  
      Params:
        pageNr = the page to render
  */
  override void renderPage(int pageNr)
  {
    gtk_print_operation_preview_render_page(cast(GtkPrintOperationPreview*)this._cPtr, pageNr);
  }

  /**
      Connect to `GotPageSize` signal.
  
      Emitted once for each page that gets rendered to the preview.
        
        A handler for this signal should update the context
        according to page_setup and set up a suitable cairo
        context, using [gtk.print_context.PrintContext.setCairoContext].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.print_context.PrintContext context, gtk.page_setup.PageSetup pageSetup, gtk.print_operation_preview.PrintOperationPreview printOperationPreview))
  
          `context` the current [gtk.print_context.PrintContext] (optional)
  
          `pageSetup` the [gtk.page_setup.PageSetup] for the current page (optional)
  
          `printOperationPreview` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGotPageSize(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.print_context.PrintContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.page_setup.PageSetup)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.print_operation_preview.PrintOperationPreview)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-page-size", closure, after);
  }

  /**
      Connect to `Ready` signal.
  
      The ::ready signal gets emitted once per preview operation,
        before the first page is rendered.
        
        A handler for this signal can be used for setup tasks.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.print_context.PrintContext context, gtk.print_operation_preview.PrintOperationPreview printOperationPreview))
  
          `context` the current [gtk.print_context.PrintContext] (optional)
  
          `printOperationPreview` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectReady(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.print_context.PrintContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.print_operation_preview.PrintOperationPreview)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("ready", closure, after);
  }
}
