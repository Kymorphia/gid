/// Module for [Gesture] class
module gtk.gesture;

import gdk.device;
import gdk.event;
import gdk.event_sequence;
import gdk.rectangle;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
    #GtkGesture is the base object for gesture recognition, although this
    object is quite generalized to serve as a base for multi-touch gestures,
    it is suitable to implement single-touch and pointer-based gestures (using
    the special null #GdkEventSequence value for these).
    
    The number of touches that a #GtkGesture need to be recognized is controlled
    by the #GtkGesture:n-points property, if a gesture is keeping track of less
    or more than that number of sequences, it won't check wether the gesture
    is recognized.
    
    As soon as the gesture has the expected number of touches, the gesture will
    run the #GtkGesture::check signal regularly on input events until the gesture
    is recognized, the criteria to consider a gesture as "recognized" is left to
    #GtkGesture subclasses.
    
    A recognized gesture will then emit the following signals:
    $(LIST
      * #GtkGesture::begin when the gesture is recognized.
      * A number of #GtkGesture::update, whenever an input event is processed.
      * #GtkGesture::end when the gesture is no longer recognized.
    )
      
    ## Event propagation
    
    In order to receive events, a gesture needs to either set a propagation phase
    through [gtk.event_controller.EventController.setPropagationPhase], or feed those manually
    through [gtk.event_controller.EventController.handleEvent].
    
    In the capture phase, events are propagated from the toplevel down to the
    target widget, and gestures that are attached to containers above the widget
    get a chance to interact with the event before it reaches the target.
    
    After the capture phase, GTK+ emits the traditional #GtkWidget::button-press-event,
    #GtkWidget::button-release-event, #GtkWidget::touch-event, etc signals. Gestures
    with the [gtk.types.PropagationPhase.Target] phase are fed events from the default #GtkWidget::event
    handlers.
    
    In the bubble phase, events are propagated up from the target widget to the
    toplevel, and gestures that are attached to containers above the widget get
    a chance to interact with events that have not been handled yet.
    
    ## States of a sequence # {#touch-sequence-states}
    
    Whenever input interaction happens, a single event may trigger a cascade of
    #GtkGestures, both across the parents of the widget receiving the event and
    in parallel within an individual widget. It is a responsibility of the
    widgets using those gestures to set the state of touch sequences accordingly
    in order to enable cooperation of gestures around the #GdkEventSequences
    triggering those.
    
    Within a widget, gestures can be grouped through [gtk.gesture.Gesture.group],
    grouped gestures synchronize the state of sequences, so calling
    [gtk.gesture.Gesture.setSequenceState] on one will effectively propagate
    the state throughout the group.
    
    By default, all sequences start out in the #GTK_EVENT_SEQUENCE_NONE state,
    sequences in this state trigger the gesture event handler, but event
    propagation will continue unstopped by gestures.
    
    If a sequence enters into the #GTK_EVENT_SEQUENCE_DENIED state, the gesture
    group will effectively ignore the sequence, letting events go unstopped
    through the gesture, but the "slot" will still remain occupied while
    the touch is active.
    
    If a sequence enters in the #GTK_EVENT_SEQUENCE_CLAIMED state, the gesture
    group will grab all interaction on the sequence, by:
    $(LIST
      * Setting the same sequence to #GTK_EVENT_SEQUENCE_DENIED on every other gesture
        group within the widget, and every gesture on parent widgets in the propagation
        chain.
      * calling #GtkGesture::cancel on every gesture in widgets underneath in the
        propagation chain.
      * Stopping event propagation after the gesture group handles the event.
    )
      
    Note: if a sequence is set early to #GTK_EVENT_SEQUENCE_CLAIMED on
    #GDK_TOUCH_BEGIN/#GDK_BUTTON_PRESS (so those events are captured before
    reaching the event widget, this implies #GTK_PHASE_CAPTURE), one similar
    event will emulated if the sequence changes to #GTK_EVENT_SEQUENCE_DENIED.
    This way event coherence is preserved before event propagation is unstopped
    again.
    
    Sequence states can't be changed freely, see [gtk.gesture.Gesture.setSequenceState]
    to know about the possible lifetimes of a #GdkEventSequence.
    
    ## Touchpad gestures
    
    On the platforms that support it, #GtkGesture will handle transparently
    touchpad gesture events. The only precautions users of #GtkGesture should do
    to enable this support are:
    $(LIST
      * Enabling [gdk.types.EventMask.TouchpadGestureMask] on their #GdkWindows
      * If the gesture has [gtk.types.PropagationPhase.None], ensuring events of type
        [gdk.types.EventType.TouchpadSwipe] and [gdk.types.EventType.TouchpadPinch] are handled by the #GtkGesture
    )
*/
class Gesture : gtk.event_controller.EventController
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
    return cast(void function())gtk_gesture_get_type != &gidSymbolNotFound ? gtk_gesture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Gesture self()
  {
    return this;
  }

  /**
      Get `window` property.
      Returns: If non-null, the gesture will only listen for events that happen on
      this #GdkWindow, or a child of it.
  */
  @property gdk.window.Window window()
  {
    return getWindow();
  }

  /**
      Set `window` property.
      Params:
        propval = If non-null, the gesture will only listen for events that happen on
        this #GdkWindow, or a child of it.
  */
  @property void window(gdk.window.Window propval)
  {
    return setWindow(propval);
  }

  /**
      If there are touch sequences being currently handled by gesture,
      this function returns true and fills in rect with the bounding
      box containing all active touches. Otherwise, false will be
      returned.
      
      Note: This function will yield unexpected results on touchpad
      gestures. Since there is no correlation between physical and
      pixel distances, these will look as if constrained in an
      infinitely small area, rect width and height will thus be 0
      regardless of the number of touchpoints.
  
      Params:
        rect = bounding box containing all active touches.
      Returns: true if there are active touches, false otherwise
  */
  bool getBoundingBox(out gdk.rectangle.Rectangle rect)
  {
    bool _retval;
    GdkRectangle _rect;
    _retval = cast(bool)gtk_gesture_get_bounding_box(cast(GtkGesture*)this._cPtr, &_rect);
    rect = new gdk.rectangle.Rectangle(cast(void*)&_rect, No.Take);
    return _retval;
  }

  /**
      If there are touch sequences being currently handled by gesture,
      this function returns true and fills in `x` and `y` with the center
      of the bounding box containing all active touches. Otherwise, false
      will be returned.
  
      Params:
        x = X coordinate for the bounding box center
        y = Y coordinate for the bounding box center
      Returns: false if no active touches are present, true otherwise
  */
  bool getBoundingBoxCenter(out double x, out double y)
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_get_bounding_box_center(cast(GtkGesture*)this._cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Returns the master #GdkDevice that is currently operating
      on gesture, or null if the gesture is not being interacted.
      Returns: a #GdkDevice, or null
  */
  gdk.device.Device getDevice()
  {
    GdkDevice* _cretval;
    _cretval = gtk_gesture_get_device(cast(GtkGesture*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns all gestures in the group of gesture
      Returns: The list
          of #GtkGestures, free with [glib.list.List.free]
  */
  gtk.gesture.Gesture[] getGroup()
  {
    GList* _cretval;
    _cretval = gtk_gesture_get_group(cast(GtkGesture*)this._cPtr);
    auto _retval = gListToD!(gtk.gesture.Gesture, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the last event that was processed for sequence.
      
      Note that the returned pointer is only valid as long as the sequence
      is still interpreted by the gesture. If in doubt, you should make
      a copy of the event.
  
      Params:
        sequence = a #GdkEventSequence
      Returns: The last event from sequence
  */
  gdk.event.Event getLastEvent(gdk.event_sequence.EventSequence sequence = null)
  {
    const(GdkEvent)* _cretval;
    _cretval = gtk_gesture_get_last_event(cast(GtkGesture*)this._cPtr, sequence ? cast(GdkEventSequence*)sequence._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gdk.event.Event(cast(GdkEvent*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the #GdkEventSequence that was last updated on gesture.
      Returns: The last updated sequence
  */
  gdk.event_sequence.EventSequence getLastUpdatedSequence()
  {
    GdkEventSequence* _cretval;
    _cretval = gtk_gesture_get_last_updated_sequence(cast(GtkGesture*)this._cPtr);
    auto _retval = _cretval ? new gdk.event_sequence.EventSequence(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      If sequence is currently being interpreted by gesture, this
      function returns true and fills in `x` and `y` with the last coordinates
      stored for that event sequence. The coordinates are always relative to the
      widget allocation.
  
      Params:
        sequence = a #GdkEventSequence, or null for pointer events
        x = return location for X axis of the sequence coordinates
        y = return location for Y axis of the sequence coordinates
      Returns: true if sequence is currently interpreted
  */
  bool getPoint(gdk.event_sequence.EventSequence sequence, out double x, out double y)
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_get_point(cast(GtkGesture*)this._cPtr, sequence ? cast(GdkEventSequence*)sequence._cPtr(No.Dup) : null, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Returns the sequence state, as seen by gesture.
  
      Params:
        sequence = a #GdkEventSequence
      Returns: The sequence state in gesture
  */
  gtk.types.EventSequenceState getSequenceState(gdk.event_sequence.EventSequence sequence)
  {
    GtkEventSequenceState _cretval;
    _cretval = gtk_gesture_get_sequence_state(cast(GtkGesture*)this._cPtr, sequence ? cast(GdkEventSequence*)sequence._cPtr(No.Dup) : null);
    gtk.types.EventSequenceState _retval = cast(gtk.types.EventSequenceState)_cretval;
    return _retval;
  }

  /**
      Returns the list of #GdkEventSequences currently being interpreted
      by gesture.
      Returns: A list
                 of #GdkEventSequences, the list elements are owned by GTK+
                 and must not be freed or modified, the list itself must be deleted
                 through [glib.list.List.free]
  */
  gdk.event_sequence.EventSequence[] getSequences()
  {
    GList* _cretval;
    _cretval = gtk_gesture_get_sequences(cast(GtkGesture*)this._cPtr);
    auto _retval = gListToD!(gdk.event_sequence.EventSequence, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the user-defined window that receives the events
      handled by gesture. See [gtk.gesture.Gesture.setWindow] for more
      information.
      Returns: the user defined window, or null if none
  */
  gdk.window.Window getWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_gesture_get_window(cast(GtkGesture*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds gesture to the same group than group_gesture. Gestures
      are by default isolated in their own groups.
      
      When gestures are grouped, the state of #GdkEventSequences
      is kept in sync for all of those, so calling [gtk.gesture.Gesture.setSequenceState],
      on one will transfer the same value to the others.
      
      Groups also perform an "implicit grabbing" of sequences, if a
      #GdkEventSequence state is set to #GTK_EVENT_SEQUENCE_CLAIMED on one group,
      every other gesture group attached to the same #GtkWidget will switch the
      state for that sequence to #GTK_EVENT_SEQUENCE_DENIED.
  
      Params:
        gesture = a #GtkGesture
  */
  void group(gtk.gesture.Gesture gesture)
  {
    gtk_gesture_group(cast(GtkGesture*)this._cPtr, gesture ? cast(GtkGesture*)gesture._cPtr(No.Dup) : null);
  }

  /**
      Returns true if gesture is currently handling events corresponding to
      sequence.
  
      Params:
        sequence = a #GdkEventSequence or null
      Returns: true if gesture is handling sequence, false otherwise
  */
  bool handlesSequence(gdk.event_sequence.EventSequence sequence = null)
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_handles_sequence(cast(GtkGesture*)this._cPtr, sequence ? cast(GdkEventSequence*)sequence._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns true if the gesture is currently active.
      A gesture is active meanwhile there are touch sequences
      interacting with it.
      Returns: true if gesture is active
  */
  bool isActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_is_active(cast(GtkGesture*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if both gestures pertain to the same group.
  
      Params:
        other = another #GtkGesture
      Returns: whether the gestures are grouped
  */
  bool isGroupedWith(gtk.gesture.Gesture other)
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_is_grouped_with(cast(GtkGesture*)this._cPtr, other ? cast(GtkGesture*)other._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns true if the gesture is currently recognized.
      A gesture is recognized if there are as many interacting
      touch sequences as required by gesture, and #GtkGesture::check
      returned true for the sequences being currently interpreted.
      Returns: true if gesture is recognized
  */
  bool isRecognized()
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_is_recognized(cast(GtkGesture*)this._cPtr);
    return _retval;
  }

  /**
      Sets the state of sequence in gesture. Sequences start
      in state #GTK_EVENT_SEQUENCE_NONE, and whenever they change
      state, they can never go back to that state. Likewise,
      sequences in state #GTK_EVENT_SEQUENCE_DENIED cannot turn
      back to a not denied state. With these rules, the lifetime
      of an event sequence is constrained to the next four:
      
      $(LIST
        * None
        * None → Denied
        * None → Claimed
        * None → Claimed → Denied
      )
        
      Note: Due to event handling ordering, it may be unsafe to
      set the state on another gesture within a #GtkGesture::begin
      signal handler, as the callback might be executed before
      the other gesture knows about the sequence. A safe way to
      perform this could be:
      
      ```
      static void
      first_gesture_begin_cb (GtkGesture       *first_gesture,
                              GdkEventSequence *sequence,
                              gpointer          user_data)
      {
        gtk_gesture_set_sequence_state (first_gesture, sequence, GTK_EVENT_SEQUENCE_CLAIMED);
        gtk_gesture_set_sequence_state (second_gesture, sequence, GTK_EVENT_SEQUENCE_DENIED);
      }
      
      static void
      second_gesture_begin_cb (GtkGesture       *second_gesture,
                               GdkEventSequence *sequence,
                               gpointer          user_data)
      {
        if (gtk_gesture_get_sequence_state (first_gesture, sequence) == GTK_EVENT_SEQUENCE_CLAIMED)
          gtk_gesture_set_sequence_state (second_gesture, sequence, GTK_EVENT_SEQUENCE_DENIED);
      }
      ```
      
      If both gestures are in the same group, just set the state on
      the gesture emitting the event, the sequence will be already
      be initialized to the group's global state when the second
      gesture processes the event.
  
      Params:
        sequence = a #GdkEventSequence
        state = the sequence state
      Returns: true if sequence is handled by gesture,
                 and the state is changed successfully
  */
  bool setSequenceState(gdk.event_sequence.EventSequence sequence, gtk.types.EventSequenceState state)
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_set_sequence_state(cast(GtkGesture*)this._cPtr, sequence ? cast(GdkEventSequence*)sequence._cPtr(No.Dup) : null, state);
    return _retval;
  }

  /**
      Sets the state of all sequences that gesture is currently
      interacting with. See [gtk.gesture.Gesture.setSequenceState]
      for more details on sequence states.
  
      Params:
        state = the sequence state
      Returns: true if the state of at least one sequence
            was changed successfully
  */
  bool setState(gtk.types.EventSequenceState state)
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_set_state(cast(GtkGesture*)this._cPtr, state);
    return _retval;
  }

  /**
      Sets a specific window to receive events about, so gesture
      will effectively handle only events targeting window, or
      a child of it. window must pertain to [gtk.event_controller.EventController.getWidget].
  
      Params:
        window = a #GdkWindow, or null
  */
  void setWindow(gdk.window.Window window = null)
  {
    gtk_gesture_set_window(cast(GtkGesture*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Separates gesture into an isolated group.
  */
  void ungroup()
  {
    gtk_gesture_ungroup(cast(GtkGesture*)this._cPtr);
  }

  /**
      Connect to `Begin` signal.
  
      This signal is emitted when the gesture is recognized. This means the
      number of touch sequences matches #GtkGesture:n-points, and the #GtkGesture::check
      handler(s) returned #TRUE.
      
      Note: These conditions may also happen when an extra touch (eg. a third touch
      on a 2-touches gesture) is lifted, in that situation sequence won't pertain
      to the current set of active touches, so don't rely on this being true.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.event_sequence.EventSequence sequence, gtk.gesture.Gesture gesture))
  
          `sequence` the #GdkEventSequence that made the gesture to be recognized (optional)
  
          `gesture` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBegin(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_sequence.EventSequence)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.gesture.Gesture)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("begin", closure, after);
  }

  /**
      Connect to `Cancel` signal.
  
      This signal is emitted whenever a sequence is cancelled. This usually
      happens on active touches when [gtk.event_controller.EventController.reset] is called
      on gesture (manually, due to grabs...), or the individual sequence
      was claimed by parent widgets' controllers (see [gtk.gesture.Gesture.setSequenceState]).
      
      gesture must forget everything about sequence as a reaction to this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.event_sequence.EventSequence sequence, gtk.gesture.Gesture gesture))
  
          `sequence` the #GdkEventSequence that was cancelled (optional)
  
          `gesture` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCancel(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_sequence.EventSequence)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.gesture.Gesture)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancel", closure, after);
  }

  /**
      Connect to `End` signal.
  
      This signal is emitted when gesture either stopped recognizing the event
      sequences as something to be handled (the #GtkGesture::check handler returned
      false), or the number of touch sequences became higher or lower than
      #GtkGesture:n-points.
      
      Note: sequence might not pertain to the group of sequences that were
      previously triggering recognition on gesture (ie. a just pressed touch
      sequence that exceeds #GtkGesture:n-points). This situation may be detected
      by checking through [gtk.gesture.Gesture.handlesSequence].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.event_sequence.EventSequence sequence, gtk.gesture.Gesture gesture))
  
          `sequence` the #GdkEventSequence that made gesture recognition to finish (optional)
  
          `gesture` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_sequence.EventSequence)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.gesture.Gesture)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("end", closure, after);
  }

  /**
      Connect to `SequenceStateChanged` signal.
  
      This signal is emitted whenever a sequence state changes. See
      [gtk.gesture.Gesture.setSequenceState] to know more about the expectable
      sequence lifetimes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.event_sequence.EventSequence sequence, gtk.types.EventSequenceState state, gtk.gesture.Gesture gesture))
  
          `sequence` the #GdkEventSequence that was cancelled (optional)
  
          `state` the new sequence state (optional)
  
          `gesture` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSequenceStateChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_sequence.EventSequence)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.types.EventSequenceState)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture.Gesture)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("sequence-state-changed", closure, after);
  }

  /**
      Connect to `Update` signal.
  
      This signal is emitted whenever an event is handled while the gesture is
      recognized. sequence is guaranteed to pertain to the set of active touches.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.event_sequence.EventSequence sequence, gtk.gesture.Gesture gesture))
  
          `sequence` the #GdkEventSequence that was updated (optional)
  
          `gesture` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUpdate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_sequence.EventSequence)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.gesture.Gesture)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("update", closure, after);
  }
}
