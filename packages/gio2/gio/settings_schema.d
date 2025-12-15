/// Module for [SettingsSchema] class
module gio.settings_schema;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.settings_schema_key;
import gio.types;
import gobject.boxed;

/**
    The [gio.settings_schema_source.SettingsSchemaSource] and [gio.settings_schema.SettingsSchema] APIs provide a
    mechanism for advanced control over the loading of schemas and a
    mechanism for introspecting their content.
    
    Plugin loading systems that wish to provide plugins a way to access
    settings face the problem of how to make the schemas for these
    settings visible to GSettings.  Typically, a plugin will want to ship
    the schema along with itself and it won't be installed into the
    standard system directories for schemas.
    
    [gio.settings_schema_source.SettingsSchemaSource] provides a mechanism for dealing with this
    by allowing the creation of a new ‘schema source’ from which schemas can
    be acquired.  This schema source can then become part of the metadata
    associated with the plugin and queried whenever the plugin requires
    access to some settings.
    
    Consider the following example:
    
    ```c
    typedef struct
    {
       …
       GSettingsSchemaSource *schema_source;
       …
    } Plugin;
    
    Plugin *
    initialise_plugin (const gchar *dir)
    {
      Plugin *plugin;
    
      …
    
      plugin->schema_source =
        g_settings_schema_source_new_from_directory (dir,
          g_settings_schema_source_get_default (), FALSE, NULL);
    
      …
    
      return plugin;
    }
    
    …
    
    GSettings *
    plugin_get_settings (Plugin      *plugin,
                         const gchar *schema_id)
    {
      GSettingsSchema *schema;
    
      if (schema_id == NULL)
        schema_id = plugin->identifier;
    
      schema = g_settings_schema_source_lookup (plugin->schema_source,
                                                schema_id, FALSE);
    
      if (schema == NULL)
        {
          … disable the plugin or abort, etc …
        }
    
      return g_settings_new_full (schema, NULL, NULL);
    }
    ```
    
    The code above shows how hooks should be added to the code that
    initialises (or enables) the plugin to create the schema source and
    how an API can be added to the plugin system to provide a convenient
    way for the plugin to access its settings, using the schemas that it
    ships.
    
    From the standpoint of the plugin, it would need to ensure that it
    ships a gschemas.compiled file as part of itself, and then simply do
    the following:
    
    ```c
    {
      GSettings *settings;
      gint some_value;
    
      settings = plugin_get_settings (self, NULL);
      some_value = g_settings_get_int (settings, "some-value");
      …
    }
    ```
    
    It's also possible that the plugin system expects the schema source
    files (ie: `.gschema.xml` files) instead of a `gschemas.compiled` file.
    In that case, the plugin loading system must compile the schemas for
    itself before attempting to create the settings source.
*/
class SettingsSchema : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_settings_schema_get_type != &gidSymbolNotFound ? g_settings_schema_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SettingsSchema self()
  {
    return this;
  }

  /**
      Get the ID of schema.
      Returns: the ID
  */
  string getId()
  {
    const(char)* _cretval;
    _cretval = g_settings_schema_get_id(cast(GSettingsSchema*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the key named name from schema.
      
      It is a programmer error to request a key that does not exist.  See
      [gio.settings_schema.SettingsSchema.listKeys].
  
      Params:
        name = the name of a key
      Returns: the #GSettingsSchemaKey for name
  */
  gio.settings_schema_key.SettingsSchemaKey getKey(string name)
  {
    GSettingsSchemaKey* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_settings_schema_get_key(cast(GSettingsSchema*)this._cPtr, _name);
    auto _retval = _cretval ? new gio.settings_schema_key.SettingsSchemaKey(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the path associated with schema, or null.
      
      Schemas may be single-instance or relocatable.  Single-instance
      schemas correspond to exactly one set of keys in the backend
      database: those located at the path returned by this function.
      
      Relocatable schemas can be referenced by other schemas and can
      therefore describe multiple sets of keys at different locations.  For
      relocatable schemas, this function will return null.
      Returns: the path of the schema, or null
  */
  string getPath()
  {
    const(char)* _cretval;
    _cretval = g_settings_schema_get_path(cast(GSettingsSchema*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Checks if schema has a key named name.
  
      Params:
        name = the name of a key
      Returns: true if such a key exists
  */
  bool hasKey(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)g_settings_schema_has_key(cast(GSettingsSchema*)this._cPtr, _name);
    return _retval;
  }

  /**
      Gets the list of children in schema.
      
      You should free the return value with [glib.global.strfreev] when you are done
      with it.
      Returns: a list of
           the children on settings, in no defined order
  */
  string[] listChildren()
  {
    char** _cretval;
    _cretval = g_settings_schema_list_children(cast(GSettingsSchema*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Introspects the list of keys on schema.
      
      You should probably not be calling this function from "normal" code
      (since you should already know what keys are in your schema).  This
      function is intended for introspection reasons.
      Returns: a list
          of the keys on schema, in no defined order
  */
  string[] listKeys()
  {
    char** _cretval;
    _cretval = g_settings_schema_list_keys(cast(GSettingsSchema*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }
}
