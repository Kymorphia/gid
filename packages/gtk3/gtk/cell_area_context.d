/// Module for [CellAreaContext] class
module gtk.cell_area_context;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_area;
import gtk.types;

/**
    The #GtkCellAreaContext object is created by a given #GtkCellArea
    implementation via its #GtkCellAreaClass.create_context() virtual
    method and is used to store cell sizes and alignments for a series of
    #GtkTreeModel rows that are requested and rendered in the same context.
    
    #GtkCellLayout widgets can create any number of contexts in which to
    request and render groups of data rows. However, it’s important that the
    same context which was used to request sizes for a given #GtkTreeModel
    row also be used for the same row when calling other #GtkCellArea APIs
    such as [gtk.cell_area.CellArea.render] and [gtk.cell_area.CellArea.event].
*/
class CellAreaContext : gobject.object.ObjectWrap
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
    return cast(void function())gtk_cell_area_context_get_type != &gidSymbolNotFound ? gtk_cell_area_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellAreaContext self()
  {
    return this;
  }

  /**
      Get `minimumHeight` property.
      Returns: The minimum height for the #GtkCellArea in this context
        for all #GtkTreeModel rows that this context was requested
        for using [gtk.cell_area.CellArea.getPreferredHeight].
  */
  @property int minimumHeight()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("minimum-height");
  }

  /**
      Get `minimumWidth` property.
      Returns: The minimum width for the #GtkCellArea in this context
        for all #GtkTreeModel rows that this context was requested
        for using [gtk.cell_area.CellArea.getPreferredWidth].
  */
  @property int minimumWidth()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("minimum-width");
  }

  /**
      Get `naturalHeight` property.
      Returns: The natural height for the #GtkCellArea in this context
        for all #GtkTreeModel rows that this context was requested
        for using [gtk.cell_area.CellArea.getPreferredHeight].
  */
  @property int naturalHeight()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("natural-height");
  }

  /**
      Get `naturalWidth` property.
      Returns: The natural width for the #GtkCellArea in this context
        for all #GtkTreeModel rows that this context was requested
        for using [gtk.cell_area.CellArea.getPreferredWidth].
  */
  @property int naturalWidth()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("natural-width");
  }

  /**
      Allocates a width and/or a height for all rows which are to be
      rendered with context.
      
      Usually allocation is performed only horizontally or sometimes
      vertically since a group of rows are usually rendered side by
      side vertically or horizontally and share either the same width
      or the same height. Sometimes they are allocated in both horizontal
      and vertical orientations producing a homogeneous effect of the
      rows. This is generally the case for #GtkTreeView when
      #GtkTreeView:fixed-height-mode is enabled.
      
      Since 3.0
  
      Params:
        width = the allocated width for all #GtkTreeModel rows rendered
              with context, or -1.
        height = the allocated height for all #GtkTreeModel rows rendered
              with context, or -1.
  */
  void allocate(int width, int height)
  {
    gtk_cell_area_context_allocate(cast(GtkCellAreaContext*)this._cPtr, width, height);
  }

  /**
      Fetches the current allocation size for context.
      
      If the context was not allocated in width or height, or if the
      context was recently reset with [gtk.cell_area_context.CellAreaContext.reset],
      the returned value will be -1.
  
      Params:
        width = location to store the allocated width, or null
        height = location to store the allocated height, or null
  */
  void getAllocation(out int width, out int height)
  {
    gtk_cell_area_context_get_allocation(cast(GtkCellAreaContext*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Fetches the #GtkCellArea this context was created by.
      
      This is generally unneeded by layouting widgets; however,
      it is important for the context implementation itself to
      fetch information about the area it is being used for.
      
      For instance at #GtkCellAreaContextClass.allocate() time
      it’s important to know details about any cell spacing
      that the #GtkCellArea is configured with in order to
      compute a proper allocation.
      Returns: the #GtkCellArea this context was created by.
  */
  gtk.cell_area.CellArea getArea()
  {
    GtkCellArea* _cretval;
    _cretval = gtk_cell_area_context_get_area(cast(GtkCellAreaContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_area.CellArea)(cast(GtkCellArea*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the accumulative preferred height for all rows which have been
      requested with this context.
      
      After [gtk.cell_area_context.CellAreaContext.reset] is called and/or before ever
      requesting the size of a #GtkCellArea, the returned values are 0.
  
      Params:
        minimumHeight = location to store the minimum height,
              or null
        naturalHeight = location to store the natural height,
              or null
  */
  void getPreferredHeight(out int minimumHeight, out int naturalHeight)
  {
    gtk_cell_area_context_get_preferred_height(cast(GtkCellAreaContext*)this._cPtr, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Gets the accumulative preferred height for width for all rows
      which have been requested for the same said width with this context.
      
      After [gtk.cell_area_context.CellAreaContext.reset] is called and/or before ever
      requesting the size of a #GtkCellArea, the returned values are -1.
  
      Params:
        width = a proposed width for allocation
        minimumHeight = location to store the minimum height,
              or null
        naturalHeight = location to store the natural height,
              or null
  */
  void getPreferredHeightForWidth(int width, out int minimumHeight, out int naturalHeight)
  {
    gtk_cell_area_context_get_preferred_height_for_width(cast(GtkCellAreaContext*)this._cPtr, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Gets the accumulative preferred width for all rows which have been
      requested with this context.
      
      After [gtk.cell_area_context.CellAreaContext.reset] is called and/or before ever
      requesting the size of a #GtkCellArea, the returned values are 0.
  
      Params:
        minimumWidth = location to store the minimum width,
              or null
        naturalWidth = location to store the natural width,
              or null
  */
  void getPreferredWidth(out int minimumWidth, out int naturalWidth)
  {
    gtk_cell_area_context_get_preferred_width(cast(GtkCellAreaContext*)this._cPtr, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Gets the accumulative preferred width for height for all rows which
      have been requested for the same said height with this context.
      
      After [gtk.cell_area_context.CellAreaContext.reset] is called and/or before ever
      requesting the size of a #GtkCellArea, the returned values are -1.
  
      Params:
        height = a proposed height for allocation
        minimumWidth = location to store the minimum width,
              or null
        naturalWidth = location to store the natural width,
              or null
  */
  void getPreferredWidthForHeight(int height, out int minimumWidth, out int naturalWidth)
  {
    gtk_cell_area_context_get_preferred_width_for_height(cast(GtkCellAreaContext*)this._cPtr, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Causes the minimum and/or natural height to grow if the new
      proposed sizes exceed the current minimum and natural height.
      
      This is used by #GtkCellAreaContext implementations during
      the request process over a series of #GtkTreeModel rows to
      progressively push the requested height over a series of
      [gtk.cell_area.CellArea.getPreferredHeight] requests.
  
      Params:
        minimumHeight = the proposed new minimum height for context
        naturalHeight = the proposed new natural height for context
  */
  void pushPreferredHeight(int minimumHeight, int naturalHeight)
  {
    gtk_cell_area_context_push_preferred_height(cast(GtkCellAreaContext*)this._cPtr, minimumHeight, naturalHeight);
  }

  /**
      Causes the minimum and/or natural width to grow if the new
      proposed sizes exceed the current minimum and natural width.
      
      This is used by #GtkCellAreaContext implementations during
      the request process over a series of #GtkTreeModel rows to
      progressively push the requested width over a series of
      [gtk.cell_area.CellArea.getPreferredWidth] requests.
  
      Params:
        minimumWidth = the proposed new minimum width for context
        naturalWidth = the proposed new natural width for context
  */
  void pushPreferredWidth(int minimumWidth, int naturalWidth)
  {
    gtk_cell_area_context_push_preferred_width(cast(GtkCellAreaContext*)this._cPtr, minimumWidth, naturalWidth);
  }

  /**
      Resets any previously cached request and allocation
      data.
      
      When underlying #GtkTreeModel data changes its
      important to reset the context if the content
      size is allowed to shrink. If the content size
      is only allowed to grow (this is usually an option
      for views rendering large data stores as a measure
      of optimization), then only the row that changed
      or was inserted needs to be (re)requested with
      [gtk.cell_area.CellArea.getPreferredWidth].
      
      When the new overall size of the context requires
      that the allocated size changes (or whenever this
      allocation changes at all), the variable row
      sizes need to be re-requested for every row.
      
      For instance, if the rows are displayed all with
      the same width from top to bottom then a change
      in the allocated width necessitates a recalculation
      of all the displayed row heights using
      [gtk.cell_area.CellArea.getPreferredHeightForWidth].
      
      Since 3.0
  */
  void reset()
  {
    gtk_cell_area_context_reset(cast(GtkCellAreaContext*)this._cPtr);
  }
}
