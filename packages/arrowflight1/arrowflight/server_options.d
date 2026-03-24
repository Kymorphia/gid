/// Module for [ServerOptions] class
module arrowflight.server_options;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.location;
import arrowflight.server_auth_handler;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ServerOptions : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_server_options_get_type != &gidSymbolNotFound ? gaflight_server_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ServerOptions self()
  {
    return this;
  }

  /**
  Get builder for [arrowflight.server_options.ServerOptions]
  Returns: New builder object
  */
  static ServerOptionsGidBuilder builder()
  {
    return new ServerOptionsGidBuilder;
  }

  /**
      Get `authHandler` property.
      Returns: The authentication handler.
  */
  @property arrowflight.server_auth_handler.ServerAuthHandler authHandler()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowflight.server_auth_handler.ServerAuthHandler)("auth-handler");
  }

  /**
      Set `authHandler` property.
      Params:
        propval = The authentication handler.
  */
  @property void authHandler(arrowflight.server_auth_handler.ServerAuthHandler propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrowflight.server_auth_handler.ServerAuthHandler)("auth-handler", propval);
  }

  /**
      Get `location` property.
      Returns: The location to be listened.
  */
  @property arrowflight.location.Location location()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowflight.location.Location)("location");
  }

  /** */
  this(arrowflight.location.Location location)
  {
    GAFlightServerOptions* _cretval;
    _cretval = gaflight_server_options_new(location ? cast(GAFlightLocation*)location._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

class ServerOptionsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `authHandler` property.
      Params:
        propval = The authentication handler.
      Returns: Builder instance for fluent chaining
  */
  T authHandler(arrowflight.server_auth_handler.ServerAuthHandler propval)
  {
    return setProperty("auth-handler", propval);
  }

  /**
      Set `location` property.
      Params:
        propval = The location to be listened.
      Returns: Builder instance for fluent chaining
  */
  T location(arrowflight.location.Location propval)
  {
    return setProperty("location", propval);
  }
}

/// Fluent builder for [arrowflight.server_options.ServerOptions]
final class ServerOptionsGidBuilder : ServerOptionsGidBuilderImpl!ServerOptionsGidBuilder
{
  ServerOptions build()
  {
    return new ServerOptions(cast(void*)createGObject(ServerOptions._getGType), Yes.Take);
  }
}
