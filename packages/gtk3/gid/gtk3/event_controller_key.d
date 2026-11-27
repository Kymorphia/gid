/// Module for [EventControllerKey] class
module gid.gtk3.event_controller_key;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.event_controller;
import gid.gtk3.imcontext;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkEventControllerKey is an event controller meant for situations
    where you need access to key events.
    
    This object was added in 3.24.
*/
@gidGir("EventControllerKey", "EventControllerKeyClass")
class EventControllerKey : gid.gtk3.event_controller.EventController
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
    return cast(void function())gtk_event_controller_key_get_type != &gidSymbolNotFound ? gtk_event_controller_key_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEventControllerKey";
  }

  /** Returns `this`, for use in `with` statements. */
  override EventControllerKey self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.event_controller_key.EventControllerKey]
      Returns: New builder object
  */
  static EventControllerKeyGidBuilder builder() nothrow
  {
    return new EventControllerKeyGidBuilder;
  }

  /** */
  this(gid.gtk3.widget.Widget widget) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkEventController* _cretval;
      _cretval = gtk_event_controller_key_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /** */
  bool forward(gid.gtk3.widget.Widget widget) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_event_controller_key_forward(cast(GtkEventControllerKey*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  uint getGroup() nothrow
  {
    uint _retval;
    _retval = gtk_event_controller_key_get_group(cast(GtkEventControllerKey*)this._cPtr);
    return _retval;
  }

  /**
      Gets the IM context of a key controller.
      Returns: the IM context
  */
  gid.gtk3.imcontext.IMContext getImContext() nothrow
  {
    GtkIMContext* _cretval;
    _cretval = gtk_event_controller_key_get_im_context(cast(GtkEventControllerKey*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.imcontext.IMContext)(cast(GtkIMContext*)_cretval, No.Take);
    return _retval;
  }

  /** */
  void setImContext(gid.gtk3.imcontext.IMContext imContext) nothrow
  {
    gtk_event_controller_key_set_im_context(cast(GtkEventControllerKey*)this._cPtr, imContext ? cast(GtkIMContext*)imContext._cPtr(No.Dup) : null);
  }

  /**
      Connect to `FocusIn` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.event_controller_key.EventControllerKey eventControllerKey)`
  
          `eventControllerKey` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFocusIn(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.event_controller_key.EventControllerKey)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.event_controller_key.EventControllerKey.focusIn");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus-in", closure, after);
  }

  /**
      Connect to `FocusOut` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.event_controller_key.EventControllerKey eventControllerKey)`
  
          `eventControllerKey` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFocusOut(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.event_controller_key.EventControllerKey)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.event_controller_key.EventControllerKey.focusOut");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus-out", closure, after);
  }

  /**
      Connect to `ImUpdate` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.event_controller_key.EventControllerKey eventControllerKey)`
  
          `eventControllerKey` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectImUpdate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.event_controller_key.EventControllerKey)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.event_controller_key.EventControllerKey.imUpdate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("im-update", closure, after);
  }

  /**
      Connect to `KeyPressed` signal.
  
      This signal is emitted whenever a key is pressed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(uint keyval, uint keycode, gid.gdk3.types.ModifierType state, gid.gtk3.event_controller_key.EventControllerKey eventControllerKey)`
  
          `keyval` the pressed key. (optional)
  
          `keycode` the raw code of the pressed key. (optional)
  
          `state` the bitmask, representing the state of modifier keys and pointer buttons. See #GdkModifierType. (optional)
  
          `eventControllerKey` the instance the signal is connected to (optional)
  
          `Returns` true if the key press was handled, false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectKeyPressed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gdk3.types.ModifierType)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.event_controller_key.EventControllerKey)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.event_controller_key.EventControllerKey.keyPressed");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-pressed", closure, after);
  }

  /**
      Connect to `KeyReleased` signal.
  
      This signal is emitted whenever a key is released.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint keyval, uint keycode, gid.gdk3.types.ModifierType state, gid.gtk3.event_controller_key.EventControllerKey eventControllerKey)`
  
          `keyval` the released key. (optional)
  
          `keycode` the raw code of the released key. (optional)
  
          `state` the bitmask, representing the state of modifier keys and pointer buttons. See #GdkModifierType. (optional)
  
          `eventControllerKey` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectKeyReleased(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gdk3.types.ModifierType)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.event_controller_key.EventControllerKey)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.event_controller_key.EventControllerKey.keyReleased");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-released", closure, after);
  }

  /**
      Connect to `Modifiers` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gdk3.types.ModifierType object, gid.gtk3.event_controller_key.EventControllerKey eventControllerKey)`
  
          `object`  (optional)
  
          `eventControllerKey` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectModifiers(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.types.ModifierType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.event_controller_key.EventControllerKey)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.event_controller_key.EventControllerKey.modifiers");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("modifiers", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.event_controller_key.EventControllerKey]
class EventControllerKeyGidBuilderImpl(T) : gid.gtk3.event_controller.EventControllerGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk3.event_controller_key.EventControllerKey]
final class EventControllerKeyGidBuilder : EventControllerKeyGidBuilderImpl!EventControllerKeyGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EventControllerKey build() nothrow
  {
    return new EventControllerKey(cast(void*)createGObject(EventControllerKey._getGType), Yes.Take);
  }
}
