/// Module for [SettingsSchemaSource] class
module gio.settings_schema_source;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.settings_schema;
import gio.types;
import glib.error;
import gobject.boxed;

/**
    This is an opaque structure type.  You may not access it directly.
*/
class SettingsSchemaSource : gobject.boxed.Boxed
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
    return cast(void function())g_settings_schema_source_get_type != &gidSymbolNotFound ? g_settings_schema_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SettingsSchemaSource self()
  {
    return this;
  }

  /**
      Attempts to create a new schema source corresponding to the contents
      of the given directory.
      
      This function is not required for normal uses of #GSettings but it
      may be useful to authors of plugin management systems.
      
      The directory should contain a file called `gschemas.compiled` as
      produced by the [glib-compile-schemas][glib-compile-schemas] tool.
      
      If trusted is true then `gschemas.compiled` is trusted not to be
      corrupted. This assumption has a performance advantage, but can result
      in crashes or inconsistent behaviour in the case of a corrupted file.
      Generally, you should set trusted to true for files installed by the
      system and to false for files in the home directory.
      
      In either case, an empty file or some types of corruption in the file will
      result in `G_FILE_ERROR_INVAL` being returned.
      
      If parent is non-null then there are two effects.
      
      First, if [gio.settings_schema_source.SettingsSchemaSource.lookup] is called with the
      recursive flag set to true and the schema can not be found in the
      source, the lookup will recurse to the parent.
      
      Second, any references to other schemas specified within this
      source (ie: `child` or `extends`) references may be resolved
      from the parent.
      
      For this second reason, except in very unusual situations, the
      parent should probably be given as the default schema source, as
      returned by [gio.settings_schema_source.SettingsSchemaSource.getDefault].
  
      Params:
        directory = the filename of a directory
        parent = a #GSettingsSchemaSource, or null
        trusted = true, if the directory is trusted
      Returns: 
      Throws: [ErrorWrap]
  */
  static gio.settings_schema_source.SettingsSchemaSource newFromDirectory(string directory, gio.settings_schema_source.SettingsSchemaSource parent, bool trusted)
  {
    GSettingsSchemaSource* _cretval;
    const(char)* _directory = directory.toCString(No.Alloc);
    GError *_err;
    _cretval = g_settings_schema_source_new_from_directory(_directory, parent ? cast(GSettingsSchemaSource*)parent._cPtr(No.Dup) : null, trusted, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gio.settings_schema_source.SettingsSchemaSource(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Lists the schemas in a given source.
      
      If recursive is true then include parent sources.  If false then
      only include the schemas from one source (ie: one directory).  You
      probably want true.
      
      Non-relocatable schemas are those for which you can call
      [gio.settings.Settings.new_].  Relocatable schemas are those for which you must
      use [gio.settings.Settings.newWithPath].
      
      Do not call this function from normal programs.  This is designed for
      use by database editors, commandline tools, etc.
  
      Params:
        recursive = if we should recurse
        nonRelocatable = the
            list of non-relocatable schemas, in no defined order
        relocatable = the list
            of relocatable schemas, in no defined order
  */
  void listSchemas(bool recursive, out string[] nonRelocatable, out string[] relocatable)
  {
    char** _nonRelocatable;
    char** _relocatable;
    g_settings_schema_source_list_schemas(cast(GSettingsSchemaSource*)this._cPtr, recursive, &_nonRelocatable, &_relocatable);
    uint _lennonRelocatable;
    if (_nonRelocatable)
    {
      for (; _nonRelocatable[_lennonRelocatable] !is null; _lennonRelocatable++)
      {
      }
    }

    nonRelocatable.length = _lennonRelocatable;
    foreach (i; 0 .. _lennonRelocatable)
      nonRelocatable[i] = _nonRelocatable[i].fromCString(Yes.Free);
    gFree(cast(void*)_nonRelocatable);
    uint _lenrelocatable;
    if (_relocatable)
    {
      for (; _relocatable[_lenrelocatable] !is null; _lenrelocatable++)
      {
      }
    }

    relocatable.length = _lenrelocatable;
    foreach (i; 0 .. _lenrelocatable)
      relocatable[i] = _relocatable[i].fromCString(Yes.Free);
    gFree(cast(void*)_relocatable);
  }

  /**
      Looks up a schema with the identifier schema_id in source.
      
      This function is not required for normal uses of #GSettings but it
      may be useful to authors of plugin management systems or to those who
      want to introspect the content of schemas.
      
      If the schema isn't found directly in source and recursive is true
      then the parent sources will also be checked.
      
      If the schema isn't found, null is returned.
  
      Params:
        schemaId = a schema ID
        recursive = true if the lookup should be recursive
      Returns: a new #GSettingsSchema
  */
  gio.settings_schema.SettingsSchema lookup(string schemaId, bool recursive)
  {
    GSettingsSchema* _cretval;
    const(char)* _schemaId = schemaId.toCString(No.Alloc);
    _cretval = g_settings_schema_source_lookup(cast(GSettingsSchemaSource*)this._cPtr, _schemaId, recursive);
    auto _retval = _cretval ? new gio.settings_schema.SettingsSchema(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the default system schema source.
      
      This function is not required for normal uses of #GSettings but it
      may be useful to authors of plugin management systems or to those who
      want to introspect the content of schemas.
      
      If no schemas are installed, null will be returned.
      
      The returned source may actually consist of multiple schema sources
      from different directories, depending on which directories were given
      in `XDG_DATA_DIRS` and `GSETTINGS_SCHEMA_DIR`. For this reason, all
      lookups performed against the default source should probably be done
      recursively.
      Returns: the default schema source
  */
  static gio.settings_schema_source.SettingsSchemaSource getDefault()
  {
    GSettingsSchemaSource* _cretval;
    _cretval = g_settings_schema_source_get_default();
    auto _retval = _cretval ? new gio.settings_schema_source.SettingsSchemaSource(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
