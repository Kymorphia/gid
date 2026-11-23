/// Module for [Frame] class
module gid.panel1.frame;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.selection_model;
import gid.gtk4.widget;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.frame_header;
import gid.panel1.position;
import gid.panel1.types;
import gid.panel1.widget;

/**
    The #PanelFrame is a widget containing panels to display in an
    area. The widgets are added internally in an [gid.adw1.tab_view.TabView] to
    display them one at a time like in a stack.
    
    A #PanelFrame can also have a header widget that will be displayed
    above the panels.
*/
class Frame : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable
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
    return cast(void function())panel_frame_get_type != &gidSymbolNotFound ? panel_frame_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelFrame";
  }

  /** Returns `this`, for use in `with` statements. */
  override Frame self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.frame.Frame]
      Returns: New builder object
  */
  static FrameGidBuilder builder() nothrow
  {
    return new FrameGidBuilder;
  }

  /** */
  @property bool closeable() nothrow
  {
    return getCloseable();
  }

  /** */
  @property bool empty() nothrow
  {
    return getEmpty();
  }

  /** */
  @property gid.gtk4.widget.Widget placeholder() nothrow
  {
    return getPlaceholder();
  }

  /** */
  @property void placeholder(gid.gtk4.widget.Widget propval) nothrow
  {
    setPlaceholder(propval);
  }

  /** */
  @property gid.panel1.widget.Widget visibleChild() nothrow
  {
    return getVisibleChild();
  }

  /** */
  @property void visibleChild(gid.panel1.widget.Widget propval) nothrow
  {
    setVisibleChild(propval);
  }

  mixin OrientableT!();

  /**
      Create a new #PanelFrame.
      Returns: a newly created #PanelFrame object.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = panel_frame_new();
      this(_cretval, No.Take);
    }
  }

  /** */
  protected bool vfuncAdoptWidget(gid.panel1.widget.Widget widget)
  {
    auto _klass = cast(PanelFrameClass*)_vfuncClass;
    if (!_klass.adoptWidget)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.adoptWidget(cast(PanelFrame*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected void vfuncPageClosed(gid.panel1.widget.Widget widget)
  {
    auto _klass = cast(PanelFrameClass*)_vfuncClass;
    if (!_klass.pageClosed)
      return;

    _klass.pageClosed(cast(PanelFrame*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Adds a widget to the frame.
  
      Params:
        panel = a #PanelWidget to add
  */
  void add(gid.panel1.widget.Widget panel) nothrow
  {
    panel_frame_add(cast(PanelFrame*)this._cPtr, panel ? cast(PanelWidget*)panel._cPtr(No.Dup) : null);
  }

  /**
      Add panel before sibling in the #PanelFrame.
  
      Params:
        panel = the #PanelWidget to add.
        sibling = the sibling #PanelWidget to add the panel before.
  */
  void addBefore(gid.panel1.widget.Widget panel, gid.panel1.widget.Widget sibling) nothrow
  {
    panel_frame_add_before(cast(PanelFrame*)this._cPtr, panel ? cast(PanelWidget*)panel._cPtr(No.Dup) : null, sibling ? cast(PanelWidget*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Tells if the panel frame is closeable.
      Returns: true if the panel frame is closeable.
  */
  bool getCloseable() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_frame_get_closeable(cast(PanelFrame*)this._cPtr);
    return _retval;
  }

  /**
      Tells if the panel frame is empty.
      Returns: true if the panel is empty.
  */
  bool getEmpty() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_frame_get_empty(cast(PanelFrame*)this._cPtr);
    return _retval;
  }

  /**
      Gets the header for the frame.
      Returns: a #PanelFrameHeader or null
  */
  gid.panel1.frame_header.FrameHeader getHeader() nothrow
  {
    PanelFrameHeader* _cretval;
    _cretval = panel_frame_get_header(cast(PanelFrame*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.frame_header.FrameHeader)(cast(PanelFrameHeader*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the number of pages in the panel frame.
      Returns: The number of pages.
  */
  uint getNPages() nothrow
  {
    uint _retval;
    _retval = panel_frame_get_n_pages(cast(PanelFrame*)this._cPtr);
    return _retval;
  }

  /**
      Gets the page with the given index, if any.
  
      Params:
        n = the index of the page
      Returns: a #PanelWidget or null
  */
  gid.panel1.widget.Widget getPage(uint n) nothrow
  {
    PanelWidget* _cretval;
    _cretval = panel_frame_get_page(cast(PanelFrame*)this._cPtr, n);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.widget.Widget)(cast(PanelWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the pages for the frame.
      Returns: a #GtkSelectionModel
  */
  gid.gtk4.selection_model.SelectionModel getPages() nothrow
  {
    GtkSelectionModel* _cretval;
    _cretval = panel_frame_get_pages(cast(PanelFrame*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the placeholder widget, if any.
      Returns: a #GtkWidget or null
  */
  gid.gtk4.widget.Widget getPlaceholder() nothrow
  {
    GtkWidget* _cretval;
    _cretval = panel_frame_get_placeholder(cast(PanelFrame*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #PanelPosition for the frame.
      Returns: a #PanelPosition
  */
  gid.panel1.position.Position getPosition() nothrow
  {
    PanelPosition* _cretval;
    _cretval = panel_frame_get_position(cast(PanelFrame*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.position.Position)(cast(PanelPosition*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the requested size for the panel frame.
      Returns: the requested size.
  */
  int getRequestedSize() nothrow
  {
    int _retval;
    _retval = panel_frame_get_requested_size(cast(PanelFrame*)this._cPtr);
    return _retval;
  }

  /**
      Gets the widget of the currently visible child.
      Returns: a #PanelWidget or null
  */
  gid.panel1.widget.Widget getVisibleChild() nothrow
  {
    PanelWidget* _cretval;
    _cretval = panel_frame_get_visible_child(cast(PanelFrame*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.widget.Widget)(cast(PanelWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes a widget from the frame.
  
      Params:
        panel = a #PanelWidget to remove.
  */
  void remove(gid.panel1.widget.Widget panel) nothrow
  {
    panel_frame_remove(cast(PanelFrame*)this._cPtr, panel ? cast(PanelWidget*)panel._cPtr(No.Dup) : null);
  }

  /**
      Set pinned state of child.
  
      Params:
        child = a #PanelWidget
        pinned = if widget should be pinned
  */
  void setChildPinned(gid.panel1.widget.Widget child, bool pinned) nothrow
  {
    panel_frame_set_child_pinned(cast(PanelFrame*)this._cPtr, child ? cast(PanelWidget*)child._cPtr(No.Dup) : null, pinned);
  }

  /**
      Sets the header for the frame, such as a #PanelFrameSwitcher.
  
      Params:
        header = a #PanelFrameHeader
  */
  void setHeader(gid.panel1.frame_header.FrameHeader header = null) nothrow
  {
    panel_frame_set_header(cast(PanelFrame*)this._cPtr, header ? cast(PanelFrameHeader*)(cast(gid.gobject2.object.ObjectWrap)header)._cPtr(No.Dup) : null);
  }

  /**
      Sets the placeholder widget for the frame.
      
      The placeholder widget is displayed when there are no pages
      to display in the frame.
  
      Params:
        placeholder = a #GtkWidget or null
  */
  void setPlaceholder(gid.gtk4.widget.Widget placeholder = null) nothrow
  {
    panel_frame_set_placeholder(cast(PanelFrame*)this._cPtr, placeholder ? cast(GtkWidget*)placeholder._cPtr(No.Dup) : null);
  }

  /**
      Sets the requested size for the panel frame.
  
      Params:
        requestedSize = the requested size.
  */
  void setRequestedSize(int requestedSize) nothrow
  {
    panel_frame_set_requested_size(cast(PanelFrame*)this._cPtr, requestedSize);
  }

  /**
      Sets the current page to the child specified in widget.
  
      Params:
        widget = a #PanelWidget
  */
  void setVisibleChild(gid.panel1.widget.Widget widget) nothrow
  {
    panel_frame_set_visible_child(cast(PanelFrame*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Connect to `AdoptWidget` signal.
  
      This signal is emitted when the frame should decide if it can adopt
        a #PanelWidget dropped on the frame.
        
        If GDK_EVENT_STOP is returned, then the widget will not be adopted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.panel1.widget.Widget widget, gid.panel1.frame.Frame frame)`
  
          `widget` a #PanelWidget (optional)
  
          `frame` the instance the signal is connected to (optional)
  
          `Returns` [gid.gdk4.types.EVENT_STOP] or [gid.gdk4.types.EVENT_PROPAGATE]
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAdoptWidget(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.panel1.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.panel1.frame.Frame)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.frame.Frame.adoptWidget");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("adopt-widget", closure, after);
  }

  /**
      Connect to `PageClosed` signal.
  
      This signal is emitted when the page widget will be closed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.panel1.widget.Widget widget, gid.panel1.frame.Frame frame)`
  
          `widget` a #PanelWidget (optional)
  
          `frame` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPageClosed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.panel1.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.panel1.frame.Frame)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.frame.Frame.pageClosed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-closed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Frame
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.panel1.frame.Frame), T.stringof ~ " is not derived from gid.panel1.frame.Frame");

    gid.gtk4.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAdoptWidget", true)[0]) == gid.panel1.frame.Frame))
      _installVfunc(klass, "adopt_widget");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPageClosed", true)[0]) == gid.panel1.frame.Frame))
      _installVfunc(klass, "page_closed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(PanelFrameClass*)klass;

    switch (vfunc)
    {
      case "adopt_widget":
      {
        static extern(C) gboolean _vfuncAdoptWidgetTramp(PanelFrame* self, PanelWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.panel1.frame.Frame)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelFrameClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.adoptWidget)
              return (cast(typeof(&_vfuncAdoptWidgetTramp))_klass.adoptWidget)(self, widget);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncAdoptWidget(gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.widget.Widget)(cast(void*)widget, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.panel1.frame.Frame.vfuncAdoptWidget");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.adoptWidget = cast(typeof(_klass.adoptWidget))&_vfuncAdoptWidgetTramp;
        break;
      }
      case "page_closed":
      {
        static extern(C) void _vfuncPageClosedTramp(PanelFrame* self, PanelWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.panel1.frame.Frame)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelFrameClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.pageClosed)
              return (cast(typeof(&_vfuncPageClosedTramp))_klass.pageClosed)(self, widget);
            return;
          }

          try
          {
            _obj.vfuncPageClosed(gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.widget.Widget)(cast(void*)widget, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.panel1.frame.Frame.vfuncPageClosed");
          }
        }

        _klass.pageClosed = cast(typeof(_klass.pageClosed))&_vfuncPageClosedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.panel1.frame.Frame]
class FrameGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /** */
  T placeholder(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("placeholder", propval);
  }

  /** */
  T visibleChild(gid.panel1.widget.Widget propval) nothrow
  {
    return setProperty("visible-child", propval);
  }
}

/// Fluent builder for [gid.panel1.frame.Frame]
final class FrameGidBuilder : FrameGidBuilderImpl!FrameGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Frame build() nothrow
  {
    return new Frame(cast(void*)createGObject(Frame._getGType), Yes.Take);
  }
}
