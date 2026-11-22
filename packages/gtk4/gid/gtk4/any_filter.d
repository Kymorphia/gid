/// Module for [AnyFilter] class
module gid.gtk4.any_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.multi_filter;
import gid.gtk4.types;

/**
    Matches an item when at least one of its filters matches.
    
    To add filters to a [gid.gtk4.any_filter.AnyFilter], use [gid.gtk4.multi_filter.MultiFilter.append].
*/
class AnyFilter : gid.gtk4.multi_filter.MultiFilter
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
    return cast(void function())gtk_any_filter_get_type != &gidSymbolNotFound ? gtk_any_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkAnyFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override AnyFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.any_filter.AnyFilter]
      Returns: New builder object
  */
  static AnyFilterGidBuilder builder() nothrow
  {
    return new AnyFilterGidBuilder;
  }

  /**
      Creates a new empty "any" filter.
      
      Use [gid.gtk4.multi_filter.MultiFilter.append] to add filters to it.
      
      This filter matches an item if any of the filters added to it
      matches the item. In particular, this means that if no filter
      has been added to it, the filter matches no item.
      Returns: a new [gid.gtk4.any_filter.AnyFilter]
  */
  this() nothrow
  {
    GtkAnyFilter* _cretval;
    _cretval = gtk_any_filter_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gtk4.any_filter.AnyFilter]
class AnyFilterGidBuilderImpl(T) : gid.gtk4.multi_filter.MultiFilterGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk4.any_filter.AnyFilter]
final class AnyFilterGidBuilder : AnyFilterGidBuilderImpl!AnyFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AnyFilter build() nothrow
  {
    return new AnyFilter(cast(void*)createGObject(AnyFilter._getGType), Yes.Take);
  }
}
