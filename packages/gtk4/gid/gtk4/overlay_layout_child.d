/// Module for [OverlayLayoutChild] class
module gid.gtk4.overlay_layout_child;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_child;
import gid.gtk4.types;

/**
    [gid.gtk4.layout_child.LayoutChild] subclass for children in a [gid.gtk4.overlay_layout.OverlayLayout].
*/
class OverlayLayoutChild : gid.gtk4.layout_child.LayoutChild
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_overlay_layout_child_get_type != &gidSymbolNotFound ? gtk_overlay_layout_child_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkOverlayLayoutChild";
  }

  /** Returns `this`, for use in `with` statements. */
  override OverlayLayoutChild self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.overlay_layout_child.OverlayLayoutChild]
      Returns: New builder object
  */
  static OverlayLayoutChildGidBuilder builder() nothrow
  {
    return new OverlayLayoutChildGidBuilder;
  }

  /**
      Get `clipOverlay` property.
      Returns: Whether the child should be clipped to fit the parent's size.
  */
  @property bool clipOverlay() nothrow
  {
    return getClipOverlay();
  }

  /**
      Set `clipOverlay` property.
      Params:
        propval = Whether the child should be clipped to fit the parent's size.
  */
  @property void clipOverlay(bool propval) nothrow
  {
    setClipOverlay(propval);
  }

  /**
      Get `measure` property.
      Returns: Whether the child size should contribute to the [gid.gtk4.overlay_layout.OverlayLayout]'s
        measurement.
  */
  @property bool measure() nothrow
  {
    return getMeasure();
  }

  /**
      Set `measure` property.
      Params:
        propval = Whether the child size should contribute to the [gid.gtk4.overlay_layout.OverlayLayout]'s
          measurement.
  */
  @property void measure(bool propval) nothrow
  {
    setMeasure(propval);
  }

  /**
      Retrieves whether the child is clipped.
      Returns: whether the child is clipped
  */
  bool getClipOverlay() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_overlay_layout_child_get_clip_overlay(cast(GtkOverlayLayoutChild*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether the child is measured.
      Returns: whether the child is measured
  */
  bool getMeasure() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_overlay_layout_child_get_measure(cast(GtkOverlayLayoutChild*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether to clip this child.
  
      Params:
        clipOverlay = whether to clip this child
  */
  void setClipOverlay(bool clipOverlay) nothrow
  {
    gtk_overlay_layout_child_set_clip_overlay(cast(GtkOverlayLayoutChild*)this._cPtr, clipOverlay);
  }

  /**
      Sets whether to measure this child.
  
      Params:
        measure = whether to measure this child
  */
  void setMeasure(bool measure) nothrow
  {
    gtk_overlay_layout_child_set_measure(cast(GtkOverlayLayoutChild*)this._cPtr, measure);
  }
}

/// Fluent builder implementation template for [gid.gtk4.overlay_layout_child.OverlayLayoutChild]
class OverlayLayoutChildGidBuilderImpl(T) : gid.gtk4.layout_child.LayoutChildGidBuilderImpl!T
{

  /**
      Set `clipOverlay` property.
      Params:
        propval = Whether the child should be clipped to fit the parent's size.
      Returns: Builder instance for fluent chaining
  */
  T clipOverlay(bool propval) nothrow
  {
    return setProperty("clip-overlay", propval);
  }

  /**
      Set `measure` property.
      Params:
        propval = Whether the child size should contribute to the [gid.gtk4.overlay_layout.OverlayLayout]'s
          measurement.
      Returns: Builder instance for fluent chaining
  */
  T measure(bool propval) nothrow
  {
    return setProperty("measure", propval);
  }
}

/// Fluent builder for [gid.gtk4.overlay_layout_child.OverlayLayoutChild]
final class OverlayLayoutChildGidBuilder : OverlayLayoutChildGidBuilderImpl!OverlayLayoutChildGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  OverlayLayoutChild build() nothrow
  {
    return new OverlayLayoutChild(cast(void*)createGObject(OverlayLayoutChild._getGType), Yes.Take);
  }
}
