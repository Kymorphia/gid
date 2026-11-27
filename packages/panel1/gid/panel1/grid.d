/// Module for [Grid] class
module gid.panel1.grid;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.frame;
import gid.panel1.grid_column;
import gid.panel1.types;
import gid.panel1.widget;

/**
    The #PanelGrid is a widget used to layout the dock item in the
    center area.
*/
@gidGir("Grid", "GridClass")
class Grid : gid.gtk4.widget.Widget
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
    return cast(void function())panel_grid_get_type != &gidSymbolNotFound ? panel_grid_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelGrid";
  }

  /** Returns `this`, for use in `with` statements. */
  override Grid self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.grid.Grid]
      Returns: New builder object
  */
  static GridGidBuilder builder() nothrow
  {
    return new GridGidBuilder;
  }

  /**
      Creates a new #PanelGrid.
      Returns: a newly created #PanelGrid
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = panel_grid_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Add a #PanelWidget to the grid.
  
      Params:
        widget = a #PanelWidget the widget to add.
  */
  void add(gid.panel1.widget.Widget widget) nothrow
  {
    panel_grid_add(cast(PanelGrid*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Request to close, asynchronously. This will display the save dialog.
  
      Params:
        cancellable = 
        callback = callback called when ready
  */
  void agreeToCloseAsync(gid.gio2.cancellable.Cancellable cancellable, gid.gio2.types.AsyncReadyCallback callback) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    panel_grid_agree_to_close_async(cast(PanelGrid*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  bool agreeToCloseFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)panel_grid_agree_to_close_finish(cast(PanelGrid*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Calls callback for each #PanelFrame within grid.
  
      Params:
        callback = a #PanelFrameCallback
  */
  void foreachFrame(gid.panel1.types.FrameCallback callback) nothrow
  {
    extern(C) void _callbackCallback(PanelFrame* frame, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.panel1.types.FrameCallback*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.frame.Frame)(cast(void*)frame, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.types.FrameCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? cast(void*)&(callback) : null;
    panel_grid_foreach_frame(cast(PanelGrid*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Gets the #PanelGridColumn for a column index.
  
      Params:
        column = a column index
      Returns: a #PanelGridColumn
  */
  gid.panel1.grid_column.GridColumn getColumn(uint column) nothrow
  {
    PanelGridColumn* _cretval;
    _cretval = panel_grid_get_column(cast(PanelGrid*)this._cPtr, column);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.grid_column.GridColumn)(cast(PanelGridColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the most recently acive column on a grid.
      Returns: a #PanelGridColumn
  */
  gid.panel1.grid_column.GridColumn getMostRecentColumn() nothrow
  {
    PanelGridColumn* _cretval;
    _cretval = panel_grid_get_most_recent_column(cast(PanelGrid*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.grid_column.GridColumn)(cast(PanelGridColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the most recently acive frame on a grid.
      Returns: a #PanelGridFrame
  */
  gid.panel1.frame.Frame getMostRecentFrame() nothrow
  {
    PanelFrame* _cretval;
    _cretval = panel_grid_get_most_recent_frame(cast(PanelGrid*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.frame.Frame)(cast(PanelFrame*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the number of columns in the grid.
      Returns: The number of columns.
  */
  uint getNColumns() nothrow
  {
    uint _retval;
    _retval = panel_grid_get_n_columns(cast(PanelGrid*)this._cPtr);
    return _retval;
  }

  /**
      Inserts a column at position.
  
      Params:
        position = The position to insert the column at.
  */
  void insertColumn(uint position) nothrow
  {
    panel_grid_insert_column(cast(PanelGrid*)this._cPtr, position);
  }

  /**
      Connect to `CreateFrame` signal.
  
      The "create-frame" signal is used to create a new frame within
        the grid.
        
        Consumers of this signal are required to return an unrooted
        #PanelFrame from this signal. The first signal handler wins.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.panel1.frame.Frame callback(gid.panel1.grid.Grid grid)`
  
          `grid` the instance the signal is connected to (optional)
  
          `Returns` an unrooted #PanelFrame
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCreateFrame(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T : gid.panel1.frame.Frame)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.panel1.grid.Grid)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.panel1.frame.Frame _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.grid.Grid.createFrame");
      }

      setVal!(gid.panel1.frame.Frame)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-frame", closure, after);
  }
}

/// Fluent builder implementation template for [gid.panel1.grid.Grid]
class GridGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [gid.panel1.grid.Grid]
final class GridGidBuilder : GridGidBuilderImpl!GridGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Grid build() nothrow
  {
    return new Grid(cast(void*)createGObject(Grid._getGType), Yes.Take);
  }
}
