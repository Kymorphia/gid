/// Module for [MetaTable] class
module gda.meta_table;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/**
    This structure specifies a #GdaMetaDbObject to represent a table's specific attributes,
    its contents must not be modified.
    
    Note that in some cases, the columns cannot be determined for views, and in this case the
    @columns will be null (this can be the case for example with SQLite where a view
    uses a function which is not natively provided by SQLite.
*/
class MetaTable
{
  GdaMetaTable _cInstance;

  /**
      Create a `meta_table.MetaTable` wrap type.
      Params:
        pkColsNb = size of the @pk_cols_array array
  */
  this(int pkColsNb = int.init) nothrow
  {
    this.pkColsNb = pkColsNb;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaMetaTable*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `pkColsNb` field.
      Returns: size of the @pk_cols_array array
  */
  @property int pkColsNb() nothrow
  {
    return (cast(GdaMetaTable*)this._cPtr).pkColsNb;
  }

  /**
      Set `pkColsNb` field.
      Params:
        propval = size of the @pk_cols_array array
  */
  @property void pkColsNb(int propval) nothrow
  {
    (cast(GdaMetaTable*)this._cPtr).pkColsNb = propval;
  }
}
