/// Module for [HSeparator] class
module gtk.hseparator;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.separator;
import gtk.types;

/**
    The #GtkHSeparator widget is a horizontal separator, used to group the
    widgets within a window. It displays a horizontal line with a shadow to
    make it appear sunken into the interface.
    
    > The #GtkHSeparator widget is not used as a separator within menus.
    > To create a separator in a menu create an empty #GtkSeparatorMenuItem
    > widget using [gtk.separator_menu_item.SeparatorMenuItem.new_] and add it to the menu with
    > [gtk.menu_shell.MenuShell.append].
    
    GtkHSeparator has been deprecated, use #GtkSeparator instead.
*/
class HSeparator : gtk.separator.Separator
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
    return cast(void function())gtk_hseparator_get_type != &gidSymbolNotFound ? gtk_hseparator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HSeparator self()
  {
    return this;
  }

  /**
      Get builder for [gtk.hseparator.HSeparator]
      Returns: New builder object
  */
  static HSeparatorGidBuilder builder()
  {
    return new HSeparatorGidBuilder;
  }

  /**
      Creates a new #GtkHSeparator.
      Returns: a new #GtkHSeparator.
  
      Deprecated: Use [gtk.separator.Separator.new_] with [gtk.types.Orientation.Horizontal] instead
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_hseparator_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtk.hseparator.HSeparator]
class HSeparatorGidBuilderImpl(T) : gtk.separator.SeparatorGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.hseparator.HSeparator]
final class HSeparatorGidBuilder : HSeparatorGidBuilderImpl!HSeparatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HSeparator build()
  {
    return new HSeparator(cast(void*)createGObject(HSeparator._getGType), No.Take);
  }
}
