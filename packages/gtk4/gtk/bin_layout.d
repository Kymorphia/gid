/// Module for [BinLayout] class
module gtk.bin_layout;

import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;

/**
    [gtk.bin_layout.BinLayout] is a [gtk.layout_manager.LayoutManager] subclass useful for create "bins" of
    widgets.
    
    [gtk.bin_layout.BinLayout] will stack each child of a widget on top of each other,
    using the [gtk.widget.Widget.hexpand], [gtk.widget.Widget.vexpand],
    [gtk.widget.Widget.halign], and [gtk.widget.Widget.valign] properties
    of each child to determine where they should be positioned.
*/
class BinLayout : gtk.layout_manager.LayoutManager
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
    return cast(void function())gtk_bin_layout_get_type != &gidSymbolNotFound ? gtk_bin_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BinLayout self()
  {
    return this;
  }

  /**
      Get builder for [gtk.bin_layout.BinLayout]
      Returns: New builder object
  */
  static BinLayoutGidBuilder builder()
  {
    return new BinLayoutGidBuilder;
  }

  /**
      Creates a new [gtk.bin_layout.BinLayout] instance.
      Returns: the newly created [gtk.bin_layout.BinLayout]
  */
  this()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_bin_layout_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gtk.bin_layout.BinLayout]
class BinLayoutGidBuilderImpl(T) : gtk.layout_manager.LayoutManagerGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.bin_layout.BinLayout]
final class BinLayoutGidBuilder : BinLayoutGidBuilderImpl!BinLayoutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BinLayout build()
  {
    return new BinLayout(cast(void*)createGObject(BinLayout._getGType), Yes.Take);
  }
}
