/// Module for [ExtensionArray] class
module arrow.extension_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ExtensionArray : arrow.array.Array
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
    return cast(void function())garrow_extension_array_get_type != &gidSymbolNotFound ? garrow_extension_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExtensionArray self()
  {
    return this;
  }

  /**
  Get builder for [arrow.extension_array.ExtensionArray]
  Returns: New builder object
  */
  static ExtensionArrayGidBuilder builder()
  {
    return new ExtensionArrayGidBuilder;
  }

  /** */
  @property arrow.array.Array storage()
  {
    return getStorage();
  }

  /** */
  arrow.array.Array getStorage()
  {
    GArrowArray* _cretval;
    _cretval = garrow_extension_array_get_storage(cast(GArrowExtensionArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}

class ExtensionArrayGidBuilderImpl(T) : arrow.array.ArrayGidBuilderImpl!T
{

  /** */
  T storage(arrow.array.Array propval)
  {
    return setProperty("storage", propval);
  }
}

/// Fluent builder for [arrow.extension_array.ExtensionArray]
final class ExtensionArrayGidBuilder : ExtensionArrayGidBuilderImpl!ExtensionArrayGidBuilder
{
  ExtensionArray build()
  {
    return new ExtensionArray(cast(void*)createGObject(ExtensionArray._getGType), No.Take);
  }
}
