/// Module for [CellAreaContext] class
module gid.gtk3.cell_area_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_area;
import gid.gtk3.types;

/**
    The #GtkCellAreaContext object is created by a given #GtkCellArea
    implementation via its #GtkCellAreaClass.create_context() virtual
    method and is used to store cell sizes and alignments for a series of
    #GtkTreeModel rows that are requested and rendered in the same context.
    
    #GtkCellLayout widgets can create any number of contexts in which to
    request and render groups of data rows. However, it’s important that the
    same context which was used to request sizes for a given #GtkTreeModel
    row also be used for the same row when calling other #GtkCellArea APIs
    such as [gid.gtk3.cell_area.CellArea.render] and [gid.gtk4.cell_area.CellArea.event].
*/
@gidGir("CellAreaContext", "CellAreaContextClass")
class CellAreaContext : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_area_context_get_type != &gidSymbolNotFound ? gtk_cell_area_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellAreaContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellAreaContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.cell_area_context.CellAreaContext]
      Returns: New builder object
  */
  static CellAreaContextGidBuilder builder() nothrow
  {
    return new CellAreaContextGidBuilder;
  }

  /**
      Get `area` property.
      Returns: The #GtkCellArea this context was created by
  */
  @property gid.gtk3.cell_area.CellArea area() nothrow
  {
    return getArea();
  }

  /**
      Get `minimumHeight` property.
      Returns: The minimum height for the #GtkCellArea in this context
        for all #GtkTreeModel rows that this context was requested
        for using [gid.gtk4.cell_area.CellArea.getPreferredHeight].
  */
  @property int minimumHeight() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("minimum-height");
  }

  /**
      Get `minimumWidth` property.
      Returns: The minimum width for the #GtkCellArea in this context
        for all #GtkTreeModel rows that this context was requested
        for using [gid.gtk4.cell_area.CellArea.getPreferredWidth].
  */
  @property int minimumWidth() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("minimum-width");
  }

  /**
      Get `naturalHeight` property.
      Returns: The natural height for the #GtkCellArea in this context
        for all #GtkTreeModel rows that this context was requested
        for using [gid.gtk4.cell_area.CellArea.getPreferredHeight].
  */
  @property int naturalHeight() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("natural-height");
  }

  /**
      Get `naturalWidth` property.
      Returns: The natural width for the #GtkCellArea in this context
        for all #GtkTreeModel rows that this context was requested
        for using [gid.gtk4.cell_area.CellArea.getPreferredWidth].
  */
  @property int naturalWidth() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("natural-width");
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAllocate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncAllocate(int width, int height)
  {
    auto _klass = cast(GtkCellAreaContextClass*)_vfuncClass;
    if (!_klass.allocate)
      return;

    _klass.allocate(cast(GtkCellAreaContext*)this._cPtr, width, height);
  }

  /**
      Gets the accumulative preferred height for width for all rows
      which have been requested for the same said width with this context.
      
      After [gid.gtk4.cell_area_context.CellAreaContext.reset] is called and/or before ever
      requesting the size of a #GtkCellArea, the returned values are -1.
  
      Params:
        width = a proposed width for allocation
        minimumHeight = location to store the minimum height,
              or null
        naturalHeight = location to store the natural height,
              or null
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredHeightForWidth` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredHeightForWidth(int width, out int minimumHeight, out int naturalHeight)
  {
    auto _klass = cast(GtkCellAreaContextClass*)_vfuncClass;
    if (!_klass.getPreferredHeightForWidth)
      return;

    _klass.getPreferredHeightForWidth(cast(GtkCellAreaContext*)this._cPtr, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Gets the accumulative preferred width for height for all rows which
      have been requested for the same said height with this context.
      
      After [gid.gtk4.cell_area_context.CellAreaContext.reset] is called and/or before ever
      requesting the size of a #GtkCellArea, the returned values are -1.
  
      Params:
        height = a proposed height for allocation
        minimumWidth = location to store the minimum width,
              or null
        naturalWidth = location to store the natural width,
              or null
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredWidthForHeight` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredWidthForHeight(int height, out int minimumWidth, out int naturalWidth)
  {
    auto _klass = cast(GtkCellAreaContextClass*)_vfuncClass;
    if (!_klass.getPreferredWidthForHeight)
      return;

    _klass.getPreferredWidthForHeight(cast(GtkCellAreaContext*)this._cPtr, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
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
      [gid.gtk4.cell_area.CellArea.getPreferredWidth].
      
      When the new overall size of the context requires
      that the allocated size changes (or whenever this
      allocation changes at all), the variable row
      sizes need to be re-requested for every row.
      
      For instance, if the rows are displayed all with
      the same width from top to bottom then a change
      in the allocated width necessitates a recalculation
      of all the displayed row heights using
      [gid.gtk4.cell_area.CellArea.getPreferredHeightForWidth].
      
      Since 3.0
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReset` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncReset()
  {
    auto _klass = cast(GtkCellAreaContextClass*)_vfuncClass;
    if (!_klass.reset)
      return;

    _klass.reset(cast(GtkCellAreaContext*)this._cPtr);
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
  void allocate(int width, int height) nothrow
  {
    gtk_cell_area_context_allocate(cast(GtkCellAreaContext*)this._cPtr, width, height);
  }

  /**
      Fetches the current allocation size for context.
      
      If the context was not allocated in width or height, or if the
      context was recently reset with [gid.gtk4.cell_area_context.CellAreaContext.reset],
      the returned value will be -1.
  
      Params:
        width = location to store the allocated width, or null
        height = location to store the allocated height, or null
  */
  void getAllocation(out int width, out int height) nothrow
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
  gid.gtk3.cell_area.CellArea getArea() nothrow
  {
    GtkCellArea* _cretval;
    _cretval = gtk_cell_area_context_get_area(cast(GtkCellAreaContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_area.CellArea)(cast(GtkCellArea*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the accumulative preferred height for all rows which have been
      requested with this context.
      
      After [gid.gtk4.cell_area_context.CellAreaContext.reset] is called and/or before ever
      requesting the size of a #GtkCellArea, the returned values are 0.
  
      Params:
        minimumHeight = location to store the minimum height,
              or null
        naturalHeight = location to store the natural height,
              or null
  */
  void getPreferredHeight(out int minimumHeight, out int naturalHeight) nothrow
  {
    gtk_cell_area_context_get_preferred_height(cast(GtkCellAreaContext*)this._cPtr, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Gets the accumulative preferred height for width for all rows
      which have been requested for the same said width with this context.
      
      After [gid.gtk4.cell_area_context.CellAreaContext.reset] is called and/or before ever
      requesting the size of a #GtkCellArea, the returned values are -1.
  
      Params:
        width = a proposed width for allocation
        minimumHeight = location to store the minimum height,
              or null
        naturalHeight = location to store the natural height,
              or null
  */
  void getPreferredHeightForWidth(int width, out int minimumHeight, out int naturalHeight) nothrow
  {
    gtk_cell_area_context_get_preferred_height_for_width(cast(GtkCellAreaContext*)this._cPtr, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Gets the accumulative preferred width for all rows which have been
      requested with this context.
      
      After [gid.gtk4.cell_area_context.CellAreaContext.reset] is called and/or before ever
      requesting the size of a #GtkCellArea, the returned values are 0.
  
      Params:
        minimumWidth = location to store the minimum width,
              or null
        naturalWidth = location to store the natural width,
              or null
  */
  void getPreferredWidth(out int minimumWidth, out int naturalWidth) nothrow
  {
    gtk_cell_area_context_get_preferred_width(cast(GtkCellAreaContext*)this._cPtr, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Gets the accumulative preferred width for height for all rows which
      have been requested for the same said height with this context.
      
      After [gid.gtk4.cell_area_context.CellAreaContext.reset] is called and/or before ever
      requesting the size of a #GtkCellArea, the returned values are -1.
  
      Params:
        height = a proposed height for allocation
        minimumWidth = location to store the minimum width,
              or null
        naturalWidth = location to store the natural width,
              or null
  */
  void getPreferredWidthForHeight(int height, out int minimumWidth, out int naturalWidth) nothrow
  {
    gtk_cell_area_context_get_preferred_width_for_height(cast(GtkCellAreaContext*)this._cPtr, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Causes the minimum and/or natural height to grow if the new
      proposed sizes exceed the current minimum and natural height.
      
      This is used by #GtkCellAreaContext implementations during
      the request process over a series of #GtkTreeModel rows to
      progressively push the requested height over a series of
      [gid.gtk4.cell_area.CellArea.getPreferredHeight] requests.
  
      Params:
        minimumHeight = the proposed new minimum height for context
        naturalHeight = the proposed new natural height for context
  */
  void pushPreferredHeight(int minimumHeight, int naturalHeight) nothrow
  {
    gtk_cell_area_context_push_preferred_height(cast(GtkCellAreaContext*)this._cPtr, minimumHeight, naturalHeight);
  }

  /**
      Causes the minimum and/or natural width to grow if the new
      proposed sizes exceed the current minimum and natural width.
      
      This is used by #GtkCellAreaContext implementations during
      the request process over a series of #GtkTreeModel rows to
      progressively push the requested width over a series of
      [gid.gtk4.cell_area.CellArea.getPreferredWidth] requests.
  
      Params:
        minimumWidth = the proposed new minimum width for context
        naturalWidth = the proposed new natural width for context
  */
  void pushPreferredWidth(int minimumWidth, int naturalWidth) nothrow
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
      [gid.gtk4.cell_area.CellArea.getPreferredWidth].
      
      When the new overall size of the context requires
      that the allocated size changes (or whenever this
      allocation changes at all), the variable row
      sizes need to be re-requested for every row.
      
      For instance, if the rows are displayed all with
      the same width from top to bottom then a change
      in the allocated width necessitates a recalculation
      of all the displayed row heights using
      [gid.gtk4.cell_area.CellArea.getPreferredHeightForWidth].
      
      Since 3.0
  */
  void reset() nothrow
  {
    gtk_cell_area_context_reset(cast(GtkCellAreaContext*)this._cPtr);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from CellAreaContext
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.cell_area_context.CellAreaContext), T.stringof ~ " is not derived from gid.gtk3.cell_area_context.CellAreaContext");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAllocate", true)[0]) == gid.gtk3.cell_area_context.CellAreaContext))
      _installVfunc(klass, "allocate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredHeightForWidth", true)[0]) == gid.gtk3.cell_area_context.CellAreaContext))
      _installVfunc(klass, "get_preferred_height_for_width");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredWidthForHeight", true)[0]) == gid.gtk3.cell_area_context.CellAreaContext))
      _installVfunc(klass, "get_preferred_width_for_height");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReset", true)[0]) == gid.gtk3.cell_area_context.CellAreaContext))
      _installVfunc(klass, "reset");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkCellAreaContextClass*)klass;

    switch (vfunc)
    {
      case "allocate":
      {
        static extern(C) void _vfuncAllocateTramp(GtkCellAreaContext* context, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.cell_area_context.CellAreaContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.allocate)
              return (cast(typeof(&_vfuncAllocateTramp))_klass.allocate)(context, width, height);
            return;
          }

          try
          {
            _obj.vfuncAllocate(width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_area_context.CellAreaContext.vfuncAllocate");
          }
        }

        _klass.allocate = cast(typeof(_klass.allocate))&_vfuncAllocateTramp;
        break;
      }
      case "get_preferred_height_for_width":
      {
        static extern(C) void _vfuncGetPreferredHeightForWidthTramp(GtkCellAreaContext* context, int width, int* minimumHeight, int* naturalHeight) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.cell_area_context.CellAreaContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.getPreferredHeightForWidth)
              return (cast(typeof(&_vfuncGetPreferredHeightForWidthTramp))_klass.getPreferredHeightForWidth)(context, width, minimumHeight, naturalHeight);
            return;
          }

          typeof(*minimumHeight) _minimumHeightNull;
          if (!minimumHeight)
            minimumHeight = &_minimumHeightNull;

          typeof(*naturalHeight) _naturalHeightNull;
          if (!naturalHeight)
            naturalHeight = &_naturalHeightNull;

          try
          {
            _obj.vfuncGetPreferredHeightForWidth(width, *minimumHeight, *naturalHeight);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_area_context.CellAreaContext.vfuncGetPreferredHeightForWidth");
          }
        }

        _klass.getPreferredHeightForWidth = cast(typeof(_klass.getPreferredHeightForWidth))&_vfuncGetPreferredHeightForWidthTramp;
        break;
      }
      case "get_preferred_width_for_height":
      {
        static extern(C) void _vfuncGetPreferredWidthForHeightTramp(GtkCellAreaContext* context, int height, int* minimumWidth, int* naturalWidth) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.cell_area_context.CellAreaContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.getPreferredWidthForHeight)
              return (cast(typeof(&_vfuncGetPreferredWidthForHeightTramp))_klass.getPreferredWidthForHeight)(context, height, minimumWidth, naturalWidth);
            return;
          }

          typeof(*minimumWidth) _minimumWidthNull;
          if (!minimumWidth)
            minimumWidth = &_minimumWidthNull;

          typeof(*naturalWidth) _naturalWidthNull;
          if (!naturalWidth)
            naturalWidth = &_naturalWidthNull;

          try
          {
            _obj.vfuncGetPreferredWidthForHeight(height, *minimumWidth, *naturalWidth);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_area_context.CellAreaContext.vfuncGetPreferredWidthForHeight");
          }
        }

        _klass.getPreferredWidthForHeight = cast(typeof(_klass.getPreferredWidthForHeight))&_vfuncGetPreferredWidthForHeightTramp;
        break;
      }
      case "reset":
      {
        static extern(C) void _vfuncResetTramp(GtkCellAreaContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.cell_area_context.CellAreaContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.reset)
              return (cast(typeof(&_vfuncResetTramp))_klass.reset)(context);
            return;
          }

          try
          {
            _obj.vfuncReset();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_area_context.CellAreaContext.vfuncReset");
          }
        }

        _klass.reset = cast(typeof(_klass.reset))&_vfuncResetTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_area_context.CellAreaContext]
class CellAreaContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `area` property.
      Params:
        propval = The #GtkCellArea this context was created by
      Returns: Builder instance for fluent chaining
  */
  T area(gid.gtk3.cell_area.CellArea propval) nothrow
  {
    return setProperty("area", propval);
  }
}

/// Fluent builder for [gid.gtk3.cell_area_context.CellAreaContext]
final class CellAreaContextGidBuilder : CellAreaContextGidBuilderImpl!CellAreaContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellAreaContext build() nothrow
  {
    return new CellAreaContext(cast(void*)createGObject(CellAreaContext._getGType), Yes.Take);
  }
}
