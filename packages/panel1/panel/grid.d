/// Module for [Grid] class
module panel.grid;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.dclosure;
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
import panel.grid_column;
import panel.types;
import panel.widget;

/**
    The #PanelGrid is a widget used to layout the dock item in the
    center area.
*/
class Grid : gtk.widget.Widget
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
    return cast(void function())panel_grid_get_type != &gidSymbolNotFound ? panel_grid_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Grid self()
  {
    return this;
  }

  /**
      Creates a new #PanelGrid.
      Returns: a newly created #PanelGrid
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_grid_new();
    this(_cretval, No.Take);
  }

  /**
      Add a #PanelWidget to the grid.
  
      Params:
        widget = a #PanelWidget the widget to add.
  */
  void add(panel.widget.Widget widget)
  {
    panel_grid_add(cast(PanelGrid*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Request to close, asynchronously. This will display the save dialog.
  
      Params:
        cancellable = 
        callback = callback called when ready
  */
  void agreeToCloseAsync(gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    panel_grid_agree_to_close_async(cast(PanelGrid*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  bool agreeToCloseFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)panel_grid_agree_to_close_finish(cast(PanelGrid*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Calls callback for each #PanelFrame within grid.
  
      Params:
        callback = a #PanelFrameCallback
  */
  void foreachFrame(panel.types.FrameCallback callback)
  {
    extern(C) void _callbackCallback(PanelFrame* frame, void* userData)
    {
      auto _dlg = cast(panel.types.FrameCallback*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(panel.frame.Frame)(cast(void*)frame, No.Take));
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
  panel.grid_column.GridColumn getColumn(uint column)
  {
    PanelGridColumn* _cretval;
    _cretval = panel_grid_get_column(cast(PanelGrid*)this._cPtr, column);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.grid_column.GridColumn)(cast(PanelGridColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the most recently acive column on a grid.
      Returns: a #PanelGridColumn
  */
  panel.grid_column.GridColumn getMostRecentColumn()
  {
    PanelGridColumn* _cretval;
    _cretval = panel_grid_get_most_recent_column(cast(PanelGrid*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.grid_column.GridColumn)(cast(PanelGridColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the most recently acive frame on a grid.
      Returns: a #PanelGridFrame
  */
  panel.frame.Frame getMostRecentFrame()
  {
    PanelFrame* _cretval;
    _cretval = panel_grid_get_most_recent_frame(cast(PanelGrid*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.frame.Frame)(cast(PanelFrame*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the number of columns in the grid.
      Returns: The number of columns.
  */
  uint getNColumns()
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
  void insertColumn(uint position)
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
  
          $(D panel.frame.Frame callback(panel.grid.Grid grid))
  
          `grid` the instance the signal is connected to (optional)
  
          `Returns` an unrooted #PanelFrame
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreateFrame(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : panel.frame.Frame)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.grid.Grid)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(panel.frame.Frame)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-frame", closure, after);
  }
}
