/// Module for [HandlerBoolean] class
module gda.handler_boolean;

import gda.c.functions;
import gda.c.types;
import gda.data_handler;
import gda.data_handler_mixin;
import gda.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class HandlerBoolean : gobject.object.ObjectWrap, gda.data_handler.DataHandler
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
    return cast(void function())gda_handler_boolean_get_type != &gidSymbolNotFound ? gda_handler_boolean_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HandlerBoolean self()
  {
    return this;
  }

  /**
      Get builder for [gda.handler_boolean.HandlerBoolean]
      Returns: New builder object
  */
  static HandlerBooleanGidBuilder builder()
  {
    return new HandlerBooleanGidBuilder;
  }

  mixin DataHandlerT!();

  /**
      Creates a data handler for booleans
      Returns: the new object
  */
  static gda.data_handler.DataHandler new_()
  {
    GdaDataHandler* _cretval;
    _cretval = gda_handler_boolean_new();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gda.handler_boolean.HandlerBoolean]
class HandlerBooleanGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gda.data_handler.DataHandlerGidBuilderImpl!T
{

  mixin DataHandlerGidBuilderT!();
}

/// Fluent builder for [gda.handler_boolean.HandlerBoolean]
final class HandlerBooleanGidBuilder : HandlerBooleanGidBuilderImpl!HandlerBooleanGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HandlerBoolean build()
  {
    return new HandlerBoolean(cast(void*)createGObject(HandlerBoolean._getGType), No.Take);
  }
}
