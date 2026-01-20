/// Module for [MetaTableForeignKey] class
module gda.meta_table_foreign_key;

import gda.c.functions;
import gda.c.types;
import gda.meta_db_object;
import gda.types;
import gid.gid;

/**
    This structure represents a foreign key constraint, its contents must not be modified.
*/
class MetaTableForeignKey
{
  GdaMetaTableForeignKey _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.meta_table_foreign_key.MetaTableForeignKey");

    _cInstance = *cast(GdaMetaTableForeignKey*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `metaTable` field.
      Returns: the #GdaMetaDbObject for which this structure represents a foreign key
  */
  @property gda.meta_db_object.MetaDbObject metaTable()
  {
    return new gda.meta_db_object.MetaDbObject(cast(GdaMetaDbObject*)(cast(GdaMetaTableForeignKey*)this._cPtr).metaTable, No.Take);
  }

  /**
      Get `dependOn` field.
      Returns: the #GdaMetaDbObject which is referenced by the foreign key
  */
  @property gda.meta_db_object.MetaDbObject dependOn()
  {
    return new gda.meta_db_object.MetaDbObject(cast(GdaMetaDbObject*)(cast(GdaMetaTableForeignKey*)this._cPtr).dependOn, No.Take);
  }

  /**
      Get `colsNb` field.
      Returns: the size of the @fk_cols_array, @fk_names_array, @ref_pk_cols_array and @ref_pk_names_array arrays
  */
  @property int colsNb()
  {
    return (cast(GdaMetaTableForeignKey*)this._cPtr).colsNb;
  }

  /**
      Set `colsNb` field.
      Params:
        propval = the size of the @fk_cols_array, @fk_names_array, @ref_pk_cols_array and @ref_pk_names_array arrays
  */
  @property void colsNb(int propval)
  {
    (cast(GdaMetaTableForeignKey*)this._cPtr).colsNb = propval;
  }

  /** */
  @property string fkName()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaTableForeignKey*)this._cPtr).fkName);
  }

  /** */
  @property void fkName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaTableForeignKey*)this._cPtr).fkName);
    dToC(propval, cast(void*)&(cast(GdaMetaTableForeignKey*)this._cPtr).fkName);
  }
}
