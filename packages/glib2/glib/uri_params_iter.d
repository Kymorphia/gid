/// Module for [UriParamsIter] struct
module glib.uri_params_iter;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.types;

/**
    Many URI schemes include one or more attribute/value pairs as part of the URI
    value. For example `scheme://server/path?query=string&is=there` has two
    attributes – `query=string` and `is=there` – in its query part.
    
    A #GUriParamsIter structure represents an iterator that can be used to
    iterate over the attribute/value pairs of a URI query string. #GUriParamsIter
    structures are typically allocated on the stack and then initialized with
    [glib.uri_params_iter.UriParamsIter.init_]. See the documentation for [glib.uri_params_iter.UriParamsIter.init_]
    for a usage example.
*/
struct UriParamsIter
{
  /** */
  int dummy0;

  /** */
  void* dummy1;

  /** */
  void* dummy2;

  /** */
  ubyte[256] dummy3;

  /**
      Initializes an attribute/value pair iterator.
      
      The iterator keeps pointers to the params and separators arguments, those
      variables must thus outlive the iterator and not be modified during the
      iteration.
      
      If `G_URI_PARAMS_WWW_FORM` is passed in flags, `+` characters in the param
      string will be replaced with spaces in the output. For example, `foo=bar+baz`
      will give attribute `foo` with value `bar baz`. This is commonly used on the
      web (the `https` and `http` schemes only), but is deprecated in favour of
      the equivalent of encoding spaces as ``20``.
      
      Unlike with [glib.uri.Uri.parseParams], `G_URI_PARAMS_CASE_INSENSITIVE` has no
      effect if passed to flags for [glib.uri_params_iter.UriParamsIter.init_]. The caller is
      responsible for doing their own case-insensitive comparisons.
      
      ```c
      GUriParamsIter iter;
      GError *error = NULL;
      gchar *unowned_attr, *unowned_value;
      
      g_uri_params_iter_init (&iter, "foo=bar&baz=bar&Foo=frob&baz=bar2", -1, "&", G_URI_PARAMS_NONE);
      while (g_uri_params_iter_next (&iter, &unowned_attr, &unowned_value, &error))
        {
          g_autofree gchar *attr = g_steal_pointer (&unowned_attr);
          g_autofree gchar *value = g_steal_pointer (&unowned_value);
          // do something with attr and value; this code will be called 4 times
          // for the params string in this example: once with attr=foo and value=bar,
          // then with baz/bar, then Foo/frob, then baz/bar2.
        }
      if (error)
        // handle parsing error
      ```
  
      Params:
        params = a `%`-encoded string containing `attribute=value`
            parameters
        length = the length of params, or `-1` if it is nul-terminated
        separators = the separator byte character set between parameters. (usually
            `&`, but sometimes `;` or both `&;`). Note that this function works on
            bytes not characters, so it can't be used to delimit UTF-8 strings for
            anything but ASCII characters. You may pass an empty set, in which case
            no splitting will occur.
        flags = flags to modify the way the parameters are handled.
  */
  void init_(string params, ptrdiff_t length, string separators, glib.types.UriParamsFlags flags)
  {
    const(char)* _params = params.toCString(No.Alloc);
    const(char)* _separators = separators.toCString(No.Alloc);
    g_uri_params_iter_init(cast(GUriParamsIter*)&this, _params, length, _separators, flags);
  }

  /**
      Advances iter and retrieves the next attribute/value. false is returned if
      an error has occurred (in which case error is set), or if the end of the
      iteration is reached (in which case attribute and value are set to null
      and the iterator becomes invalid). If true is returned,
      [glib.uri_params_iter.UriParamsIter.next] may be called again to receive another
      attribute/value pair.
      
      Note that the same attribute may be returned multiple times, since URIs
      allow repeated attributes.
  
      Params:
        attribute = on return, contains
              the attribute, or null.
        value = on return, contains
              the value, or null.
      Returns: false if the end of the parameters has been reached or an error was
            encountered. true otherwise.
      Throws: [ErrorWrap]
  */
  bool next(out string attribute, out string value)
  {
    bool _retval;
    char* _attribute;
    char* _value;
    GError *_err;
    _retval = cast(bool)g_uri_params_iter_next(cast(GUriParamsIter*)&this, &_attribute, &_value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    attribute = _attribute.fromCString(Yes.Free);
    value = _value.fromCString(Yes.Free);
    return _retval;
  }
}
