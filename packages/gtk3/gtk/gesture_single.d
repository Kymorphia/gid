/// Module for [GestureSingle] class
module gtk.gesture_single;

import gdk.event_sequence;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture;
import gtk.types;

/**
    #GtkGestureSingle is a subclass of #GtkGesture, optimized (although
    not restricted) for dealing with mouse and single-touch gestures. Under
    interaction, these gestures stick to the first interacting sequence, which
    is accessible through [gtk.gesture_single.GestureSingle.getCurrentSequence] while the
    gesture is being interacted with.
    
    By default gestures react to both `GDK_BUTTON_PRIMARY` and touch
    events, [gtk.gesture_single.GestureSingle.setTouchOnly] can be used to change the
    touch behavior. Callers may also specify a different mouse button number
    to interact with through [gtk.gesture_single.GestureSingle.setButton], or react to any
    mouse button by setting 0. While the gesture is active, the button being
    currently pressed can be known through [gtk.gesture_single.GestureSingle.getCurrentButton].
*/
class GestureSingle : gtk.gesture.Gesture
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
    return cast(void function())gtk_gesture_single_get_type != &gidSymbolNotFound ? gtk_gesture_single_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureSingle self()
  {
    return this;
  }

  /**
      Get `button` property.
      Returns: Mouse button number to listen to, or 0 to listen for any button.
  */
  @property uint button()
  {
    return getButton();
  }

  /**
      Set `button` property.
      Params:
        propval = Mouse button number to listen to, or 0 to listen for any button.
  */
  @property void button(uint propval)
  {
    return setButton(propval);
  }

  /**
      Get `exclusive` property.
      Returns: Whether the gesture is exclusive. Exclusive gestures only listen to pointer
        and pointer emulated events.
  */
  @property bool exclusive()
  {
    return getExclusive();
  }

  /**
      Set `exclusive` property.
      Params:
        propval = Whether the gesture is exclusive. Exclusive gestures only listen to pointer
          and pointer emulated events.
  */
  @property void exclusive(bool propval)
  {
    return setExclusive(propval);
  }

  /**
      Get `touchOnly` property.
      Returns: Whether the gesture handles only touch events.
  */
  @property bool touchOnly()
  {
    return getTouchOnly();
  }

  /**
      Set `touchOnly` property.
      Params:
        propval = Whether the gesture handles only touch events.
  */
  @property void touchOnly(bool propval)
  {
    return setTouchOnly(propval);
  }

  /**
      Returns the button number gesture listens for, or 0 if gesture
      reacts to any button press.
      Returns: The button number, or 0 for any button
  */
  uint getButton()
  {
    uint _retval;
    _retval = gtk_gesture_single_get_button(cast(GtkGestureSingle*)this._cPtr);
    return _retval;
  }

  /**
      Returns the button number currently interacting with gesture, or 0 if there
      is none.
      Returns: The current button number
  */
  uint getCurrentButton()
  {
    uint _retval;
    _retval = gtk_gesture_single_get_current_button(cast(GtkGestureSingle*)this._cPtr);
    return _retval;
  }

  /**
      Returns the event sequence currently interacting with gesture.
      This is only meaningful if [gtk.gesture.Gesture.isActive] returns true.
      Returns: the current sequence
  */
  gdk.event_sequence.EventSequence getCurrentSequence()
  {
    GdkEventSequence* _cretval;
    _cretval = gtk_gesture_single_get_current_sequence(cast(GtkGestureSingle*)this._cPtr);
    auto _retval = _cretval ? new gdk.event_sequence.EventSequence(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets whether a gesture is exclusive. For more information, see
      [gtk.gesture_single.GestureSingle.setExclusive].
      Returns: Whether the gesture is exclusive
  */
  bool getExclusive()
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_single_get_exclusive(cast(GtkGestureSingle*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if the gesture is only triggered by touch events.
      Returns: true if the gesture only handles touch events
  */
  bool getTouchOnly()
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_single_get_touch_only(cast(GtkGestureSingle*)this._cPtr);
    return _retval;
  }

  /**
      Sets the button number gesture listens to. If non-0, every
      button press from a different button number will be ignored.
      Touch events implicitly match with button 1.
  
      Params:
        button = button number to listen to, or 0 for any button
  */
  void setButton(uint button)
  {
    gtk_gesture_single_set_button(cast(GtkGestureSingle*)this._cPtr, button);
  }

  /**
      Sets whether gesture is exclusive. An exclusive gesture will
      only handle pointer and "pointer emulated" touch events, so at
      any given time, there is only one sequence able to interact with
      those.
  
      Params:
        exclusive = true to make gesture exclusive
  */
  void setExclusive(bool exclusive)
  {
    gtk_gesture_single_set_exclusive(cast(GtkGestureSingle*)this._cPtr, exclusive);
  }

  /**
      If touch_only is true, gesture will only handle events of type
      #GDK_TOUCH_BEGIN, #GDK_TOUCH_UPDATE or #GDK_TOUCH_END. If false,
      mouse events will be handled too.
  
      Params:
        touchOnly = whether gesture handles only touch events
  */
  void setTouchOnly(bool touchOnly)
  {
    gtk_gesture_single_set_touch_only(cast(GtkGestureSingle*)this._cPtr, touchOnly);
  }
}
