/// Module for [ParseContext] class
module gid.gst1.parse_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/**
    Opaque structure.
*/
class ParseContext : gid.gobject2.boxed.BoxedWrap!(gst_parse_context_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ParseContext self() nothrow
  {
    return this;
  }

  /**
      Allocates a parse context for use with [gid.gst1.global.parseLaunchFull] or
      [gid.gst1.global.parseLaunchvFull].
      
      Free-function: gst_parse_context_free
      Returns: a newly-allocated parse context. Free
            with [gid.gst1.parse_context.ParseContext.free] when no longer needed.
  */
  this() nothrow
  {
    GstParseContext* _cretval;
    _cretval = gst_parse_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copies the context.
      Returns: A copied #GstParseContext
  */
  gid.gst1.parse_context.ParseContext copy() nothrow
  {
    GstParseContext* _cretval;
    _cretval = gst_parse_context_copy(cast(const(GstParseContext)*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.parse_context.ParseContext(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieve missing elements from a previous run of [gid.gst1.global.parseLaunchFull]
      or [gid.gst1.global.parseLaunchvFull]. Will only return results if an error code
      of [gid.gst1.types.ParseError.NoSuchElement] was returned.
      Returns: a
            null-terminated array of element factory name strings of missing
            elements. Free with [gid.glib2.global.strfreev] when no longer needed.
  */
  string[] getMissingElements() nothrow
  {
    char** _cretval;
    _cretval = gst_parse_context_get_missing_elements(cast(GstParseContext*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }
}
