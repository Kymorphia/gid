/// Module for [HandlerNumerical] class
module gda.handler_numerical;

import gda.c.functions;
import gda.c.types;
import gda.data_handler;
import gda.data_handler_mixin;
import gda.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class HandlerNumerical : gobject.object.ObjectWrap, gda.data_handler.DataHandler
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
    return cast(void function())gda_handler_numerical_get_type != &gidSymbolNotFound ? gda_handler_numerical_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HandlerNumerical self()
  {
    return this;
  }

  /**
      Get builder for [gda.handler_numerical.HandlerNumerical]
      Returns: New builder object
  */
  static HandlerNumericalGidBuilder builder()
  {
    return new HandlerNumericalGidBuilder;
  }

  mixin DataHandlerT!();

  /**
      Creates a data handler for numerical values
      Returns: the new object
  */
  static gda.data_handler.DataHandler new_()
  {
    GdaDataHandler* _cretval;
    _cretval = gda_handler_numerical_new();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gda.handler_numerical.HandlerNumerical]
class HandlerNumericalGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gda.data_handler.DataHandlerGidBuilderImpl!T
{

  mixin DataHandlerGidBuilderT!();
}

/// Fluent builder for [gda.handler_numerical.HandlerNumerical]
final class HandlerNumericalGidBuilder : HandlerNumericalGidBuilderImpl!HandlerNumericalGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HandlerNumerical build()
  {
    return new HandlerNumerical(cast(void*)createGObject(HandlerNumerical._getGType), No.Take);
  }
}
