/// Module for [Bin] class
module gid.adw1.bin;

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
import gid.gtk4.widget;

/**
    A widget with one child.
    
    <picture>
      <source srcset="bin-dark.png" media="(prefers-color-scheme: dark)">
      <img src="bin.png" alt="bin">
    </picture>
    
    The [gid.adw1.bin.Bin] widget has only one child, set with the [gid.adw1.bin.Bin.child]
    property.
    
    It is useful for deriving subclasses, since it provides common code needed
    for handling a single child widget.
*/
class Bin : gid.gtk4.widget.Widget
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
    return cast(void function())adw_bin_get_type != &gidSymbolNotFound ? adw_bin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwBin";
  }

  /** Returns `this`, for use in `with` statements. */
  override Bin self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.bin.Bin]
      Returns: New builder object
  */
  static BinGidBuilder builder() nothrow
  {
    return new BinGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget of the [gid.adw1.bin.Bin].
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget of the [gid.adw1.bin.Bin].
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Creates a new [gid.adw1.bin.Bin].
      Returns: the new created [gid.adw1.bin.Bin]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = adw_bin_new();
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
    _cretval = adw_bin_get_child(cast(AdwBin*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    adw_bin_set_child(cast(AdwBin*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.bin.Bin]
class BinGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget of the [gid.adw1.bin.Bin].
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [gid.adw1.bin.Bin]
final class BinGidBuilder : BinGidBuilderImpl!BinGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Bin build() nothrow
  {
    return new Bin(cast(void*)createGObject(Bin._getGType), Yes.Take);
  }
}
