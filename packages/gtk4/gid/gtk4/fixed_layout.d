/// Module for [FixedLayout] class
module gid.gtk4.fixed_layout;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_manager;
import gid.gtk4.types;

/**
    Places child widgets at fixed positions.
    
    Most applications should never use this layout manager; fixed positioning
    and sizing requires constant recalculations on where children need to be
    positioned and sized. Other layout managers perform this kind of work
    internally so that application developers don't need to do it. Specifically,
    widgets positioned in a fixed layout manager will need to take into account:
    
    - Themes, which may change widget sizes.
    
    - Fonts other than the one you used to write the app will of course
      change the size of widgets containing text; keep in mind that
      users may use a larger font because of difficulty reading the
      default, or they may be using a different OS that provides different
      fonts.
    
    - Translation of text into other languages changes its size. Also,
      display of non-English text will use a different font in many
      cases.
    
    In addition, [gid.gtk4.fixed_layout.FixedLayout] does not pay attention to text direction and
    thus may produce unwanted results if your app is run under right-to-left
    languages such as Hebrew or Arabic. That is: normally GTK will order
    containers appropriately depending on the text direction, e.g. to put labels
    to the right of the thing they label when using an RTL language;
    [gid.gtk4.fixed_layout.FixedLayout] won't be able to do that for you.
    
    Finally, fixed positioning makes it kind of annoying to add/remove UI
    elements, since you have to reposition all the other  elements. This is a
    long-term maintenance problem for your application.
*/
@gidGir("FixedLayout", "FixedLayoutClass")
class FixedLayout : gid.gtk4.layout_manager.LayoutManager
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
    return cast(void function())gtk_fixed_layout_get_type != &gidSymbolNotFound ? gtk_fixed_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFixedLayout";
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedLayout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.fixed_layout.FixedLayout]
      Returns: New builder object
  */
  static FixedLayoutGidBuilder builder() nothrow
  {
    return new FixedLayoutGidBuilder;
  }

  /**
      Creates a new [gid.gtk4.fixed_layout.FixedLayout].
      Returns: the newly created [gid.gtk4.fixed_layout.FixedLayout]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkLayoutManager* _cretval;
      _cretval = gtk_fixed_layout_new();
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.fixed_layout.FixedLayout]
class FixedLayoutGidBuilderImpl(T) : gid.gtk4.layout_manager.LayoutManagerGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.fixed_layout.FixedLayout]
final class FixedLayoutGidBuilder : FixedLayoutGidBuilderImpl!FixedLayoutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedLayout build() nothrow
  {
    return new FixedLayout(cast(void*)createGObject(FixedLayout._getGType), Yes.Take);
  }
}
