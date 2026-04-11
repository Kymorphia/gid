/// Module for [Bin] class
module adw.bin;

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
import gtk.widget;

/**
    A widget with one child.
    
    <picture>
      <source srcset="bin-dark.png" media="(prefers-color-scheme: dark)">
      <img src="bin.png" alt="bin">
    </picture>
    
    The [adw.bin.Bin] widget has only one child, set with the `property@Bin:child`
    property.
    
    It is useful for deriving subclasses, since it provides common code needed
    for handling a single child widget.
*/
class Bin : gtk.widget.Widget
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
    return cast(void function())adw_bin_get_type != &gidSymbolNotFound ? adw_bin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Bin self()
  {
    return this;
  }

  /**
      Get builder for [adw.bin.Bin]
      Returns: New builder object
  */
  static BinGidBuilder builder()
  {
    return new BinGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget of the [adw.bin.Bin].
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget of the [adw.bin.Bin].
  */
  @property void child(gtk.widget.Widget propval)
  {
    setChild(propval);
  }

  /**
      Creates a new [adw.bin.Bin].
      Returns: the new created [adw.bin.Bin]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_bin_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_bin_get_child(cast(AdwBin*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    adw_bin_set_child(cast(AdwBin*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [adw.bin.Bin]
class BinGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget of the [adw.bin.Bin].
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval)
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [adw.bin.Bin]
final class BinGidBuilder : BinGidBuilderImpl!BinGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Bin build()
  {
    return new Bin(cast(void*)createGObject(Bin._getGType), No.Take);
  }
}
