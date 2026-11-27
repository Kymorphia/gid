/// Module for [CellRendererProgress] class
module gid.gtk3.cell_renderer_progress;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_renderer;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;

/**
    #GtkCellRendererProgress renders a numeric value as a progress par in a cell.
    Additionally, it can display a text on top of the progress bar.
    
    The #GtkCellRendererProgress cell renderer was added in GTK+ 2.6.
*/
@gidGir("CellRendererProgress", "CellRendererProgressClass")
class CellRendererProgress : gid.gtk3.cell_renderer.CellRenderer, gid.gtk3.orientable.Orientable
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
    return cast(void function())gtk_cell_renderer_progress_get_type != &gidSymbolNotFound ? gtk_cell_renderer_progress_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellRendererProgress";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererProgress self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.cell_renderer_progress.CellRendererProgress]
      Returns: New builder object
  */
  static CellRendererProgressGidBuilder builder() nothrow
  {
    return new CellRendererProgressGidBuilder;
  }

  /** */
  @property bool inverted() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("inverted");
  }

  /** */
  @property void inverted(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("inverted", propval);
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
  @property int pulse() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("pulse");
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
  @property void pulse(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("pulse", propval);
  }

  /**
      Get `text` property.
      Returns: The "text" property determines the label which will be drawn
        over the progress bar. Setting this property to null causes the default
        label to be displayed. Setting this property to an empty string causes
        no label to be displayed.
  */
  @property string text() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Set `text` property.
      Params:
        propval = The "text" property determines the label which will be drawn
          over the progress bar. Setting this property to null causes the default
          label to be displayed. Setting this property to an empty string causes
          no label to be displayed.
  */
  @property void text(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Get `textXalign` property.
      Returns: The "text-xalign" property controls the horizontal alignment of the
        text in the progress bar.  Valid values range from 0 (left) to 1
        (right).  Reserved for RTL layouts.
  */
  @property float textXalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("text-xalign");
  }

  /**
      Set `textXalign` property.
      Params:
        propval = The "text-xalign" property controls the horizontal alignment of the
          text in the progress bar.  Valid values range from 0 (left) to 1
          (right).  Reserved for RTL layouts.
  */
  @property void textXalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("text-xalign", propval);
  }

  /**
      Get `textYalign` property.
      Returns: The "text-yalign" property controls the vertical alignment of the
        text in the progress bar.  Valid values range from 0 (top) to 1
        (bottom).
  */
  @property float textYalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("text-yalign");
  }

  /**
      Set `textYalign` property.
      Params:
        propval = The "text-yalign" property controls the vertical alignment of the
          text in the progress bar.  Valid values range from 0 (top) to 1
          (bottom).
  */
  @property void textYalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("text-yalign", propval);
  }

  /**
      Get `value` property.
      Returns: The "value" property determines the percentage to which the
        progress bar will be "filled in".
  */
  @property int value() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("value");
  }

  /**
      Set `value` property.
      Params:
        propval = The "value" property determines the percentage to which the
          progress bar will be "filled in".
  */
  @property void value(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("value", propval);
  }

  mixin OrientableT!();

  /**
      Creates a new #GtkCellRendererProgress.
      Returns: the new cell renderer
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkCellRenderer* _cretval;
      _cretval = gtk_cell_renderer_progress_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_renderer_progress.CellRendererProgress]
class CellRendererProgressGidBuilderImpl(T) : gid.gtk3.cell_renderer.CellRendererGidBuilderImpl!T, gid.gtk3.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /** */
  T inverted(bool propval) nothrow
  {
    return setProperty("inverted", propval);
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
      Returns: Builder instance for fluent chaining
  */
  T pulse(int propval) nothrow
  {
    return setProperty("pulse", propval);
  }

  /**
      Set `text` property.
      Params:
        propval = The "text" property determines the label which will be drawn
          over the progress bar. Setting this property to null causes the default
          label to be displayed. Setting this property to an empty string causes
          no label to be displayed.
      Returns: Builder instance for fluent chaining
  */
  T text(string propval) nothrow
  {
    return setProperty("text", propval);
  }

  /**
      Set `textXalign` property.
      Params:
        propval = The "text-xalign" property controls the horizontal alignment of the
          text in the progress bar.  Valid values range from 0 (left) to 1
          (right).  Reserved for RTL layouts.
      Returns: Builder instance for fluent chaining
  */
  T textXalign(float propval) nothrow
  {
    return setProperty("text-xalign", propval);
  }

  /**
      Set `textYalign` property.
      Params:
        propval = The "text-yalign" property controls the vertical alignment of the
          text in the progress bar.  Valid values range from 0 (top) to 1
          (bottom).
      Returns: Builder instance for fluent chaining
  */
  T textYalign(float propval) nothrow
  {
    return setProperty("text-yalign", propval);
  }

  /**
      Set `value` property.
      Params:
        propval = The "value" property determines the percentage to which the
          progress bar will be "filled in".
      Returns: Builder instance for fluent chaining
  */
  T value(int propval) nothrow
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [gid.gtk3.cell_renderer_progress.CellRendererProgress]
final class CellRendererProgressGidBuilder : CellRendererProgressGidBuilderImpl!CellRendererProgressGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellRendererProgress build() nothrow
  {
    return new CellRendererProgress(cast(void*)createGObject(CellRendererProgress._getGType), Yes.Take);
  }
}
