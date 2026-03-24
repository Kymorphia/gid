/// Module for [FixedLayout] class
module gtk.fixed_layout;

import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;

/**
    [gtk.fixed_layout.FixedLayout] is a layout manager which can place child widgets
    at fixed positions.
    
    Most applications should never use this layout manager; fixed positioning
    and sizing requires constant recalculations on where children need to be
    positioned and sized. Other layout managers perform this kind of work
    internally so that application developers don't need to do it. Specifically,
    widgets positioned in a fixed layout manager will need to take into account:
    
    $(LIST
      * Themes, which may change widget sizes.
      
      * Fonts other than the one you used to write the app will of course
        change the size of widgets containing text; keep in mind that
        users may use a larger font because of difficulty reading the
        default, or they may be using a different OS that provides different
        fonts.
      
      * Translation of text into other languages changes its size. Also,
        display of non-English text will use a different font in many
        cases.
    )
      
    In addition, [gtk.fixed_layout.FixedLayout] does not pay attention to text direction and
    thus may produce unwanted results if your app is run under right-to-left
    languages such as Hebrew or Arabic. That is: normally GTK will order
    containers appropriately depending on the text direction, e.g. to put labels
    to the right of the thing they label when using an RTL language;
    [gtk.fixed_layout.FixedLayout] won't be able to do that for you.
    
    Finally, fixed positioning makes it kind of annoying to add/remove UI
    elements, since you have to reposition all the other  elements. This is a
    long-term maintenance problem for your application.
*/
class FixedLayout : gtk.layout_manager.LayoutManager
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
    return cast(void function())gtk_fixed_layout_get_type != &gidSymbolNotFound ? gtk_fixed_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedLayout self()
  {
    return this;
  }

  /**
  Get builder for [gtk.fixed_layout.FixedLayout]
  Returns: New builder object
  */
  static FixedLayoutGidBuilder builder()
  {
    return new FixedLayoutGidBuilder;
  }

  /**
      Creates a new [gtk.fixed_layout.FixedLayout].
      Returns: the newly created [gtk.fixed_layout.FixedLayout]
  */
  this()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_fixed_layout_new();
    this(_cretval, Yes.Take);
  }
}

class FixedLayoutGidBuilderImpl(T) : gtk.layout_manager.LayoutManagerGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.fixed_layout.FixedLayout]
final class FixedLayoutGidBuilder : FixedLayoutGidBuilderImpl!FixedLayoutGidBuilder
{
  FixedLayout build()
  {
    return new FixedLayout(cast(void*)createGObject(FixedLayout._getGType), Yes.Take);
  }
}
