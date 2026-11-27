/// Module for [LayoutIter] class
module gid.pango1.layout_iter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.layout;
import gid.pango1.layout_line;
import gid.pango1.types;

/**
    A [gid.pango1.layout_iter.LayoutIter] can be used to iterate over the visual
    extents of a [gid.pango1.layout.Layout].
    
    To obtain a [gid.pango1.layout_iter.LayoutIter], use [gid.pango1.layout.Layout.getIter].
    
    The [gid.pango1.layout_iter.LayoutIter] structure is opaque, and has no user-visible fields.
*/
@gidGir("LayoutIter")
class LayoutIter : gid.gobject2.boxed.BoxedWrap!(pango_layout_iter_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override LayoutIter self() nothrow
  {
    return this;
  }

  /**
      Determines whether iter is on the last line of the layout.
      Returns: true if iter is on the last line
  */
  bool atLastLine() nothrow
  {
    bool _retval;
    _retval = cast(bool)pango_layout_iter_at_last_line(cast(PangoLayoutIter*)this._cPtr);
    return _retval;
  }

  /**
      Copies a [gid.pango1.layout_iter.LayoutIter].
      Returns: the newly allocated [gid.pango1.layout_iter.LayoutIter]
  */
  gid.pango1.layout_iter.LayoutIter copy() nothrow
  {
    PangoLayoutIter* _cretval;
    _cretval = pango_layout_iter_copy(cast(PangoLayoutIter*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.layout_iter.LayoutIter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the Y position of the current line's baseline, in layout
      coordinates.
      
      Layout coordinates have the origin at the top left of the entire layout.
      Returns: baseline of current line
  */
  int getBaseline() nothrow
  {
    int _retval;
    _retval = pango_layout_iter_get_baseline(cast(PangoLayoutIter*)this._cPtr);
    return _retval;
  }

  /**
      Gets the extents of the current character, in layout coordinates.
      
      Layout coordinates have the origin at the top left of the entire layout.
      
      Only logical extents can sensibly be obtained for characters;
      ink extents make sense only down to the level of clusters.
  
      Params:
        logicalRect = rectangle to fill with
            logical extents
  */
  void getCharExtents(out gid.pango1.types.Rectangle logicalRect) nothrow
  {
    pango_layout_iter_get_char_extents(cast(PangoLayoutIter*)this._cPtr, cast(PangoRectangle*)&logicalRect);
  }

  /**
      Gets the extents of the current cluster, in layout coordinates.
      
      Layout coordinates have the origin at the top left of the entire layout.
  
      Params:
        inkRect = rectangle to fill with ink extents
        logicalRect = rectangle to fill with logical extents
  */
  void getClusterExtents(out gid.pango1.types.Rectangle inkRect, out gid.pango1.types.Rectangle logicalRect) nothrow
  {
    pango_layout_iter_get_cluster_extents(cast(PangoLayoutIter*)this._cPtr, cast(PangoRectangle*)&inkRect, cast(PangoRectangle*)&logicalRect);
  }

  /**
      Gets the current byte index.
      
      Note that iterating forward by char moves in visual order,
      not logical order, so indexes may not be sequential. Also,
      the index may be equal to the length of the text in the
      layout, if on the null run (see [gid.pango1.layout_iter.LayoutIter.getRun]).
      Returns: current byte index
  */
  int getIndex() nothrow
  {
    int _retval;
    _retval = pango_layout_iter_get_index(cast(PangoLayoutIter*)this._cPtr);
    return _retval;
  }

  /**
      Gets the layout associated with a [gid.pango1.layout_iter.LayoutIter].
      Returns: the layout associated with iter
  */
  gid.pango1.layout.Layout getLayout() nothrow
  {
    PangoLayout* _cretval;
    _cretval = pango_layout_iter_get_layout(cast(PangoLayoutIter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.layout.Layout)(cast(PangoLayout*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the extents of the [gid.pango1.layout.Layout] being iterated over.
  
      Params:
        inkRect = rectangle to fill with ink extents
        logicalRect = rectangle to fill with logical extents
  */
  void getLayoutExtents(out gid.pango1.types.Rectangle inkRect, out gid.pango1.types.Rectangle logicalRect) nothrow
  {
    pango_layout_iter_get_layout_extents(cast(PangoLayoutIter*)this._cPtr, cast(PangoRectangle*)&inkRect, cast(PangoRectangle*)&logicalRect);
  }

  /**
      Gets the current line.
      
      Use the faster [gid.pango1.layout_iter.LayoutIter.getLineReadonly] if
      you do not plan to modify the contents of the line (glyphs,
      glyph widths, etc.).
      Returns: the current line
  */
  gid.pango1.layout_line.LayoutLine getLine() nothrow
  {
    PangoLayoutLine* _cretval;
    _cretval = pango_layout_iter_get_line(cast(PangoLayoutIter*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.layout_line.LayoutLine(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Obtains the extents of the current line.
      
      Extents are in layout coordinates (origin is the top-left corner
      of the entire [gid.pango1.layout.Layout]). Thus the extents returned by this
      function will be the same width/height but not at the same x/y
      as the extents returned from [gid.pango1.layout_line.LayoutLine.getExtents].
  
      Params:
        inkRect = rectangle to fill with ink extents
        logicalRect = rectangle to fill with logical extents
  */
  void getLineExtents(out gid.pango1.types.Rectangle inkRect, out gid.pango1.types.Rectangle logicalRect) nothrow
  {
    pango_layout_iter_get_line_extents(cast(PangoLayoutIter*)this._cPtr, cast(PangoRectangle*)&inkRect, cast(PangoRectangle*)&logicalRect);
  }

  /**
      Gets the current line for read-only access.
      
      This is a faster alternative to [gid.pango1.layout_iter.LayoutIter.getLine],
      but the user is not expected to modify the contents of the line
      (glyphs, glyph widths, etc.).
      Returns: the current line, that should not be
          modified
  */
  gid.pango1.layout_line.LayoutLine getLineReadonly() nothrow
  {
    PangoLayoutLine* _cretval;
    _cretval = pango_layout_iter_get_line_readonly(cast(PangoLayoutIter*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.layout_line.LayoutLine(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Divides the vertical space in the [gid.pango1.layout.Layout] being iterated over
      between the lines in the layout, and returns the space belonging to
      the current line.
      
      A line's range includes the line's logical extents. plus half of the
      spacing above and below the line, if [gid.pango1.layout.Layout.setSpacing]
      has been called to set layout spacing. The Y positions are in layout
      coordinates (origin at top left of the entire layout).
      
      Note: Since 1.44, Pango uses line heights for placing lines, and there
      may be gaps between the ranges returned by this function.
  
      Params:
        y0 = start of line
        y1 = end of line
  */
  void getLineYrange(out int y0, out int y1) nothrow
  {
    pango_layout_iter_get_line_yrange(cast(PangoLayoutIter*)this._cPtr, cast(int*)&y0, cast(int*)&y1);
  }

  /**
      Gets the current run.
      
      When iterating by run, at the end of each line, there's a position
      with a null run, so this function can return null. The null run
      at the end of each line ensures that all lines have at least one run,
      even lines consisting of only a newline.
      
      Use the faster [gid.pango1.layout_iter.LayoutIter.getRunReadonly] if you do not
      plan to modify the contents of the run (glyphs, glyph widths, etc.).
      Returns: the current run
  */
  gid.pango1.types.LayoutRun getRun() nothrow
  {
    PangoLayoutRun* _cretval;
    _cretval = pango_layout_iter_get_run(cast(PangoLayoutIter*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.types.LayoutRun(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the Y position of the current run's baseline, in layout
      coordinates.
      
      Layout coordinates have the origin at the top left of the entire layout.
      
      The run baseline can be different from the line baseline, for
      example due to superscript or subscript positioning.
      Returns: 
  */
  int getRunBaseline() nothrow
  {
    int _retval;
    _retval = pango_layout_iter_get_run_baseline(cast(PangoLayoutIter*)this._cPtr);
    return _retval;
  }

  /**
      Gets the extents of the current run in layout coordinates.
      
      Layout coordinates have the origin at the top left of the entire layout.
  
      Params:
        inkRect = rectangle to fill with ink extents
        logicalRect = rectangle to fill with logical extents
  */
  void getRunExtents(out gid.pango1.types.Rectangle inkRect, out gid.pango1.types.Rectangle logicalRect) nothrow
  {
    pango_layout_iter_get_run_extents(cast(PangoLayoutIter*)this._cPtr, cast(PangoRectangle*)&inkRect, cast(PangoRectangle*)&logicalRect);
  }

  /**
      Gets the current run for read-only access.
      
      When iterating by run, at the end of each line, there's a position
      with a null run, so this function can return null. The null run
      at the end of each line ensures that all lines have at least one run,
      even lines consisting of only a newline.
      
      This is a faster alternative to [gid.pango1.layout_iter.LayoutIter.getRun],
      but the user is not expected to modify the contents of the run (glyphs,
      glyph widths, etc.).
      Returns: the current run, that
          should not be modified
  */
  gid.pango1.types.LayoutRun getRunReadonly() nothrow
  {
    PangoLayoutRun* _cretval;
    _cretval = pango_layout_iter_get_run_readonly(cast(PangoLayoutIter*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.types.LayoutRun(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Moves iter forward to the next character in visual order.
      
      If iter was already at the end of the layout, returns false.
      Returns: whether motion was possible
  */
  bool nextChar() nothrow
  {
    bool _retval;
    _retval = cast(bool)pango_layout_iter_next_char(cast(PangoLayoutIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves iter forward to the next cluster in visual order.
      
      If iter was already at the end of the layout, returns false.
      Returns: whether motion was possible
  */
  bool nextCluster() nothrow
  {
    bool _retval;
    _retval = cast(bool)pango_layout_iter_next_cluster(cast(PangoLayoutIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves iter forward to the start of the next line.
      
      If iter is already on the last line, returns false.
      Returns: whether motion was possible
  */
  bool nextLine() nothrow
  {
    bool _retval;
    _retval = cast(bool)pango_layout_iter_next_line(cast(PangoLayoutIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves iter forward to the next run in visual order.
      
      If iter was already at the end of the layout, returns false.
      Returns: whether motion was possible
  */
  bool nextRun() nothrow
  {
    bool _retval;
    _retval = cast(bool)pango_layout_iter_next_run(cast(PangoLayoutIter*)this._cPtr);
    return _retval;
  }
}
