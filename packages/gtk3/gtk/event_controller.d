/// Module for [EventController] class
module gtk.event_controller;

import gdk.event;
import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    #GtkEventController is a base, low-level implementation for event
    controllers. Those react to a series of #GdkEvents, and possibly trigger
    actions as a consequence of those.
*/
class EventController : gobject.object.ObjectWrap
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
    return cast(void function())gtk_event_controller_get_type != &gidSymbolNotFound ? gtk_event_controller_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EventController self()
  {
    return this;
  }

  /**
      Get `propagationPhase` property.
      Returns: The propagation phase at which this controller will handle events.
  */
  @property gtk.types.PropagationPhase propagationPhase()
  {
    return getPropagationPhase();
  }

  /**
      Set `propagationPhase` property.
      Params:
        propval = The propagation phase at which this controller will handle events.
  */
  @property void propagationPhase(gtk.types.PropagationPhase propval)
  {
    return setPropagationPhase(propval);
  }

  /**
      Gets the propagation phase at which controller handles events.
      Returns: the propagation phase
  */
  gtk.types.PropagationPhase getPropagationPhase()
  {
    GtkPropagationPhase _cretval;
    _cretval = gtk_event_controller_get_propagation_phase(cast(GtkEventController*)this._cPtr);
    gtk.types.PropagationPhase _retval = cast(gtk.types.PropagationPhase)_cretval;
    return _retval;
  }

  /**
      Returns the #GtkWidget this controller relates to.
      Returns: a #GtkWidget
  */
  gtk.widget.Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_event_controller_get_widget(cast(GtkEventController*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Feeds an events into controller, so it can be interpreted
      and the controller actions triggered.
  
      Params:
        event = a #GdkEvent
      Returns: true if the event was potentially useful to trigger the
                 controller action
  */
  bool handleEvent(gdk.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gtk_event_controller_handle_event(cast(GtkEventController*)this._cPtr, event ? cast(const(GdkEvent)*)event._cPtr : null);
    return _retval;
  }

  /**
      Resets the controller to a clean state. Every interaction
      the controller did through #GtkEventController::handle-event
      will be dropped at this point.
  */
  void reset()
  {
    gtk_event_controller_reset(cast(GtkEventController*)this._cPtr);
  }

  /**
      Sets the propagation phase at which a controller handles events.
      
      If phase is [gtk.types.PropagationPhase.None], no automatic event handling will be
      performed, but other additional gesture maintenance will. In that phase,
      the events can be managed by calling [gtk.event_controller.EventController.handleEvent].
  
      Params:
        phase = a propagation phase
  */
  void setPropagationPhase(gtk.types.PropagationPhase phase)
  {
    gtk_event_controller_set_propagation_phase(cast(GtkEventController*)this._cPtr, phase);
  }
}
