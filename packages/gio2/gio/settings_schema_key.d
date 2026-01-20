/// Module for [SettingsSchemaKey] class
module gio.settings_schema_key;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.variant;
import glib.variant_type;
import gobject.boxed;

/**
    #GSettingsSchemaKey is an opaque data structure and can only be accessed
    using the following functions.
*/
class SettingsSchemaKey : gobject.boxed.Boxed
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
    return cast(void function())g_settings_schema_key_get_type != &gidSymbolNotFound ? g_settings_schema_key_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SettingsSchemaKey self()
  {
    return this;
  }

  /**
      Gets the default value for key.
      
      Note that this is the default value according to the schema.  System
      administrator defaults and lockdown are not visible via this API.
      Returns: the default value for the key
  */
  glib.variant.Variant getDefaultValue()
  {
    GVariant* _cretval;
    _cretval = g_settings_schema_key_get_default_value(cast(GSettingsSchemaKey*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the description for key.
      
      If no description has been provided in the schema for key, returns
      null.
      
      The description can be one sentence to several paragraphs in length.
      Paragraphs are delimited with a double newline.  Descriptions can be
      translated and the value returned from this function is is the
      current locale.
      
      This function is slow.  The summary and description information for
      the schemas is not stored in the compiled schema database so this
      function has to parse all of the source XML files in the schema
      directory.
      Returns: the description for key, or null
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = g_settings_schema_key_get_description(cast(GSettingsSchemaKey*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the name of key.
      Returns: the name of key.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_settings_schema_key_get_name(cast(GSettingsSchemaKey*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Queries the range of a key.
      
      This function will return a #GVariant that fully describes the range
      of values that are valid for key.
      
      The type of #GVariant returned is `(sv)`. The string describes
      the type of range restriction in effect. The type and meaning of
      the value contained in the variant depends on the string.
      
      If the string is `'type'` then the variant contains an empty array.
      The element type of that empty array is the expected type of value
      and all values of that type are valid.
      
      If the string is `'enum'` then the variant contains an array
      enumerating the possible values. Each item in the array is
      a possible valid value and no other values are valid.
      
      If the string is `'flags'` then the variant contains an array. Each
      item in the array is a value that may appear zero or one times in an
      array to be used as the value for this key. For example, if the
      variant contained the array `['x', 'y']` then the valid values for
      the key would be `[]`, `['x']`, `['y']`, `['x', 'y']` and
      `['y', 'x']`.
      
      Finally, if the string is `'range'` then the variant contains a pair
      of like-typed values -- the minimum and maximum permissible values
      for this key.
      
      This information should not be used by normal programs.  It is
      considered to be a hint for introspection purposes.  Normal programs
      should already know what is permitted by their own schema.  The
      format may change in any way in the future -- but particularly, new
      forms may be added to the possibilities described above.
      
      You should free the returned value with [glib.variant.Variant.unref] when it is
      no longer needed.
      Returns: a #GVariant describing the range
  */
  glib.variant.Variant getRange()
  {
    GVariant* _cretval;
    _cretval = g_settings_schema_key_get_range(cast(GSettingsSchemaKey*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the summary for key.
      
      If no summary has been provided in the schema for key, returns
      null.
      
      The summary is a short description of the purpose of the key; usually
      one short sentence.  Summaries can be translated and the value
      returned from this function is is the current locale.
      
      This function is slow.  The summary and description information for
      the schemas is not stored in the compiled schema database so this
      function has to parse all of the source XML files in the schema
      directory.
      Returns: the summary for key, or null
  */
  string getSummary()
  {
    const(char)* _cretval;
    _cretval = g_settings_schema_key_get_summary(cast(GSettingsSchemaKey*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #GVariantType of key.
      Returns: the type of key
  */
  glib.variant_type.VariantType getValueType()
  {
    const(GVariantType)* _cretval;
    _cretval = g_settings_schema_key_get_value_type(cast(GSettingsSchemaKey*)this._cPtr);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks if the given value is within the
      permitted range for key.
      
      It is a programmer error if value is not of the correct type — you
      must check for this first.
  
      Params:
        value = the value to check
      Returns: true if value is valid for key
  */
  bool rangeCheck(glib.variant.Variant value)
  {
    bool _retval;
    _retval = cast(bool)g_settings_schema_key_range_check(cast(GSettingsSchemaKey*)this._cPtr, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
    return _retval;
  }
}
