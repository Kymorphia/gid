/// Module for [MultiFilter] class
module gid.gtk4.multi_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.filter;
import gid.gtk4.types;

/**
    Base class for filters that combine multiple filters.
*/
class MultiFilter : gid.gtk4.filter.Filter, gid.gio2.list_model.ListModel, gid.gtk4.buildable.Buildable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_multi_filter_get_type != &gidSymbolNotFound ? gtk_multi_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMultiFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override MultiFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.multi_filter.MultiFilter]
      Returns: New builder object
  */
  static MultiFilterGidBuilder builder() nothrow
  {
    return new MultiFilterGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of items.
        
        See [gid.gio2.list_model.ListModel.getItemType].
  */
  @property gid.gobject2.types.GType itemType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items.
        
        See [gid.gio2.list_model.ListModel.getNItems].
  */
  @property uint nItems() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();
  mixin BuildableT!();

  /**
      Adds a filter.
  
      Params:
        filter = a filter to add
  */
  void append(gid.gtk4.filter.Filter filter) nothrow
  {
    gtk_multi_filter_append(cast(GtkMultiFilter*)this._cPtr, filter ? cast(GtkFilter*)filter._cPtr(Yes.Dup) : null);
  }

  /**
      Removes a filter.
      
      If position is larger than the number of filters,
      nothing happens.
  
      Params:
        position = position of filter to remove
  */
  void remove(uint position) nothrow
  {
    gtk_multi_filter_remove(cast(GtkMultiFilter*)this._cPtr, position);
  }
}

/// Fluent builder implementation template for [gid.gtk4.multi_filter.MultiFilter]
class MultiFilterGidBuilderImpl(T) : gid.gtk4.filter.FilterGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.buildable.BuildableGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin BuildableGidBuilderT!();
}

/// Fluent builder for [gid.gtk4.multi_filter.MultiFilter]
final class MultiFilterGidBuilder : MultiFilterGidBuilderImpl!MultiFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MultiFilter build() nothrow
  {
    return new MultiFilter(cast(void*)createGObject(MultiFilter._getGType), Yes.Take);
  }
}
