/// Module for [Uri] class
module gst.uri;

import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A #GstUri object can be used to parse and split a URI string into its
    constituent parts. Two #GstUri objects can be joined to make a new #GstUri
    using the algorithm described in RFC3986.
*/
class Uri : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_uri_get_type != &gidSymbolNotFound ? gst_uri_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Uri self()
  {
    return this;
  }

  /**
      Creates a new #GstUri object with the given URI parts. The path and query
      strings will be broken down into their elements. All strings should not be
      escaped except where indicated.
  
      Params:
        scheme = The scheme for the new URI.
        userinfo = The user-info for the new URI.
        host = The host name for the new URI.
        port = The port number for the new URI or `GST_URI_NO_PORT`.
        path = The path for the new URI with '/' separating path
                               elements.
        query = The query string for the new URI with '&' separating
                                query elements. Elements containing '&' characters
                                should encode them as "&percnt;26".
        fragment = The fragment name for the new URI.
      Returns: A new #GstUri object.
  */
  this(string scheme, string userinfo, string host, uint port, string path = null, string query = null, string fragment = null)
  {
    GstUri* _cretval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    const(char)* _userinfo = userinfo.toCString(No.Alloc);
    const(char)* _host = host.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    const(char)* _query = query.toCString(No.Alloc);
    const(char)* _fragment = fragment.toCString(No.Alloc);
    _cretval = gst_uri_new(_scheme, _userinfo, _host, port, _path, _query, _fragment);
    this(_cretval, Yes.Take);
  }

  /**
      Append a path onto the end of the path in the URI. The path is not
      normalized, call #[gst.uri.Uri.normalize] to normalize the path.
  
      Params:
        relativePath = Relative path to append to the end of the current path.
      Returns: true if the path was appended successfully.
  */
  bool appendPath(string relativePath = null)
  {
    bool _retval;
    const(char)* _relativePath = relativePath.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_append_path(cast(GstUri*)this._cPtr, _relativePath);
    return _retval;
  }

  /**
      Append a single path segment onto the end of the URI path.
  
      Params:
        pathSegment = The path segment string to append to the URI path.
      Returns: true if the path was appended successfully.
  */
  bool appendPathSegment(string pathSegment = null)
  {
    bool _retval;
    const(char)* _pathSegment = pathSegment.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_append_path_segment(cast(GstUri*)this._cPtr, _pathSegment);
    return _retval;
  }

  /**
      Compares two #GstUri objects to see if they represent the same normalized
      URI.
  
      Params:
        second = Second #GstUri to compare.
      Returns: true if the normalized versions of the two URI's would be equal.
  */
  bool equal(gst.uri.Uri second)
  {
    bool _retval;
    _retval = cast(bool)gst_uri_equal(cast(const(GstUri)*)this._cPtr, second ? cast(const(GstUri)*)second._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Like [gst.uri.Uri.fromString] but also joins with a base URI.
  
      Params:
        uri = The URI string to parse.
      Returns: A new #GstUri object.
  */
  gst.uri.Uri fromStringWithBase(string uri)
  {
    GstUri* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = gst_uri_from_string_with_base(cast(GstUri*)this._cPtr, _uri);
    auto _retval = _cretval ? new gst.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the fragment name from the URI or null if it doesn't exist.
      If uri is null then returns null.
      Returns: The host name from the #GstUri object or null.
  */
  string getFragment()
  {
    const(char)* _cretval;
    _cretval = gst_uri_get_fragment(cast(const(GstUri)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the host name from the URI or null if it doesn't exist.
      If uri is null then returns null.
      Returns: The host name from the #GstUri object or null.
  */
  string getHost()
  {
    const(char)* _cretval;
    _cretval = gst_uri_get_host(cast(const(GstUri)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the media fragment table from the URI, as defined by "Media Fragments URI 1.0".
      Hash table returned by this API is a list of "key-value" pairs, and the each
      pair is generated by splitting "URI fragment" per "&" sub-delims, then "key"
      and "value" are split by "=" sub-delims. The "key" returned by this API may
      be undefined keyword by standard.
      A value may be null to indicate that the key should appear in the fragment
      string in the URI, but does not have a value. Free the returned #GHashTable
      with #[glib.hash_table.HashTable.unref] when it is no longer required.
      Modifying this hash table does not affect the fragment in the URI.
      
      See more about Media Fragments URI 1.0 (W3C) at https://www.w3.org/TR/media-frags/
      Returns: The
                 fragment hash table from the URI.
  */
  string[string] getMediaFragmentTable()
  {
    GHashTable* _cretval;
    _cretval = gst_uri_get_media_fragment_table(cast(const(GstUri)*)this._cPtr);
    auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
    return _retval;
  }

  /**
      Extract the path string from the URI object.
      Returns: The path from the URI. Once finished
                                             with the string should be [glib.global.gfree]'d.
  */
  string getPath()
  {
    char* _cretval;
    _cretval = gst_uri_get_path(cast(const(GstUri)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get a list of path segments from the URI.
      Returns: A #GList of path segment
                 strings or null if no path segments are available. Free the list
                 when no longer needed with g_list_free_full(list, g_free).
  */
  string[] getPathSegments()
  {
    GList* _cretval;
    _cretval = gst_uri_get_path_segments(cast(const(GstUri)*)this._cPtr);
    auto _retval = gListToD!(string, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Extract the path string from the URI object as a percent encoded URI path.
      Returns: The path from the URI. Once finished
                                             with the string should be [glib.global.gfree]'d.
  */
  string getPathString()
  {
    char* _cretval;
    _cretval = gst_uri_get_path_string(cast(const(GstUri)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the port number from the URI or `GST_URI_NO_PORT` if it doesn't exist.
      If uri is null then returns `GST_URI_NO_PORT`.
      Returns: The port number from the #GstUri object or `GST_URI_NO_PORT`.
  */
  uint getPort()
  {
    uint _retval;
    _retval = gst_uri_get_port(cast(const(GstUri)*)this._cPtr);
    return _retval;
  }

  /**
      Get a list of the query keys from the URI.
      Returns: A list of keys from
                 the URI query. Free the list with [glib.list.List.free].
  */
  string[] getQueryKeys()
  {
    GList* _cretval;
    _cretval = gst_uri_get_query_keys(cast(const(GstUri)*)this._cPtr);
    auto _retval = gListToD!(string, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get a percent encoded URI query string from the uri.
      Returns: A percent encoded query string. Use
                                             [glib.global.gfree] when no longer needed.
  */
  string getQueryString()
  {
    char* _cretval;
    _cretval = gst_uri_get_query_string(cast(const(GstUri)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get a percent encoded URI query string from the uri, with query parameters
      in the order provided by the keys list. Only parameter keys in the list will
      be added to the resulting URI string. This method can be used by retrieving
      the keys with [gst.uri.Uri.getQueryKeys] and then sorting the list, for
      example.
  
      Params:
        keys = A GList containing the
            query argument key strings.
      Returns: A percent encoded query string. Use
        [glib.global.gfree] when no longer needed.
  */
  string getQueryStringOrdered(string[] keys = null)
  {
    char* _cretval;
    auto _keys = gListFromD!(string)(keys);
    scope(exit) containerFree!(const(GList)*, string, GidOwnership.None)(_keys);
    _cretval = gst_uri_get_query_string_ordered(cast(const(GstUri)*)this._cPtr, _keys);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the query table from the URI. Keys and values in the table are freed
      with g_free when they are deleted. A value may be null to indicate that
      the key should appear in the query string in the URI, but does not have a
      value. Free the returned #GHashTable with #[glib.hash_table.HashTable.unref] when it is
      no longer required. Modifying this hash table will modify the query in the
      URI.
      Returns: The query
                 hash table from the URI.
  */
  string[string] getQueryTable()
  {
    GHashTable* _cretval;
    _cretval = gst_uri_get_query_table(cast(const(GstUri)*)this._cPtr);
    auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
    return _retval;
  }

  /**
      Get the value associated with the query_key key. Will return null if the
      key has no value or if the key does not exist in the URI query table. Because
      null is returned for both missing keys and keys with no value, you should
      use [gst.uri.Uri.queryHasKey] to determine if a key is present in the URI
      query.
  
      Params:
        queryKey = The key to lookup.
      Returns: The value for the given key, or null if not found.
  */
  string getQueryValue(string queryKey)
  {
    const(char)* _cretval;
    const(char)* _queryKey = queryKey.toCString(No.Alloc);
    _cretval = gst_uri_get_query_value(cast(const(GstUri)*)this._cPtr, _queryKey);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the scheme name from the URI or null if it doesn't exist.
      If uri is null then returns null.
      Returns: The scheme from the #GstUri object or null.
  */
  string getScheme()
  {
    const(char)* _cretval;
    _cretval = gst_uri_get_scheme(cast(const(GstUri)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the userinfo (usually in the form "username:password") from the URI
      or null if it doesn't exist. If uri is null then returns null.
      Returns: The userinfo from the #GstUri object or null.
  */
  string getUserinfo()
  {
    const(char)* _cretval;
    _cretval = gst_uri_get_userinfo(cast(const(GstUri)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Tests the uri to see if it is normalized. A null uri is considered to be
      normalized.
      Returns: TRUE if the URI is normalized or is null.
  */
  bool isNormalized()
  {
    bool _retval;
    _retval = cast(bool)gst_uri_is_normalized(cast(const(GstUri)*)this._cPtr);
    return _retval;
  }

  /**
      Check if it is safe to write to this #GstUri.
      
      Check if the refcount of uri is exactly 1, meaning that no other
      reference exists to the #GstUri and that the #GstUri is therefore writable.
      
      Modification of a #GstUri should only be done after verifying that it is
      writable.
      Returns: true if it is safe to write to the object.
  */
  bool isWritable()
  {
    bool _retval;
    _retval = cast(bool)gst_uri_is_writable(cast(const(GstUri)*)this._cPtr);
    return _retval;
  }

  /**
      Join a reference URI onto a base URI using the method from RFC 3986.
      If either URI is null then the other URI will be returned with the ref count
      increased.
  
      Params:
        refUri = The reference URI to join onto the
                                                base URI.
      Returns: A #GstUri which represents the base
                                             with the reference URI joined on.
  */
  gst.uri.Uri join(gst.uri.Uri refUri = null)
  {
    GstUri* _cretval;
    _cretval = gst_uri_join(cast(GstUri*)this._cPtr, refUri ? cast(GstUri*)refUri._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Make the #GstUri writable.
      
      Checks if uri is writable, and if so the original object is returned. If
      not, then a writable copy is made and returned. This gives away the
      reference to uri and returns a reference to the new #GstUri.
      If uri is null then null is returned.
      Returns: A writable version of uri.
  */
  gst.uri.Uri makeWritable()
  {
    GstUri* _cretval;
    _cretval = gst_uri_make_writable(cast(GstUri*)this._cPtr);
    auto _retval = _cretval ? new gst.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Like [gst.uri.Uri.new_], but joins the new URI onto a base URI.
  
      Params:
        scheme = The scheme for the new URI.
        userinfo = The user-info for the new URI.
        host = The host name for the new URI.
        port = The port number for the new URI or `GST_URI_NO_PORT`.
        path = The path for the new URI with '/' separating path
                               elements.
        query = The query string for the new URI with '&' separating
                                query elements. Elements containing '&' characters
                                should encode them as "&percnt;26".
        fragment = The fragment name for the new URI.
      Returns: The new URI joined onto base.
  */
  gst.uri.Uri newWithBase(string scheme, string userinfo, string host, uint port, string path = null, string query = null, string fragment = null)
  {
    GstUri* _cretval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    const(char)* _userinfo = userinfo.toCString(No.Alloc);
    const(char)* _host = host.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    const(char)* _query = query.toCString(No.Alloc);
    const(char)* _fragment = fragment.toCString(No.Alloc);
    _cretval = gst_uri_new_with_base(cast(GstUri*)this._cPtr, _scheme, _userinfo, _host, port, _path, _query, _fragment);
    auto _retval = _cretval ? new gst.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Normalization will remove extra path segments ("." and "..") from the URI. It
      will also convert the scheme and host name to lower case and any
      percent-encoded values to uppercase.
      
      The #GstUri object must be writable. Check with [gst.uri.Uri.isWritable] or use
      [gst.uri.Uri.makeWritable] first.
      Returns: TRUE if the URI was modified.
  */
  bool normalize()
  {
    bool _retval;
    _retval = cast(bool)gst_uri_normalize(cast(GstUri*)this._cPtr);
    return _retval;
  }

  /**
      Check if there is a query table entry for the query_key key.
  
      Params:
        queryKey = The key to lookup.
      Returns: true if query_key exists in the URI query table.
  */
  bool queryHasKey(string queryKey)
  {
    bool _retval;
    const(char)* _queryKey = queryKey.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_query_has_key(cast(const(GstUri)*)this._cPtr, _queryKey);
    return _retval;
  }

  /**
      Remove an entry from the query table by key.
  
      Params:
        queryKey = The key to remove.
      Returns: true if the key existed in the table and was removed.
  */
  bool removeQueryKey(string queryKey)
  {
    bool _retval;
    const(char)* _queryKey = queryKey.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_remove_query_key(cast(GstUri*)this._cPtr, _queryKey);
    return _retval;
  }

  /**
      Sets the fragment string in the URI. Use a value of null in fragment to
      unset the fragment string.
  
      Params:
        fragment = The fragment string to set.
      Returns: true if the fragment was set/unset successfully.
  */
  bool setFragment(string fragment = null)
  {
    bool _retval;
    const(char)* _fragment = fragment.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_set_fragment(cast(GstUri*)this._cPtr, _fragment);
    return _retval;
  }

  /**
      Set or unset the host for the URI.
  
      Params:
        host = The new host string to set or null to unset.
      Returns: true if the host was set/unset successfully.
  */
  bool setHost(string host)
  {
    bool _retval;
    const(char)* _host = host.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_set_host(cast(GstUri*)this._cPtr, _host);
    return _retval;
  }

  /**
      Sets or unsets the path in the URI.
  
      Params:
        path = The new path to set with path segments separated by '/', or use null
                 to unset the path.
      Returns: true if the path was set successfully.
  */
  bool setPath(string path = null)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_set_path(cast(GstUri*)this._cPtr, _path);
    return _retval;
  }

  /**
      Sets or unsets the path in the URI.
  
      Params:
        path = The new percent encoded path to set with path segments separated by
          '/', or use null to unset the path.
      Returns: true if the path was set successfully.
  */
  bool setPathString(string path)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_set_path_string(cast(GstUri*)this._cPtr, _path);
    return _retval;
  }

  /**
      Set or unset the port number for the URI.
  
      Params:
        port = The new port number to set or `GST_URI_NO_PORT` to unset.
      Returns: true if the port number was set/unset successfully.
  */
  bool setPort(uint port)
  {
    bool _retval;
    _retval = cast(bool)gst_uri_set_port(cast(GstUri*)this._cPtr, port);
    return _retval;
  }

  /**
      Sets or unsets the query table in the URI.
  
      Params:
        query = The new percent encoded query string to use to populate the query
                 table, or use null to unset the query table.
      Returns: true if the query table was set successfully.
  */
  bool setQueryString(string query = null)
  {
    bool _retval;
    const(char)* _query = query.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_set_query_string(cast(GstUri*)this._cPtr, _query);
    return _retval;
  }

  /**
      Set the query table to use in the URI. The old table is unreferenced and a
      reference to the new one is used instead. A value if null for query_table
      will remove the query string from the URI.
  
      Params:
        queryTable = The new
                        query table to use.
      Returns: true if the new table was successfully used for the query table.
  */
  bool setQueryTable(string[string] queryTable = null)
  {
    bool _retval;
    auto _queryTable = gHashTableFromD!(string, string)(queryTable);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_queryTable);
    _retval = cast(bool)gst_uri_set_query_table(cast(GstUri*)this._cPtr, _queryTable);
    return _retval;
  }

  /**
      This inserts or replaces a key in the query table. A query_value of null
      indicates that the key has no associated value, but will still be present in
      the query string.
  
      Params:
        queryKey = The key for the query entry.
        queryValue = The value for the key.
      Returns: true if the query table was successfully updated.
  */
  bool setQueryValue(string queryKey, string queryValue = null)
  {
    bool _retval;
    const(char)* _queryKey = queryKey.toCString(No.Alloc);
    const(char)* _queryValue = queryValue.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_set_query_value(cast(GstUri*)this._cPtr, _queryKey, _queryValue);
    return _retval;
  }

  /**
      Set or unset the scheme for the URI.
  
      Params:
        scheme = The new scheme to set or null to unset the scheme.
      Returns: true if the scheme was set/unset successfully.
  */
  bool setScheme(string scheme)
  {
    bool _retval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_set_scheme(cast(GstUri*)this._cPtr, _scheme);
    return _retval;
  }

  /**
      Set or unset the user information for the URI.
  
      Params:
        userinfo = The new user-information string to set or null to unset.
      Returns: true if the user information was set/unset successfully.
  */
  bool setUserinfo(string userinfo)
  {
    bool _retval;
    const(char)* _userinfo = userinfo.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_set_userinfo(cast(GstUri*)this._cPtr, _userinfo);
    return _retval;
  }

  /**
      Convert the URI to a string.
      
      Returns the URI as held in this object as a #gchar* nul-terminated string.
      The caller should [glib.global.gfree] the string once they are finished with it.
      The string is put together as described in RFC 3986.
      Returns: The string version of the URI.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gst_uri_to_string(cast(const(GstUri)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Convert the URI to a string, with the query arguments in a specific order.
      Only the keys in the keys list will be added to the resulting string.
      
      Returns the URI as held in this object as a #gchar* nul-terminated string.
      The caller should [glib.global.gfree] the string once they are finished with it.
      The string is put together as described in RFC 3986.
  
      Params:
        keys = A GList containing
            the query argument key strings.
      Returns: The string version of the URI.
  */
  string toStringWithKeys(string[] keys = null)
  {
    char* _cretval;
    auto _keys = gListFromD!(string)(keys);
    scope(exit) containerFree!(const(GList)*, string, GidOwnership.None)(_keys);
    _cretval = gst_uri_to_string_with_keys(cast(const(GstUri)*)this._cPtr, _keys);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Constructs a URI for a given valid protocol and location.
      
      Free-function: g_free
  
      Params:
        protocol = Protocol for URI
        location = Location for URI
      Returns: a new string for this URI.
  
      Deprecated: Use GstURI instead.
  */
  static string construct(string protocol, string location)
  {
    char* _cretval;
    const(char)* _protocol = protocol.toCString(No.Alloc);
    const(char)* _location = location.toCString(No.Alloc);
    _cretval = gst_uri_construct(_protocol, _location);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses a URI string into a new #GstUri object. Will return NULL if the URI
      cannot be parsed.
  
      Params:
        uri = The URI string to parse.
      Returns: A new #GstUri object, or NULL.
  */
  static gst.uri.Uri fromString(string uri)
  {
    GstUri* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = gst_uri_from_string(_uri);
    auto _retval = _cretval ? new gst.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parses a URI string into a new #GstUri object. Will return NULL if the URI
      cannot be parsed. This is identical to [gst.uri.Uri.fromString] except that
      the userinfo and fragment components of the URI will not be unescaped while
      parsing.
      
      Use this when you need to extract a username and password from the userinfo
      such as https://user:passwordexample.com since either may contain
      a URI-escaped ':' character. [gst.uri.Uri.fromString] will unescape the entire
      userinfo component, which will make it impossible to know which ':'
      delineates the username and password.
      
      The same applies to the fragment component of the URI, such as
      https://example.com/path#fragment which may contain a URI-escaped '#'.
  
      Params:
        uri = The URI string to parse.
      Returns: A new #GstUri object, or NULL.
  */
  static gst.uri.Uri fromStringEscaped(string uri)
  {
    GstUri* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = gst_uri_from_string_escaped(_uri);
    auto _retval = _cretval ? new gst.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Extracts the location out of a given valid URI, ie. the protocol and "://"
      are stripped from the URI, which means that the location returned includes
      the hostname if one is specified. The returned string must be freed using
      [glib.global.gfree].
      
      Free-function: g_free
  
      Params:
        uri = A URI string
      Returns: the location for this URI. Returns
            null if the URI isn't valid. If the URI does not contain a location, an
            empty string is returned.
  */
  static string getLocation(string uri)
  {
    char* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = gst_uri_get_location(_uri);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Extracts the protocol out of a given valid URI. The returned string must be
      freed using [glib.global.gfree].
  
      Params:
        uri = A URI string
      Returns: The protocol for this URI.
  */
  static string getProtocol(string uri)
  {
    char* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = gst_uri_get_protocol(_uri);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Checks if the protocol of a given valid URI matches protocol.
  
      Params:
        uri = a URI string
        protocol = a protocol string (e.g. "http")
      Returns: true if the protocol matches.
  */
  static bool hasProtocol(string uri, string protocol)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _protocol = protocol.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_has_protocol(_uri, _protocol);
    return _retval;
  }

  /**
      Tests if the given string is a valid URI identifier. URIs start with a valid
      scheme followed by ":" and maybe a string identifying the location.
  
      Params:
        uri = A URI string
      Returns: true if the string is a valid URI
  */
  static bool isValid(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_is_valid(_uri);
    return _retval;
  }

  /**
      This is a convenience function to join two URI strings and return the result.
      The returned string should be [glib.global.gfree]'d after use.
  
      Params:
        baseUri = The percent-encoded base URI.
        refUri = The percent-encoded reference URI to join to the base_uri.
      Returns: A string representing the percent-encoded join of
                 the two URIs.
  */
  static string joinStrings(string baseUri, string refUri)
  {
    char* _cretval;
    const(char)* _baseUri = baseUri.toCString(No.Alloc);
    const(char)* _refUri = refUri.toCString(No.Alloc);
    _cretval = gst_uri_join_strings(_baseUri, _refUri);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Checks if an element exists that supports the given URI protocol. Note
      that a positive return value does not imply that a subsequent call to
      [gst.element.Element.makeFromUri] is guaranteed to work.
  
      Params:
        type = Whether to check for a source or a sink
        protocol = Protocol that should be checked for (e.g. "http" or "smb")
      Returns: true
  */
  static bool protocolIsSupported(gst.types.URIType type, string protocol)
  {
    bool _retval;
    const(char)* _protocol = protocol.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_protocol_is_supported(type, _protocol);
    return _retval;
  }

  /**
      Tests if the given string is a valid protocol identifier. Protocols
      must consist of alphanumeric characters, '+', '-' and '.' and must
      start with a alphabetic character. See RFC 3986 Section 3.1.
  
      Params:
        protocol = A string
      Returns: true if the string is a valid protocol identifier, false otherwise.
  */
  static bool protocolIsValid(string protocol)
  {
    bool _retval;
    const(char)* _protocol = protocol.toCString(No.Alloc);
    _retval = cast(bool)gst_uri_protocol_is_valid(_protocol);
    return _retval;
  }
}
