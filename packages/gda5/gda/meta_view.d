/// Module for [MetaView] class
module gda.meta_view;

import gda.c.functions;
import gda.c.types;
import gda.meta_table;
import gda.types;
import gid.gid;

/**
    This structure specifies a #GdaMetaDbObject to represent a view's specific attributes,
    its contents must not be modified.
*/
class MetaView
{
  GdaMetaView cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.meta_view.MetaView");

    cInstance = *cast(GdaMetaView*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `table` field.
      Returns: a view is also a table as it has columns
  */
  @property gda.meta_table.MetaTable table()
  {
    return new gda.meta_table.MetaTable(cast(GdaMetaTable*)&(cast(GdaMetaView*)this._cPtr).table, No.Take);
  }

  /**
      Get `viewDef` field.
      Returns: views' definition
  */
  @property string viewDef()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaView*)this._cPtr).viewDef);
  }

  /**
      Set `viewDef` field.
      Params:
        propval = views' definition
  */
  @property void viewDef(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaView*)this._cPtr).viewDef);
    dToC(propval, cast(void*)&(cast(GdaMetaView*)this._cPtr).viewDef);
  }

  /**
      Get `isUpdatable` field.
      Returns: tells if the view's contents can be updated
  */
  @property bool isUpdatable()
  {
    return cast(bool)(cast(GdaMetaView*)this._cPtr).isUpdatable;
  }

  /**
      Set `isUpdatable` field.
      Params:
        propval = tells if the view's contents can be updated
  */
  @property void isUpdatable(bool propval)
  {
    (cast(GdaMetaView*)this._cPtr).isUpdatable = propval;
  }
}
