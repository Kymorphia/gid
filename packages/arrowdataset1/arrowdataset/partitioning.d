/// Module for [Partitioning] class
module arrowdataset.partitioning;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import gobject.object;

/** */
class Partitioning : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_partitioning_get_type != &gidSymbolNotFound ? gadataset_partitioning_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Partitioning self()
  {
    return this;
  }

  /** */
  static arrowdataset.partitioning.Partitioning createDefault()
  {
    GADatasetPartitioning* _cretval;
    _cretval = gadataset_partitioning_create_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowdataset.partitioning.Partitioning)(cast(GADatasetPartitioning*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string getTypeName()
  {
    char* _cretval;
    _cretval = gadataset_partitioning_get_type_name(cast(GADatasetPartitioning*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
