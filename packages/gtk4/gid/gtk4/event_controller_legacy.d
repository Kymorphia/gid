/// Module for [EventControllerLegacy] class
module gid.gtk4.event_controller_legacy;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.event;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.event_controller;
import gid.gtk4.types;

/**
    Provides raw access to the event stream.
    
    It should only be used as a last resort if none of the other event
    controllers or gestures do the job.
*/
@gidGir("EventControllerLegacy", "EventControllerLegacyClass")
class EventControllerLegacy : gid.gtk4.event_controller.EventController
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_event_controller_legacy_get_type != &gidSymbolNotFound ? gtk_event_controller_legacy_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEventControllerLegacy";
  }

  /** Returns `this`, for use in `with` statements. */
  override EventControllerLegacy self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.event_controller_legacy.EventControllerLegacy]
      Returns: New builder object
  */
  static EventControllerLegacyGidBuilder builder() nothrow
  {
    return new EventControllerLegacyGidBuilder;
  }

  /**
      Creates a new legacy event controller.
      Returns: the newly created event controller.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkEventController* _cretval;
      _cretval = gtk_event_controller_legacy_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Connect to `Event` signal.
  
      Emitted for each GDK event delivered to controller.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gdk4.event.Event event, gid.gtk4.event_controller_legacy.EventControllerLegacy eventControllerLegacy)`
  
          `event` the [gid.gdk4.event.Event] which triggered this signal (optional)
  
          `eventControllerLegacy` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event
              and the emission of this signal. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk4.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.event_controller_legacy.EventControllerLegacy)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.event_controller_legacy.EventControllerLegacy.event");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.event_controller_legacy.EventControllerLegacy]
class EventControllerLegacyGidBuilderImpl(T) : gid.gtk4.event_controller.EventControllerGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.event_controller_legacy.EventControllerLegacy]
final class EventControllerLegacyGidBuilder : EventControllerLegacyGidBuilderImpl!EventControllerLegacyGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EventControllerLegacy build() nothrow
  {
    return new EventControllerLegacy(cast(void*)createGObject(EventControllerLegacy._getGType), Yes.Take);
  }
}
