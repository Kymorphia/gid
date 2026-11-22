/// Global functions for panel1 library
module gid.panel1.global;

import gid.core.utils;
import gid.gio2.resource;
import gid.gobject2.closure;
import gid.gobject2.value;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.types;


/** */
bool checkVersion(uint major, uint minor, uint micro) nothrow
{
  bool _retval;
  _retval = cast(bool)panel_check_version(major, minor, micro);
  return _retval;
}

/** */
void finalize() nothrow
{
  panel_finalize();
}

/** */
uint getMajorVersion() nothrow
{
  uint _retval;
  _retval = panel_get_major_version();
  return _retval;
}

/** */
uint getMicroVersion() nothrow
{
  uint _retval;
  _retval = panel_get_micro_version();
  return _retval;
}

/** */
uint getMinorVersion() nothrow
{
  uint _retval;
  _retval = panel_get_minor_version();
  return _retval;
}

/** */
gid.gio2.resource.Resource getResource() nothrow
{
  GResource* _cretval;
  _cretval = panel_get_resource();
  auto _retval = _cretval ? new gid.gio2.resource.Resource(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/** */
void init_() nothrow
{
  panel_init();
}

/** */
void marshalBOOLEANOBJECTOBJECT(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
{
  panel_marshal_BOOLEAN__OBJECT_OBJECT(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
}

/** */
void marshalOBJECTOBJECT(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
{
  panel_marshal_OBJECT__OBJECT(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
}
