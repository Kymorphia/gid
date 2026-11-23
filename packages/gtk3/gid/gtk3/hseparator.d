/// Module for [HSeparator] class
module gid.gtk3.hseparator;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.separator;
import gid.gtk3.types;

/**
    The #GtkHSeparator widget is a horizontal separator, used to group the
    widgets within a window. It displays a horizontal line with a shadow to
    make it appear sunken into the interface.
    
    > The #GtkHSeparator widget is not used as a separator within menus.
    > To create a separator in a menu create an empty #GtkSeparatorMenuItem
    > widget using [gid.gtk3.separator_menu_item.SeparatorMenuItem.new_] and add it to the menu with
    > [gid.gtk3.menu_shell.MenuShell.append].
    
    GtkHSeparator has been deprecated, use #GtkSeparator instead.
*/
class HSeparator : gid.gtk3.separator.Separator
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
    return cast(void function())gtk_hseparator_get_type != &gidSymbolNotFound ? gtk_hseparator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkHSeparator";
  }

  /** Returns `this`, for use in `with` statements. */
  override HSeparator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.hseparator.HSeparator]
      Returns: New builder object
  */
  static HSeparatorGidBuilder builder() nothrow
  {
    return new HSeparatorGidBuilder;
  }

  /**
      Creates a new #GtkHSeparator.
      Returns: a new #GtkHSeparator.
  
      Deprecated: Use [gid.gtk4.separator.Separator.new_] with [gid.gtk4.types.Orientation.Horizontal] instead
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
      _cretval = gtk_hseparator_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.hseparator.HSeparator]
class HSeparatorGidBuilderImpl(T) : gid.gtk3.separator.SeparatorGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.hseparator.HSeparator]
final class HSeparatorGidBuilder : HSeparatorGidBuilderImpl!HSeparatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HSeparator build() nothrow
  {
    return new HSeparator(cast(void*)createGObject(HSeparator._getGType), Yes.Take);
  }
}
