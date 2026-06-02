/// Module for [Dock] class
module panel.dock;

public import gid.basictypes;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.frame;
import panel.position;
import panel.types;
import panel.widget;

/**
    The #PanelDock is a widget designed to contain widgets that can be
    docked. Use the #PanelDock as the top widget of your dockable UI.
    
    A #PanelDock is divided in 5 areas: [panel.types.Area.Top],
    [panel.types.Area.Bottom], [panel.types.Area.Start], [panel.types.Area.End] represent
    the surrounding areas that can revealed. [panel.types.Area.Center]
    represent the main area, that is always displayed and resized
    depending on the reveal state of the surrounding areas.
    
    It will contain a #PanelDockChild for each of the areas in use,
    albeit this is done by the widget.
*/
class Dock : gtk.widget.Widget
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
    return cast(void function())panel_dock_get_type != &gidSymbolNotFound ? panel_dock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Dock self() nothrow
  {
    return this;
  }

  /**
      Get builder for [panel.dock.Dock]
      Returns: New builder object
  */
  static DockGidBuilder builder() nothrow
  {
    return new DockGidBuilder;
  }

  /** */
  @property int bottomHeight() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("bottom-height");
  }

  /** */
  @property void bottomHeight(int propval) nothrow
  {
    setBottomHeight(propval);
  }

  /** */
  @property bool canRevealBottom() nothrow
  {
    return getCanRevealBottom();
  }

  /** */
  @property bool canRevealEnd() nothrow
  {
    return getCanRevealEnd();
  }

  /** */
  @property bool canRevealStart() nothrow
  {
    return getCanRevealStart();
  }

  /** */
  @property bool canRevealTop() nothrow
  {
    return getCanRevealTop();
  }

  /** */
  @property int endWidth() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("end-width");
  }

  /** */
  @property void endWidth(int propval) nothrow
  {
    setEndWidth(propval);
  }

  /** */
  @property bool revealBottom() nothrow
  {
    return getRevealBottom();
  }

  /** */
  @property void revealBottom(bool propval) nothrow
  {
    setRevealBottom(propval);
  }

  /** */
  @property bool revealEnd() nothrow
  {
    return getRevealEnd();
  }

  /** */
  @property void revealEnd(bool propval) nothrow
  {
    setRevealEnd(propval);
  }

  /** */
  @property bool revealStart() nothrow
  {
    return getRevealStart();
  }

  /** */
  @property void revealStart(bool propval) nothrow
  {
    setRevealStart(propval);
  }

  /** */
  @property bool revealTop() nothrow
  {
    return getRevealTop();
  }

  /** */
  @property void revealTop(bool propval) nothrow
  {
    setRevealTop(propval);
  }

  /** */
  @property int startWidth() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("start-width");
  }

  /** */
  @property void startWidth(int propval) nothrow
  {
    setStartWidth(propval);
  }

  /** */
  @property int topHeight() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("top-height");
  }

  /** */
  @property void topHeight(int propval) nothrow
  {
    setTopHeight(propval);
  }

  /**
      Create a new #PanelDock.
      Returns: a newly created #PanelDock
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = panel_dock_new();
    this(_cretval, No.Take);
  }

  /**
      Invokes a callback for each frame in the dock.
  
      Params:
        callback = a function to be called on each frame
  */
  void foreachFrame(panel.types.FrameCallback callback) nothrow
  {
    extern(C) void _callbackCallback(PanelFrame* frame, void* userData) nothrow
    {
      auto _dlg = cast(panel.types.FrameCallback*)userData;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(panel.frame.Frame)(cast(void*)frame, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "panel.types.FrameCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? cast(void*)&(callback) : null;
    panel_dock_foreach_frame(cast(PanelDock*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Tells if the panel area can be revealed.
  
      Params:
        area = the panel area to check.
      Returns: whether it can reveal the area or not. If the is no child
        or the child is empty, will return false.
  */
  bool getCanRevealArea(panel.types.Area area) nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_dock_get_can_reveal_area(cast(PanelDock*)this._cPtr, area);
    return _retval;
  }

  /**
      Tells if the bottom panel area can be revealed.
      Returns: whether it can reveal the bottom area or not. If the is no
        child or the child is empty, will return false.
  */
  bool getCanRevealBottom() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_dock_get_can_reveal_bottom(cast(PanelDock*)this._cPtr);
    return _retval;
  }

  /**
      Tells if the end panel area can be revealed.
      Returns: whether it can reveal the end area or not. If the is no
        child or the child is empty, will return false.
  */
  bool getCanRevealEnd() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_dock_get_can_reveal_end(cast(PanelDock*)this._cPtr);
    return _retval;
  }

  /**
      Tells if the start panel area can be revealed.
      Returns: whether it can reveal the start area or not. If the is no
        child or the child is empty, will return false.
  */
  bool getCanRevealStart() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_dock_get_can_reveal_start(cast(PanelDock*)this._cPtr);
    return _retval;
  }

  /**
      Tells if the top panel area can be revealed.
      Returns: whether it can reveal the top area or not. If the is no
        child or the child is empty, will return false.
  */
  bool getCanRevealTop() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_dock_get_can_reveal_top(cast(PanelDock*)this._cPtr);
    return _retval;
  }

  /**
      Tells if an area if revealed.
  
      Params:
        area = the #PanelArea to return the reveal status of.
      Returns: The reveal state.
  */
  bool getRevealArea(panel.types.Area area) nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_dock_get_reveal_area(cast(PanelDock*)this._cPtr, area);
    return _retval;
  }

  /**
      Tells if the bottom area is revealed.
      Returns: The reveal state of the bottom area.
  */
  bool getRevealBottom() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_dock_get_reveal_bottom(cast(PanelDock*)this._cPtr);
    return _retval;
  }

  /**
      Tells if the end area is revealed.
      Returns: The reveal state of the end area.
  */
  bool getRevealEnd() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_dock_get_reveal_end(cast(PanelDock*)this._cPtr);
    return _retval;
  }

  /**
      Tells if the start area is revealed.
      Returns: The reveal state of the start area.
  */
  bool getRevealStart() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_dock_get_reveal_start(cast(PanelDock*)this._cPtr);
    return _retval;
  }

  /**
      Tells if the top area is revealed.
      Returns: The reveal state of the top area.
  */
  bool getRevealTop() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_dock_get_reveal_top(cast(PanelDock*)this._cPtr);
    return _retval;
  }

  /**
      Removes a widget from the dock. If widget is not a #DockChild,
      then the closest #DockChild parent is removed.
  
      Params:
        widget = a #GtkWidget to remove
  */
  void remove(gtk.widget.Widget widget) nothrow
  {
    panel_dock_remove(cast(PanelDock*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Set the height of the bottom area.
  
      Params:
        height = the height
  */
  void setBottomHeight(int height) nothrow
  {
    panel_dock_set_bottom_height(cast(PanelDock*)this._cPtr, height);
  }

  /**
      Set the width of the end area.
  
      Params:
        width = the width
  */
  void setEndWidth(int width) nothrow
  {
    panel_dock_set_end_width(cast(PanelDock*)this._cPtr, width);
  }

  /**
      Sets the reveal status of the area.
  
      Params:
        area = a #PanelArea. [panel.types.Area.Center] is an invalid value.
        reveal = reveal the area.
  */
  void setRevealArea(panel.types.Area area, bool reveal) nothrow
  {
    panel_dock_set_reveal_area(cast(PanelDock*)this._cPtr, area, reveal);
  }

  /**
      Sets the reveal status of the bottom area.
  
      Params:
        revealBottom = reveal the bottom area.
  */
  void setRevealBottom(bool revealBottom) nothrow
  {
    panel_dock_set_reveal_bottom(cast(PanelDock*)this._cPtr, revealBottom);
  }

  /**
      Sets the reveal status of the end area.
  
      Params:
        revealEnd = reveal the end area.
  */
  void setRevealEnd(bool revealEnd) nothrow
  {
    panel_dock_set_reveal_end(cast(PanelDock*)this._cPtr, revealEnd);
  }

  /**
      Sets the reveal status of the start area.
  
      Params:
        revealStart = reveal the start area.
  */
  void setRevealStart(bool revealStart) nothrow
  {
    panel_dock_set_reveal_start(cast(PanelDock*)this._cPtr, revealStart);
  }

  /**
      Sets the reveal status of the top area.
  
      Params:
        revealTop = reveal the top area.
  */
  void setRevealTop(bool revealTop) nothrow
  {
    panel_dock_set_reveal_top(cast(PanelDock*)this._cPtr, revealTop);
  }

  /**
      Set the width of the start area.
  
      Params:
        width = the width
  */
  void setStartWidth(int width) nothrow
  {
    panel_dock_set_start_width(cast(PanelDock*)this._cPtr, width);
  }

  /**
      Set the height of the top area.
  
      Params:
        height = the height
  */
  void setTopHeight(int height) nothrow
  {
    panel_dock_set_top_height(cast(PanelDock*)this._cPtr, height);
  }

  /**
      Connect to `AdoptWidget` signal.
  
      Signal is emitted when a widget is requesting to be added via a
        drag-n-drop event.
        
        This is generally propagated via #PanelFrame::adopt-widget to the
        dock so that applications do not need to attach signal handlers
        to every #PanelFrame.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(panel.widget.Widget widget, panel.dock.Dock dock)`
  
          `widget` a #PanelWidget (optional)
  
          `dock` the instance the signal is connected to (optional)
  
          `Returns` [gdk.types.EVENT_STOP] to prevent dropping, otherwise
              [gdk.types.EVENT_PROPAGATE] to allow adopting the widget.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAdoptWidget(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.dock.Dock)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "panel.dock.Dock.adoptWidget");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("adopt-widget", closure, after);
  }

  /**
      Connect to `CreateFrame` signal.
  
      This signal is emitted when a new frame is needed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `panel.frame.Frame callback(panel.position.Position position, panel.dock.Dock dock)`
  
          `position` the position for the frame (optional)
  
          `dock` the instance the signal is connected to (optional)
  
          `Returns` a #PanelFrame
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCreateFrame(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T : panel.frame.Frame)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.position.Position)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.dock.Dock)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      panel.frame.Frame _retval;

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
        gidInvokeCallbackExceptionHandler(e, "panel.dock.Dock.createFrame");
      }

      setVal!(panel.frame.Frame)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-frame", closure, after);
  }

  /**
      Connect to `PanelDragBegin` signal.
  
      This signal is emitted when dragging of a panel begins.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(panel.widget.Widget panel, panel.dock.Dock dock)`
  
          `panel` a #PanelWidget (optional)
  
          `dock` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPanelDragBegin(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.dock.Dock)))
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
        gidInvokeCallbackExceptionHandler(e, "panel.dock.Dock.panelDragBegin");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("panel-drag-begin", closure, after);
  }

  /**
      Connect to `PanelDragEnd` signal.
  
      This signal is emitted when dragging of a panel either
        completes or was cancelled.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(panel.widget.Widget panel, panel.dock.Dock dock)`
  
          `panel` a #PanelWidget (optional)
  
          `dock` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPanelDragEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.dock.Dock)))
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
        gidInvokeCallbackExceptionHandler(e, "panel.dock.Dock.panelDragEnd");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("panel-drag-end", closure, after);
  }
}

/// Fluent builder implementation template for [panel.dock.Dock]
class DockGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /** */
  T bottomHeight(int propval) nothrow
  {
    return setProperty("bottom-height", propval);
  }

  /** */
  T endWidth(int propval) nothrow
  {
    return setProperty("end-width", propval);
  }

  /** */
  T revealBottom(bool propval) nothrow
  {
    return setProperty("reveal-bottom", propval);
  }

  /** */
  T revealEnd(bool propval) nothrow
  {
    return setProperty("reveal-end", propval);
  }

  /** */
  T revealStart(bool propval) nothrow
  {
    return setProperty("reveal-start", propval);
  }

  /** */
  T revealTop(bool propval) nothrow
  {
    return setProperty("reveal-top", propval);
  }

  /** */
  T startWidth(int propval) nothrow
  {
    return setProperty("start-width", propval);
  }

  /** */
  T topHeight(int propval) nothrow
  {
    return setProperty("top-height", propval);
  }
}

/// Fluent builder for [panel.dock.Dock]
final class DockGidBuilder : DockGidBuilderImpl!DockGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Dock build() nothrow
  {
    return new Dock(cast(void*)createGObject(Dock._getGType), No.Take);
  }
}
