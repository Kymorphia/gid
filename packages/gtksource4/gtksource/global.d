/// Global functions for gtksource4 library
module gtksource.global;

import gid.gid;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;


/**
    Free the resources allocated by GtkSourceView. For example it unrefs the
    singleton objects.
    
    It is not mandatory to call this function, it's just to be friendlier to
    memory debugging tools. This function is meant to be called at the end of
    main(). It can be called several times.
*/
void finalize() nothrow
{
  gtk_source_finalize();
}

/**
    Initializes the GtkSourceView library (e.g. for the internationalization).
    
    This function can be called several times, but is meant to be called at the
    beginning of main(), before any other GtkSourceView function call.
*/
void init_() nothrow
{
  gtk_source_init();
}

/**
    Use this function to escape the following characters: `\n`, `\r`, `\t` and `\`.
    
    For a regular expression search, use [glib.regex.Regex.escapeString] instead.
    
    One possible use case is to take the #GtkTextBuffer's selection and put it in a
    search entry. The selection can contain tabulations, newlines, etc. So it's
    better to escape those special characters to better fit in the search entry.
    
    See also: [gtksource.global.utilsUnescapeSearchText].
    
    <warning>
    Warning: the escape and unescape functions are not reciprocal! For example,
    escape (unescape (\)) = \\. So avoid cycles such as: search entry -> unescape
    -> search settings -> escape -> search entry. The original search entry text
    may be modified.
    </warning>

    Params:
      text = the text to escape.
    Returns: the escaped text.
*/
string utilsEscapeSearchText(string text) nothrow
{
  char* _cretval;
  const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
  _cretval = gtk_source_utils_escape_search_text(_text);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Use this function before [gtksource.search_settings.SearchSettings.setSearchText], to
    unescape the following sequences of characters: `\n`, `\r`, `\t` and `\\`.
    The purpose is to easily write those characters in a search entry.
    
    Note that unescaping the search text is not needed for regular expression
    searches.
    
    See also: [gtksource.global.utilsEscapeSearchText].

    Params:
      text = the text to unescape.
    Returns: the unescaped text.
*/
string utilsUnescapeSearchText(string text) nothrow
{
  char* _cretval;
  const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
  _cretval = gtk_source_utils_unescape_search_text(_text);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}
