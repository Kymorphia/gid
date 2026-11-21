/// Module for [EventController] class
module gid.gtk4.event_controller;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.device;
import gid.gdk4.event;
import gid.gdk4.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    The base class for event controllers.
    
    These are ancillary objects associated to widgets, which react
    to `GdkEvents`, and possibly trigger actions as a consequence.
    
    Event controllers are added to a widget with
    [gid.gtk4.widget.Widget.addController]. It is rarely necessary to
    explicitly remove a controller with [gid.gtk4.widget.Widget.removeController].
    
    See the chapter on [input handling](input-handling.html) for
    an overview of the basic concepts, such as the capture and bubble
    phases of event propagation.
*/
class EventController : gid.gobject2.object.ObjectWrap
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
      Get builder for [gid.gtk4.event_controller.EventController]
      Returns: New builder object
  */
  static EventControllerGidBuilder builder() nothrow
  {
    return new EventControllerGidBuilder;
  }

  /**
      Get `name` property.
      Returns: The name for this controller, typically used for debugging purposes.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The name for this controller, typically used for debugging purposes.
  */
  @property void name(string propval) nothrow
  {
    setName(propval);
  }

  /**
      Get `propagationLimit` property.
      Returns: The limit for which events this controller will handle.
  */
  @property gid.gtk4.types.PropagationLimit propagationLimit() nothrow
  {
    return getPropagationLimit();
  }

  /**
      Set `propagationLimit` property.
      Params:
        propval = The limit for which events this controller will handle.
  */
  @property void propagationLimit(gid.gtk4.types.PropagationLimit propval) nothrow
  {
    setPropagationLimit(propval);
  }

  /**
      Get `propagationPhase` property.
      Returns: The propagation phase at which this controller will handle events.
  */
  @property gid.gtk4.types.PropagationPhase propagationPhase() nothrow
  {
    return getPropagationPhase();
  }

  /**
      Set `propagationPhase` property.
      Params:
        propval = The propagation phase at which this controller will handle events.
  */
  @property void propagationPhase(gid.gtk4.types.PropagationPhase propval) nothrow
  {
    setPropagationPhase(propval);
  }

  /**
      Get `widget` property.
      Returns: The widget receiving the `GdkEvents` that the controller will handle.
  */
  @property gid.gtk4.widget.Widget widget() nothrow
  {
    return getWidget();
  }

  /**
      Returns the event that is currently being handled by the controller.
      
      At other times, null is returned.
      Returns: the event that is currently
          handled by controller
  */
  gid.gdk4.event.Event getCurrentEvent() nothrow
  {
    GdkEvent* _cretval;
    _cretval = gtk_event_controller_get_current_event(cast(GtkEventController*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.event.Event(cast(GdkEvent*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the device of the event that is currently being
      handled by the controller.
      
      At other times, null is returned.
      Returns: device of the event is
          currently handled by controller
  */
  gid.gdk4.device.Device getCurrentEventDevice() nothrow
  {
    GdkDevice* _cretval;
    _cretval = gtk_event_controller_get_current_event_device(cast(GtkEventController*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the modifier state of the event that is currently being
      handled by the controller.
      
      At other times, 0 is returned.
      Returns: modifier state of the event is currently handled by controller
  */
  gid.gdk4.types.ModifierType getCurrentEventState() nothrow
  {
    GdkModifierType _cretval;
    _cretval = gtk_event_controller_get_current_event_state(cast(GtkEventController*)this._cPtr);
    gid.gdk4.types.ModifierType _retval = cast(gid.gdk4.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Returns the timestamp of the event that is currently being
      handled by the controller.
      
      At other times, 0 is returned.
      Returns: timestamp of the event is currently handled by controller
  */
  uint getCurrentEventTime() nothrow
  {
    uint _retval;
    _retval = gtk_event_controller_get_current_event_time(cast(GtkEventController*)this._cPtr);
    return _retval;
  }

  /**
      Gets the name of controller.
      Returns: The controller name
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_event_controller_get_name(cast(GtkEventController*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the propagation limit of the event controller.
      Returns: the propagation limit
  */
  gid.gtk4.types.PropagationLimit getPropagationLimit() nothrow
  {
    GtkPropagationLimit _cretval;
    _cretval = gtk_event_controller_get_propagation_limit(cast(GtkEventController*)this._cPtr);
    gid.gtk4.types.PropagationLimit _retval = cast(gid.gtk4.types.PropagationLimit)_cretval;
    return _retval;
  }

  /**
      Gets the propagation phase at which controller handles events.
      Returns: the propagation phase
  */
  gid.gtk4.types.PropagationPhase getPropagationPhase() nothrow
  {
    GtkPropagationPhase _cretval;
    _cretval = gtk_event_controller_get_propagation_phase(cast(GtkEventController*)this._cPtr);
    gid.gtk4.types.PropagationPhase _retval = cast(gid.gtk4.types.PropagationPhase)_cretval;
    return _retval;
  }

  /**
      Returns the [gid.gtk4.widget.Widget] this controller relates to.
      Returns: a [gid.gtk4.widget.Widget]
  */
  gid.gtk4.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_event_controller_get_widget(cast(GtkEventController*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Resets the controller to a clean state.
  */
  void reset() nothrow
  {
    gtk_event_controller_reset(cast(GtkEventController*)this._cPtr);
  }

  /**
      Sets a name on the controller that can be used for debugging.
  
      Params:
        name = a name for controller
  */
  void setName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    gtk_event_controller_set_name(cast(GtkEventController*)this._cPtr, _name);
  }

  /**
      Sets the event propagation limit on the event controller.
      
      If the limit is set to [gid.gtk4.types.PropagationLimit.SameNative], the controller
      won't handle events that are targeted at widgets on a different
      surface, such as popovers.
  
      Params:
        limit = the propagation limit
  */
  void setPropagationLimit(gid.gtk4.types.PropagationLimit limit) nothrow
  {
    gtk_event_controller_set_propagation_limit(cast(GtkEventController*)this._cPtr, limit);
  }

  /**
      Sets the propagation phase at which a controller handles events.
      
      If phase is [gid.gtk4.types.PropagationPhase.None], no automatic event handling will be
      performed, but other additional gesture maintenance will.
  
      Params:
        phase = a propagation phase
  */
  void setPropagationPhase(gid.gtk4.types.PropagationPhase phase) nothrow
  {
    gtk_event_controller_set_propagation_phase(cast(GtkEventController*)this._cPtr, phase);
  }

  /**
      Sets a name on the controller that can be used for debugging.
  
      Params:
        name = a name for controller, must be a static string
  */
  void setStaticName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    gtk_event_controller_set_static_name(cast(GtkEventController*)this._cPtr, _name);
  }
}

/// Fluent builder implementation template for [gid.gtk4.event_controller.EventController]
class EventControllerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `name` property.
      Params:
        propval = The name for this controller, typically used for debugging purposes.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `propagationLimit` property.
      Params:
        propval = The limit for which events this controller will handle.
      Returns: Builder instance for fluent chaining
  */
  T propagationLimit(gid.gtk4.types.PropagationLimit propval) nothrow
  {
    return setProperty("propagation-limit", propval);
  }

  /**
      Set `propagationPhase` property.
      Params:
        propval = The propagation phase at which this controller will handle events.
      Returns: Builder instance for fluent chaining
  */
  T propagationPhase(gid.gtk4.types.PropagationPhase propval) nothrow
  {
    return setProperty("propagation-phase", propval);
  }
}

/// Fluent builder for [gid.gtk4.event_controller.EventController]
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
