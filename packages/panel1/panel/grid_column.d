/// Module for [GridColumn] class
module panel.grid_column;

import gid.gid;
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
import panel.types;

/** */
class GridColumn : gtk.widget.Widget
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
    return cast(void function())panel_grid_column_get_type != &gidSymbolNotFound ? panel_grid_column_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GridColumn self()
  {
    return this;
  }

  /** */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_grid_column_new();
    this(_cretval, No.Take);
  }

  /**
      Invokes a callback for each frame in the grid column.
  
      Params:
        callback = a function to be called on each frame
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
    panel_grid_column_foreach_frame(cast(PanelGridColumn*)this._cPtr, _callbackCB, _callback);
  }

  /** */
  bool getEmpty()
  {
    bool _retval;
    _retval = cast(bool)panel_grid_column_get_empty(cast(PanelGridColumn*)this._cPtr);
    return _retval;
  }

  /**
      Gets the most recently acive frame on a grid column.
      Returns: a #PanelGridFrame
  */
  panel.frame.Frame getMostRecentFrame()
  {
    PanelFrame* _cretval;
    _cretval = panel_grid_column_get_most_recent_frame(cast(PanelGridColumn*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.frame.Frame)(cast(PanelFrame*)_cretval, No.Take);
    return _retval;
  }

  /** */
  uint getNRows()
  {
    uint _retval;
    _retval = panel_grid_column_get_n_rows(cast(PanelGridColumn*)this._cPtr);
    return _retval;
  }

  /**
      Gets the frame corresponding to a row index.
  
      Params:
        row = the index of the row
      Returns: a #PanelGridFrame
  */
  panel.frame.Frame getRow(uint row)
  {
    PanelFrame* _cretval;
    _cretval = panel_grid_column_get_row(cast(PanelGridColumn*)this._cPtr, row);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.frame.Frame)(cast(PanelFrame*)_cretval, No.Take);
    return _retval;
  }
}
