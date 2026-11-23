/// Module for [OverlayLayout] class
module gid.gtk4.overlay_layout;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_manager;
import gid.gtk4.types;

/**
    The layout manager used by [gid.gtk4.overlay.Overlay].
    
    It places widgets as overlays on top of the main child.
    
    This is not a reusable layout manager, since it expects its widget
    to be a [gid.gtk4.overlay.Overlay]. It is only listed here so that its layout
    properties get documented.
*/
class OverlayLayout : gid.gtk4.layout_manager.LayoutManager
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
    return cast(void function())gtk_overlay_layout_get_type != &gidSymbolNotFound ? gtk_overlay_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkOverlayLayout";
  }

  /** Returns `this`, for use in `with` statements. */
  override OverlayLayout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.overlay_layout.OverlayLayout]
      Returns: New builder object
  */
  static OverlayLayoutGidBuilder builder() nothrow
  {
    return new OverlayLayoutGidBuilder;
  }

  /**
      Creates a new [gid.gtk4.overlay_layout.OverlayLayout] instance.
      Returns: the newly created instance
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkLayoutManager* _cretval;
      _cretval = gtk_overlay_layout_new();
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.overlay_layout.OverlayLayout]
class OverlayLayoutGidBuilderImpl(T) : gid.gtk4.layout_manager.LayoutManagerGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.overlay_layout.OverlayLayout]
final class OverlayLayoutGidBuilder : OverlayLayoutGidBuilderImpl!OverlayLayoutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  OverlayLayout build() nothrow
  {
    return new OverlayLayout(cast(void*)createGObject(OverlayLayout._getGType), Yes.Take);
  }
}
