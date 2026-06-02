/// Module for [AttributesManager] class
module gda.attributes_manager;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import glib.types;
import gobject.value;

/** */
class AttributesManager
{
  GdaAttributesManager* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstancePtr = cast(GdaAttributesManager*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)_cInstancePtr;
  }

  /** */
  void clear(void* ptr = null) nothrow
  {
    gda_attributes_manager_clear(cast(GdaAttributesManager*)this._cPtr, ptr);
  }

  /** */
  void foreach_(void* ptr, gda.types.AttributesManagerFunc func) nothrow
  {
    extern(C) void _funcCallback(const(char)* attName, const(GValue)* value, void* data) nothrow
    {
      auto _dlg = cast(gda.types.AttributesManagerFunc*)data;
      string _attName = attName.fromCString(No.Free);

      try
      {
        (*_dlg)(_attName, value ? new gobject.value.Value(cast(void*)value, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gda.types.AttributesManagerFunc");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    gda_attributes_manager_foreach(cast(GdaAttributesManager*)this._cPtr, ptr, _funcCB, _func);
  }

  /** */
  gobject.value.Value get(void* ptr, string attName) nothrow
  {
    const(GValue)* _cretval;
    const(char)* _attName = attName.toCString(No.Alloc);
    _cretval = gda_attributes_manager_get(cast(GdaAttributesManager*)this._cPtr, ptr, _attName);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  void set(void* ptr, string attName, gobject.value.Value value) nothrow
  {
    const(char)* _attName = attName.toCString(No.Alloc);
    gda_attributes_manager_set(cast(GdaAttributesManager*)this._cPtr, ptr, _attName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /** */
  void setFull(void* ptr, string attName, gobject.value.Value value, glib.types.DestroyNotify destroy) nothrow
  {
    extern(C) void _destroyCallback(void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.DestroyNotify");
      }
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;
    const(char)* _attName = attName.toCString(No.Alloc);
    gda_attributes_manager_set_full(cast(GdaAttributesManager*)this._cPtr, ptr, _attName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, _destroyCB);
  }
}
