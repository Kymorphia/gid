module gst.parse_context;

import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    Opaque structure.
*/
class ParseContext : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_parse_context_get_type != &gidSymbolNotFound ? gst_parse_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ParseContext self()
  {
    return this;
  }

  /**
      Allocates a parse context for use with [gst.global.parseLaunchFull] or
    [gst.global.parseLaunchvFull].
    
    Free-function: gst_parse_context_free
    Returns:     a newly-allocated parse context. Free
          with [gst.parse_context.ParseContext.free] when no longer needed.
  */
  this()
  {
    GstParseContext* _cretval;
    _cretval = gst_parse_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copies the context.
    Returns:     A copied #GstParseContext
  */
  gst.parse_context.ParseContext copy()
  {
    GstParseContext* _cretval;
    _cretval = gst_parse_context_copy(cast(const(GstParseContext)*)cPtr);
    auto _retval = _cretval ? new gst.parse_context.ParseContext(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieve missing elements from a previous run of [gst.global.parseLaunchFull]
    or [gst.global.parseLaunchvFull]. Will only return results if an error code
    of [gst.types.ParseError.NoSuchElement] was returned.
    Returns:     a
          null-terminated array of element factory name strings of missing
          elements. Free with [glib.global.strfreev] when no longer needed.
  */
  string[] getMissingElements()
  {
    char** _cretval;
    _cretval = gst_parse_context_get_missing_elements(cast(GstParseContext*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }
}
