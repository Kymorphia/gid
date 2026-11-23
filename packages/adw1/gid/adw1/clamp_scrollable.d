/// Module for [ClampScrollable] class
module gid.adw1.clamp_scrollable;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.scrollable;
import gid.gtk4.scrollable_mixin;
import gid.gtk4.widget;

/**
    A scrollable [gid.adw1.clamp.Clamp].
    
    [gid.adw1.clamp_scrollable.ClampScrollable] is a variant of [gid.adw1.clamp.Clamp] that implements the
    [gid.gtk4.scrollable.Scrollable] interface.
    
    The primary use case for [gid.adw1.clamp_scrollable.ClampScrollable] is clamping
    [gid.gtk4.list_view.ListView].
    
    See also: [gid.adw1.clamp_layout.ClampLayout].
*/
class ClampScrollable : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable, gid.gtk4.scrollable.Scrollable
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
    return cast(void function())adw_clamp_scrollable_get_type != &gidSymbolNotFound ? adw_clamp_scrollable_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwClampScrollable";
  }

  /** Returns `this`, for use in `with` statements. */
  override ClampScrollable self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.clamp_scrollable.ClampScrollable]
      Returns: New builder object
  */
  static ClampScrollableGidBuilder builder() nothrow
  {
    return new ClampScrollableGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget of the [gid.adw1.clamp_scrollable.ClampScrollable].
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget of the [gid.adw1.clamp_scrollable.ClampScrollable].
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `maximumSize` property.
      Returns: The maximum size allocated to the child.
        
        It is the width if the clamp is horizontal, or the height if it is vertical.
  */
  @property int maximumSize() nothrow
  {
    return getMaximumSize();
  }

  /**
      Set `maximumSize` property.
      Params:
        propval = The maximum size allocated to the child.
          
          It is the width if the clamp is horizontal, or the height if it is vertical.
  */
  @property void maximumSize(int propval) nothrow
  {
    setMaximumSize(propval);
  }

  /**
      Get `tighteningThreshold` property.
      Returns: The size above which the child is clamped.
        
        Starting from this size, the clamp will tighten its grip on the child,
        slowly allocating less and less of the available size up to the maximum
        allocated size. Below that threshold and below the maximum width, the child
        will be allocated all the available size.
        
        If the threshold is greater than the maximum size to allocate to the child,
        the child will be allocated all the width up to the maximum.
        If the threshold is lower than the minimum size to allocate to the child,
        that size will be used as the tightening threshold.
        
        Effectively, tightening the grip on the child before it reaches its maximum
        size makes transitions to and from the maximum size smoother when resizing.
  */
  @property int tighteningThreshold() nothrow
  {
    return getTighteningThreshold();
  }

  /**
      Set `tighteningThreshold` property.
      Params:
        propval = The size above which the child is clamped.
          
          Starting from this size, the clamp will tighten its grip on the child,
          slowly allocating less and less of the available size up to the maximum
          allocated size. Below that threshold and below the maximum width, the child
          will be allocated all the available size.
          
          If the threshold is greater than the maximum size to allocate to the child,
          the child will be allocated all the width up to the maximum.
          If the threshold is lower than the minimum size to allocate to the child,
          that size will be used as the tightening threshold.
          
          Effectively, tightening the grip on the child before it reaches its maximum
          size makes transitions to and from the maximum size smoother when resizing.
  */
  @property void tighteningThreshold(int propval) nothrow
  {
    setTighteningThreshold(propval);
  }

  /**
      Get `unit` property.
      Returns: The length unit for maximum size and tightening threshold.
        
        Allows the sizes to vary depending on the text scale factor.
  */
  @property gid.adw1.types.LengthUnit unit() nothrow
  {
    return getUnit();
  }

  /**
      Set `unit` property.
      Params:
        propval = The length unit for maximum size and tightening threshold.
          
          Allows the sizes to vary depending on the text scale factor.
  */
  @property void unit(gid.adw1.types.LengthUnit propval) nothrow
  {
    setUnit(propval);
  }

  mixin OrientableT!();
  mixin ScrollableT!();

  /**
      Creates a new [gid.adw1.clamp_scrollable.ClampScrollable].
      Returns: the newly created [gid.adw1.clamp_scrollable.ClampScrollable]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = adw_clamp_scrollable_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_clamp_scrollable_get_child(cast(AdwClampScrollable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the maximum size allocated to the child.
      Returns: the maximum size to allocate to the child
  */
  int getMaximumSize() nothrow
  {
    int _retval;
    _retval = adw_clamp_scrollable_get_maximum_size(cast(AdwClampScrollable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size above which the child is clamped.
      Returns: the size above which the child is clamped
  */
  int getTighteningThreshold() nothrow
  {
    int _retval;
    _retval = adw_clamp_scrollable_get_tightening_threshold(cast(AdwClampScrollable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length unit for maximum size and tightening threshold.
      Returns: the length unit
  */
  gid.adw1.types.LengthUnit getUnit() nothrow
  {
    AdwLengthUnit _cretval;
    _cretval = adw_clamp_scrollable_get_unit(cast(AdwClampScrollable*)this._cPtr);
    gid.adw1.types.LengthUnit _retval = cast(gid.adw1.types.LengthUnit)_cretval;
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    adw_clamp_scrollable_set_child(cast(AdwClampScrollable*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the maximum size allocated to the child.
      
      It is the width if the clamp is horizontal, or the height if it is vertical.
  
      Params:
        maximumSize = the maximum size
  */
  void setMaximumSize(int maximumSize) nothrow
  {
    adw_clamp_scrollable_set_maximum_size(cast(AdwClampScrollable*)this._cPtr, maximumSize);
  }

  /**
      Sets the size above which the child is clamped.
      
      Starting from this size, the clamp will tighten its grip on the child, slowly
      allocating less and less of the available size up to the maximum allocated
      size. Below that threshold and below the maximum width, the child will be
      allocated all the available size.
      
      If the threshold is greater than the maximum size to allocate to the child,
      the child will be allocated all the width up to the maximum. If the threshold
      is lower than the minimum size to allocate to the child, that size will be
      used as the tightening threshold.
      
      Effectively, tightening the grip on the child before it reaches its maximum
      size makes transitions to and from the maximum size smoother when resizing.
  
      Params:
        tighteningThreshold = the tightening threshold
  */
  void setTighteningThreshold(int tighteningThreshold) nothrow
  {
    adw_clamp_scrollable_set_tightening_threshold(cast(AdwClampScrollable*)this._cPtr, tighteningThreshold);
  }

  /**
      Sets the length unit for maximum size and tightening threshold.
      
      Allows the sizes to vary depending on the text scale factor.
  
      Params:
        unit = the length unit
  */
  void setUnit(gid.adw1.types.LengthUnit unit) nothrow
  {
    adw_clamp_scrollable_set_unit(cast(AdwClampScrollable*)this._cPtr, unit);
  }
}

/// Fluent builder implementation template for [gid.adw1.clamp_scrollable.ClampScrollable]
class ClampScrollableGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T, gid.gtk4.scrollable.ScrollableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();
  mixin ScrollableGidBuilderT!();

  /**
      Set `child` property.
      Params:
        propval = The child widget of the [gid.adw1.clamp_scrollable.ClampScrollable].
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `maximumSize` property.
      Params:
        propval = The maximum size allocated to the child.
          
          It is the width if the clamp is horizontal, or the height if it is vertical.
      Returns: Builder instance for fluent chaining
  */
  T maximumSize(int propval) nothrow
  {
    return setProperty("maximum-size", propval);
  }

  /**
      Set `tighteningThreshold` property.
      Params:
        propval = The size above which the child is clamped.
          
          Starting from this size, the clamp will tighten its grip on the child,
          slowly allocating less and less of the available size up to the maximum
          allocated size. Below that threshold and below the maximum width, the child
          will be allocated all the available size.
          
          If the threshold is greater than the maximum size to allocate to the child,
          the child will be allocated all the width up to the maximum.
          If the threshold is lower than the minimum size to allocate to the child,
          that size will be used as the tightening threshold.
          
          Effectively, tightening the grip on the child before it reaches its maximum
          size makes transitions to and from the maximum size smoother when resizing.
      Returns: Builder instance for fluent chaining
  */
  T tighteningThreshold(int propval) nothrow
  {
    return setProperty("tightening-threshold", propval);
  }

  /**
      Set `unit` property.
      Params:
        propval = The length unit for maximum size and tightening threshold.
          
          Allows the sizes to vary depending on the text scale factor.
      Returns: Builder instance for fluent chaining
  */
  T unit(gid.adw1.types.LengthUnit propval) nothrow
  {
    return setProperty("unit", propval);
  }
}

/// Fluent builder for [gid.adw1.clamp_scrollable.ClampScrollable]
final class ClampScrollableGidBuilder : ClampScrollableGidBuilderImpl!ClampScrollableGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ClampScrollable build() nothrow
  {
    return new ClampScrollable(cast(void*)createGObject(ClampScrollable._getGType), Yes.Take);
  }
}
