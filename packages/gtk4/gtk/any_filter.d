/// Module for [AnyFilter] class
module gtk.any_filter;

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
    [gtk.any_filter.AnyFilter] matches an item when at least one of its filters matches.
    
    To add filters to a [gtk.any_filter.AnyFilter], use [gtk.multi_filter.MultiFilter.append].
*/
class AnyFilter : gtk.multi_filter.MultiFilter
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
    return cast(void function())gtk_any_filter_get_type != &gidSymbolNotFound ? gtk_any_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AnyFilter self()
  {
    return this;
  }

  /**
  Get builder for [gtk.any_filter.AnyFilter]
  Returns: New builder object
  */
  static AnyFilterGidBuilder builder()
  {
    return new AnyFilterGidBuilder;
  }

  /**
      Creates a new empty "any" filter.
      
      Use [gtk.multi_filter.MultiFilter.append] to add filters to it.
      
      This filter matches an item if any of the filters added to it
      matches the item. In particular, this means that if no filter
      has been added to it, the filter matches no item.
      Returns: a new [gtk.any_filter.AnyFilter]
  */
  this()
  {
    GtkAnyFilter* _cretval;
    _cretval = gtk_any_filter_new();
    this(_cretval, Yes.Take);
  }
}

class AnyFilterGidBuilderImpl(T) : gtk.multi_filter.MultiFilterGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.any_filter.AnyFilter]
final class AnyFilterGidBuilder : AnyFilterGidBuilderImpl!AnyFilterGidBuilder
{
  AnyFilter build()
  {
    return new AnyFilter(cast(void*)createGObject(AnyFilter._getGType), Yes.Take);
  }
}
