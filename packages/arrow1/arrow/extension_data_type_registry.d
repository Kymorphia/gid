/// Module for [ExtensionDataTypeRegistry] class
module arrow.extension_data_type_registry;

import arrow.c.functions;
import arrow.c.types;
import arrow.extension_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class ExtensionDataTypeRegistry : gobject.object.ObjectWrap
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
    return cast(void function())garrow_extension_data_type_registry_get_type != &gidSymbolNotFound ? garrow_extension_data_type_registry_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExtensionDataTypeRegistry self()
  {
    return this;
  }

  /** */
  static arrow.extension_data_type_registry.ExtensionDataTypeRegistry default_()
  {
    GArrowExtensionDataTypeRegistry* _cretval;
    _cretval = garrow_extension_data_type_registry_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.extension_data_type_registry.ExtensionDataTypeRegistry)(cast(GArrowExtensionDataTypeRegistry*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.extension_data_type.ExtensionDataType lookup(string name)
  {
    GArrowExtensionDataType* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = garrow_extension_data_type_registry_lookup(cast(GArrowExtensionDataTypeRegistry*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.extension_data_type.ExtensionDataType)(cast(GArrowExtensionDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Register the given data_type to the registry.
  
      Params:
        dataType = A #GArrowExtensionDataType to be registered.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool register(arrow.extension_data_type.ExtensionDataType dataType)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_extension_data_type_registry_register(cast(GArrowExtensionDataTypeRegistry*)this._cPtr, dataType ? cast(GArrowExtensionDataType*)dataType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Unregister an extension data type that has the given name from the
      registry.
  
      Params:
        name = An extension data type name to be unregistered.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool unregister(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)garrow_extension_data_type_registry_unregister(cast(GArrowExtensionDataTypeRegistry*)this._cPtr, _name, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
