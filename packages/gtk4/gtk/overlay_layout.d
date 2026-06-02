/// Module for [OverlayLayout] class
module gtk.overlay_layout;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;

/**
    [gtk.overlay_layout.OverlayLayout] is the layout manager used by [gtk.overlay.Overlay].
    
    It places widgets as overlays on top of the main child.
    
    This is not a reusable layout manager, since it expects its widget
    to be a [gtk.overlay.Overlay]. It is only listed here so that its layout
    properties get documented.
*/
class OverlayLayout : gtk.layout_manager.LayoutManager
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_overlay_layout_get_type != &gidSymbolNotFound ? gtk_overlay_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OverlayLayout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.overlay_layout.OverlayLayout]
      Returns: New builder object
  */
  static OverlayLayoutGidBuilder builder() nothrow
  {
    return new OverlayLayoutGidBuilder;
  }

  /**
      Creates a new [gtk.overlay_layout.OverlayLayout] instance.
      Returns: the newly created instance
  */
  this() nothrow
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_overlay_layout_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gtk.overlay_layout.OverlayLayout]
class OverlayLayoutGidBuilderImpl(T) : gtk.layout_manager.LayoutManagerGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.overlay_layout.OverlayLayout]
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
