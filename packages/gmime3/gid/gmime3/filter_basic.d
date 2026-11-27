/// Module for [FilterBasic] class
module gid.gmime3.filter_basic;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A basic encoder/decoder filter for the MIME encodings.
*/
@gidGir("FilterBasic", "FilterBasicClass")
class FilterBasic : gid.gmime3.filter.Filter
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
    return cast(void function())g_mime_filter_basic_get_type != &gidSymbolNotFound ? g_mime_filter_basic_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterBasic";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterBasic self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_basic.FilterBasic]
      Returns: New builder object
  */
  static FilterBasicGidBuilder builder() nothrow
  {
    return new FilterBasicGidBuilder;
  }

  /**
      Creates a new basic filter for encoding.
  
      Params:
        encoding = a #GMimeContentEncoding
        encode = true to encode or false to decode
      Returns: a new basic encoder filter.
  */
  this(gid.gmime3.types.ContentEncoding encoding, bool encode) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GMimeFilter* _cretval;
      _cretval = g_mime_filter_basic_new(encoding, encode);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter_basic.FilterBasic]
class FilterBasicGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_basic.FilterBasic]
final class FilterBasicGidBuilder : FilterBasicGidBuilderImpl!FilterBasicGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterBasic build() nothrow
  {
    return new FilterBasic(cast(void*)createGObject(FilterBasic._getGType), Yes.Take);
  }
}
