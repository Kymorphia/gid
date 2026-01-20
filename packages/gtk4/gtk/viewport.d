/// Module for [Viewport] class
module gtk.viewport;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.scroll_info;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.viewport.Viewport] implements scrollability for widgets that lack their
    own scrolling capabilities.
    
    Use [gtk.viewport.Viewport] to scroll child widgets such as [gtk.grid.Grid],
    [gtk.box.Box], and so on.
    
    The [gtk.viewport.Viewport] will start scrolling content only if allocated
    less than the child widget’s minimum size in a given orientation.
    
    # CSS nodes
    
    [gtk.viewport.Viewport] has a single CSS node with name `viewport`.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.viewport.Viewport] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.viewport.Viewport] uses the [gtk.types.AccessibleRole.Generic] role.
*/
class Viewport : gtk.widget.Widget, gtk.scrollable.Scrollable
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
    return cast(void function())gtk_viewport_get_type != &gidSymbolNotFound ? gtk_viewport_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Viewport self()
  {
    return this;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `scrollToFocus` property.
      Returns: Whether to scroll when the focus changes.
        
        Before 4.6.2, this property was mistakenly defaulting to FALSE, so if your
        code needs to work with older versions, consider setting it explicitly to
        TRUE.
  */
  @property bool scrollToFocus()
  {
    return getScrollToFocus();
  }

  /**
      Set `scrollToFocus` property.
      Params:
        propval = Whether to scroll when the focus changes.
          
          Before 4.6.2, this property was mistakenly defaulting to FALSE, so if your
          code needs to work with older versions, consider setting it explicitly to
          TRUE.
  */
  @property void scrollToFocus(bool propval)
  {
    return setScrollToFocus(propval);
  }

  mixin ScrollableT!();

  /**
      Creates a new [gtk.viewport.Viewport].
      
      The new viewport uses the given adjustments, or default
      adjustments if none are given.
  
      Params:
        hadjustment = horizontal adjustment
        vadjustment = vertical adjustment
      Returns: a new [gtk.viewport.Viewport]
  */
  this(gtk.adjustment.Adjustment hadjustment = null, gtk.adjustment.Adjustment vadjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_viewport_new(hadjustment ? cast(GtkAdjustment*)hadjustment._cPtr(No.Dup) : null, vadjustment ? cast(GtkAdjustment*)vadjustment._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of viewport.
      Returns: the child widget of viewport
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_viewport_get_child(cast(GtkViewport*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the viewport is scrolling to keep the focused
      child in view.
      Returns: true if the viewport keeps the focus child scrolled to view
  */
  bool getScrollToFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_viewport_get_scroll_to_focus(cast(GtkViewport*)this._cPtr);
    return _retval;
  }

  /**
      Scrolls a descendant of the viewport into view.
      
      The viewport and the descendant must be visible and mapped for
      this function to work, otherwise no scrolling will be performed.
  
      Params:
        descendant = a descendant widget of the viewport
        scroll = details of how to perform
            the scroll operation or NULL to scroll into view
  */
  void scrollTo(gtk.widget.Widget descendant, gtk.scroll_info.ScrollInfo scroll = null)
  {
    gtk_viewport_scroll_to(cast(GtkViewport*)this._cPtr, descendant ? cast(GtkWidget*)descendant._cPtr(No.Dup) : null, scroll ? cast(GtkScrollInfo*)scroll._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the child widget of viewport.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_viewport_set_child(cast(GtkViewport*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the viewport should automatically scroll
      to keep the focused child in view.
  
      Params:
        scrollToFocus = whether to keep the focus widget scrolled to view
  */
  void setScrollToFocus(bool scrollToFocus)
  {
    gtk_viewport_set_scroll_to_focus(cast(GtkViewport*)this._cPtr, scrollToFocus);
  }
}
