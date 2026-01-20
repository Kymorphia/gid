/// Module for [ScriptWorld] class
module webkitwebprocessextension.script_world;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.frame;
import webkitwebprocessextension.types;
import webkitwebprocessextension.web_page;

/** */
class ScriptWorld : gobject.object.ObjectWrap
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
    return cast(void function())webkit_script_world_get_type != &gidSymbolNotFound ? webkit_script_world_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScriptWorld self()
  {
    return this;
  }

  /**
      Creates a new isolated #WebKitScriptWorld. Scripts executed in
      isolated worlds have access to the DOM but not to other variable
      or functions created by the page.
      The #WebKitScriptWorld is created with a generated unique name. Use
      [webkitwebprocessextension.script_world.ScriptWorld.newWithName] if you want to create it with a
      custom name.
      You can get the JavaScript execution context of a #WebKitScriptWorld
      for a given #WebKitFrame with webkit_frame_get_javascript_context_for_script_world().
      Returns: a new isolated #WebKitScriptWorld
  */
  this()
  {
    WebKitScriptWorld* _cretval;
    _cretval = webkit_script_world_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new isolated #WebKitScriptWorld with a name. Scripts executed in
      isolated worlds have access to the DOM but not to other variable
      or functions created by the page.
      You can get the JavaScript execution context of a #WebKitScriptWorld
      for a given #WebKitFrame with webkit_frame_get_javascript_context_for_script_world().
  
      Params:
        name = a name for the script world
      Returns: a new isolated #WebKitScriptWorld
  */
  static webkitwebprocessextension.script_world.ScriptWorld newWithName(string name)
  {
    WebKitScriptWorld* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = webkit_script_world_new_with_name(_name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkitwebprocessextension.script_world.ScriptWorld)(cast(WebKitScriptWorld*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the default #WebKitScriptWorld. This is the normal script world
      where all scripts are executed by default.
      You can get the JavaScript execution context of a #WebKitScriptWorld
      for a given #WebKitFrame with webkit_frame_get_javascript_context_for_script_world().
      Returns: the default #WebKitScriptWorld
  */
  static webkitwebprocessextension.script_world.ScriptWorld getDefault()
  {
    WebKitScriptWorld* _cretval;
    _cretval = webkit_script_world_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkitwebprocessextension.script_world.ScriptWorld)(cast(WebKitScriptWorld*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the name of a #WebKitScriptWorld.
      Returns: the name of world
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = webkit_script_world_get_name(cast(WebKitScriptWorld*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Connect to `WindowObjectCleared` signal.
  
      Emitted when the JavaScript window object in a #WebKitScriptWorld has been
        cleared. This is the preferred place to set custom properties on the window
        object using the JavaScriptCore API. You can get the window object of frame
        from the JavaScript execution context of world that is returned by
        [webkitwebprocessextension.frame.Frame.getJsContextForScriptWorld].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkitwebprocessextension.web_page.WebPage page, webkitwebprocessextension.frame.Frame frame, webkitwebprocessextension.script_world.ScriptWorld scriptWorld))
  
          `page` a #WebKitWebPage (optional)
  
          `frame` the #WebKitFrame  to which world belongs (optional)
  
          `scriptWorld` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWindowObjectCleared(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkitwebprocessextension.web_page.WebPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkitwebprocessextension.frame.Frame)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkitwebprocessextension.script_world.ScriptWorld)))
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
    return connectSignalClosure("window-object-cleared", closure, after);
  }
}
