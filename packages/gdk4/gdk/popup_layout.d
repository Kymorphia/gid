/// Module for [PopupLayout] class
module gdk.popup_layout;

import gdk.c.functions;
import gdk.c.types;
import gdk.rectangle;
import gdk.types;
import gid.gid;
import gobject.boxed;

/**
    The [gdk.popup_layout.PopupLayout] struct contains information that is
    necessary position a [gdk.popup.Popup] relative to its parent.
    
    The positioning requires a negotiation with the windowing system,
    since it depends on external constraints, such as the position of
    the parent surface, and the screen dimensions.
    
    The basic ingredients are a rectangle on the parent surface,
    and the anchor on both that rectangle and the popup. The anchors
    specify a side or corner to place next to each other.
    
    ![Popup anchors](popup-anchors.png)
    
    For cases where placing the anchors next to each other would make
    the popup extend offscreen, the layout includes some hints for how
    to resolve this problem. The hints may suggest to flip the anchor
    position to the other side, or to 'slide' the popup along a side,
    or to resize it.
    
    ![Flipping popups](popup-flip.png)
    
    ![Sliding popups](popup-slide.png)
    
    These hints may be combined.
    
    Ultimatively, it is up to the windowing system to determine the position
    and size of the popup. You can learn about the result by calling
    [gdk.popup.Popup.getPositionX], [gdk.popup.Popup.getPositionY],
    [gdk.popup.Popup.getRectAnchor] and [gdk.popup.Popup.getSurfaceAnchor]
    after the popup has been presented. This can be used to adjust the rendering.
    For example, [GtkPopover](../gtk4/class.Popover.html) changes its arrow position
    accordingly. But you have to be careful avoid changing the size of the popover,
    or it has to be presented again.
*/
class PopupLayout : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_popup_layout_get_type != &gidSymbolNotFound ? gdk_popup_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PopupLayout self()
  {
    return this;
  }

  /**
      Create a popup layout description.
      
      Used together with [gdk.popup.Popup.present] to describe how a popup
      surface should be placed and behave on-screen.
      
      anchor_rect is relative to the top-left corner of the surface's parent.
      rect_anchor and surface_anchor determine anchor points on anchor_rect
      and surface to pin together.
      
      The position of anchor_rect's anchor point can optionally be offset using
      [gdk.popup_layout.PopupLayout.setOffset], which is equivalent to offsetting the
      position of surface.
  
      Params:
        anchorRect = the anchor [gtk.types.Rectangle] to align surface with
        rectAnchor = the point on anchor_rect to align with surface's anchor point
        surfaceAnchor = the point on surface to align with rect's anchor point
      Returns: newly created instance of [gdk.popup_layout.PopupLayout]
  */
  this(gdk.rectangle.Rectangle anchorRect, gdk.types.Gravity rectAnchor, gdk.types.Gravity surfaceAnchor)
  {
    GdkPopupLayout* _cretval;
    _cretval = gdk_popup_layout_new(cast(const(GdkRectangle)*)&anchorRect, rectAnchor, surfaceAnchor);
    this(_cretval, Yes.Take);
  }

  /**
      Makes a copy of layout.
      Returns: a copy of layout.
  */
  gdk.popup_layout.PopupLayout copy()
  {
    GdkPopupLayout* _cretval;
    _cretval = gdk_popup_layout_copy(cast(GdkPopupLayout*)this._cPtr);
    auto _retval = _cretval ? new gdk.popup_layout.PopupLayout(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Check whether layout and other has identical layout properties.
  
      Params:
        other = another [gdk.popup_layout.PopupLayout]
      Returns: true if layout and other have identical layout properties,
          otherwise false.
  */
  bool equal(gdk.popup_layout.PopupLayout other)
  {
    bool _retval;
    _retval = cast(bool)gdk_popup_layout_equal(cast(GdkPopupLayout*)this._cPtr, other ? cast(GdkPopupLayout*)other._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the [gdk.types.AnchorHints].
      Returns: the [gdk.types.AnchorHints]
  */
  gdk.types.AnchorHints getAnchorHints()
  {
    GdkAnchorHints _cretval;
    _cretval = gdk_popup_layout_get_anchor_hints(cast(GdkPopupLayout*)this._cPtr);
    gdk.types.AnchorHints _retval = cast(gdk.types.AnchorHints)_cretval;
    return _retval;
  }

  /**
      Get the anchor rectangle.
      Returns: The anchor rectangle
  */
  gdk.rectangle.Rectangle getAnchorRect()
  {
    const(GdkRectangle)* _cretval;
    _cretval = gdk_popup_layout_get_anchor_rect(cast(GdkPopupLayout*)this._cPtr);
    gdk.rectangle.Rectangle _retval;
    if (_cretval)
      _retval = *cast(gdk.rectangle.Rectangle*)_cretval;
    return _retval;
  }

  /**
      Retrieves the offset for the anchor rectangle.
  
      Params:
        dx = return location for the delta X coordinate
        dy = return location for the delta Y coordinate
  */
  void getOffset(out int dx, out int dy)
  {
    gdk_popup_layout_get_offset(cast(GdkPopupLayout*)this._cPtr, cast(int*)&dx, cast(int*)&dy);
  }

  /**
      Returns the anchor position on the anchor rectangle.
      Returns: the anchor on the anchor rectangle.
  */
  gdk.types.Gravity getRectAnchor()
  {
    GdkGravity _cretval;
    _cretval = gdk_popup_layout_get_rect_anchor(cast(GdkPopupLayout*)this._cPtr);
    gdk.types.Gravity _retval = cast(gdk.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Obtains the shadow widths of this layout.
  
      Params:
        left = return location for the left shadow width
        right = return location for the right shadow width
        top = return location for the top shadow width
        bottom = return location for the bottom shadow width
  */
  void getShadowWidth(out int left, out int right, out int top, out int bottom)
  {
    gdk_popup_layout_get_shadow_width(cast(GdkPopupLayout*)this._cPtr, cast(int*)&left, cast(int*)&right, cast(int*)&top, cast(int*)&bottom);
  }

  /**
      Returns the anchor position on the popup surface.
      Returns: the anchor on the popup surface.
  */
  gdk.types.Gravity getSurfaceAnchor()
  {
    GdkGravity _cretval;
    _cretval = gdk_popup_layout_get_surface_anchor(cast(GdkPopupLayout*)this._cPtr);
    gdk.types.Gravity _retval = cast(gdk.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Set new anchor hints.
      
      The set anchor_hints determines how surface will be moved
      if the anchor points cause it to move off-screen. For example,
      [gdk.types.AnchorHints.FlipX] will replace [gdk.types.Gravity.NorthWest] with
      [gdk.types.Gravity.NorthEast] and vice versa if surface extends
      beyond the left or right edges of the monitor.
  
      Params:
        anchorHints = the new [gdk.types.AnchorHints]
  */
  void setAnchorHints(gdk.types.AnchorHints anchorHints)
  {
    gdk_popup_layout_set_anchor_hints(cast(GdkPopupLayout*)this._cPtr, anchorHints);
  }

  /**
      Set the anchor rectangle.
  
      Params:
        anchorRect = the new anchor rectangle
  */
  void setAnchorRect(gdk.rectangle.Rectangle anchorRect)
  {
    gdk_popup_layout_set_anchor_rect(cast(GdkPopupLayout*)this._cPtr, cast(const(GdkRectangle)*)&anchorRect);
  }

  /**
      Offset the position of the anchor rectangle with the given delta.
  
      Params:
        dx = x delta to offset the anchor rectangle with
        dy = y delta to offset the anchor rectangle with
  */
  void setOffset(int dx, int dy)
  {
    gdk_popup_layout_set_offset(cast(GdkPopupLayout*)this._cPtr, dx, dy);
  }

  /**
      Set the anchor on the anchor rectangle.
  
      Params:
        anchor = the new rect anchor
  */
  void setRectAnchor(gdk.types.Gravity anchor)
  {
    gdk_popup_layout_set_rect_anchor(cast(GdkPopupLayout*)this._cPtr, anchor);
  }

  /**
      Sets the shadow width of the popup.
      
      The shadow width corresponds to the part of the computed
      surface size that would consist of the shadow margin
      surrounding the window, would there be any.
  
      Params:
        left = width of the left part of the shadow
        right = width of the right part of the shadow
        top = height of the top part of the shadow
        bottom = height of the bottom part of the shadow
  */
  void setShadowWidth(int left, int right, int top, int bottom)
  {
    gdk_popup_layout_set_shadow_width(cast(GdkPopupLayout*)this._cPtr, left, right, top, bottom);
  }

  /**
      Set the anchor on the popup surface.
  
      Params:
        anchor = the new popup surface anchor
  */
  void setSurfaceAnchor(gdk.types.Gravity anchor)
  {
    gdk_popup_layout_set_surface_anchor(cast(GdkPopupLayout*)this._cPtr, anchor);
  }
}
