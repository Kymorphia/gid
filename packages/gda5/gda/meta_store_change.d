/// Module for [MetaStoreChange] class
module gda.meta_store_change;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class MetaStoreChange
{
  GdaMetaStoreChange _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaMetaStoreChange*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.types.MetaStoreChangeType cType() nothrow
  {
    return cast(gda.types.MetaStoreChangeType)(cast(GdaMetaStoreChange*)this._cPtr).cType;
  }

  /** */
  @property void cType(gda.types.MetaStoreChangeType propval) nothrow
  {
    (cast(GdaMetaStoreChange*)this._cPtr).cType = cast(GdaMetaStoreChangeType)propval;
  }

  /** */
  @property string tableName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaStoreChange*)this._cPtr).tableName);
  }

  /** */
  @property void tableName(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaStoreChange*)this._cPtr).tableName);
    dToC(propval, cast(void*)&(cast(GdaMetaStoreChange*)this._cPtr).tableName);
  }
}
