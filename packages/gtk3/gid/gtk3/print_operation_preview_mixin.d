/// Module for [PrintOperationPreview] interface mixin
module gid.gtk3.print_operation_preview_mixin;

public import gid.core.basictypes;
public import gid.gtk3.print_operation_preview;
public import gid.gtk3.print_operation_preview_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.page_setup;
public import gid.gtk3.print_context;
public import gid.gtk3.types;

/** */
template PrintOperationPreviewT()
{

  /**
      Ends a preview.
      
      This function must be called to finish a custom print preview.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEndPreview`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEndPreview()
  {
    auto _klass = cast(GtkPrintOperationPreviewIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.print_operation_preview.PrintOperationPreview._getGType);
    if (!_klass || !_klass.endPreview)
      return;

    _klass.endPreview(cast(GtkPrintOperationPreview*)this._cPtr);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGotPageSize(gid.gtk3.print_context.PrintContext context, gid.gtk3.page_setup.PageSetup pageSetup)
  {
    auto _klass = cast(GtkPrintOperationPreviewIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.print_operation_preview.PrintOperationPreview._getGType);
    if (!_klass || !_klass.gotPageSize)
      return;

    _klass.gotPageSize(cast(GtkPrintOperationPreview*)this._cPtr, context ? cast(GtkPrintContext*)context._cPtr(No.Dup) : null, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null);
  }

  /**
      Returns whether the given page is included in the set of pages that
      have been selected for printing.
  
      Params:
        pageNr = a page number
      Returns: true if the page has been selected for printing
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsSelected`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsSelected(int pageNr)
  {
    auto _klass = cast(GtkPrintOperationPreviewIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.print_operation_preview.PrintOperationPreview._getGType);
    if (!_klass || !_klass.isSelected)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isSelected(cast(GtkPrintOperationPreview*)this._cPtr, pageNr);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncReady(gid.gtk3.print_context.PrintContext context)
  {
    auto _klass = cast(GtkPrintOperationPreviewIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.print_operation_preview.PrintOperationPreview._getGType);
    if (!_klass || !_klass.ready)
      return;

    _klass.ready(cast(GtkPrintOperationPreview*)this._cPtr, context ? cast(GtkPrintContext*)context._cPtr(No.Dup) : null);
  }

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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRenderPage`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRenderPage(int pageNr)
  {
    auto _klass = cast(GtkPrintOperationPreviewIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.print_operation_preview.PrintOperationPreview._getGType);
    if (!_klass || !_klass.renderPage)
      return;

    _klass.renderPage(cast(GtkPrintOperationPreview*)this._cPtr, pageNr);
  }

  /**
      Ends a preview.
      
      This function must be called to finish a custom print preview.
  */
  override void endPreview() nothrow
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
  override bool isSelected(int pageNr) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_print_operation_preview_is_selected(cast(GtkPrintOperationPreview*)this._cPtr, pageNr);
    return _retval;
  }

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
  override void renderPage(int pageNr) nothrow
  {
    gtk_print_operation_preview_render_page(cast(GtkPrintOperationPreview*)this._cPtr, pageNr);
  }

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
      gidAttachThread();
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
    return connectSignalClosure("got-page-size", closure, after);
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
      gidAttachThread();
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
    return connectSignalClosure("ready", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.print_operation_preview.PrintOperationPreview (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_print_operation_preview_PrintOperationPreview(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEndPreview", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGotPageSize", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsSelected", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReady", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRenderPage", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.print_operation_preview.PrintOperationPreview vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_print_operation_preview_PrintOperationPreview(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEndPreview", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_print_operation_preview_PrintOperationPreview(iface, "end_preview");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGotPageSize", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_print_operation_preview_PrintOperationPreview(iface, "got_page_size");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsSelected", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_print_operation_preview_PrintOperationPreview(iface, "is_selected");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReady", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_print_operation_preview_PrintOperationPreview(iface, "ready");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRenderPage", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_print_operation_preview_PrintOperationPreview(iface, "render_page");
  }

  private static void _installIfaceVfunc_gid_gtk3_print_operation_preview_PrintOperationPreview(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkPrintOperationPreviewIface*)iface;

    switch (vfunc)
    {
      case "end_preview":
      {
        static extern(C) void _vfuncEndPreviewTramp(GtkPrintOperationPreview* preview) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)preview);
          if (!_obj)
          {
            auto _klass = cast(GtkPrintOperationPreviewIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preview), gid.gtk3.print_operation_preview.PrintOperationPreview._getGType);
            if (_klass && _klass.endPreview)
              return (cast(typeof(&_vfuncEndPreviewTramp))_klass.endPreview)(preview);
            return;
          }

          try
          {
            _obj.vfuncEndPreview();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.print_operation_preview.PrintOperationPreview.vfuncEndPreview");
          }
        }

        _klass.endPreview = cast(typeof(_klass.endPreview))&_vfuncEndPreviewTramp;
        break;
      }
      case "got_page_size":
      {
        static extern(C) void _vfuncGotPageSizeTramp(GtkPrintOperationPreview* preview, GtkPrintContext* context, GtkPageSetup* pageSetup) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)preview);
          if (!_obj)
          {
            auto _klass = cast(GtkPrintOperationPreviewIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preview), gid.gtk3.print_operation_preview.PrintOperationPreview._getGType);
            if (_klass && _klass.gotPageSize)
              return (cast(typeof(&_vfuncGotPageSizeTramp))_klass.gotPageSize)(preview, context, pageSetup);
            return;
          }

          try
          {
            _obj.vfuncGotPageSize(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.print_context.PrintContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.page_setup.PageSetup)(cast(void*)pageSetup, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.print_operation_preview.PrintOperationPreview.vfuncGotPageSize");
          }
        }

        _klass.gotPageSize = cast(typeof(_klass.gotPageSize))&_vfuncGotPageSizeTramp;
        break;
      }
      case "is_selected":
      {
        static extern(C) gboolean _vfuncIsSelectedTramp(GtkPrintOperationPreview* preview, int pageNr) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)preview);
          if (!_obj)
          {
            auto _klass = cast(GtkPrintOperationPreviewIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preview), gid.gtk3.print_operation_preview.PrintOperationPreview._getGType);
            if (_klass && _klass.isSelected)
              return (cast(typeof(&_vfuncIsSelectedTramp))_klass.isSelected)(preview, pageNr);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsSelected(pageNr);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.print_operation_preview.PrintOperationPreview.vfuncIsSelected");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isSelected = cast(typeof(_klass.isSelected))&_vfuncIsSelectedTramp;
        break;
      }
      case "ready":
      {
        static extern(C) void _vfuncReadyTramp(GtkPrintOperationPreview* preview, GtkPrintContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)preview);
          if (!_obj)
          {
            auto _klass = cast(GtkPrintOperationPreviewIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preview), gid.gtk3.print_operation_preview.PrintOperationPreview._getGType);
            if (_klass && _klass.ready)
              return (cast(typeof(&_vfuncReadyTramp))_klass.ready)(preview, context);
            return;
          }

          try
          {
            _obj.vfuncReady(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.print_context.PrintContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.print_operation_preview.PrintOperationPreview.vfuncReady");
          }
        }

        _klass.ready = cast(typeof(_klass.ready))&_vfuncReadyTramp;
        break;
      }
      case "render_page":
      {
        static extern(C) void _vfuncRenderPageTramp(GtkPrintOperationPreview* preview, int pageNr) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)preview);
          if (!_obj)
          {
            auto _klass = cast(GtkPrintOperationPreviewIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preview), gid.gtk3.print_operation_preview.PrintOperationPreview._getGType);
            if (_klass && _klass.renderPage)
              return (cast(typeof(&_vfuncRenderPageTramp))_klass.renderPage)(preview, pageNr);
            return;
          }

          try
          {
            _obj.vfuncRenderPage(pageNr);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.print_operation_preview.PrintOperationPreview.vfuncRenderPage");
          }
        }

        _klass.renderPage = cast(typeof(_klass.renderPage))&_vfuncRenderPageTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.print_operation_preview.PrintOperationPreview]
template PrintOperationPreviewGidBuilderT()
{
}
