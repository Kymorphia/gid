/// Module for [EveryFilter] class
module gid.gtk4.every_filter;

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
    Matches an item when each of its filters matches.
    
    To add filters to a [gid.gtk4.every_filter.EveryFilter], use [gid.gtk4.multi_filter.MultiFilter.append].
*/
class EveryFilter : gid.gtk4.multi_filter.MultiFilter
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
    return cast(void function())gtk_every_filter_get_type != &gidSymbolNotFound ? gtk_every_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEveryFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override EveryFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.every_filter.EveryFilter]
      Returns: New builder object
  */
  static EveryFilterGidBuilder builder() nothrow
  {
    return new EveryFilterGidBuilder;
  }

  /**
      Creates a new empty "every" filter.
      
      Use [gid.gtk4.multi_filter.MultiFilter.append] to add filters to it.
      
      This filter matches an item if each of the filters added to it
      matches the item. In particular, this means that if no filter
      has been added to it, the filter matches every item.
      Returns: a new [gid.gtk4.every_filter.EveryFilter]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkEveryFilter* _cretval;
      _cretval = gtk_every_filter_new();
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.every_filter.EveryFilter]
class EveryFilterGidBuilderImpl(T) : gid.gtk4.multi_filter.MultiFilterGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk4.every_filter.EveryFilter]
final class EveryFilterGidBuilder : EveryFilterGidBuilderImpl!EveryFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EveryFilter build() nothrow
  {
    return new EveryFilter(cast(void*)createGObject(EveryFilter._getGType), Yes.Take);
  }
}
