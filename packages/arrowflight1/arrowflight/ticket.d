/// Module for [Ticket] class
module arrowflight.ticket;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import glib.bytes;
import gobject.object;

/** */
class Ticket : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_ticket_get_type != &gidSymbolNotFound ? gaflight_ticket_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Ticket self()
  {
    return this;
  }

  /**
      Get `data` property.
      Returns: Opaque identifier or credential to use when requesting a data
        stream with the DoGet RPC.
  */
  @property glib.bytes.Bytes data()
  {
    return gobject.object.ObjectWrap.getProperty!(glib.bytes.Bytes)("data");
  }

  /**
      Set `data` property.
      Params:
        propval = Opaque identifier or credential to use when requesting a data
          stream with the DoGet RPC.
  */
  @property void data(glib.bytes.Bytes propval)
  {
    gobject.object.ObjectWrap.setProperty!(glib.bytes.Bytes)("data", propval);
  }

  /** */
  this(glib.bytes.Bytes data)
  {
    GAFlightTicket* _cretval;
    _cretval = gaflight_ticket_new(data ? cast(GBytes*)data._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrowflight.ticket.Ticket otherTicket)
  {
    bool _retval;
    _retval = cast(bool)gaflight_ticket_equal(cast(GAFlightTicket*)this._cPtr, otherTicket ? cast(GAFlightTicket*)otherTicket._cPtr(No.Dup) : null);
    return _retval;
  }
}
