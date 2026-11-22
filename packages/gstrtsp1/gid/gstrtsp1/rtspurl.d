/// Module for [RTSPUrl] class
module gid.gstrtsp1.rtspurl;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;
import gid.gstrtsp1.types;

/**
    Provides helper functions to handle RTSP urls.
*/
class RTSPUrl : gid.gobject2.boxed.BoxedWrap!(gst_rtsp_url_get_type)
{
  /**
      Create a `rtspurl.RTSPUrl` boxed type.
      Params:
        transports = the transports allowed
        family = the family
        user = the user
        passwd = the password
        host = the host
        port = the port
        abspath = the absolute path
        query = additional query parameters
  */
  this(gid.gstrtsp1.types.RTSPLowerTrans transports = gid.gstrtsp1.types.RTSPLowerTrans.init, gid.gstrtsp1.types.RTSPFamily family = gid.gstrtsp1.types.RTSPFamily.init, string user = string.init, string passwd = string.init, string host = string.init, ushort port = ushort.init, string abspath = string.init, string query = string.init) nothrow
  {
    super(boxedNew!GstRTSPUrl(_getGType), Yes.Take);
    this.transports = transports;
    this.family = family;
    this.user = user;
    this.passwd = passwd;
    this.host = host;
    this.port = port;
    this.abspath = abspath;
    this.query = query;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override RTSPUrl self() nothrow
  {
    return this;
  }

  /**
      Get `transports` field.
      Returns: the transports allowed
  */
  @property gid.gstrtsp1.types.RTSPLowerTrans transports() nothrow
  {
    return cast(gid.gstrtsp1.types.RTSPLowerTrans)(cast(GstRTSPUrl*)this._cPtr).transports;
  }

  /**
      Set `transports` field.
      Params:
        propval = the transports allowed
  */
  @property void transports(gid.gstrtsp1.types.RTSPLowerTrans propval) nothrow
  {
    (cast(GstRTSPUrl*)this._cPtr).transports = cast(GstRTSPLowerTrans)propval;
  }

  /**
      Get `family` field.
      Returns: the family
  */
  @property gid.gstrtsp1.types.RTSPFamily family() nothrow
  {
    return cast(gid.gstrtsp1.types.RTSPFamily)(cast(GstRTSPUrl*)this._cPtr).family;
  }

  /**
      Set `family` field.
      Params:
        propval = the family
  */
  @property void family(gid.gstrtsp1.types.RTSPFamily propval) nothrow
  {
    (cast(GstRTSPUrl*)this._cPtr).family = cast(GstRTSPFamily)propval;
  }

  /**
      Get `user` field.
      Returns: the user
  */
  @property string user() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPUrl*)this._cPtr).user);
  }

  /**
      Set `user` field.
      Params:
        propval = the user
  */
  @property void user(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPUrl*)this._cPtr).user);
    (cast(GstRTSPUrl*)this._cPtr).user = toCString!(Yes.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `passwd` field.
      Returns: the password
  */
  @property string passwd() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPUrl*)this._cPtr).passwd);
  }

  /**
      Set `passwd` field.
      Params:
        propval = the password
  */
  @property void passwd(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPUrl*)this._cPtr).passwd);
    (cast(GstRTSPUrl*)this._cPtr).passwd = toCString!(Yes.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `host` field.
      Returns: the host
  */
  @property string host() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPUrl*)this._cPtr).host);
  }

  /**
      Set `host` field.
      Params:
        propval = the host
  */
  @property void host(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPUrl*)this._cPtr).host);
    (cast(GstRTSPUrl*)this._cPtr).host = toCString!(Yes.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `port` field.
      Returns: the port
  */
  @property ushort port() nothrow
  {
    return (cast(GstRTSPUrl*)this._cPtr).port;
  }

  /**
      Set `port` field.
      Params:
        propval = the port
  */
  @property void port(ushort propval) nothrow
  {
    (cast(GstRTSPUrl*)this._cPtr).port = propval;
  }

  /**
      Get `abspath` field.
      Returns: the absolute path
  */
  @property string abspath() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPUrl*)this._cPtr).abspath);
  }

  /**
      Set `abspath` field.
      Params:
        propval = the absolute path
  */
  @property void abspath(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPUrl*)this._cPtr).abspath);
    (cast(GstRTSPUrl*)this._cPtr).abspath = toCString!(Yes.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `query` field.
      Returns: additional query parameters
  */
  @property string query() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPUrl*)this._cPtr).query);
  }

  /**
      Set `query` field.
      Params:
        propval = additional query parameters
  */
  @property void query(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPUrl*)this._cPtr).query);
    (cast(GstRTSPUrl*)this._cPtr).query = toCString!(Yes.Malloc, Yes.Nullable)(propval);
  }

  /**
      Make a copy of url.
      Returns: a copy of url. Free with gst_rtsp_url_free () after usage.
  */
  gid.gstrtsp1.rtspurl.RTSPUrl copy() nothrow
  {
    GstRTSPUrl* _cretval;
    _cretval = gst_rtsp_url_copy(cast(const(GstRTSPUrl)*)this._cPtr);
    auto _retval = _cretval ? new gid.gstrtsp1.rtspurl.RTSPUrl(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Splits the path of url on '/' boundaries, decoding the resulting components,
      
      The decoding performed by this routine is "URI decoding", as defined in RFC
      3986, commonly known as percent-decoding. For example, a string "foo\`2fbar`"
      will decode to "foo/bar" -- the \`2f` being replaced by the corresponding byte
      with hex value 0x2f. Note that there is no guarantee that the resulting byte
      sequence is valid in any given encoding. As a special case, \`00` is not
      unescaped to NUL, as that would prematurely terminate the string.
      
      Also note that since paths usually start with a slash, the first component
      will usually be the empty string.
      Returns: null-terminated array of URL components. Free with
        [gid.glib2.global.strfreev] when no longer needed.
  */
  string[] decodePathComponents() nothrow
  {
    char** _cretval;
    _cretval = gst_rtsp_url_decode_path_components(cast(const(GstRTSPUrl)*)this._cPtr);
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

  /**
      Get the port number of url.
  
      Params:
        port = location to hold the port
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult getPort(out ushort port) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_url_get_port(cast(const(GstRTSPUrl)*)this._cPtr, cast(ushort*)&port);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Get a newly allocated string describing the request URI for url.
      Returns: a string with the request URI. [gid.glib2.global.gfree] after usage.
  */
  string getRequestUri() nothrow
  {
    char* _cretval;
    _cretval = gst_rtsp_url_get_request_uri(cast(const(GstRTSPUrl)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get a newly allocated string describing the request URI for url
      combined with the control path for control_path
  
      Params:
        controlPath = an RTSP aggregate control path
      Returns: a string with the request URI combined with the control path.
        [gid.glib2.global.gfree] after usage.
  */
  string getRequestUriWithControl(string controlPath) nothrow
  {
    char* _cretval;
    const(char)* _controlPath = controlPath.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_rtsp_url_get_request_uri_with_control(cast(const(GstRTSPUrl)*)this._cPtr, _controlPath);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Set the port number in url to port.
  
      Params:
        port = the port
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult setPort(ushort port) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_url_set_port(cast(GstRTSPUrl*)this._cPtr, port);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Parse the RTSP urlstr into a newly allocated #GstRTSPUrl. Free after usage
      with [gid.gstrtsp1.rtspurl.RTSPUrl.free].
  
      Params:
        urlstr = the url string to parse
        url = location to hold the result.
      Returns: a #GstRTSPResult.
  */
  static gid.gstrtsp1.types.RTSPResult parse(string urlstr, out gid.gstrtsp1.rtspurl.RTSPUrl url) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _urlstr = urlstr.toCString!(No.Malloc, No.Nullable);
    GstRTSPUrl* _url;
    _cretval = gst_rtsp_url_parse(_urlstr, &_url);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    if (_url)
      url = new gid.gstrtsp1.rtspurl.RTSPUrl(cast(void*)_url, Yes.Take);
    return _retval;
  }
}
