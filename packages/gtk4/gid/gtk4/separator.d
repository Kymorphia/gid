/// Module for [Separator] class
module gid.gtk4.separator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Draws a horizontal or vertical line to separate other widgets.
    
    <picture>
      <source srcset="separator-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkSeparator" src="separator.png">
    </picture>
    
    A [gid.gtk4.separator.Separator] can be used to group the widgets within a window.
    It displays a line with a shadow to make it appear sunken into the
    interface.
    
    # CSS nodes
    
    [gid.gtk4.separator.Separator] has a single CSS node with name separator. The node
    gets one of the .horizontal or .vertical style classes.
    
    # Accessibility
    
    [gid.gtk4.separator.Separator] uses the [gid.gtk4.types.AccessibleRole.Separator] role.
*/
class Separator : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
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
      Get builder for [gid.gtk4.separator.Separator]
      Returns: New builder object
  */
  static SeparatorGidBuilder builder() nothrow
  {
    return new SeparatorGidBuilder;
  }

  mixin OrientableT!();

  /**
      Creates a new [gid.gtk4.separator.Separator] with the given orientation.
  
      Params:
        orientation = the separator’s orientation.
      Returns: a new [gid.gtk4.separator.Separator].
  */
  this(gid.gtk4.types.Orientation orientation) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
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

/// Fluent builder implementation template for [gid.gtk4.separator.Separator]
class SeparatorGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();
}

/// Fluent builder for [gid.gtk4.separator.Separator]
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
