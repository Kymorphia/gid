/// Module for [StreamCat] class
module gid.gmime3.stream_cat;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.stream;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A concatenation of other #GMimeStream objects.
*/
class StreamCat : gid.gmime3.stream.Stream
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
    return cast(void function())g_mime_stream_cat_get_type != &gidSymbolNotFound ? g_mime_stream_cat_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeStreamCat";
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamCat self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.stream_cat.StreamCat]
      Returns: New builder object
  */
  static StreamCatGidBuilder builder() nothrow
  {
    return new StreamCatGidBuilder;
  }

  /**
      Creates a new #GMimeStreamCat object.
      Returns: a new #GMimeStreamCat stream.
  */
  this() nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_cat_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds the source stream to the cat.
  
      Params:
        source = a source stream
      Returns: `0` on success or %-1 on fail.
  */
  int addSource(gid.gmime3.stream.Stream source) nothrow
  {
    int _retval;
    _retval = g_mime_stream_cat_add_source(cast(GMimeStreamCat*)this._cPtr, source ? cast(GMimeStream*)source._cPtr(No.Dup) : null);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gmime3.stream_cat.StreamCat]
class StreamCatGidBuilderImpl(T) : gid.gmime3.stream.StreamGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.stream_cat.StreamCat]
final class StreamCatGidBuilder : StreamCatGidBuilderImpl!StreamCatGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamCat build() nothrow
  {
    return new StreamCat(cast(void*)createGObject(StreamCat._getGType), Yes.Take);
  }
}
