/// Module for [MultiSorter] class
module gid.gtk4.multi_sorter;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.sorter;
import gid.gtk4.types;

/**
    Combines multiple sorters by trying them in turn.
    
    If the first sorter compares two items as equal,
    the second is tried next, and so on.
*/
class MultiSorter : gid.gtk4.sorter.Sorter, gid.gio2.list_model.ListModel, gid.gtk4.buildable.Buildable
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
    return cast(void function())gtk_multi_sorter_get_type != &gidSymbolNotFound ? gtk_multi_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMultiSorter";
  }

  /** Returns `this`, for use in `with` statements. */
  override MultiSorter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.multi_sorter.MultiSorter]
      Returns: New builder object
  */
  static MultiSorterGidBuilder builder() nothrow
  {
    return new MultiSorterGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gid.gio2.list_model.ListModel.getItemType].
  */
  @property gid.gobject2.types.GType itemType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gid.gio2.list_model.ListModel.getNItems].
  */
  @property uint nItems() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();
  mixin BuildableT!();

  /**
      Creates a new multi sorter.
      
      This sorter compares items by trying each of the sorters
      in turn, until one returns non-zero. In particular, if
      no sorter has been added to it, it will always compare
      items as equal.
      Returns: a new [gid.gtk4.multi_sorter.MultiSorter]
  */
  this() nothrow
  {
    GtkMultiSorter* _cretval;
    _cretval = gtk_multi_sorter_new();
    this(_cretval, Yes.Take);
  }

  /**
      Add sorter to self to use for sorting at the end.
      
      self will consult all existing sorters before it will
      sort with the given sorter.
  
      Params:
        sorter = a sorter to add
  */
  void append(gid.gtk4.sorter.Sorter sorter) nothrow
  {
    gtk_multi_sorter_append(cast(GtkMultiSorter*)this._cPtr, sorter ? cast(GtkSorter*)sorter._cPtr(Yes.Dup) : null);
  }

  /**
      Removes the sorter at the given position from the list of sorter
      used by self.
      
      If position is larger than the number of sorters, nothing happens.
  
      Params:
        position = position of sorter to remove
  */
  void remove(uint position) nothrow
  {
    gtk_multi_sorter_remove(cast(GtkMultiSorter*)this._cPtr, position);
  }
}

/// Fluent builder implementation template for [gid.gtk4.multi_sorter.MultiSorter]
class MultiSorterGidBuilderImpl(T) : gid.gtk4.sorter.SorterGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.buildable.BuildableGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin BuildableGidBuilderT!();
}

/// Fluent builder for [gid.gtk4.multi_sorter.MultiSorter]
final class MultiSorterGidBuilder : MultiSorterGidBuilderImpl!MultiSorterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MultiSorter build() nothrow
  {
    return new MultiSorter(cast(void*)createGObject(MultiSorter._getGType), Yes.Take);
  }
}
