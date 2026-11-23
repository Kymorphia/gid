/// Module for [EventController] class
module gid.gtk3.event_controller;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.event;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkEventController is a base, low-level implementation for event
    controllers. Those react to a series of #GdkEvents, and possibly trigger
    actions as a consequence of those.
*/
class EventController : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_event_controller_get_type != &gidSymbolNotFound ? gtk_event_controller_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEventController";
  }

  /** Returns `this`, for use in `with` statements. */
  override EventController self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.event_controller.EventController]
      Returns: New builder object
  */
  static EventControllerGidBuilder builder() nothrow
  {
    return new EventControllerGidBuilder;
  }

  /**
      Get `propagationPhase` property.
      Returns: The propagation phase at which this controller will handle events.
  */
  @property gid.gtk3.types.PropagationPhase propagationPhase() nothrow
  {
    return getPropagationPhase();
  }

  /**
      Set `propagationPhase` property.
      Params:
        propval = The propagation phase at which this controller will handle events.
  */
  @property void propagationPhase(gid.gtk3.types.PropagationPhase propval) nothrow
  {
    setPropagationPhase(propval);
  }

  /**
      Get `widget` property.
      Returns: The widget receiving the #GdkEvents that the controller will handle.
  */
  @property gid.gtk3.widget.Widget widget() nothrow
  {
    return getWidget();
  }

  /**
      Gets the propagation phase at which controller handles events.
      Returns: the propagation phase
  */
  gid.gtk3.types.PropagationPhase getPropagationPhase() nothrow
  {
    GtkPropagationPhase _cretval;
    _cretval = gtk_event_controller_get_propagation_phase(cast(GtkEventController*)this._cPtr);
    gid.gtk3.types.PropagationPhase _retval = cast(gid.gtk3.types.PropagationPhase)_cretval;
    return _retval;
  }

  /**
      Returns the #GtkWidget this controller relates to.
      Returns: a #GtkWidget
  */
  gid.gtk3.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_event_controller_get_widget(cast(GtkEventController*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
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
  bool handleEvent(gid.gdk3.event.Event event) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_event_controller_handle_event(cast(GtkEventController*)this._cPtr, event ? cast(const(GdkEvent)*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Resets the controller to a clean state. Every interaction
      the controller did through #GtkEventController::handle-event
      will be dropped at this point.
  */
  void reset() nothrow
  {
    gtk_event_controller_reset(cast(GtkEventController*)this._cPtr);
  }

  /**
      Sets the propagation phase at which a controller handles events.
      
      If phase is [gid.gtk4.types.PropagationPhase.None], no automatic event handling will be
      performed, but other additional gesture maintenance will. In that phase,
      the events can be managed by calling [gid.gtk3.event_controller.EventController.handleEvent].
  
      Params:
        phase = a propagation phase
  */
  void setPropagationPhase(gid.gtk3.types.PropagationPhase phase) nothrow
  {
    gtk_event_controller_set_propagation_phase(cast(GtkEventController*)this._cPtr, phase);
  }
}

/// Fluent builder implementation template for [gid.gtk3.event_controller.EventController]
class EventControllerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `propagationPhase` property.
      Params:
        propval = The propagation phase at which this controller will handle events.
      Returns: Builder instance for fluent chaining
  */
  T propagationPhase(gid.gtk3.types.PropagationPhase propval) nothrow
  {
    return setProperty("propagation-phase", propval);
  }

  /**
      Set `widget` property.
      Params:
        propval = The widget receiving the #GdkEvents that the controller will handle.
      Returns: Builder instance for fluent chaining
  */
  T widget(gid.gtk3.widget.Widget propval) nothrow
  {
    return setProperty("widget", propval);
  }
}

/// Fluent builder for [gid.gtk3.event_controller.EventController]
final class EventControllerGidBuilder : EventControllerGidBuilderImpl!EventControllerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EventController build() nothrow
  {
    return new EventController(cast(void*)createGObject(EventController._getGType), Yes.Take);
  }
}
