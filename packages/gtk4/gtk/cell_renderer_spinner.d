/// Module for [CellRendererSpinner] class
module gtk.cell_renderer_spinner;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.types;

/**
    Renders a spinning animation in a cell
    
    [gtk.cell_renderer_spinner.CellRendererSpinner] renders a spinning animation in a cell, very
    similar to [gtk.spinner.Spinner]. It can often be used as an alternative
    to a [gtk.cell_renderer_progress.CellRendererProgress] for displaying indefinite activity,
    instead of actual progress.
    
    To start the animation in a cell, set the `GtkCellRendererSpinner:active`
    property to true and increment the `GtkCellRendererSpinner:pulse` property
    at regular intervals. The usual way to set the cell renderer properties
    for each cell is to bind them to columns in your tree model using e.g.
    [gtk.tree_view_column.TreeViewColumn.addAttribute].

    Deprecated: List views use widgets to display their contents.
        You should use [gtk.spinner.Spinner] instead
*/
class CellRendererSpinner : gtk.cell_renderer.CellRenderer
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
    return cast(void function())gtk_cell_renderer_spinner_get_type != &gidSymbolNotFound ? gtk_cell_renderer_spinner_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererSpinner self()
  {
    return this;
  }

  /** */
  @property bool active()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("active");
  }

  /** */
  @property void active(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("active", propval);
  }

  /**
      Get `pulse` property.
      Returns: Pulse of the spinner. Increment this value to draw the next frame of the
        spinner animation. Usually, you would update this value in a timeout.
        
        By default, the [gtk.spinner.Spinner] widget draws one full cycle of the animation,
        consisting of 12 frames, in 750 milliseconds.
  */
  @property uint pulse()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("pulse");
  }

  /**
      Set `pulse` property.
      Params:
        propval = Pulse of the spinner. Increment this value to draw the next frame of the
          spinner animation. Usually, you would update this value in a timeout.
          
          By default, the [gtk.spinner.Spinner] widget draws one full cycle of the animation,
          consisting of 12 frames, in 750 milliseconds.
  */
  @property void pulse(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("pulse", propval);
  }

  /**
      Get `size` property.
      Returns: The [gtk.types.IconSize] value that specifies the size of the rendered spinner.
  */
  @property gtk.types.IconSize size()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.IconSize)("size");
  }

  /**
      Set `size` property.
      Params:
        propval = The [gtk.types.IconSize] value that specifies the size of the rendered spinner.
  */
  @property void size(gtk.types.IconSize propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.IconSize)("size", propval);
  }

  /**
      Returns a new cell renderer which will show a spinner to indicate
      activity.
      Returns: a new [gtk.cell_renderer.CellRenderer]
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_spinner_new();
    this(_cretval, No.Take);
  }
}
