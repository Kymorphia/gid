/// Module for [Endpoint] class
module arrowflight.endpoint;

public import gid.basictypes;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.location;
import arrowflight.ticket;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class Endpoint : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_endpoint_get_type != &gidSymbolNotFound ? gaflight_endpoint_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Endpoint self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowflight.endpoint.Endpoint]
      Returns: New builder object
  */
  static EndpointGidBuilder builder() nothrow
  {
    return new EndpointGidBuilder;
  }

  /**
      Get `ticket` property.
      Returns: Opaque ticket identify; use with DoGet RPC.
  */
  @property arrowflight.ticket.Ticket ticket() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrowflight.ticket.Ticket)("ticket");
  }

  /** */
  this(arrowflight.ticket.Ticket ticket, arrowflight.location.Location[] locations) nothrow
  {
    GAFlightEndpoint* _cretval;
    auto _locations = gListFromD!(arrowflight.location.Location)(locations);
    scope(exit) containerFree!(GList*, arrowflight.location.Location, GidOwnership.None)(_locations);
    _cretval = gaflight_endpoint_new(ticket ? cast(GAFlightTicket*)ticket._cPtr(No.Dup) : null, _locations);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrowflight.endpoint.Endpoint otherEndpoint) nothrow
  {
    bool _retval;
    _retval = cast(bool)gaflight_endpoint_equal(cast(GAFlightEndpoint*)this._cPtr, otherEndpoint ? cast(GAFlightEndpoint*)otherEndpoint._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrowflight.location.Location[] getLocations() nothrow
  {
    GList* _cretval;
    _cretval = gaflight_endpoint_get_locations(cast(GAFlightEndpoint*)this._cPtr);
    auto _retval = gListToD!(arrowflight.location.Location, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrowflight.endpoint.Endpoint]
class EndpointGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [arrowflight.endpoint.Endpoint]
final class EndpointGidBuilder : EndpointGidBuilderImpl!EndpointGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Endpoint build() nothrow
  {
    return new Endpoint(cast(void*)createGObject(Endpoint._getGType), Yes.Take);
  }
}
