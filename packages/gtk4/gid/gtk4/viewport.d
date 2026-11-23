/// Module for [Viewport] class
module gid.gtk4.viewport;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.adjustment;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.scroll_info;
import gid.gtk4.scrollable;
import gid.gtk4.scrollable_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Implements scrollability for widgets that don't support scrolling
    on their own.
    
    Use [gid.gtk4.viewport.Viewport] to scroll child widgets such as [gid.gtk4.grid.Grid],
    [gid.gtk4.box.Box], and so on.
    
    The [gid.gtk4.viewport.Viewport] will start scrolling content only if allocated
    less than the child widget’s minimum size in a given orientation.
    
    # CSS nodes
    
    [gid.gtk4.viewport.Viewport] has a single CSS node with name `viewport`.
    
    # Accessibility
    
    Until GTK 4.10, [gid.gtk4.viewport.Viewport] used the [gid.gtk4.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gid.gtk4.viewport.Viewport] uses the [gid.gtk4.types.AccessibleRole.Generic] role.
*/
class Viewport : gid.gtk4.widget.Widget, gid.gtk4.scrollable.Scrollable
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
    return cast(void function())gtk_viewport_get_type != &gidSymbolNotFound ? gtk_viewport_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkViewport";
  }

  /** Returns `this`, for use in `with` statements. */
  override Viewport self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.viewport.Viewport]
      Returns: New builder object
  */
  static ViewportGidBuilder builder() nothrow
  {
    return new ViewportGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `scrollToFocus` property.
      Returns: Whether to scroll when the focus changes.
        
        Before 4.6.2, this property was mistakenly defaulting to FALSE, so if your
        code needs to work with older versions, consider setting it explicitly to
        TRUE.
  */
  @property bool scrollToFocus() nothrow
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
  @property void scrollToFocus(bool propval) nothrow
  {
    setScrollToFocus(propval);
  }

  mixin ScrollableT!();

  /**
      Creates a new [gid.gtk4.viewport.Viewport].
      
      The new viewport uses the given adjustments, or default
      adjustments if none are given.
  
      Params:
        hadjustment = horizontal adjustment
        vadjustment = vertical adjustment
      Returns: a new [gid.gtk4.viewport.Viewport]
  */
  this(gid.gtk4.adjustment.Adjustment hadjustment = null, gid.gtk4.adjustment.Adjustment vadjustment = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, hadjustment !is null || vadjustment !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_viewport_new(hadjustment ? cast(GtkAdjustment*)hadjustment._cPtr(No.Dup) : null, vadjustment ? cast(GtkAdjustment*)vadjustment._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the child widget of viewport.
      Returns: the child widget of viewport
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_viewport_get_child(cast(GtkViewport*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the viewport is scrolling to keep the focused
      child in view.
      Returns: true if the viewport keeps the focus child scrolled to view
  */
  bool getScrollToFocus() nothrow
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
  void scrollTo(gid.gtk4.widget.Widget descendant, gid.gtk4.scroll_info.ScrollInfo scroll = null) nothrow
  {
    gtk_viewport_scroll_to(cast(GtkViewport*)this._cPtr, descendant ? cast(GtkWidget*)descendant._cPtr(No.Dup) : null, scroll ? cast(GtkScrollInfo*)scroll._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the child widget of viewport.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_viewport_set_child(cast(GtkViewport*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the viewport should automatically scroll
      to keep the focused child in view.
  
      Params:
        scrollToFocus = whether to keep the focus widget scrolled to view
  */
  void setScrollToFocus(bool scrollToFocus) nothrow
  {
    gtk_viewport_set_scroll_to_focus(cast(GtkViewport*)this._cPtr, scrollToFocus);
  }
}

/// Fluent builder implementation template for [gid.gtk4.viewport.Viewport]
class ViewportGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.scrollable.ScrollableGidBuilderImpl!T
{

  mixin ScrollableGidBuilderT!();

  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `scrollToFocus` property.
      Params:
        propval = Whether to scroll when the focus changes.
          
          Before 4.6.2, this property was mistakenly defaulting to FALSE, so if your
          code needs to work with older versions, consider setting it explicitly to
          TRUE.
      Returns: Builder instance for fluent chaining
  */
  T scrollToFocus(bool propval) nothrow
  {
    return setProperty("scroll-to-focus", propval);
  }
}

/// Fluent builder for [gid.gtk4.viewport.Viewport]
final class ViewportGidBuilder : ViewportGidBuilderImpl!ViewportGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Viewport build() nothrow
  {
    return new Viewport(cast(void*)createGObject(Viewport._getGType), Yes.Take);
  }
}
