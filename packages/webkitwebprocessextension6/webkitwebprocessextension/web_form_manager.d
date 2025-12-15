/// Module for [WebFormManager] class
module webkitwebprocessextension.web_form_manager;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import javascriptcore.value;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.frame;
import webkitwebprocessextension.types;

/**
    Form manager of a #WebKitWebPage in a #WebKitScriptWorld
*/
class WebFormManager : gobject.object.ObjectWrap
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
    return cast(void function())webkit_web_form_manager_get_type != &gidSymbolNotFound ? webkit_web_form_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebFormManager self()
  {
    return this;
  }

  /**
      Set the value of an HTML input element as if it had been edited by
      the user, triggering a change event, and set it as filled automatically.
      If element is not an HTML input element this function does nothing.
  
      Params:
        element = a #JSCValue
        value = the text to set
  */
  static void inputElementAutoFill(javascriptcore.value.Value element, string value)
  {
    const(char)* _value = value.toCString(No.Alloc);
    webkit_web_form_manager_input_element_auto_fill(element ? cast(JSCValue*)element._cPtr(No.Dup) : null, _value);
  }

  /**
      Get whether element is an HTML input element that has been filled automatically.
  
      Params:
        element = a #JSCValue
      Returns: true if element is an HTML input element that has been filled automatically,
           or false otherwise
  */
  static bool inputElementIsAutoFilled(javascriptcore.value.Value element)
  {
    bool _retval;
    _retval = cast(bool)webkit_web_form_manager_input_element_is_auto_filled(element ? cast(JSCValue*)element._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get whether element is an HTML text input element that has been edited by a user action.
  
      Params:
        element = a #JSCValue
      Returns: true if element is an HTML text input element that has been edited by a user action,
           or false otherwise
  */
  static bool inputElementIsUserEdited(javascriptcore.value.Value element)
  {
    bool _retval;
    _retval = cast(bool)webkit_web_form_manager_input_element_is_user_edited(element ? cast(JSCValue*)element._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Connect to `FormControlsAssociated` signal.
  
      Emitted after form elements (or form associated elements) are associated to frame.
      This is useful to implement form auto filling for web pages where form fields are added
      dynamically. This signal might be emitted multiple times for the same frame.
      
      Note that this signal could be also emitted when form controls are moved between forms. In
      that case, the elements array carries the list of those elements which have moved.
      
      Clients should take a reference to the members of the elements array if it is desired to
      keep them alive after the signal handler returns.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkitwebprocessextension.frame.Frame frame, javascriptcore.value.Value[] elements, webkitwebprocessextension.web_form_manager.WebFormManager webFormManager))
  
          `frame` a #WebKitFrame (optional)
  
          `elements` a #GPtrArray of
              #JSCValue with the list of forms in the page (optional)
  
          `webFormManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFormControlsAssociated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkitwebprocessextension.frame.Frame)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == javascriptcore.value.Value[])))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkitwebprocessextension.web_form_manager.WebFormManager)))
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
        _paramTuple[1] = gPtrArrayToD!(javascriptcore.value.Value, GidOwnership.None)(cast(GPtrArray*)getVal!(void*)(&_paramVals[2]));
      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("form-controls-associated", closure, after);
  }

  /**
      Connect to `WillSendSubmitEvent` signal.
  
      This signal is emitted when the DOM submit event is about to be fired for form.
      JavaScript code may rely on the submit event to detect that the user has clicked
      on a submit button, and to possibly cancel the form submission before
      #WebKitWebFormManager::will-submit-form signal is emitted.
      However, beware that, for historical reasons, the submit event is not emitted at
      all if the form submission is triggered by JavaScript. For these reasons,
      this signal may not be used to reliably detect whether a form will be submitted.
      Instead, use it to detect if a user has clicked on a form's submit button even if
      JavaScript later cancels the form submission, or to read the values of the form's
      fields even if JavaScript later clears certain fields before submitting. This may
      be needed, for example, to implement a robust browser password manager, as some
      misguided websites may use such techniques to attempt to thwart password managers.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(javascriptcore.value.Value form, webkitwebprocessextension.frame.Frame sourceFrame, webkitwebprocessextension.frame.Frame targetFrame, webkitwebprocessextension.web_form_manager.WebFormManager webFormManager))
  
          `form` the #JSCValue to be submitted, which will always correspond to an HTMLFormElement (optional)
  
          `sourceFrame` the #WebKitFrame containing the form to be submitted (optional)
  
          `targetFrame` the #WebKitFrame containing the form's target,
              which may be the same as source_frame if no target was specified (optional)
  
          `webFormManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWillSendSubmitEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : javascriptcore.value.Value)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkitwebprocessextension.frame.Frame)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkitwebprocessextension.frame.Frame)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : webkitwebprocessextension.web_form_manager.WebFormManager)))
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
    return connectSignalClosure("will-send-submit-event", closure, after);
  }

  /**
      Connect to `WillSubmitForm` signal.
  
      This signal is emitted when form will imminently be submitted. It can no longer
      be cancelled. This event always occurs immediately before a form is submitted to
      its target, so use this event to reliably detect when a form is submitted. This
      signal is emitted after #WebKitWebFormManager::will-send-submit-event if that
      signal is emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(javascriptcore.value.Value form, webkitwebprocessextension.frame.Frame sourceFrame, webkitwebprocessextension.frame.Frame targetFrame, webkitwebprocessextension.web_form_manager.WebFormManager webFormManager))
  
          `form` the #JSCValue to be submitted, which will always correspond to an HTMLFormElement (optional)
  
          `sourceFrame` the #WebKitFrame containing the form to be submitted (optional)
  
          `targetFrame` the #WebKitFrame containing the form's target,
              which may be the same as source_frame if no target was specified (optional)
  
          `webFormManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWillSubmitForm(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : javascriptcore.value.Value)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkitwebprocessextension.frame.Frame)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkitwebprocessextension.frame.Frame)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : webkitwebprocessextension.web_form_manager.WebFormManager)))
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
    return connectSignalClosure("will-submit-form", closure, after);
  }
}
