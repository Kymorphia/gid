/// Module for [MetaTableColumn] class
module gda.meta_table_column;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import glib.types;
import gobject.types;
import gobject.value;

/**
    This structure represents a table of view's column, its contents must not be modified.
*/
class MetaTableColumn
{
  GdaMetaTableColumn _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.meta_table_column.MetaTableColumn");

    _cInstance = *cast(GdaMetaTableColumn*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `columnName` field.
      Returns: the column's name
  */
  @property string columnName()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaTableColumn*)this._cPtr).columnName);
  }

  /**
      Set `columnName` field.
      Params:
        propval = the column's name
  */
  @property void columnName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaTableColumn*)this._cPtr).columnName);
    dToC(propval, cast(void*)&(cast(GdaMetaTableColumn*)this._cPtr).columnName);
  }

  /**
      Get `columnType` field.
      Returns: the column's DBMS's type
  */
  @property string columnType()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaTableColumn*)this._cPtr).columnType);
  }

  /**
      Set `columnType` field.
      Params:
        propval = the column's DBMS's type
  */
  @property void columnType(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaTableColumn*)this._cPtr).columnType);
    dToC(propval, cast(void*)&(cast(GdaMetaTableColumn*)this._cPtr).columnType);
  }

  /**
      Get `gtype` field.
      Returns: the detected column's #GType
  */
  @property gobject.types.GType gtype()
  {
    return (cast(GdaMetaTableColumn*)this._cPtr).gtype;
  }

  /**
      Set `gtype` field.
      Params:
        propval = the detected column's #GType
  */
  @property void gtype(gobject.types.GType propval)
  {
    (cast(GdaMetaTableColumn*)this._cPtr).gtype = propval;
  }

  /**
      Get `pkey` field.
      Returns: tells if the column is part of a primary key
  */
  @property bool pkey()
  {
    return cast(bool)(cast(GdaMetaTableColumn*)this._cPtr).pkey;
  }

  /**
      Set `pkey` field.
      Params:
        propval = tells if the column is part of a primary key
  */
  @property void pkey(bool propval)
  {
    (cast(GdaMetaTableColumn*)this._cPtr).pkey = propval;
  }

  /**
      Get `nullok` field.
      Returns: tells if the column can be null
  */
  @property bool nullok()
  {
    return cast(bool)(cast(GdaMetaTableColumn*)this._cPtr).nullok;
  }

  /**
      Set `nullok` field.
      Params:
        propval = tells if the column can be null
  */
  @property void nullok(bool propval)
  {
    (cast(GdaMetaTableColumn*)this._cPtr).nullok = propval;
  }

  /**
      Get `defaultValue` field.
      Returns: the column's default value, represented as a valid SQL value (surrounded by simple quotes for strings, ...), or null if column has no default value
  */
  @property string defaultValue()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaTableColumn*)this._cPtr).defaultValue);
  }

  /**
      Set `defaultValue` field.
      Params:
        propval = the column's default value, represented as a valid SQL value (surrounded by simple quotes for strings, ...), or null if column has no default value
  */
  @property void defaultValue(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaTableColumn*)this._cPtr).defaultValue);
    dToC(propval, cast(void*)&(cast(GdaMetaTableColumn*)this._cPtr).defaultValue);
  }

  /**
      Calls func for each attribute set to tcol
  
      Params:
        func = a #GdaAttributesManagerFunc function
  */
  void foreachAttribute(gda.types.AttributesManagerFunc func)
  {
    extern(C) void _funcCallback(const(char)* attName, const(GValue)* value, void* data)
    {
      auto _dlg = cast(gda.types.AttributesManagerFunc*)data;
      string _attName = attName.fromCString(No.Free);

      (*_dlg)(_attName, value ? new gobject.value.Value(cast(void*)value, No.Take) : null);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gda_meta_table_column_foreach_attribute(cast(GdaMetaTableColumn*)this._cPtr, _funcCB, _func);
  }

  /**
      Get the value associated to a named attribute.
      
      Attributes can have any name, but Libgda proposes some default names, see <link linkend="libgda-5.0-Attributes-manager.synopsis">this section</link>.
  
      Params:
        attribute = attribute name as a string
      Returns: a read-only #GValue, or null if not attribute named attribute has been set for column
  */
  gobject.value.Value getAttribute(string attribute)
  {
    const(GValue)* _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = gda_meta_table_column_get_attribute(cast(GdaMetaTableColumn*)this._cPtr, _attribute);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Set the value associated to a named attribute.
      
      Attributes can have any name, but Libgda proposes some default names, see <link linkend="libgda-40-Attributes-manager.synopsis">this section</link>.
      If there is already an attribute named attribute set, then its value is replaced with the new value,
      except if value is null, in which case the attribute is removed.
      
      Warning: attribute is not copied, if it needs to be freed when not used anymore, then destroy should point to
      the functions which will free it (typically [glib.global.gfree]). If attribute does not need to be freed, then destroy can be null.
  
      Params:
        attribute = attribute name as a static string
        value = a #GValue, or null
        destroy = function called when attribute has to be freed, or null
  */
  void setAttribute(string attribute, gobject.value.Value value = null, glib.types.DestroyNotify destroy = null)
  {
    extern(C) void _destroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    gda_meta_table_column_set_attribute(cast(GdaMetaTableColumn*)this._cPtr, _attribute, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, _destroyCB);
  }
}
