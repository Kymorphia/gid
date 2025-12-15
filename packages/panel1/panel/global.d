/// Global functions for panel1 library
module panel.global;

import gid.gid;
import gio.resource;
import gobject.closure;
import gobject.value;
import panel.c.functions;
import panel.c.types;
import panel.types;


/** */
bool checkVersion(uint major, uint minor, uint micro)
{
  bool _retval;
  _retval = cast(bool)panel_check_version(major, minor, micro);
  return _retval;
}

/** */
void finalize()
{
  panel_finalize();
}

/** */
uint getMajorVersion()
{
  uint _retval;
  _retval = panel_get_major_version();
  return _retval;
}

/** */
uint getMicroVersion()
{
  uint _retval;
  _retval = panel_get_micro_version();
  return _retval;
}

/** */
uint getMinorVersion()
{
  uint _retval;
  _retval = panel_get_minor_version();
  return _retval;
}

/** */
gio.resource.Resource getResource()
{
  GResource* _cretval;
  _cretval = panel_get_resource();
  auto _retval = _cretval ? new gio.resource.Resource(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/** */
void init_()
{
  panel_init();
}

/** */
void marshalBOOLEANOBJECTOBJECT(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
{
  panel_marshal_BOOLEAN__OBJECT_OBJECT(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
}

/** */
void marshalOBJECTOBJECT(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
{
  panel_marshal_OBJECT__OBJECT(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
}
