/// Module for [MetaDbObject] class
module gda.meta_db_object;

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
  GdaMetaDbObject cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.meta_db_object.MetaDbObject");

    cInstance = *cast(GdaMetaDbObject*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `objType` field.
      Returns: the type of object (table, view)
  */
  @property gda.types.MetaDbObjectType objType()
  {
    return cast(gda.types.MetaDbObjectType)(cast(GdaMetaDbObject*)this._cPtr).objType;
  }

  /**
      Set `objType` field.
      Params:
        propval = the type of object (table, view)
  */
  @property void objType(gda.types.MetaDbObjectType propval)
  {
    (cast(GdaMetaDbObject*)this._cPtr).objType = cast(GdaMetaDbObjectType)propval;
  }

  /**
      Get `outdated` field.
      Returns: set to true if the information in this #GdaMetaDbObject may be outdated because the #GdaMetaStore has been updated
  */
  @property bool outdated()
  {
    return cast(bool)(cast(GdaMetaDbObject*)this._cPtr).outdated;
  }

  /**
      Set `outdated` field.
      Params:
        propval = set to true if the information in this #GdaMetaDbObject may be outdated because the #GdaMetaStore has been updated
  */
  @property void outdated(bool propval)
  {
    (cast(GdaMetaDbObject*)this._cPtr).outdated = propval;
  }

  /**
      Get `objCatalog` field.
      Returns: the catalog the object is in
  */
  @property string objCatalog()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objCatalog);
  }

  /**
      Set `objCatalog` field.
      Params:
        propval = the catalog the object is in
  */
  @property void objCatalog(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objCatalog);
    dToC(propval, cast(void*)&(cast(GdaMetaDbObject*)this._cPtr).objCatalog);
  }

  /**
      Get `objSchema` field.
      Returns: the schema the object is in
  */
  @property string objSchema()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objSchema);
  }

  /**
      Set `objSchema` field.
      Params:
        propval = the schema the object is in
  */
  @property void objSchema(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objSchema);
    dToC(propval, cast(void*)&(cast(GdaMetaDbObject*)this._cPtr).objSchema);
  }

  /**
      Get `objName` field.
      Returns: the object's name
  */
  @property string objName()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objName);
  }

  /**
      Set `objName` field.
      Params:
        propval = the object's name
  */
  @property void objName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objName);
    dToC(propval, cast(void*)&(cast(GdaMetaDbObject*)this._cPtr).objName);
  }

  /**
      Get `objShortName` field.
      Returns: the shortest way to name the object
  */
  @property string objShortName()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objShortName);
  }

  /**
      Set `objShortName` field.
      Params:
        propval = the shortest way to name the object
  */
  @property void objShortName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objShortName);
    dToC(propval, cast(void*)&(cast(GdaMetaDbObject*)this._cPtr).objShortName);
  }

  /**
      Get `objFullName` field.
      Returns: the full name of the object (in the &lt;schema&gt;.&lt;nameagt; notation
  */
  @property string objFullName()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objFullName);
  }

  /**
      Set `objFullName` field.
      Params:
        propval = the full name of the object (in the &lt;schema&gt;.&lt;nameagt; notation
  */
  @property void objFullName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objFullName);
    dToC(propval, cast(void*)&(cast(GdaMetaDbObject*)this._cPtr).objFullName);
  }

  /**
      Get `objOwner` field.
      Returns: object's owner
  */
  @property string objOwner()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objOwner);
  }

  /**
      Set `objOwner` field.
      Params:
        propval = object's owner
  */
  @property void objOwner(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaDbObject*)this._cPtr).objOwner);
    dToC(propval, cast(void*)&(cast(GdaMetaDbObject*)this._cPtr).objOwner);
  }
}
