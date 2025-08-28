/// Module for [StreamCat] class
module gmime.stream_cat;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;

/**
    A concatenation of other #GMimeStream objects.
*/
class StreamCat : gmime.stream.Stream
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
    return cast(void function())g_mime_stream_cat_get_type != &gidSymbolNotFound ? g_mime_stream_cat_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamCat self()
  {
    return this;
  }

  /**
      Creates a new #GMimeStreamCat object.
      Returns: a new #GMimeStreamCat stream.
  */
  this()
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
  int addSource(gmime.stream.Stream source)
  {
    int _retval;
    _retval = g_mime_stream_cat_add_source(cast(GMimeStreamCat*)this._cPtr, source ? cast(GMimeStream*)source._cPtr(No.Dup) : null);
    return _retval;
  }
}
