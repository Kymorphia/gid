/// Module for [EveryFilter] class
module gtk.every_filter;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.gid_builder;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.multi_filter;
import gtk.types;

/**
    [gtk.every_filter.EveryFilter] matches an item when each of its filters matches.
    
    To add filters to a [gtk.every_filter.EveryFilter], use [gtk.multi_filter.MultiFilter.append].
*/
class EveryFilter : gtk.multi_filter.MultiFilter
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
    return cast(void function())gtk_every_filter_get_type != &gidSymbolNotFound ? gtk_every_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EveryFilter self()
  {
    return this;
  }

  /**
  Get builder for [gtk.every_filter.EveryFilter]
  Returns: New builder object
  */
  static EveryFilterGidBuilder builder()
  {
    return new EveryFilterGidBuilder;
  }

  /**
      Creates a new empty "every" filter.
      
      Use [gtk.multi_filter.MultiFilter.append] to add filters to it.
      
      This filter matches an item if each of the filters added to it
      matches the item. In particular, this means that if no filter
      has been added to it, the filter matches every item.
      Returns: a new [gtk.every_filter.EveryFilter]
  */
  this()
  {
    GtkEveryFilter* _cretval;
    _cretval = gtk_every_filter_new();
    this(_cretval, Yes.Take);
  }
}

class EveryFilterGidBuilderImpl(T) : gtk.multi_filter.MultiFilterGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.every_filter.EveryFilter]
final class EveryFilterGidBuilder : EveryFilterGidBuilderImpl!EveryFilterGidBuilder
{
  EveryFilter build()
  {
    return new EveryFilter(cast(void*)createGObject(EveryFilter._getGType), Yes.Take);
  }
}
