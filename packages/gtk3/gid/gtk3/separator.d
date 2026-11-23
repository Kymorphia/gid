/// Module for [Separator] class
module gid.gtk3.separator;

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
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    GtkSeparator is a horizontal or vertical separator widget, depending on the
    value of the #GtkOrientable:orientation property, used to group the widgets
    within a window. It displays a line with a shadow to make it appear sunken
    into the interface.
    
    # CSS nodes
    
    GtkSeparator has a single CSS node with name separator. The node
    gets one of the .horizontal or .vertical style classes.
*/
class Separator : gid.gtk3.widget.Widget, gid.gtk3.orientable.Orientable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_separator_get_type != &gidSymbolNotFound ? gtk_separator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSeparator";
  }

  /** Returns `this`, for use in `with` statements. */
  override Separator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.separator.Separator]
      Returns: New builder object
  */
  static SeparatorGidBuilder builder() nothrow
  {
    return new SeparatorGidBuilder;
  }

  mixin OrientableT!();

  /**
      Creates a new #GtkSeparator with the given orientation.
  
      Params:
        orientation = the separator’s orientation.
      Returns: a new #GtkSeparator.
  */
  this(gid.gtk3.types.Orientation orientation) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_separator_new(orientation);
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.separator.Separator]
class SeparatorGidBuilderImpl(T) : gid.gtk3.widget.WidgetGidBuilderImpl!T, gid.gtk3.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.separator.Separator]
final class SeparatorGidBuilder : SeparatorGidBuilderImpl!SeparatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Separator build() nothrow
  {
    return new Separator(cast(void*)createGObject(Separator._getGType), Yes.Take);
  }
}
