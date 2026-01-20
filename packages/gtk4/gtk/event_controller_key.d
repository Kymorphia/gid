/// Module for [EventControllerKey] class
module gtk.event_controller_key;

import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.imcontext;
import gtk.types;
import gtk.widget;

/**
    [gtk.event_controller_key.EventControllerKey] is an event controller that provides access
    to key events.
*/
class EventControllerKey : gtk.event_controller.EventController
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
    return cast(void function())gtk_event_controller_key_get_type != &gidSymbolNotFound ? gtk_event_controller_key_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EventControllerKey self()
  {
    return this;
  }

  /**
      Creates a new event controller that will handle key events.
      Returns: a new [gtk.event_controller_key.EventControllerKey]
  */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_key_new();
    this(_cretval, Yes.Take);
  }

  /**
      Forwards the current event of this controller to a widget.
      
      This function can only be used in handlers for the
      `signalGtk.EventControllerKey::key-pressed`,
      `signalGtk.EventControllerKey::key-released`
      or [gtk.event_controller_key.EventControllerKey.modifiers] signals.
  
      Params:
        widget = a [gtk.widget.Widget]
      Returns: whether the widget handled the event
  */
  bool forward(gtk.widget.Widget widget)
  {
    bool _retval;
    _retval = cast(bool)gtk_event_controller_key_forward(cast(GtkEventControllerKey*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the key group of the current event of this controller.
      
      See [gdk.key_event.KeyEvent.getLayout].
      Returns: the key group
  */
  uint getGroup()
  {
    uint _retval;
    _retval = gtk_event_controller_key_get_group(cast(GtkEventControllerKey*)this._cPtr);
    return _retval;
  }

  /**
      Gets the input method context of the key controller.
      Returns: the [gtk.imcontext.IMContext]
  */
  gtk.imcontext.IMContext getImContext()
  {
    GtkIMContext* _cretval;
    _cretval = gtk_event_controller_key_get_im_context(cast(GtkEventControllerKey*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.imcontext.IMContext)(cast(GtkIMContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the input method context of the key controller.
  
      Params:
        imContext = a [gtk.imcontext.IMContext]
  */
  void setImContext(gtk.imcontext.IMContext imContext = null)
  {
    gtk_event_controller_key_set_im_context(cast(GtkEventControllerKey*)this._cPtr, imContext ? cast(GtkIMContext*)imContext._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ImUpdate` signal.
  
      Emitted whenever the input method context filters away
        a keypress and prevents the controller receiving it.
        
        See [gtk.event_controller_key.EventControllerKey.setImContext] and
        [gtk.imcontext.IMContext.filterKeypress].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.event_controller_key.EventControllerKey eventControllerKey))
  
          `eventControllerKey` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectImUpdate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.event_controller_key.EventControllerKey)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("im-update", closure, after);
  }

  /**
      Connect to `KeyPressed` signal.
  
      Emitted whenever a key is pressed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(uint keyval, uint keycode, gdk.types.ModifierType state, gtk.event_controller_key.EventControllerKey eventControllerKey))
  
          `keyval` the pressed key. (optional)
  
          `keycode` the raw code of the pressed key. (optional)
  
          `state` the bitmask, representing the state of modifier keys and pointer buttons. (optional)
  
          `eventControllerKey` the instance the signal is connected to (optional)
  
          `Returns` true if the key press was handled, false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectKeyPressed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gdk.types.ModifierType)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.event_controller_key.EventControllerKey)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-pressed", closure, after);
  }

  /**
      Connect to `KeyReleased` signal.
  
      Emitted whenever a key is released.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint keyval, uint keycode, gdk.types.ModifierType state, gtk.event_controller_key.EventControllerKey eventControllerKey))
  
          `keyval` the released key. (optional)
  
          `keycode` the raw code of the released key. (optional)
  
          `state` the bitmask, representing the state of modifier keys and pointer buttons. (optional)
  
          `eventControllerKey` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectKeyReleased(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gdk.types.ModifierType)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.event_controller_key.EventControllerKey)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-released", closure, after);
  }

  /**
      Connect to `Modifiers` signal.
  
      Emitted whenever the state of modifier keys and pointer buttons change.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.types.ModifierType state, gtk.event_controller_key.EventControllerKey eventControllerKey))
  
          `state` the bitmask, representing the new state of modifier keys and
              pointer buttons. (optional)
  
          `eventControllerKey` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectModifiers(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.types.ModifierType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.event_controller_key.EventControllerKey)))
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
    return connectSignalClosure("modifiers", closure, after);
  }
}
