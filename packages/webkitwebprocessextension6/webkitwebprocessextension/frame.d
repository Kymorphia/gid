/// Module for [Frame] class
module webkitwebprocessextension.frame;

import gid.gid;
import gobject.object;
import javascriptcore.context;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.script_world;
import webkitwebprocessextension.types;

/**
    A web page frame.
    
    Each [webkitwebprocessextension.web_page.WebPage] has at least one main frame, and can have any number
    of subframes.
*/
class Frame : gobject.object.ObjectWrap
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
    return cast(void function())webkit_frame_get_type != &gidSymbolNotFound ? webkit_frame_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Frame self()
  {
    return this;
  }

  /**
      Gets the process-unique identifier of this #WebKitFrame. No other
      frame in the same web process will have the same ID; however, frames
      in other web processes may.
      Returns: the identifier of frame
  */
  ulong getId()
  {
    ulong _retval;
    _retval = webkit_frame_get_id(cast(WebKitFrame*)this._cPtr);
    return _retval;
  }

  /**
      Get the JavaScript execution context of frame. Use this function to bridge
      between the WebKit and JavaScriptCore APIs.
      Returns: the #JSCContext for the JavaScript execution context of frame.
  */
  javascriptcore.context.Context getJsContext()
  {
    JSCContext* _cretval;
    _cretval = webkit_frame_get_js_context(cast(WebKitFrame*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.context.Context)(cast(JSCContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the JavaScript execution context of frame for the given #WebKitScriptWorld.
  
      Params:
        world = a #WebKitScriptWorld
      Returns: the #JSCContext for the JavaScript execution context of frame for world.
  */
  javascriptcore.context.Context getJsContextForScriptWorld(webkitwebprocessextension.script_world.ScriptWorld world)
  {
    JSCContext* _cretval;
    _cretval = webkit_frame_get_js_context_for_script_world(cast(WebKitFrame*)this._cPtr, world ? cast(WebKitScriptWorld*)world._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.context.Context)(cast(JSCContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the current active URI of frame.
      Returns: the current active URI of frame or null if nothing has been
           loaded yet.
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = webkit_frame_get_uri(cast(WebKitFrame*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether frame is the main frame of a #WebKitWebPage
      Returns: true if frame is a main frame or false otherwise
  */
  bool isMainFrame()
  {
    bool _retval;
    _retval = cast(bool)webkit_frame_is_main_frame(cast(WebKitFrame*)this._cPtr);
    return _retval;
  }
}
