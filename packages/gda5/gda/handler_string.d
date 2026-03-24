/// Module for [HandlerString] class
module gda.handler_string;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.data_handler;
import gda.data_handler_mixin;
import gda.server_provider;
import gda.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class HandlerString : gobject.object.ObjectWrap, gda.data_handler.DataHandler
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
    return cast(void function())gda_handler_string_get_type != &gidSymbolNotFound ? gda_handler_string_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HandlerString self()
  {
    return this;
  }

  /**
  Get builder for [gda.handler_string.HandlerString]
  Returns: New builder object
  */
  static HandlerStringGidBuilder builder()
  {
    return new HandlerStringGidBuilder;
  }

  mixin DataHandlerT!();

  /**
      Creates a data handler for strings
      Returns: the new object
  */
  static gda.data_handler.DataHandler new_()
  {
    GdaDataHandler* _cretval;
    _cretval = gda_handler_string_new();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a data handler for strings, which will use some specific methods implemented
      by the prov object (possibly also cnc).
  
      Params:
        prov = a #GdaServerProvider object
        cnc = a #GdaConnection object, or null
      Returns: the new object
  */
  static gda.data_handler.DataHandler newWithProvider(gda.server_provider.ServerProvider prov, gda.connection.Connection cnc = null)
  {
    GdaDataHandler* _cretval;
    _cretval = gda_handler_string_new_with_provider(prov ? cast(GdaServerProvider*)prov._cPtr(No.Dup) : null, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, Yes.Take);
    return _retval;
  }
}

class HandlerStringGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gda.data_handler.DataHandlerGidBuilderImpl!T
{

  mixin DataHandlerGidBuilderT!();
}

/// Fluent builder for [gda.handler_string.HandlerString]
final class HandlerStringGidBuilder : HandlerStringGidBuilderImpl!HandlerStringGidBuilder
{
  HandlerString build()
  {
    return new HandlerString(cast(void*)createGObject(HandlerString._getGType), No.Take);
  }
}
