/// Module for [PathDescriptor] class
module arrowflight.path_descriptor;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.descriptor;
import arrowflight.types;
import gid.gid;

/** */
class PathDescriptor : arrowflight.descriptor.Descriptor
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
    return cast(void function())gaflight_path_descriptor_get_type != &gidSymbolNotFound ? gaflight_path_descriptor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PathDescriptor self()
  {
    return this;
  }

  /** */
  this(string[] paths)
  {
    GAFlightPathDescriptor* _cretval;
    size_t _nPaths;
    if (paths)
      _nPaths = cast(size_t)paths.length;

    char*[] _tmppaths;
    foreach (s; paths)
      _tmppaths ~= s.toCString(No.Alloc);
    const(char*)* _paths = _tmppaths.ptr;

    _cretval = gaflight_path_descriptor_new(_paths, _nPaths);
    this(_cretval, Yes.Take);
  }

  /** */
  string[] getPaths()
  {
    char** _cretval;
    _cretval = gaflight_path_descriptor_get_paths(cast(GAFlightPathDescriptor*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }
}
