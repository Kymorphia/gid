/// Module for [Frame] class
module panel.frame;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.selection_model;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.frame_header;
import panel.position;
import panel.types;
import panel.widget;

/**
    The #PanelFrame is a widget containing panels to display in an
    area. The widgets are added internally in an [adw.tab_view.TabView] to
    display them one at a time like in a stack.
    
    A #PanelFrame can also have a header widget that will be displayed
    above the panels.
*/
class Frame : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())panel_frame_get_type != &gidSymbolNotFound ? panel_frame_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Frame self()
  {
    return this;
  }

  /** */
  @property bool closeable()
  {
    return getCloseable();
  }

  /** */
  @property bool empty()
  {
    return getEmpty();
  }

  /** */
  @property gtk.widget.Widget placeholder()
  {
    return getPlaceholder();
  }

  /** */
  @property void placeholder(gtk.widget.Widget propval)
  {
    return setPlaceholder(propval);
  }

  /** */
  @property panel.widget.Widget visibleChild()
  {
    return getVisibleChild();
  }

  /** */
  @property void visibleChild(panel.widget.Widget propval)
  {
    return setVisibleChild(propval);
  }

  mixin OrientableT!();

  /**
      Create a new #PanelFrame.
      Returns: a newly created #PanelFrame object.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_frame_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a widget to the frame.
  
      Params:
        panel = a #PanelWidget to add
  */
  void add(panel.widget.Widget panel)
  {
    panel_frame_add(cast(PanelFrame*)this._cPtr, panel ? cast(PanelWidget*)panel._cPtr(No.Dup) : null);
  }

  /**
      Add panel before sibling in the #PanelFrame.
  
      Params:
        panel = the #PanelWidget to add.
        sibling = the sibling #PanelWidget to add the panel before.
  */
  void addBefore(panel.widget.Widget panel, panel.widget.Widget sibling)
  {
    panel_frame_add_before(cast(PanelFrame*)this._cPtr, panel ? cast(PanelWidget*)panel._cPtr(No.Dup) : null, sibling ? cast(PanelWidget*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Tells if the panel frame is closeable.
      Returns: true if the panel frame is closeable.
  */
  bool getCloseable()
  {
    bool _retval;
    _retval = cast(bool)panel_frame_get_closeable(cast(PanelFrame*)this._cPtr);
    return _retval;
  }

  /**
      Tells if the panel frame is empty.
      Returns: true if the panel is empty.
  */
  bool getEmpty()
  {
    bool _retval;
    _retval = cast(bool)panel_frame_get_empty(cast(PanelFrame*)this._cPtr);
    return _retval;
  }

  /**
      Gets the header for the frame.
      Returns: a #PanelFrameHeader or null
  */
  panel.frame_header.FrameHeader getHeader()
  {
    PanelFrameHeader* _cretval;
    _cretval = panel_frame_get_header(cast(PanelFrame*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.frame_header.FrameHeader)(cast(PanelFrameHeader*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the number of pages in the panel frame.
      Returns: The number of pages.
  */
  uint getNPages()
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
  panel.widget.Widget getPage(uint n)
  {
    PanelWidget* _cretval;
    _cretval = panel_frame_get_page(cast(PanelFrame*)this._cPtr, n);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.widget.Widget)(cast(PanelWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the pages for the frame.
      Returns: a #GtkSelectionModel
  */
  gtk.selection_model.SelectionModel getPages()
  {
    GtkSelectionModel* _cretval;
    _cretval = panel_frame_get_pages(cast(PanelFrame*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the placeholder widget, if any.
      Returns: a #GtkWidget or null
  */
  gtk.widget.Widget getPlaceholder()
  {
    GtkWidget* _cretval;
    _cretval = panel_frame_get_placeholder(cast(PanelFrame*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #PanelPosition for the frame.
      Returns: a #PanelPosition
  */
  panel.position.Position getPosition()
  {
    PanelPosition* _cretval;
    _cretval = panel_frame_get_position(cast(PanelFrame*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.position.Position)(cast(PanelPosition*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the requested size for the panel frame.
      Returns: the requested size.
  */
  int getRequestedSize()
  {
    int _retval;
    _retval = panel_frame_get_requested_size(cast(PanelFrame*)this._cPtr);
    return _retval;
  }

  /**
      Gets the widget of the currently visible child.
      Returns: a #PanelWidget or null
  */
  panel.widget.Widget getVisibleChild()
  {
    PanelWidget* _cretval;
    _cretval = panel_frame_get_visible_child(cast(PanelFrame*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.widget.Widget)(cast(PanelWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes a widget from the frame.
  
      Params:
        panel = a #PanelWidget to remove.
  */
  void remove(panel.widget.Widget panel)
  {
    panel_frame_remove(cast(PanelFrame*)this._cPtr, panel ? cast(PanelWidget*)panel._cPtr(No.Dup) : null);
  }

  /**
      Set pinned state of child.
  
      Params:
        child = a #PanelWidget
        pinned = if widget should be pinned
  */
  void setChildPinned(panel.widget.Widget child, bool pinned)
  {
    panel_frame_set_child_pinned(cast(PanelFrame*)this._cPtr, child ? cast(PanelWidget*)child._cPtr(No.Dup) : null, pinned);
  }

  /**
      Sets the header for the frame, such as a #PanelFrameSwitcher.
  
      Params:
        header = a #PanelFrameHeader
  */
  void setHeader(panel.frame_header.FrameHeader header = null)
  {
    panel_frame_set_header(cast(PanelFrame*)this._cPtr, header ? cast(PanelFrameHeader*)(cast(gobject.object.ObjectWrap)header)._cPtr(No.Dup) : null);
  }

  /**
      Sets the placeholder widget for the frame.
      
      The placeholder widget is displayed when there are no pages
      to display in the frame.
  
      Params:
        placeholder = a #GtkWidget or null
  */
  void setPlaceholder(gtk.widget.Widget placeholder = null)
  {
    panel_frame_set_placeholder(cast(PanelFrame*)this._cPtr, placeholder ? cast(GtkWidget*)placeholder._cPtr(No.Dup) : null);
  }

  /**
      Sets the requested size for the panel frame.
  
      Params:
        requestedSize = the requested size.
  */
  void setRequestedSize(int requestedSize)
  {
    panel_frame_set_requested_size(cast(PanelFrame*)this._cPtr, requestedSize);
  }

  /**
      Sets the current page to the child specified in widget.
  
      Params:
        widget = a #PanelWidget
  */
  void setVisibleChild(panel.widget.Widget widget)
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
  
          $(D bool callback(panel.widget.Widget widget, panel.frame.Frame frame))
  
          `widget` a #PanelWidget (optional)
  
          `frame` the instance the signal is connected to (optional)
  
          `Returns` [gdk.types.EVENT_STOP] or [gdk.types.EVENT_PROPAGATE]
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAdoptWidget(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.frame.Frame)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(panel.widget.Widget widget, panel.frame.Frame frame))
  
          `widget` a #PanelWidget (optional)
  
          `frame` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPageClosed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.frame.Frame)))
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
    return connectSignalClosure("page-closed", closure, after);
  }
}
