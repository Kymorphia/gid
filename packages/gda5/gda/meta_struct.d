/// Module for [MetaStruct] class
module gda.meta_struct;

import gda.c.functions;
import gda.c.types;
import gda.meta_db_object;
import gda.meta_store;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.object;
import gobject.value;

/** */
class MetaStruct : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_meta_struct_get_type != &gidSymbolNotFound ? gda_meta_struct_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MetaStruct self()
  {
    return this;
  }

  /**
      Creates a new #GdaMetaStruct object. The features specifies the extra features which will also be computed:
      the more features, the more time it takes to run. Features such as table's columns, each column's attributes, etc
      are not optional and will always be computed.
  
      Params:
        store = a #GdaMetaStore from which the new #GdaMetaStruct object will fetch information
        features = the kind of extra information the new #GdaMetaStruct object will compute
      Returns: the newly created #GdaMetaStruct object
  */
  this(gda.meta_store.MetaStore store, gda.types.MetaStructFeature features)
  {
    GdaMetaStruct* _cretval;
    _cretval = gda_meta_struct_new(store ? cast(GdaMetaStore*)store._cPtr(No.Dup) : null, features);
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_meta_struct_error_quark();
    return _retval;
  }

  /**
      Creates a new #GdaMetaDbObject structure in mstruct to represent the database object (of type type)
      which can be uniquely identified as catalog.schema.name.
      
      If catalog is not null, then schema should not be null.
      
      If both catalog and schema are null, then the database object will be the one which is
      "visible" by default (that is which can be accessed only by its short name name).
      
      If catalog is null and schema is not null, then the database object will be the one which
      can be accessed by its schema.name name.
      
      Important note: catalog, schema and name will be used using the following convention:
      <itemizedlist>
        <listitem><para>be surrounded by double quotes for a case sensitive search</para></listitem>
        <listitem><para>otherwise for case insensitive search</para></listitem>
      </itemizedlist>
      
      For more information, see the <link linkend="information_schema:sql_identifiers">
      meta data section about SQL identifiers</link>.
  
      Params:
        type = the type of object to add (which can be GDA_META_DB_UNKNOWN)
        catalog = the catalog the object belongs to (as a G_TYPE_STRING GValue), or null
        schema = the schema the object belongs to (as a G_TYPE_STRING GValue), or null
        name = the object's name (as a G_TYPE_STRING GValue), not null
      Returns: the #GdaMetaDbObject corresponding to the database object if no error occurred, or null
      Throws: [MetaStructException]
  */
  gda.meta_db_object.MetaDbObject complement(gda.types.MetaDbObjectType type, gobject.value.Value catalog, gobject.value.Value schema, gobject.value.Value name)
  {
    GdaMetaDbObject* _cretval;
    GError *_err;
    _cretval = gda_meta_struct_complement(cast(GdaMetaStruct*)this._cPtr, type, catalog ? cast(const(GValue)*)catalog._cPtr(No.Dup) : null, schema ? cast(const(GValue)*)schema._cPtr(No.Dup) : null, name ? cast(const(GValue)*)name._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new MetaStructException(_err);
    auto _retval = _cretval ? new gda.meta_db_object.MetaDbObject(cast(GdaMetaDbObject*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This method is similar to [gda.meta_struct.MetaStruct.complement] and [gda.meta_struct.MetaStruct.complementDefault]
      but creates #GdaMetaDbObject for all the database object.
      
      Please refer to [gda.meta_struct.MetaStruct.complement] form more information.
      Returns: TRUE if no error occurred
      Throws: [MetaStructException]
  */
  bool complementAll()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_meta_struct_complement_all(cast(GdaMetaStruct*)this._cPtr, &_err);
    if (_err)
      throw new MetaStructException(_err);
    return _retval;
  }

  /**
      This method is similar to [gda.meta_struct.MetaStruct.complement] and [gda.meta_struct.MetaStruct.complementAll]
      but creates #GdaMetaDbObject for all the
      database object which are usable using only their short name (that is which do not need to be prefixed by
      the schema in which they are to be used).
      
      Please refer to [gda.meta_struct.MetaStruct.complement] form more information.
      Returns: TRUE if no error occurred
      Throws: [MetaStructException]
  */
  bool complementDefault()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_meta_struct_complement_default(cast(GdaMetaStruct*)this._cPtr, &_err);
    if (_err)
      throw new MetaStructException(_err);
    return _retval;
  }

  /**
      This method is similar to [gda.meta_struct.MetaStruct.complement] but creates #GdaMetaDbObject for all the dependencies
      of dbo.
      
      Please refer to [gda.meta_struct.MetaStruct.complement] form more information.
  
      Params:
        dbo = a #GdaMetaDbObject part of mstruct
      Returns: TRUE if no error occurred
      Throws: [MetaStructException]
  */
  bool complementDepend(gda.meta_db_object.MetaDbObject dbo)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_meta_struct_complement_depend(cast(GdaMetaStruct*)this._cPtr, dbo ? cast(GdaMetaDbObject*)dbo._cPtr : null, &_err);
    if (_err)
      throw new MetaStructException(_err);
    return _retval;
  }

  /**
      This method is similar to [gda.meta_struct.MetaStruct.complement] but creates #GdaMetaDbObject for all the
      database object which are in the schema schema (and in the catalog catalog).
      If catalog is null, then any catalog will be used, and
      if schema is null then any schema will be used (if schema is null then catalog must also be null).
      
      Please refer to [gda.meta_struct.MetaStruct.complement] form more information.
  
      Params:
        catalog = name of a catalog, or null
        schema = name of a schema, or null
      Returns: TRUE if no error occurred
      Throws: [MetaStructException]
  */
  bool complementSchema(gobject.value.Value catalog = null, gobject.value.Value schema = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_meta_struct_complement_schema(cast(GdaMetaStruct*)this._cPtr, catalog ? cast(const(GValue)*)catalog._cPtr(No.Dup) : null, schema ? cast(const(GValue)*)schema._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new MetaStructException(_err);
    return _retval;
  }

  /**
      Creates a new graph (in the GraphViz syntax) representation of mstruct.
  
      Params:
        info = informs what kind of information to show in the resulting graph
      Returns: a new string, or null if an error occurred.
      Throws: [MetaStructException]
  */
  string dumpAsGraph(gda.types.MetaGraphInfo info)
  {
    char* _cretval;
    GError *_err;
    _cretval = gda_meta_struct_dump_as_graph(cast(GdaMetaStruct*)this._cPtr, info, &_err);
    if (_err)
      throw new MetaStructException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Tries to locate the #GdaMetaDbObject structure representing the database object named after
      catalog, schema and name.
      
      If one or both of catalog and schema are null, and more than one database object matches the name, then
      the return value is also null.
  
      Params:
        catalog = the catalog the object belongs to (as a G_TYPE_STRING GValue), or null
        schema = the schema the object belongs to (as a G_TYPE_STRING GValue), or null
        name = the object's name (as a G_TYPE_STRING GValue), not null
      Returns: the #GdaMetaDbObject or null if not found
  */
  gda.meta_db_object.MetaDbObject getDbObject(gobject.value.Value catalog, gobject.value.Value schema, gobject.value.Value name)
  {
    GdaMetaDbObject* _cretval;
    _cretval = gda_meta_struct_get_db_object(cast(GdaMetaStruct*)this._cPtr, catalog ? cast(const(GValue)*)catalog._cPtr(No.Dup) : null, schema ? cast(const(GValue)*)schema._cPtr(No.Dup) : null, name ? cast(const(GValue)*)name._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gda.meta_db_object.MetaDbObject(cast(GdaMetaDbObject*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Loads an XML description into mstruct. This method is still experimental and no description
      the XML file structure is given, and no guarantee that it will remain as it is given.
  
      Params:
        catalog = the catalog name, or null
        schema = the schema name, or null
        xmlSpecFile = the specifications as the name of an XML file
      Returns: TRUE if no error has occurred
      Throws: [MetaStructException]
  */
  bool loadFromXmlFile(string catalog, string schema, string xmlSpecFile)
  {
    bool _retval;
    const(char)* _catalog = catalog.toCString(No.Alloc);
    const(char)* _schema = schema.toCString(No.Alloc);
    const(char)* _xmlSpecFile = xmlSpecFile.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_meta_struct_load_from_xml_file(cast(GdaMetaStruct*)this._cPtr, _catalog, _schema, _xmlSpecFile, &_err);
    if (_err)
      throw new MetaStructException(_err);
    return _retval;
  }

  /**
      Reorders the list of database objects within mstruct in a way specified by sort_type.
  
      Params:
        sortType = the kind of sorting requested
      Returns: TRUE if no error occurred
      Throws: [MetaStructException]
  */
  bool sortDbObjects(gda.types.MetaSortType sortType)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_meta_struct_sort_db_objects(cast(GdaMetaStruct*)this._cPtr, sortType, &_err);
    if (_err)
      throw new MetaStructException(_err);
    return _retval;
  }
}

class MetaStructException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.meta_struct.MetaStruct.errorQuark, cast(int)code, msg);
  }

  alias Code = MetaStructError;
}
