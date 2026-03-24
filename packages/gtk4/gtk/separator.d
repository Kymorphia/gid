/// Module for [Separator] class
module gtk.separator;

import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.separator.Separator] is a horizontal or vertical separator widget.
    
    ![An example GtkSeparator](separator.png)
    
    A [gtk.separator.Separator] can be used to group the widgets within a window.
    It displays a line with a shadow to make it appear sunken into the
    interface.
    
    # CSS nodes
    
    [gtk.separator.Separator] has a single CSS node with name separator. The node
    gets one of the .horizontal or .vertical style classes.
    
    # Accessibility
    
    [gtk.separator.Separator] uses the [gtk.types.AccessibleRole.Separator] role.
*/
class Separator : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())gtk_separator_get_type != &gidSymbolNotFound ? gtk_separator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Separator self()
  {
    return this;
  }

  /**
  Get builder for [gtk.separator.Separator]
  Returns: New builder object
  */
  static SeparatorGidBuilder builder()
  {
    return new SeparatorGidBuilder;
  }

  mixin OrientableT!();

  /**
      Creates a new [gtk.separator.Separator] with the given orientation.
  
      Params:
        orientation = the separator’s orientation.
      Returns: a new [gtk.separator.Separator].
  */
  this(gtk.types.Orientation orientation)
  {
    GtkWidget* _cretval;
    _cretval = gtk_separator_new(orientation);
    this(_cretval, No.Take);
  }
}

class SeparatorGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();
}

/// Fluent builder for [gtk.separator.Separator]
final class SeparatorGidBuilder : SeparatorGidBuilderImpl!SeparatorGidBuilder
{
  Separator build()
  {
    return new Separator(cast(void*)createGObject(Separator._getGType), No.Take);
  }
}
