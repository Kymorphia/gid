/// Module for [FilterDos2Unix] class
module gid.gmime3.filter_dos2_unix;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A filter to convert a stream from Windows/DOS line endings to Unix line endings.
*/
class FilterDos2Unix : gid.gmime3.filter.Filter
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
    return cast(void function())g_mime_filter_dos2unix_get_type != &gidSymbolNotFound ? g_mime_filter_dos2unix_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterDos2Unix";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterDos2Unix self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_dos2_unix.FilterDos2Unix]
      Returns: New builder object
  */
  static FilterDos2UnixGidBuilder builder() nothrow
  {
    return new FilterDos2UnixGidBuilder;
  }

  /**
      Creates a new #GMimeFilterDos2Unix filter.
  
      Params:
        ensureNewline = true if the filter should ensure that the stream ends in a new line
      Returns: a new #GMimeFilterDos2Unix filter.
  */
  this(bool ensureNewline) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GMimeFilter* _cretval;
      _cretval = g_mime_filter_dos2unix_new(ensureNewline);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter_dos2_unix.FilterDos2Unix]
class FilterDos2UnixGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_dos2_unix.FilterDos2Unix]
final class FilterDos2UnixGidBuilder : FilterDos2UnixGidBuilderImpl!FilterDos2UnixGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterDos2Unix build() nothrow
  {
    return new FilterDos2Unix(cast(void*)createGObject(FilterDos2Unix._getGType), Yes.Take);
  }
}
