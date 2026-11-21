/// Module for [CellRendererSpinner] class
module gid.gtk4.cell_renderer_spinner;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.cell_renderer;
import gid.gtk4.types;

/**
    Renders a spinning animation in a cell
    
    [gid.gtk4.cell_renderer_spinner.CellRendererSpinner] renders a spinning animation in a cell, very
    similar to [gid.gtk4.spinner.Spinner]. It can often be used as an alternative
    to a [gid.gtk4.cell_renderer_progress.CellRendererProgress] for displaying indefinite activity,
    instead of actual progress.
    
    To start the animation in a cell, set the `GtkCellRendererSpinner:active`
    property to true and increment the `GtkCellRendererSpinner:pulse` property
    at regular intervals. The usual way to set the cell renderer properties
    for each cell is to bind them to columns in your tree model using e.g.
    [gid.gtk4.tree_view_column.TreeViewColumn.addAttribute].

    Deprecated: List views use widgets to display their contents.
        You should use [gid.gtk4.spinner.Spinner] instead
*/
class CellRendererSpinner : gid.gtk4.cell_renderer.CellRenderer
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
    return cast(void function())gtk_cell_renderer_spinner_get_type != &gidSymbolNotFound ? gtk_cell_renderer_spinner_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellRendererSpinner";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererSpinner self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.cell_renderer_spinner.CellRendererSpinner]
      Returns: New builder object
  */
  static CellRendererSpinnerGidBuilder builder() nothrow
  {
    return new CellRendererSpinnerGidBuilder;
  }

  /**
      Get `active` property.
      Returns: Whether the spinner is active (ie. shown) in the cell
  */
  @property bool active() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("active");
  }

  /**
      Set `active` property.
      Params:
        propval = Whether the spinner is active (ie. shown) in the cell
  */
  @property void active(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("active", propval);
  }

  /**
      Get `pulse` property.
      Returns: Pulse of the spinner. Increment this value to draw the next frame of the
        spinner animation. Usually, you would update this value in a timeout.
        
        By default, the [gid.gtk4.spinner.Spinner] widget draws one full cycle of the animation,
        consisting of 12 frames, in 750 milliseconds.
  */
  @property uint pulse() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("pulse");
  }

  /**
      Set `pulse` property.
      Params:
        propval = Pulse of the spinner. Increment this value to draw the next frame of the
          spinner animation. Usually, you would update this value in a timeout.
          
          By default, the [gid.gtk4.spinner.Spinner] widget draws one full cycle of the animation,
          consisting of 12 frames, in 750 milliseconds.
  */
  @property void pulse(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("pulse", propval);
  }

  /**
      Get `size` property.
      Returns: The [gid.gtk4.types.IconSize] value that specifies the size of the rendered spinner.
  */
  @property gid.gtk4.types.IconSize size() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.types.IconSize)("size");
  }

  /**
      Set `size` property.
      Params:
        propval = The [gid.gtk4.types.IconSize] value that specifies the size of the rendered spinner.
  */
  @property void size(gid.gtk4.types.IconSize propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.types.IconSize)("size", propval);
  }

  /**
      Returns a new cell renderer which will show a spinner to indicate
      activity.
      Returns: a new [gid.gtk4.cell_renderer.CellRenderer]
  */
  this() nothrow
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_spinner_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gid.gtk4.cell_renderer_spinner.CellRendererSpinner]
class CellRendererSpinnerGidBuilderImpl(T) : gid.gtk4.cell_renderer.CellRendererGidBuilderImpl!T
{

  /**
      Set `active` property.
      Params:
        propval = Whether the spinner is active (ie. shown) in the cell
      Returns: Builder instance for fluent chaining
  */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }

  /**
      Set `pulse` property.
      Params:
        propval = Pulse of the spinner. Increment this value to draw the next frame of the
          spinner animation. Usually, you would update this value in a timeout.
          
          By default, the [gid.gtk4.spinner.Spinner] widget draws one full cycle of the animation,
          consisting of 12 frames, in 750 milliseconds.
      Returns: Builder instance for fluent chaining
  */
  T pulse(uint propval) nothrow
  {
    return setProperty("pulse", propval);
  }

  /**
      Set `size` property.
      Params:
        propval = The [gid.gtk4.types.IconSize] value that specifies the size of the rendered spinner.
      Returns: Builder instance for fluent chaining
  */
  T size(gid.gtk4.types.IconSize propval) nothrow
  {
    return setProperty("size", propval);
  }
}

/// Fluent builder for [gid.gtk4.cell_renderer_spinner.CellRendererSpinner]
final class CellRendererSpinnerGidBuilder : CellRendererSpinnerGidBuilderImpl!CellRendererSpinnerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellRendererSpinner build() nothrow
  {
    return new CellRendererSpinner(cast(void*)createGObject(CellRendererSpinner._getGType), Yes.Take);
  }
}
