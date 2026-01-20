/// Module for [MetaStoreChange] class
module gda.meta_store_change;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class MetaStoreChange
{
  GdaMetaStoreChange _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.meta_store_change.MetaStoreChange");

    _cInstance = *cast(GdaMetaStoreChange*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.types.MetaStoreChangeType cType()
  {
    return cast(gda.types.MetaStoreChangeType)(cast(GdaMetaStoreChange*)this._cPtr).cType;
  }

  /** */
  @property void cType(gda.types.MetaStoreChangeType propval)
  {
    (cast(GdaMetaStoreChange*)this._cPtr).cType = cast(GdaMetaStoreChangeType)propval;
  }

  /** */
  @property string tableName()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaStoreChange*)this._cPtr).tableName);
  }

  /** */
  @property void tableName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaStoreChange*)this._cPtr).tableName);
    dToC(propval, cast(void*)&(cast(GdaMetaStoreChange*)this._cPtr).tableName);
  }
}
