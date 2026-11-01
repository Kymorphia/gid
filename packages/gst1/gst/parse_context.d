/// Module for [ParseContext] class
module gst.parse_context;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    Opaque structure.
*/
class ParseContext : gobject.boxed.BoxedWrap!(gst_parse_context_get_type)
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
      Allocates a parse context for use with [gst.global.parseLaunchFull] or
      [gst.global.parseLaunchvFull].
      
      Free-function: gst_parse_context_free
      Returns: a newly-allocated parse context. Free
            with [gst.parse_context.ParseContext.free] when no longer needed.
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
  gst.parse_context.ParseContext copy() nothrow
  {
    GstParseContext* _cretval;
    _cretval = gst_parse_context_copy(cast(const(GstParseContext)*)this._cPtr);
    auto _retval = _cretval ? new gst.parse_context.ParseContext(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieve missing elements from a previous run of [gst.global.parseLaunchFull]
      or [gst.global.parseLaunchvFull]. Will only return results if an error code
      of [gst.types.ParseError.NoSuchElement] was returned.
      Returns: a
            null-terminated array of element factory name strings of missing
            elements. Free with [glib.global.strfreev] when no longer needed.
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
