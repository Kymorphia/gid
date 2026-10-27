/// Module for [MetaDbObject] class
module gda.meta_db_object;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/**
    Struture to hold information about each database object (tables, views, ...),
    its contents must not be modified.
    
    Note: @obj_catalog, @obj_schema, @obj_name, @obj_short_name and @obj_full_name respect the
    <link linkend="information_schema:sql_identifiers">SQL identifiers</link> convention used in
    #GdaMetaStore objects. Before using these SQL identifiers, you should check the
    [gda.global.sqlIdentifierQuote] to know if is it is necessary to surround by double quotes
    before using in an SQL statement.
*/
class MetaDbObject
{
  GdaMetaDbObject _cInstance;

  /**
      Create a `meta_db_object.MetaDbObject` wrap type.
      Params:
        objType = the type of object (table, view)
        outdated = set to true if the information in this #GdaMetaDbObject may be outdated because the #GdaMetaStore has been updated
        objCatalog = the catalog the object is in
        objSchema = the schema the object is in
        objName = the object's name
        objShortName = the shortest way to name the object
        objFullName = the full name of the object (in the &lt;schema&gt;.&lt;nameagt; notation
        objOwner = object's owner
  */
  this(gda.types.MetaDbObjectType objType = gda.types.MetaDbObjectType.init, bool outdated = bool.init, string objCatalog = string.init, string objSchema = string.init, string objName = string.init, string objShortName = string.init, string objFullName = string.init, string objOwner = string.init) nothrow
  {
    this.objType = objType;
    this.outdated = outdated;
    this.objCatalog = objCatalog;
    this.objSchema = objSchema;
    this.objName = objName;
    this.objShortName = objShortName;
    this.objFullName = objFullName;
    this.objOwner = objOwner;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaMetaDbObject*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `objType` field.
      Returns: the type of object (table, view)
  */
  @property gda.types.MetaDbObjectType objType() nothrow
  {
    return cast(gda.types.MetaDbObjectType)(cast(GdaMetaDbObject*)this._cPtr).objType;
  }

  /**
      Set `objType` field.
      Params:
        propval = the type of object (table, view)
  */
  @property void objType(gda.types.MetaDbObjectType propval) nothrow
  {
    (cast(GdaMetaDbObject*)this._cPtr).objType = cast(GdaMetaDbObjectType)propval;
  }

  /**
      Get `outdated` field.
      Returns: set to true if the information in this #GdaMetaDbObject may be outdated because the #GdaMetaStore has been updated
  */
  @property bool outdated() nothrow
  {
    return cast(bool)(cast(GdaMetaDbObject*)this._cPtr).outdated;
  }

  /**
      Set `outdated` field.
      Params:
        propval = set to true if the information in this #GdaMetaDbObject may be outdated because the #GdaMetaStore has been updated
  */
  @property void outdated(bool propval) nothrow
  {
    (cast(GdaMetaDbObject*)this._cPtr).outdated = propval;
  }

  /**
      Get `objCatalog` field.
      Returns: the catalog the object is in
  */
  @property string objCatalog() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objCatalog);
  }

  /**
      Set `objCatalog` field.
      Params:
        propval = the catalog the object is in
  */
  @property void objCatalog(string propval) nothrow
  {
    (cast(GdaMetaDbObject*)this._cPtr).objCatalog = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `objSchema` field.
      Returns: the schema the object is in
  */
  @property string objSchema() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objSchema);
  }

  /**
      Set `objSchema` field.
      Params:
        propval = the schema the object is in
  */
  @property void objSchema(string propval) nothrow
  {
    (cast(GdaMetaDbObject*)this._cPtr).objSchema = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `objName` field.
      Returns: the object's name
  */
  @property string objName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objName);
  }

  /**
      Set `objName` field.
      Params:
        propval = the object's name
  */
  @property void objName(string propval) nothrow
  {
    (cast(GdaMetaDbObject*)this._cPtr).objName = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `objShortName` field.
      Returns: the shortest way to name the object
  */
  @property string objShortName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objShortName);
  }

  /**
      Set `objShortName` field.
      Params:
        propval = the shortest way to name the object
  */
  @property void objShortName(string propval) nothrow
  {
    (cast(GdaMetaDbObject*)this._cPtr).objShortName = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `objFullName` field.
      Returns: the full name of the object (in the &lt;schema&gt;.&lt;nameagt; notation
  */
  @property string objFullName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objFullName);
  }

  /**
      Set `objFullName` field.
      Params:
        propval = the full name of the object (in the &lt;schema&gt;.&lt;nameagt; notation
  */
  @property void objFullName(string propval) nothrow
  {
    (cast(GdaMetaDbObject*)this._cPtr).objFullName = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `objOwner` field.
      Returns: object's owner
  */
  @property string objOwner() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objOwner);
  }

  /**
      Set `objOwner` field.
      Params:
        propval = object's owner
  */
  @property void objOwner(string propval) nothrow
  {
    (cast(GdaMetaDbObject*)this._cPtr).objOwner = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }
}
