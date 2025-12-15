/// Module for [Endpoint] class
module arrowflight.endpoint;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.location;
import arrowflight.ticket;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class Endpoint : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_endpoint_get_type != &gidSymbolNotFound ? gaflight_endpoint_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Endpoint self()
  {
    return this;
  }

  /**
      Get `ticket` property.
      Returns: Opaque ticket identify; use with DoGet RPC.
  */
  @property arrowflight.ticket.Ticket ticket()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowflight.ticket.Ticket)("ticket");
  }

  /** */
  this(arrowflight.ticket.Ticket ticket, arrowflight.location.Location[] locations)
  {
    GAFlightEndpoint* _cretval;
    auto _locations = gListFromD!(arrowflight.location.Location)(locations);
    scope(exit) containerFree!(GList*, arrowflight.location.Location, GidOwnership.None)(_locations);
    _cretval = gaflight_endpoint_new(ticket ? cast(GAFlightTicket*)ticket._cPtr(No.Dup) : null, _locations);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrowflight.endpoint.Endpoint otherEndpoint)
  {
    bool _retval;
    _retval = cast(bool)gaflight_endpoint_equal(cast(GAFlightEndpoint*)this._cPtr, otherEndpoint ? cast(GAFlightEndpoint*)otherEndpoint._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrowflight.location.Location[] getLocations()
  {
    GList* _cretval;
    _cretval = gaflight_endpoint_get_locations(cast(GAFlightEndpoint*)this._cPtr);
    auto _retval = gListToD!(arrowflight.location.Location, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}
