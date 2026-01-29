/// Module for [KeyFile] class
module glib.key_file;

import gid.gid;
import glib.bytes;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.types;
import gobject.boxed;

/**
    [glib.key_file.KeyFile] parses .ini-like config files.
    
    [glib.key_file.KeyFile] lets you parse, edit or create files containing groups of
    key-value pairs, which we call "key files" for lack of a better name.
    Several freedesktop.org specifications use key files now, e.g the
    [Desktop Entry Specification](http://freedesktop.org/Standards/desktop-entry-spec)
    and the [Icon Theme Specification](http://freedesktop.org/Standards/icon-theme-spec).
    
    The syntax of key files is described in detail in the
    [Desktop Entry Specification](http://freedesktop.org/Standards/desktop-entry-spec),
    here is a quick summary: Key files consists of groups of key-value pairs, interspersed
    with comments.
    
    ```txt
    # this is just an example
    # there can be comments before the first group
    
    [First Group]
    
    Name=Key File Example\tthis value shows\nescaping
    
    # localized strings are stored in multiple key-value pairs
    Welcome=Hello
    Welcome[de]=Hallo
    Welcome[fr_FR]=Bonjour
    Welcome[it]=Ciao
    
    [Another Group]
    
    Numbers=2;20;-200;0
    
    Booleans=true;false;true;true
    ```
    
    Lines beginning with a '#' and blank lines are considered comments.
    
    Groups are started by a header line containing the group name enclosed
    in '[' and ']', and ended implicitly by the start of the next group or
    the end of the file. Each key-value pair must be contained in a group.
    
    Key-value pairs generally have the form `key=value`, with the exception
    of localized strings, which have the form `key[locale]=value`, with a
    locale identifier of the form `lang_COUNTRY@MODIFIER` where `COUNTRY`
    and `MODIFIER` are optional. Space before and after the '=' character
    are ignored. Newline, tab, carriage return and backslash characters in
    value are escaped as `\n`, `\t`, `\r`, and `\\\\`, respectively. To preserve
    leading spaces in values, these can also be escaped as `\s`.
    
    Key files can store strings (possibly with localized variants), integers,
    booleans and lists of these. Lists are separated by a separator character,
    typically ';' or ','. To use the list separator character in a value in
    a list, it has to be escaped by prefixing it with a backslash.
    
    This syntax is obviously inspired by the .ini files commonly met
    on Windows, but there are some important differences:
    
    $(LIST
      * .ini files use the ';' character to begin comments,
        key files use the '#' character.
      
      * Key files do not allow for ungrouped keys meaning only
        comments can precede the first group.
      
      * Key files are always encoded in UTF-8.
      
      * Key and Group names are case-sensitive. For example, a group called
        [GROUP] is a different from [group].
      
      * .ini files don't have a strongly typed boolean entry type,
         they only have GetProfileInt(). In key files, only
         true and false (in lower case) are allowed.
    )
      
    Note that in contrast to the
    [Desktop Entry Specification](http://freedesktop.org/Standards/desktop-entry-spec),
    groups in key files may contain the same key multiple times; the last entry wins.
    Key files may also contain multiple groups with the same name; they are merged
    together. Another difference is that keys and group names in key files are not
    restricted to ASCII characters.
    
    Here is an example of loading a key file and reading a value:
    
    ```c
    g_autoptr(GError) error = NULL;
    g_autoptr(GKeyFile) key_file = g_key_file_new ();
    
    if (!g_key_file_load_from_file (key_file, "key-file.ini", flags, &error))
      {
        if (!g_error_matches (error, G_FILE_ERROR, G_FILE_ERROR_NOENT))
          g_warning ("Error loading key file: %s", error->message);
        return;
      }
    
    g_autofree gchar *val = g_key_file_get_string (key_file, "Group Name", "SomeKey", &error);
    if (val == NULL &&
        !g_error_matches (error, G_KEY_FILE_ERROR, G_KEY_FILE_ERROR_KEY_NOT_FOUND))
      {
        g_warning ("Error finding key in key file: %s", error->message);
        return;
      }
    else if (val == NULL)
      {
        // Fall back to a default value.
        val = g_strdup ("default-value");
      }
    ```
    
    Here is an example of creating and saving a key file:
    
    ```c
    g_autoptr(GKeyFile) key_file = g_key_file_new ();
    const gchar *val = …;
    g_autoptr(GError) error = NULL;
    
    g_key_file_set_string (key_file, "Group Name", "SomeKey", val);
    
    // Save as a file.
    if (!g_key_file_save_to_file (key_file, "key-file.ini", &error))
      {
        g_warning ("Error saving key file: %s", error->message);
        return;
      }
    
    // Or store to a GBytes for use elsewhere.
    gsize data_len;
    g_autofree guint8 *data = (guint8 *) g_key_file_to_data (key_file, &data_len, &error);
    if (data == NULL)
      {
        g_warning ("Error saving key file: %s", error->message);
        return;
      }
    g_autoptr(GBytes) bytes = g_bytes_new_take (g_steal_pointer (&data), data_len);
    ```
*/
class KeyFile : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_key_file_get_type != &gidSymbolNotFound ? g_key_file_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override KeyFile self()
  {
    return this;
  }

  /**
      Creates a new empty #GKeyFile object. Use
      [glib.key_file.KeyFile.loadFromFile], [glib.key_file.KeyFile.loadFromData],
      [glib.key_file.KeyFile.loadFromDirs] or [glib.key_file.KeyFile.loadFromDataDirs] to
      read an existing key file.
      Returns: an empty #GKeyFile.
  */
  this()
  {
    GKeyFile* _cretval;
    _cretval = g_key_file_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns the value associated with key under group_name as a
      boolean.
      
      If key cannot be found then false is returned and error is set
      to `G_KEY_FILE_ERROR_KEY_NOT_FOUND`. Likewise, if the value
      associated with key cannot be interpreted as a boolean then false
      is returned and error is set to `G_KEY_FILE_ERROR_INVALID_VALUE`.
  
      Params:
        groupName = a group name
        key = a key
      Returns: the value associated with the key as a boolean,
           or false if the key was not found or could not be parsed.
      Throws: [KeyFileException]
  */
  bool getBoolean(string groupName, string key)
  {
    bool _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_key_file_get_boolean(cast(GKeyFile*)this._cPtr, _groupName, _key, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Returns the values associated with key under group_name as
      booleans.
      
      If key cannot be found then null is returned and error is set to
      `G_KEY_FILE_ERROR_KEY_NOT_FOUND`. Likewise, if the values associated
      with key cannot be interpreted as booleans then null is returned
      and error is set to `G_KEY_FILE_ERROR_INVALID_VALUE`.
  
      Params:
        groupName = a group name
        key = a key
      Returns: the values associated with the key as a list of booleans, or null if the
           key was not found or could not be parsed. The returned list of booleans
           should be freed with [glib.global.gfree] when no longer needed.
      Throws: [KeyFileException]
  */
  bool[] getBooleanList(string groupName, string key)
  {
    gboolean* _cretval;
    size_t _cretlength;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _cretval = g_key_file_get_boolean_list(cast(GKeyFile*)this._cPtr, _groupName, _key, &_cretlength, &_err);
    if (_err)
      throw new KeyFileException(_err);
    bool[] _retval;

    if (_cretval)
    {
      _retval = new bool[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = cast(bool)_cretval[i];
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Retrieves a comment above key from group_name.
      If key is null then comment will be read from above
      group_name. If both key and group_name are null, then
      comment will be read from above the first group in the file.
      
      Note that the returned string does not include the '#' comment markers,
      but does include any whitespace after them (on each line). It includes
      the line breaks between lines, but does not include the final line break.
  
      Params:
        groupName = a group name, or null
        key = a key
      Returns: a comment that should be freed with [glib.global.gfree]
      Throws: [KeyFileException]
  */
  string getComment(string groupName = null, string key = null)
  {
    char* _cretval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _cretval = g_key_file_get_comment(cast(GKeyFile*)this._cPtr, _groupName, _key, &_err);
    if (_err)
      throw new KeyFileException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the value associated with key under group_name as a
      double. If group_name is null, the start_group is used.
      
      If key cannot be found then 0.0 is returned and error is set to
      `G_KEY_FILE_ERROR_KEY_NOT_FOUND`. Likewise, if the value associated
      with key cannot be interpreted as a double then 0.0 is returned
      and error is set to `G_KEY_FILE_ERROR_INVALID_VALUE`.
  
      Params:
        groupName = a group name
        key = a key
      Returns: the value associated with the key as a double, or
            0.0 if the key was not found or could not be parsed.
      Throws: [KeyFileException]
  */
  double getDouble(string groupName, string key)
  {
    double _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _retval = g_key_file_get_double(cast(GKeyFile*)this._cPtr, _groupName, _key, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Returns the values associated with key under group_name as
      doubles.
      
      If key cannot be found then null is returned and error is set to
      `G_KEY_FILE_ERROR_KEY_NOT_FOUND`. Likewise, if the values associated
      with key cannot be interpreted as doubles then null is returned
      and error is set to `G_KEY_FILE_ERROR_INVALID_VALUE`.
  
      Params:
        groupName = a group name
        key = a key
      Returns: the values associated with the key as a list of doubles, or null if the
            key was not found or could not be parsed. The returned list of doubles
            should be freed with [glib.global.gfree] when no longer needed.
      Throws: [KeyFileException]
  */
  double[] getDoubleList(string groupName, string key)
  {
    double* _cretval;
    size_t _cretlength;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _cretval = g_key_file_get_double_list(cast(GKeyFile*)this._cPtr, _groupName, _key, &_cretlength, &_err);
    if (_err)
      throw new KeyFileException(_err);
    double[] _retval;

    if (_cretval)
    {
      _retval = cast(double[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns all groups in the key file loaded with key_file.
      The array of returned groups will be null-terminated, so
      length may optionally be null.
      Returns: a newly-allocated null-terminated array of strings.
          Use [glib.global.strfreev] to free it.
  */
  string[] getGroups()
  {
    char** _cretval;
    size_t _cretlength;
    _cretval = g_key_file_get_groups(cast(GKeyFile*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns the value associated with key under group_name as a signed
      64-bit integer. This is similar to [glib.key_file.KeyFile.getInteger] but can return
      64-bit results without truncation.
  
      Params:
        groupName = a non-null group name
        key = a non-null key
      Returns: the value associated with the key as a signed 64-bit integer, or
        0 if the key was not found or could not be parsed.
      Throws: [KeyFileException]
  */
  long getInt64(string groupName, string key)
  {
    long _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _retval = g_key_file_get_int64(cast(GKeyFile*)this._cPtr, _groupName, _key, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Returns the value associated with key under group_name as an
      integer.
      
      If key cannot be found then 0 is returned and error is set to
      `G_KEY_FILE_ERROR_KEY_NOT_FOUND`. Likewise, if the value associated
      with key cannot be interpreted as an integer, or is out of range
      for a #gint, then 0 is returned
      and error is set to `G_KEY_FILE_ERROR_INVALID_VALUE`.
  
      Params:
        groupName = a group name
        key = a key
      Returns: the value associated with the key as an integer, or
            0 if the key was not found or could not be parsed.
      Throws: [KeyFileException]
  */
  int getInteger(string groupName, string key)
  {
    int _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _retval = g_key_file_get_integer(cast(GKeyFile*)this._cPtr, _groupName, _key, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Returns the values associated with key under group_name as
      integers.
      
      If key cannot be found then null is returned and error is set to
      `G_KEY_FILE_ERROR_KEY_NOT_FOUND`. Likewise, if the values associated
      with key cannot be interpreted as integers, or are out of range for
      #gint, then null is returned
      and error is set to `G_KEY_FILE_ERROR_INVALID_VALUE`.
  
      Params:
        groupName = a group name
        key = a key
      Returns: the values associated with the key as a list of integers, or null if
            the key was not found or could not be parsed. The returned list of
            integers should be freed with [glib.global.gfree] when no longer needed.
      Throws: [KeyFileException]
  */
  int[] getIntegerList(string groupName, string key)
  {
    int* _cretval;
    size_t _cretlength;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _cretval = g_key_file_get_integer_list(cast(GKeyFile*)this._cPtr, _groupName, _key, &_cretlength, &_err);
    if (_err)
      throw new KeyFileException(_err);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns all keys for the group name group_name.  The array of
      returned keys will be null-terminated, so length may
      optionally be null. In the event that the group_name cannot
      be found, null is returned and error is set to
      `G_KEY_FILE_ERROR_GROUP_NOT_FOUND`.
  
      Params:
        groupName = a group name
      Returns: a newly-allocated null-terminated array of strings.
            Use [glib.global.strfreev] to free it.
      Throws: [KeyFileException]
  */
  string[] getKeys(string groupName)
  {
    char** _cretval;
    size_t _cretlength;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    GError *_err;
    _cretval = g_key_file_get_keys(cast(GKeyFile*)this._cPtr, _groupName, &_cretlength, &_err);
    if (_err)
      throw new KeyFileException(_err);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns the actual locale which the result of
      [glib.key_file.KeyFile.getLocaleString] or [glib.key_file.KeyFile.getLocaleStringList]
      came from.
      
      If calling [glib.key_file.KeyFile.getLocaleString] or
      [glib.key_file.KeyFile.getLocaleStringList] with exactly the same key_file,
      group_name, key and locale, the result of those functions will
      have originally been tagged with the locale that is the result of
      this function.
  
      Params:
        groupName = a group name
        key = a key
        locale = a locale identifier or null
      Returns: the locale from the file, or null if the key was not
          found or the entry in the file was was untranslated
  */
  string getLocaleForKey(string groupName, string key, string locale = null)
  {
    char* _cretval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _locale = locale.toCString(No.Alloc);
    _cretval = g_key_file_get_locale_for_key(cast(GKeyFile*)this._cPtr, _groupName, _key, _locale);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the value associated with key under group_name
      translated in the given locale if available.  If locale is
      null then the current locale is assumed.
      
      If locale is to be non-null, or if the current locale will change over
      the lifetime of the #GKeyFile, it must be loaded with
      `G_KEY_FILE_KEEP_TRANSLATIONS` in order to load strings for all locales.
      
      If key cannot be found then null is returned and error is set
      to `G_KEY_FILE_ERROR_KEY_NOT_FOUND`. If the value associated
      with key cannot be interpreted or no suitable translation can
      be found then the untranslated value is returned.
  
      Params:
        groupName = a group name
        key = a key
        locale = a locale identifier or null
      Returns: a newly allocated string or null if the specified
          key cannot be found.
      Throws: [KeyFileException]
  */
  string getLocaleString(string groupName, string key, string locale = null)
  {
    char* _cretval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _locale = locale.toCString(No.Alloc);
    GError *_err;
    _cretval = g_key_file_get_locale_string(cast(GKeyFile*)this._cPtr, _groupName, _key, _locale, &_err);
    if (_err)
      throw new KeyFileException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the values associated with key under group_name
      translated in the given locale if available.  If locale is
      null then the current locale is assumed.
      
      If locale is to be non-null, or if the current locale will change over
      the lifetime of the #GKeyFile, it must be loaded with
      `G_KEY_FILE_KEEP_TRANSLATIONS` in order to load strings for all locales.
      
      If key cannot be found then null is returned and error is set
      to `G_KEY_FILE_ERROR_KEY_NOT_FOUND`. If the values associated
      with key cannot be interpreted or no suitable translations
      can be found then the untranslated values are returned. The
      returned array is null-terminated, so length may optionally
      be null.
  
      Params:
        groupName = a group name
        key = a key
        locale = a locale identifier or null
      Returns: a newly allocated null-terminated string array
          or null if the key isn't found. The string array should be freed
          with [glib.global.strfreev].
      Throws: [KeyFileException]
  */
  string[] getLocaleStringList(string groupName, string key, string locale = null)
  {
    char** _cretval;
    size_t _cretlength;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _locale = locale.toCString(No.Alloc);
    GError *_err;
    _cretval = g_key_file_get_locale_string_list(cast(GKeyFile*)this._cPtr, _groupName, _key, _locale, &_cretlength, &_err);
    if (_err)
      throw new KeyFileException(_err);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns the name of the start group of the file.
      Returns: The start group of the key file.
  */
  string getStartGroup()
  {
    char* _cretval;
    _cretval = g_key_file_get_start_group(cast(GKeyFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the string value associated with key under group_name.
      Unlike [glib.key_file.KeyFile.getValue], this function handles escape sequences
      like \s.
      
      In the event the key cannot be found, null is returned and
      error is set to `G_KEY_FILE_ERROR_KEY_NOT_FOUND`.  In the
      event that the group_name cannot be found, null is returned
      and error is set to `G_KEY_FILE_ERROR_GROUP_NOT_FOUND`.
  
      Params:
        groupName = a group name
        key = a key
      Returns: a newly allocated string or null if the specified
          key cannot be found.
      Throws: [KeyFileException]
  */
  string getString(string groupName, string key)
  {
    char* _cretval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _cretval = g_key_file_get_string(cast(GKeyFile*)this._cPtr, _groupName, _key, &_err);
    if (_err)
      throw new KeyFileException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the values associated with key under group_name.
      
      In the event the key cannot be found, null is returned and
      error is set to `G_KEY_FILE_ERROR_KEY_NOT_FOUND`.  In the
      event that the group_name cannot be found, null is returned
      and error is set to `G_KEY_FILE_ERROR_GROUP_NOT_FOUND`.
  
      Params:
        groupName = a group name
        key = a key
      Returns: a null-terminated string array or null if the specified
         key cannot be found. The array should be freed with [glib.global.strfreev].
      Throws: [KeyFileException]
  */
  string[] getStringList(string groupName, string key)
  {
    char** _cretval;
    size_t _cretlength;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _cretval = g_key_file_get_string_list(cast(GKeyFile*)this._cPtr, _groupName, _key, &_cretlength, &_err);
    if (_err)
      throw new KeyFileException(_err);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns the value associated with key under group_name as an unsigned
      64-bit integer. This is similar to [glib.key_file.KeyFile.getInteger] but can return
      large positive results without truncation.
  
      Params:
        groupName = a non-null group name
        key = a non-null key
      Returns: the value associated with the key as an unsigned 64-bit integer,
        or 0 if the key was not found or could not be parsed.
      Throws: [KeyFileException]
  */
  ulong getUint64(string groupName, string key)
  {
    ulong _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _retval = g_key_file_get_uint64(cast(GKeyFile*)this._cPtr, _groupName, _key, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Returns the raw value associated with key under group_name.
      Use [glib.key_file.KeyFile.getString] to retrieve an unescaped UTF-8 string.
      
      In the event the key cannot be found, null is returned and
      error is set to `G_KEY_FILE_ERROR_KEY_NOT_FOUND`.  In the
      event that the group_name cannot be found, null is returned
      and error is set to `G_KEY_FILE_ERROR_GROUP_NOT_FOUND`.
  
      Params:
        groupName = a group name
        key = a key
      Returns: a newly allocated string or null if the specified
         key cannot be found.
      Throws: [KeyFileException]
  */
  string getValue(string groupName, string key)
  {
    char* _cretval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _cretval = g_key_file_get_value(cast(GKeyFile*)this._cPtr, _groupName, _key, &_err);
    if (_err)
      throw new KeyFileException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Looks whether the key file has the group group_name.
  
      Params:
        groupName = a group name
      Returns: true if group_name is a part of key_file, false
        otherwise.
  */
  bool hasGroup(string groupName)
  {
    bool _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    _retval = cast(bool)g_key_file_has_group(cast(GKeyFile*)this._cPtr, _groupName);
    return _retval;
  }

  /**
      Loads a key file from the data in bytes into an empty #GKeyFile structure.
      If the object cannot be created then `error` is set to a #GKeyFileError.
  
      Params:
        bytes = a #GBytes
        flags = flags from #GKeyFileFlags
      Returns: true if a key file could be loaded, false otherwise
      Throws: [KeyFileException]
  */
  bool loadFromBytes(glib.bytes.Bytes bytes, glib.types.KeyFileFlags flags)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_key_file_load_from_bytes(cast(GKeyFile*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, flags, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Loads a key file from memory into an empty #GKeyFile structure.
      If the object cannot be created then `error` is set to a #GKeyFileError.
  
      Params:
        data = key file loaded in memory
        flags = flags from #GKeyFileFlags
      Returns: true if a key file could be loaded, false otherwise
      Throws: [KeyFileException]
  */
  bool loadFromData(string data, glib.types.KeyFileFlags flags)
  {
    bool _retval;
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(const(char)*)data.ptr;
    GError *_err;
    _retval = cast(bool)g_key_file_load_from_data(cast(GKeyFile*)this._cPtr, _data, _length, flags, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      This function looks for a key file named file in the paths
      returned from [glib.global.getUserDataDir] and [glib.global.getSystemDataDirs],
      loads the file into key_file and returns the file's full path in
      full_path.  If the file could not be loaded then an `error` is
      set to either a #GFileError or #GKeyFileError.
  
      Params:
        file = a relative path to a filename to open and parse
        fullPath = return location for a string containing the full path
            of the file, or null
        flags = flags from #GKeyFileFlags
      Returns: true if a key file could be loaded, false otherwise
      Throws: [KeyFileException]
  */
  bool loadFromDataDirs(string file, out string fullPath, glib.types.KeyFileFlags flags)
  {
    bool _retval;
    const(char)* _file = file.toCString(No.Alloc);
    char* _fullPath;
    GError *_err;
    _retval = cast(bool)g_key_file_load_from_data_dirs(cast(GKeyFile*)this._cPtr, _file, &_fullPath, flags, &_err);
    if (_err)
      throw new KeyFileException(_err);
    fullPath = _fullPath.fromCString(Yes.Free);
    return _retval;
  }

  /**
      This function looks for a key file named file in the paths
      specified in search_dirs, loads the file into key_file and
      returns the file's full path in full_path.
      
      If the file could not be found in any of the search_dirs,
      `G_KEY_FILE_ERROR_NOT_FOUND` is returned. If
      the file is found but the OS returns an error when opening or reading the
      file, a `G_FILE_ERROR` is returned. If there is a problem parsing the file, a
      `G_KEY_FILE_ERROR` is returned.
  
      Params:
        file = a relative path to a filename to open and parse
        searchDirs = null-terminated array of directories to search
        fullPath = return location for a string containing the full path
            of the file, or null
        flags = flags from #GKeyFileFlags
      Returns: true if a key file could be loaded, false otherwise
      Throws: [KeyFileException]
  */
  bool loadFromDirs(string file, string[] searchDirs, out string fullPath, glib.types.KeyFileFlags flags)
  {
    bool _retval;
    const(char)* _file = file.toCString(No.Alloc);
    const(char)*[] _tmpsearchDirs;
    foreach (s; searchDirs)
      _tmpsearchDirs ~= s.toCString(No.Alloc);
    _tmpsearchDirs ~= null;
    const(char*)* _searchDirs = _tmpsearchDirs.ptr;

    char* _fullPath;
    GError *_err;
    _retval = cast(bool)g_key_file_load_from_dirs(cast(GKeyFile*)this._cPtr, _file, _searchDirs, &_fullPath, flags, &_err);
    if (_err)
      throw new KeyFileException(_err);
    fullPath = _fullPath.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Loads a key file into an empty #GKeyFile structure.
      
      If the OS returns an error when opening or reading the file, a
      `G_FILE_ERROR` is returned. If there is a problem parsing the file, a
      `G_KEY_FILE_ERROR` is returned.
      
      This function will never return a `G_KEY_FILE_ERROR_NOT_FOUND` error. If the
      file is not found, `G_FILE_ERROR_NOENT` is returned.
  
      Params:
        file = the path of a filename to load, in the GLib filename encoding
        flags = flags from #GKeyFileFlags
      Returns: true if a key file could be loaded, false otherwise
      Throws: [KeyFileException]
  */
  bool loadFromFile(string file, glib.types.KeyFileFlags flags)
  {
    bool _retval;
    const(char)* _file = file.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_key_file_load_from_file(cast(GKeyFile*)this._cPtr, _file, flags, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Removes a comment above key from group_name.
      If key is null then comment will be removed above group_name.
      If both key and group_name are null, then comment will
      be removed above the first group in the file.
  
      Params:
        groupName = a group name, or null
        key = a key
      Returns: true if the comment was removed, false otherwise
      Throws: [KeyFileException]
  */
  bool removeComment(string groupName = null, string key = null)
  {
    bool _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_key_file_remove_comment(cast(GKeyFile*)this._cPtr, _groupName, _key, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Removes the specified group, group_name,
      from the key file.
  
      Params:
        groupName = a group name
      Returns: true if the group was removed, false otherwise
      Throws: [KeyFileException]
  */
  bool removeGroup(string groupName)
  {
    bool _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_key_file_remove_group(cast(GKeyFile*)this._cPtr, _groupName, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Removes key in group_name from the key file.
  
      Params:
        groupName = a group name
        key = a key name to remove
      Returns: true if the key was removed, false otherwise
      Throws: [KeyFileException]
  */
  bool removeKey(string groupName, string key)
  {
    bool _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_key_file_remove_key(cast(GKeyFile*)this._cPtr, _groupName, _key, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Writes the contents of key_file to filename using
      [glib.global.fileSetContents]. If you need stricter guarantees about durability of
      the written file than are provided by [glib.global.fileSetContents], use
      [glib.global.fileSetContentsFull] with the return value of [glib.key_file.KeyFile.toData].
      
      This function can fail for any of the reasons that
      [glib.global.fileSetContents] may fail.
  
      Params:
        filename = the name of the file to write to
      Returns: true if successful, else false with error set
      Throws: [KeyFileException]
  */
  bool saveToFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_key_file_save_to_file(cast(GKeyFile*)this._cPtr, _filename, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Associates a new boolean value with key under group_name.
      If key cannot be found then it is created.
  
      Params:
        groupName = a group name
        key = a key
        value = true or false
  */
  void setBoolean(string groupName, string key, bool value)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    g_key_file_set_boolean(cast(GKeyFile*)this._cPtr, _groupName, _key, value);
  }

  /**
      Associates a list of boolean values with key under group_name.
      If key cannot be found then it is created.
      If group_name is null, the start_group is used.
  
      Params:
        groupName = a group name
        key = a key
        list = an array of boolean values
  */
  void setBooleanList(string groupName, string key, bool[] list)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    size_t _length;
    if (list)
      _length = cast(size_t)list.length;

    auto _list = cast(gboolean*)list.ptr;
    g_key_file_set_boolean_list(cast(GKeyFile*)this._cPtr, _groupName, _key, _list, _length);
  }

  /**
      Places a comment above key from group_name.
      
      If key is null then comment will be written above group_name.
      If both key and group_name  are null, then comment will be
      written above the first group in the file.
      
      Note that this function prepends a '#' comment marker to
      each line of comment.
  
      Params:
        groupName = a group name, or null
        key = a key
        comment = a comment
      Returns: true if the comment was written, false otherwise
      Throws: [KeyFileException]
  */
  bool setComment(string groupName, string key, string comment)
  {
    bool _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _comment = comment.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_key_file_set_comment(cast(GKeyFile*)this._cPtr, _groupName, _key, _comment, &_err);
    if (_err)
      throw new KeyFileException(_err);
    return _retval;
  }

  /**
      Associates a new double value with key under group_name.
      If key cannot be found then it is created.
  
      Params:
        groupName = a group name
        key = a key
        value = a double value
  */
  void setDouble(string groupName, string key, double value)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    g_key_file_set_double(cast(GKeyFile*)this._cPtr, _groupName, _key, value);
  }

  /**
      Associates a list of double values with key under
      group_name.  If key cannot be found then it is created.
  
      Params:
        groupName = a group name
        key = a key
        list = an array of double values
  */
  void setDoubleList(string groupName, string key, double[] list)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    size_t _length;
    if (list)
      _length = cast(size_t)list.length;

    auto _list = cast(double*)list.ptr;
    g_key_file_set_double_list(cast(GKeyFile*)this._cPtr, _groupName, _key, _list, _length);
  }

  /**
      Associates a new integer value with key under group_name.
      If key cannot be found then it is created.
  
      Params:
        groupName = a group name
        key = a key
        value = an integer value
  */
  void setInt64(string groupName, string key, long value)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    g_key_file_set_int64(cast(GKeyFile*)this._cPtr, _groupName, _key, value);
  }

  /**
      Associates a new integer value with key under group_name.
      If key cannot be found then it is created.
  
      Params:
        groupName = a group name
        key = a key
        value = an integer value
  */
  void setInteger(string groupName, string key, int value)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    g_key_file_set_integer(cast(GKeyFile*)this._cPtr, _groupName, _key, value);
  }

  /**
      Associates a list of integer values with key under group_name.
      If key cannot be found then it is created.
  
      Params:
        groupName = a group name
        key = a key
        list = an array of integer values
  */
  void setIntegerList(string groupName, string key, int[] list)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    size_t _length;
    if (list)
      _length = cast(size_t)list.length;

    auto _list = cast(int*)list.ptr;
    g_key_file_set_integer_list(cast(GKeyFile*)this._cPtr, _groupName, _key, _list, _length);
  }

  /**
      Sets the character which is used to separate
      values in lists. Typically ';' or ',' are used
      as separators. The default list separator is ';'.
  
      Params:
        separator = the separator
  */
  void setListSeparator(char separator)
  {
    g_key_file_set_list_separator(cast(GKeyFile*)this._cPtr, separator);
  }

  /**
      Associates a string value for key and locale under group_name.
      If the translation for key cannot be found then it is created.
  
      Params:
        groupName = a group name
        key = a key
        locale = a locale identifier
        string_ = a string
  */
  void setLocaleString(string groupName, string key, string locale, string string_)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _locale = locale.toCString(No.Alloc);
    const(char)* _string_ = string_.toCString(No.Alloc);
    g_key_file_set_locale_string(cast(GKeyFile*)this._cPtr, _groupName, _key, _locale, _string_);
  }

  /**
      Associates a list of string values for key and locale under
      group_name.  If the translation for key cannot be found then
      it is created.
  
      Params:
        groupName = a group name
        key = a key
        locale = a locale identifier
        list = a null-terminated array of locale string values
  */
  void setLocaleStringList(string groupName, string key, string locale, string[] list)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _locale = locale.toCString(No.Alloc);
    size_t _length;
    if (list)
      _length = cast(size_t)list.length;

    char*[] _tmplist;
    foreach (s; list)
      _tmplist ~= s.toCString(No.Alloc);
    _tmplist ~= null;
    const(char*)* _list = _tmplist.ptr;

    g_key_file_set_locale_string_list(cast(GKeyFile*)this._cPtr, _groupName, _key, _locale, _list, _length);
  }

  /**
      Associates a new string value with key under group_name.
      If key cannot be found then it is created.
      If group_name cannot be found then it is created.
      Unlike [glib.key_file.KeyFile.setValue], this function handles characters
      that need escaping, such as newlines.
  
      Params:
        groupName = a group name
        key = a key
        string_ = a string
  */
  void setString(string groupName, string key, string string_)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _string_ = string_.toCString(No.Alloc);
    g_key_file_set_string(cast(GKeyFile*)this._cPtr, _groupName, _key, _string_);
  }

  /**
      Associates a list of string values for key under group_name.
      If key cannot be found then it is created.
      If group_name cannot be found then it is created.
  
      Params:
        groupName = a group name
        key = a key
        list = an array of string values
  */
  void setStringList(string groupName, string key, string[] list)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    size_t _length;
    if (list)
      _length = cast(size_t)list.length;

    const(char)*[] _tmplist;
    foreach (s; list)
      _tmplist ~= s.toCString(No.Alloc);
    _tmplist ~= null;
    const(char*)* _list = _tmplist.ptr;

    g_key_file_set_string_list(cast(GKeyFile*)this._cPtr, _groupName, _key, _list, _length);
  }

  /**
      Associates a new integer value with key under group_name.
      If key cannot be found then it is created.
  
      Params:
        groupName = a group name
        key = a key
        value = an integer value
  */
  void setUint64(string groupName, string key, ulong value)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    g_key_file_set_uint64(cast(GKeyFile*)this._cPtr, _groupName, _key, value);
  }

  /**
      Associates a new value with key under group_name.
      
      If key cannot be found then it is created. If group_name cannot
      be found then it is created. To set an UTF-8 string which may contain
      characters that need escaping (such as newlines or spaces), use
      [glib.key_file.KeyFile.setString].
  
      Params:
        groupName = a group name
        key = a key
        value = a string
  */
  void setValue(string groupName, string key, string value)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    g_key_file_set_value(cast(GKeyFile*)this._cPtr, _groupName, _key, _value);
  }

  /**
      This function outputs key_file as a string.
      
      Note that this function never reports an error,
      so it is safe to pass null as error.
      Returns: a newly allocated string holding
          the contents of the #GKeyFile
      Throws: [KeyFileException]
  */
  string toData()
  {
    char* _cretval;
    size_t _cretlength;
    GError *_err;
    _cretval = g_key_file_to_data(cast(GKeyFile*)this._cPtr, &_cretlength, &_err);
    if (_err)
      throw new KeyFileException(_err);
    string _retval;

    if (_cretval)
    {
      _retval = cast(string)_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = g_key_file_error_quark();
    return _retval;
  }
}

class KeyFileException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(glib.key_file.KeyFile.errorQuark, cast(int)code, msg);
  }

  alias Code = KeyFileError;
}
