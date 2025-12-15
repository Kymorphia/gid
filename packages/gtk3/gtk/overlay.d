/// Module for [Overlay] class
module gtk.overlay;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    GtkOverlay is a container which contains a single main child, on top
    of which it can place “overlay” widgets. The position of each overlay
    widget is determined by its #GtkWidget:halign and #GtkWidget:valign
    properties. E.g. a widget with both alignments set to [gtk.types.Align.Start]
    will be placed at the top left corner of the GtkOverlay container,
    whereas an overlay with halign set to [gtk.types.Align.Center] and valign set
    to [gtk.types.Align.End] will be placed a the bottom edge of the GtkOverlay,
    horizontally centered. The position can be adjusted by setting the margin
    properties of the child to non-zero values.
    
    More complicated placement of overlays is possible by connecting
    to the #GtkOverlay::get-child-position signal.
    
    An overlay’s minimum and natural sizes are those of its main child. The sizes
    of overlay children are not considered when measuring these preferred sizes.
    
    # GtkOverlay as GtkBuildable
    
    The GtkOverlay implementation of the GtkBuildable interface
    supports placing a child as an overlay by specifying “overlay” as
    the “type” attribute of a `<child>` element.
    
    # CSS nodes
    
    GtkOverlay has a single CSS node with the name “overlay”. Overlay children
    whose alignments cause them to be positioned at an edge get the style classes
    “.left”, “.right”, “.top”, and/or “.bottom” according to their position.
*/
class Overlay : gtk.bin.Bin
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
    return cast(void function())gtk_overlay_get_type != &gidSymbolNotFound ? gtk_overlay_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Overlay self()
  {
    return this;
  }

  /**
      Creates a new #GtkOverlay.
      Returns: a new #GtkOverlay object.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_overlay_new();
    this(_cretval, No.Take);
  }

  /**
      Adds widget to overlay.
      
      The widget will be stacked on top of the main widget
      added with [gtk.container.Container.add].
      
      The position at which widget is placed is determined
      from its #GtkWidget:halign and #GtkWidget:valign properties.
  
      Params:
        widget = a #GtkWidget to be added to the container
  */
  void addOverlay(gtk.widget.Widget widget)
  {
    gtk_overlay_add_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Convenience function to get the value of the #GtkOverlay:pass-through
      child property for widget.
  
      Params:
        widget = an overlay child of #GtkOverlay
      Returns: whether the widget is a pass through child.
  */
  bool getOverlayPassThrough(gtk.widget.Widget widget)
  {
    bool _retval;
    _retval = cast(bool)gtk_overlay_get_overlay_pass_through(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves child to a new index in the list of overlay children.
      The list contains overlays in the order that these were
      added to overlay by default. See also #GtkOverlay:index.
      
      A widget’s index in the overlay children list determines which order
      the children are drawn if they overlap. The first child is drawn at
      the bottom. It also affects the default focus chain order.
  
      Params:
        child = the overlaid #GtkWidget to move
        index = the new index for child in the list of overlay children
            of overlay, starting from 0. If negative, indicates the end of
            the list
  */
  void reorderOverlay(gtk.widget.Widget child, int index)
  {
    gtk_overlay_reorder_overlay(cast(GtkOverlay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, index);
  }

  /**
      Convenience function to set the value of the #GtkOverlay:pass-through
      child property for widget.
  
      Params:
        widget = an overlay child of #GtkOverlay
        passThrough = whether the child should pass the input through
  */
  void setOverlayPassThrough(gtk.widget.Widget widget, bool passThrough)
  {
    gtk_overlay_set_overlay_pass_through(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, passThrough);
  }
}
