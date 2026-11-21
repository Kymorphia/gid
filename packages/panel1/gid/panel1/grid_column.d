/// Module for [GridColumn] class
module gid.panel1.grid_column;

public import gid.core.basictypes;
import gid.core.gid;
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
import gid.panel1.types;

/** */
class GridColumn : gid.gtk4.widget.Widget
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
    return cast(void function())panel_grid_column_get_type != &gidSymbolNotFound ? panel_grid_column_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelGridColumn";
  }

  /** Returns `this`, for use in `with` statements. */
  override GridColumn self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.grid_column.GridColumn]
      Returns: New builder object
  */
  static GridColumnGidBuilder builder() nothrow
  {
    return new GridColumnGidBuilder;
  }

  /** */
  this() nothrow
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
  void foreachFrame(gid.panel1.types.FrameCallback callback) nothrow
  {
    extern(C) void _callbackCallback(PanelFrame* frame, void* userData) nothrow
    {
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
    panel_grid_column_foreach_frame(cast(PanelGridColumn*)this._cPtr, _callbackCB, _callback);
  }

  /** */
  bool getEmpty() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_grid_column_get_empty(cast(PanelGridColumn*)this._cPtr);
    return _retval;
  }

  /**
      Gets the most recently acive frame on a grid column.
      Returns: a #PanelGridFrame
  */
  gid.panel1.frame.Frame getMostRecentFrame() nothrow
  {
    PanelFrame* _cretval;
    _cretval = panel_grid_column_get_most_recent_frame(cast(PanelGridColumn*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.frame.Frame)(cast(PanelFrame*)_cretval, No.Take);
    return _retval;
  }

  /** */
  uint getNRows() nothrow
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
  gid.panel1.frame.Frame getRow(uint row) nothrow
  {
    PanelFrame* _cretval;
    _cretval = panel_grid_column_get_row(cast(PanelGridColumn*)this._cPtr, row);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.frame.Frame)(cast(PanelFrame*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.panel1.grid_column.GridColumn]
class GridColumnGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [gid.panel1.grid_column.GridColumn]
final class GridColumnGidBuilder : GridColumnGidBuilderImpl!GridColumnGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GridColumn build() nothrow
  {
    return new GridColumn(cast(void*)createGObject(GridColumn._getGType), Yes.Take);
  }
}
