/// Module for [MultiSorter] class
module gtk.multi_sorter;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.sorter;
import gtk.types;

/**
    [gtk.multi_sorter.MultiSorter] combines multiple sorters by trying them
    in turn.
    
    If the first sorter compares two items as equal,
    the second is tried next, and so on.
*/
class MultiSorter : gtk.sorter.Sorter, gio.list_model.ListModel, gtk.buildable.Buildable
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
    return cast(void function())gtk_multi_sorter_get_type != &gidSymbolNotFound ? gtk_multi_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MultiSorter self()
  {
    return this;
  }

  /**
      Get builder for [gtk.multi_sorter.MultiSorter]
      Returns: New builder object
  */
  static MultiSorterGidBuilder builder()
  {
    return new MultiSorterGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gio.list_model.ListModel.getItemType].
  */
  @property gobject.types.GType itemType()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();
  mixin BuildableT!();

  /**
      Creates a new multi sorter.
      
      This sorter compares items by trying each of the sorters
      in turn, until one returns non-zero. In particular, if
      no sorter has been added to it, it will always compare
      items as equal.
      Returns: a new [gtk.multi_sorter.MultiSorter]
  */
  this()
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
  void append(gtk.sorter.Sorter sorter)
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
  void remove(uint position)
  {
    gtk_multi_sorter_remove(cast(GtkMultiSorter*)this._cPtr, position);
  }
}

/// Fluent builder implementation template for [gtk.multi_sorter.MultiSorter]
class MultiSorterGidBuilderImpl(T) : gtk.sorter.SorterGidBuilderImpl!T, gio.list_model.ListModelGidBuilderImpl!T, gtk.buildable.BuildableGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin BuildableGidBuilderT!();
}

/// Fluent builder for [gtk.multi_sorter.MultiSorter]
final class MultiSorterGidBuilder : MultiSorterGidBuilderImpl!MultiSorterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MultiSorter build()
  {
    return new MultiSorter(cast(void*)createGObject(MultiSorter._getGType), Yes.Take);
  }
}
