/// Module for [HButtonBox] class
module gid.gtk3.hbutton_box;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.button_box;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;

/** */
class HButtonBox : gid.gtk3.button_box.ButtonBox
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
    return cast(void function())gtk_hbutton_box_get_type != &gidSymbolNotFound ? gtk_hbutton_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkHButtonBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override HButtonBox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.hbutton_box.HButtonBox]
      Returns: New builder object
  */
  static HButtonBoxGidBuilder builder() nothrow
  {
    return new HButtonBoxGidBuilder;
  }

  /**
      Creates a new horizontal button box.
      Returns: a new button box #GtkWidget.
  
      Deprecated: Use [gid.gtk3.button_box.ButtonBox.new_] with [gid.gtk4.types.Orientation.Horizontal] instead
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
      _cretval = gtk_hbutton_box_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.hbutton_box.HButtonBox]
class HButtonBoxGidBuilderImpl(T) : gid.gtk3.button_box.ButtonBoxGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.hbutton_box.HButtonBox]
final class HButtonBoxGidBuilder : HButtonBoxGidBuilderImpl!HButtonBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HButtonBox build() nothrow
  {
    return new HButtonBox(cast(void*)createGObject(HButtonBox._getGType), Yes.Take);
  }
}
