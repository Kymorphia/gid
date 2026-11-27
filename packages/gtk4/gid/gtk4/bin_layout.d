/// Module for [BinLayout] class
module gid.gtk4.bin_layout;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_manager;
import gid.gtk4.types;

/**
    A layout manager for widgets with a single child.
    
    [gid.gtk4.bin_layout.BinLayout] will stack each child of a widget on top of each other,
    using the [gid.gtk4.widget.Widget.hexpand], [gid.gtk4.widget.Widget.vexpand],
    [gid.gtk4.widget.Widget.halign], and [gid.gtk4.widget.Widget.valign] properties
    of each child to determine where they should be positioned.
*/
@gidGir("BinLayout", "BinLayoutClass")
class BinLayout : gid.gtk4.layout_manager.LayoutManager
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
    return cast(void function())gtk_bin_layout_get_type != &gidSymbolNotFound ? gtk_bin_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkBinLayout";
  }

  /** Returns `this`, for use in `with` statements. */
  override BinLayout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.bin_layout.BinLayout]
      Returns: New builder object
  */
  static BinLayoutGidBuilder builder() nothrow
  {
    return new BinLayoutGidBuilder;
  }

  /**
      Creates a new [gid.gtk4.bin_layout.BinLayout] instance.
      Returns: the newly created [gid.gtk4.bin_layout.BinLayout]
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
      _cretval = gtk_bin_layout_new();
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.bin_layout.BinLayout]
class BinLayoutGidBuilderImpl(T) : gid.gtk4.layout_manager.LayoutManagerGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.bin_layout.BinLayout]
final class BinLayoutGidBuilder : BinLayoutGidBuilderImpl!BinLayoutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BinLayout build() nothrow
  {
    return new BinLayout(cast(void*)createGObject(BinLayout._getGType), Yes.Take);
  }
}
