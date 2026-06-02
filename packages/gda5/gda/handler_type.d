/// Module for [HandlerType] class
module gda.handler_type;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.data_handler;
import gda.data_handler_mixin;
import gda.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class HandlerType : gobject.object.ObjectWrap, gda.data_handler.DataHandler
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_handler_type_get_type != &gidSymbolNotFound ? gda_handler_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HandlerType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gda.handler_type.HandlerType]
      Returns: New builder object
  */
  static HandlerTypeGidBuilder builder() nothrow
  {
    return new HandlerTypeGidBuilder;
  }

  mixin DataHandlerT!();

  /**
      Creates a data handler for Gda types
      Returns: the new object
  */
  static gda.data_handler.DataHandler new_() nothrow
  {
    GdaDataHandler* _cretval;
    _cretval = gda_handler_type_new();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gda.handler_type.HandlerType]
class HandlerTypeGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gda.data_handler.DataHandlerGidBuilderImpl!T
{

  mixin DataHandlerGidBuilderT!();
}

/// Fluent builder for [gda.handler_type.HandlerType]
final class HandlerTypeGidBuilder : HandlerTypeGidBuilderImpl!HandlerTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HandlerType build() nothrow
  {
    return new HandlerType(cast(void*)createGObject(HandlerType._getGType), No.Take);
  }
}
