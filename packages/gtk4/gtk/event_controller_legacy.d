/// Module for [EventControllerLegacy] class
module gtk.event_controller_legacy;

import gdk.event;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
    [gtk.event_controller_legacy.EventControllerLegacy] is an event controller that provides raw
    access to the event stream.
    
    It should only be used as a last resort if none of the other event
    controllers or gestures do the job.
*/
class EventControllerLegacy : gtk.event_controller.EventController
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
    return cast(void function())gtk_event_controller_legacy_get_type != &gidSymbolNotFound ? gtk_event_controller_legacy_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EventControllerLegacy self()
  {
    return this;
  }

  /**
      Creates a new legacy event controller.
      Returns: the newly created event controller.
  */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_legacy_new();
    this(_cretval, Yes.Take);
  }

  /**
      Connect to `Event` signal.
  
      Emitted for each GDK event delivered to controller.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event.Event event, gtk.event_controller_legacy.EventControllerLegacy eventControllerLegacy))
  
          `event` the [gdk.event.Event] which triggered this signal (optional)
  
          `eventControllerLegacy` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event
              and the emission of this signal. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.event_controller_legacy.EventControllerLegacy)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event", closure, after);
  }
}
