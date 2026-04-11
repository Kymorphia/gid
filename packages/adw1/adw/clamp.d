/// Module for [Clamp] class
module adw.clamp;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.widget;

/**
    A widget constraining its child to a given size.
    
    <picture>
      <source srcset="clamp-wide-dark.png" media="(prefers-color-scheme: dark)">
      <img src="clamp-wide.png" alt="clamp-wide">
    </picture>
    <picture>
      <source srcset="clamp-narrow-dark.png" media="(prefers-color-scheme: dark)">
      <img src="clamp-narrow.png" alt="clamp-narrow">
    </picture>
    
    The [adw.clamp.Clamp] widget constrains the size of the widget it contains to a
    given maximum size. It will constrain the width if it is horizontal, or the
    height if it is vertical. The expansion of the child from its minimum to its
    maximum size is eased out for a smooth transition.
    
    If the child requires more than the requested maximum size, it will be
    allocated the minimum size it can fit in instead.
    
    [adw.clamp.Clamp] can scale with the text scale factor, use the
    `property@Clamp:unit` property to enable that behavior.
    
    See also: `class@ClampLayout`, `class@ClampScrollable`.
    
    ## CSS nodes
    
    [adw.clamp.Clamp] has a single CSS node with name `clamp`.
*/
class Clamp : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())adw_clamp_get_type != &gidSymbolNotFound ? adw_clamp_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Clamp self()
  {
    return this;
  }

  /**
      Get builder for [adw.clamp.Clamp]
      Returns: New builder object
  */
  static ClampGidBuilder builder()
  {
    return new ClampGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget of the [adw.clamp.Clamp].
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget of the [adw.clamp.Clamp].
  */
  @property void child(gtk.widget.Widget propval)
  {
    setChild(propval);
  }

  /**
      Get `maximumSize` property.
      Returns: The maximum size allocated to the child.
        
        It is the width if the clamp is horizontal, or the height if it is vertical.
  */
  @property int maximumSize()
  {
    return getMaximumSize();
  }

  /**
      Set `maximumSize` property.
      Params:
        propval = The maximum size allocated to the child.
          
          It is the width if the clamp is horizontal, or the height if it is vertical.
  */
  @property void maximumSize(int propval)
  {
    setMaximumSize(propval);
  }

  /**
      Get `tighteningThreshold` property.
      Returns: The size above which the child is clamped.
        
        Starting from this size, the clamp will tighten its grip on the child,
        slowly allocating less and less of the available size up to the maximum
        allocated size. Below that threshold and below the maximum size, the child
        will be allocated all the available size.
        
        If the threshold is greater than the maximum size to allocate to the child,
        the child will be allocated all the size up to the maximum.
        If the threshold is lower than the minimum size to allocate to the child,
        that size will be used as the tightening threshold.
        
        Effectively, tightening the grip on the child before it reaches its maximum
        size makes transitions to and from the maximum size smoother when resizing.
  */
  @property int tighteningThreshold()
  {
    return getTighteningThreshold();
  }

  /**
      Set `tighteningThreshold` property.
      Params:
        propval = The size above which the child is clamped.
          
          Starting from this size, the clamp will tighten its grip on the child,
          slowly allocating less and less of the available size up to the maximum
          allocated size. Below that threshold and below the maximum size, the child
          will be allocated all the available size.
          
          If the threshold is greater than the maximum size to allocate to the child,
          the child will be allocated all the size up to the maximum.
          If the threshold is lower than the minimum size to allocate to the child,
          that size will be used as the tightening threshold.
          
          Effectively, tightening the grip on the child before it reaches its maximum
          size makes transitions to and from the maximum size smoother when resizing.
  */
  @property void tighteningThreshold(int propval)
  {
    setTighteningThreshold(propval);
  }

  /**
      Get `unit` property.
      Returns: The length unit for maximum size and tightening threshold.
        
        Allows the sizes to vary depending on the text scale factor.
  */
  @property adw.types.LengthUnit unit()
  {
    return getUnit();
  }

  /**
      Set `unit` property.
      Params:
        propval = The length unit for maximum size and tightening threshold.
          
          Allows the sizes to vary depending on the text scale factor.
  */
  @property void unit(adw.types.LengthUnit propval)
  {
    setUnit(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [adw.clamp.Clamp].
      Returns: the newly created [adw.clamp.Clamp]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_clamp_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_clamp_get_child(cast(AdwClamp*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the maximum size allocated to the child.
      Returns: the maximum size to allocate to the child
  */
  int getMaximumSize()
  {
    int _retval;
    _retval = adw_clamp_get_maximum_size(cast(AdwClamp*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size above which the child is clamped.
      Returns: the size above which the child is clamped
  */
  int getTighteningThreshold()
  {
    int _retval;
    _retval = adw_clamp_get_tightening_threshold(cast(AdwClamp*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length unit for maximum size and tightening threshold.
      Returns: the length unit
  */
  adw.types.LengthUnit getUnit()
  {
    AdwLengthUnit _cretval;
    _cretval = adw_clamp_get_unit(cast(AdwClamp*)this._cPtr);
    adw.types.LengthUnit _retval = cast(adw.types.LengthUnit)_cretval;
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    adw_clamp_set_child(cast(AdwClamp*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the maximum size allocated to the child.
      
      It is the width if the clamp is horizontal, or the height if it is vertical.
  
      Params:
        maximumSize = the maximum size
  */
  void setMaximumSize(int maximumSize)
  {
    adw_clamp_set_maximum_size(cast(AdwClamp*)this._cPtr, maximumSize);
  }

  /**
      Sets the size above which the child is clamped.
      
      Starting from this size, the clamp will tighten its grip on the child, slowly
      allocating less and less of the available size up to the maximum allocated
      size. Below that threshold and below the maximum size, the child will be
      allocated all the available size.
      
      If the threshold is greater than the maximum size to allocate to the child,
      the child will be allocated all the size up to the maximum. If the threshold
      is lower than the minimum size to allocate to the child, that size will be
      used as the tightening threshold.
      
      Effectively, tightening the grip on the child before it reaches its maximum
      size makes transitions to and from the maximum size smoother when resizing.
  
      Params:
        tighteningThreshold = the tightening threshold
  */
  void setTighteningThreshold(int tighteningThreshold)
  {
    adw_clamp_set_tightening_threshold(cast(AdwClamp*)this._cPtr, tighteningThreshold);
  }

  /**
      Sets the length unit for maximum size and tightening threshold.
      
      Allows the sizes to vary depending on the text scale factor.
  
      Params:
        unit = the length unit
  */
  void setUnit(adw.types.LengthUnit unit)
  {
    adw_clamp_set_unit(cast(AdwClamp*)this._cPtr, unit);
  }
}

/// Fluent builder implementation template for [adw.clamp.Clamp]
class ClampGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `child` property.
      Params:
        propval = The child widget of the [adw.clamp.Clamp].
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval)
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
  T maximumSize(int propval)
  {
    return setProperty("maximum-size", propval);
  }

  /**
      Set `tighteningThreshold` property.
      Params:
        propval = The size above which the child is clamped.
          
          Starting from this size, the clamp will tighten its grip on the child,
          slowly allocating less and less of the available size up to the maximum
          allocated size. Below that threshold and below the maximum size, the child
          will be allocated all the available size.
          
          If the threshold is greater than the maximum size to allocate to the child,
          the child will be allocated all the size up to the maximum.
          If the threshold is lower than the minimum size to allocate to the child,
          that size will be used as the tightening threshold.
          
          Effectively, tightening the grip on the child before it reaches its maximum
          size makes transitions to and from the maximum size smoother when resizing.
      Returns: Builder instance for fluent chaining
  */
  T tighteningThreshold(int propval)
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
  T unit(adw.types.LengthUnit propval)
  {
    return setProperty("unit", propval);
  }
}

/// Fluent builder for [adw.clamp.Clamp]
final class ClampGidBuilder : ClampGidBuilderImpl!ClampGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Clamp build()
  {
    return new Clamp(cast(void*)createGObject(Clamp._getGType), No.Take);
  }
}
