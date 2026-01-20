/// Module for [CellRendererProgress] class
module gtk.cell_renderer_progress;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    Renders numbers as progress bars
    
    [gtk.cell_renderer_progress.CellRendererProgress] renders a numeric value as a progress par in a cell.
    Additionally, it can display a text on top of the progress bar.

    Deprecated: List views use widgets to display their contents.
        You should use [gtk.progress_bar.ProgressBar] instead
*/
class CellRendererProgress : gtk.cell_renderer.CellRenderer, gtk.orientable.Orientable
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
    return cast(void function())gtk_cell_renderer_progress_get_type != &gidSymbolNotFound ? gtk_cell_renderer_progress_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererProgress self()
  {
    return this;
  }

  /** */
  @property bool inverted()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("inverted");
  }

  /** */
  @property void inverted(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("inverted", propval);
  }

  /**
      Get `pulse` property.
      Returns: Setting this to a non-negative value causes the cell renderer to
        enter "activity mode", where a block bounces back and forth to
        indicate that some progress is made, without specifying exactly how
        much.
        
        Each increment of the property causes the block to move by a little
        bit.
        
        To indicate that the activity has not started yet, set the property
        to zero. To indicate completion, set the property to `G_MAXINT`.
  */
  @property int pulse()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pulse");
  }

  /**
      Set `pulse` property.
      Params:
        propval = Setting this to a non-negative value causes the cell renderer to
          enter "activity mode", where a block bounces back and forth to
          indicate that some progress is made, without specifying exactly how
          much.
          
          Each increment of the property causes the block to move by a little
          bit.
          
          To indicate that the activity has not started yet, set the property
          to zero. To indicate completion, set the property to `G_MAXINT`.
  */
  @property void pulse(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("pulse", propval);
  }

  /**
      Get `text` property.
      Returns: The "text" property determines the label which will be drawn
        over the progress bar. Setting this property to null causes the default
        label to be displayed. Setting this property to an empty string causes
        no label to be displayed.
  */
  @property string text()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Set `text` property.
      Params:
        propval = The "text" property determines the label which will be drawn
          over the progress bar. Setting this property to null causes the default
          label to be displayed. Setting this property to an empty string causes
          no label to be displayed.
  */
  @property void text(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Get `textXalign` property.
      Returns: The "text-xalign" property controls the horizontal alignment of the
        text in the progress bar.  Valid values range from 0 (left) to 1
        (right).  Reserved for RTL layouts.
  */
  @property float textXalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("text-xalign");
  }

  /**
      Set `textXalign` property.
      Params:
        propval = The "text-xalign" property controls the horizontal alignment of the
          text in the progress bar.  Valid values range from 0 (left) to 1
          (right).  Reserved for RTL layouts.
  */
  @property void textXalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("text-xalign", propval);
  }

  /**
      Get `textYalign` property.
      Returns: The "text-yalign" property controls the vertical alignment of the
        text in the progress bar.  Valid values range from 0 (top) to 1
        (bottom).
  */
  @property float textYalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("text-yalign");
  }

  /**
      Set `textYalign` property.
      Params:
        propval = The "text-yalign" property controls the vertical alignment of the
          text in the progress bar.  Valid values range from 0 (top) to 1
          (bottom).
  */
  @property void textYalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("text-yalign", propval);
  }

  /**
      Get `value` property.
      Returns: The "value" property determines the percentage to which the
        progress bar will be "filled in".
  */
  @property int value()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("value");
  }

  /**
      Set `value` property.
      Params:
        propval = The "value" property determines the percentage to which the
          progress bar will be "filled in".
  */
  @property void value(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("value", propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [gtk.cell_renderer_progress.CellRendererProgress].
      Returns: the new cell renderer
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_progress_new();
    this(_cretval, No.Take);
  }
}
