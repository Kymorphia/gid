/// Module for [VButtonBox] class
module gid.gtk3.vbutton_box;

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
class VButtonBox : gid.gtk3.button_box.ButtonBox
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
    return cast(void function())gtk_vbutton_box_get_type != &gidSymbolNotFound ? gtk_vbutton_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkVButtonBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override VButtonBox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.vbutton_box.VButtonBox]
      Returns: New builder object
  */
  static VButtonBoxGidBuilder builder() nothrow
  {
    return new VButtonBoxGidBuilder;
  }

  /**
      Creates a new vertical button box.
      Returns: a new button box #GtkWidget.
  
      Deprecated: Use [gid.gtk3.button_box.ButtonBox.new_] with [gid.gtk4.types.Orientation.Vertical] instead
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
      _cretval = gtk_vbutton_box_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.vbutton_box.VButtonBox]
class VButtonBoxGidBuilderImpl(T) : gid.gtk3.button_box.ButtonBoxGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.vbutton_box.VButtonBox]
final class VButtonBoxGidBuilder : VButtonBoxGidBuilderImpl!VButtonBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VButtonBox build() nothrow
  {
    return new VButtonBox(cast(void*)createGObject(VButtonBox._getGType), Yes.Take);
  }
}
