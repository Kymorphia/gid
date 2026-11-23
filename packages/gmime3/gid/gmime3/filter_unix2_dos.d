/// Module for [FilterUnix2Dos] class
module gid.gmime3.filter_unix2_dos;

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
class FilterUnix2Dos : gid.gmime3.filter.Filter
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
    return cast(void function())g_mime_filter_unix2dos_get_type != &gidSymbolNotFound ? g_mime_filter_unix2dos_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterUnix2Dos";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterUnix2Dos self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_unix2_dos.FilterUnix2Dos]
      Returns: New builder object
  */
  static FilterUnix2DosGidBuilder builder() nothrow
  {
    return new FilterUnix2DosGidBuilder;
  }

  /**
      Creates a new #GMimeFilterUnix2Dos filter.
  
      Params:
        ensureNewline = true if the filter should ensure that the stream ends in a new line
      Returns: a new #GMimeFilterUnix2Dos filter.
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
      _cretval = g_mime_filter_unix2dos_new(ensureNewline);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter_unix2_dos.FilterUnix2Dos]
class FilterUnix2DosGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_unix2_dos.FilterUnix2Dos]
final class FilterUnix2DosGidBuilder : FilterUnix2DosGidBuilderImpl!FilterUnix2DosGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterUnix2Dos build() nothrow
  {
    return new FilterUnix2Dos(cast(void*)createGObject(FilterUnix2Dos._getGType), Yes.Take);
  }
}
