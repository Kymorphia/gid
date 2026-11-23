/// Module for [Frame] class
module gid.webkitwebprocessextension6.frame;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.javascriptcore6.context;
import gid.webkitwebprocessextension6.c.functions;
import gid.webkitwebprocessextension6.c.types;
import gid.webkitwebprocessextension6.script_world;
import gid.webkitwebprocessextension6.types;

/**
    A web page frame.
    
    Each [gid.webkitwebprocessextension6.web_page.WebPage] has at least one main frame, and can have any number
    of subframes.
*/
class Frame : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_frame_get_type != &gidSymbolNotFound ? webkit_frame_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitFrame";
  }

  /** Returns `this`, for use in `with` statements. */
  override Frame self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkitwebprocessextension6.frame.Frame]
      Returns: New builder object
  */
  static FrameGidBuilder builder() nothrow
  {
    return new FrameGidBuilder;
  }

  /**
      Gets the process-unique identifier of this #WebKitFrame. No other
      frame in the same web process will have the same ID; however, frames
      in other web processes may.
      Returns: the identifier of frame
  */
  ulong getId() nothrow
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
  gid.javascriptcore6.context.Context getJsContext() nothrow
  {
    JSCContext* _cretval;
    _cretval = webkit_frame_get_js_context(cast(WebKitFrame*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.javascriptcore6.context.Context)(cast(JSCContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the JavaScript execution context of frame for the given #WebKitScriptWorld.
  
      Params:
        world = a #WebKitScriptWorld
      Returns: the #JSCContext for the JavaScript execution context of frame for world.
  */
  gid.javascriptcore6.context.Context getJsContextForScriptWorld(gid.webkitwebprocessextension6.script_world.ScriptWorld world) nothrow
  {
    JSCContext* _cretval;
    _cretval = webkit_frame_get_js_context_for_script_world(cast(WebKitFrame*)this._cPtr, world ? cast(WebKitScriptWorld*)world._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.javascriptcore6.context.Context)(cast(JSCContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the current active URI of frame.
      Returns: the current active URI of frame or null if nothing has been
           loaded yet.
  */
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_frame_get_uri(cast(WebKitFrame*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether frame is the main frame of a #WebKitWebPage
      Returns: true if frame is a main frame or false otherwise
  */
  bool isMainFrame() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_frame_is_main_frame(cast(WebKitFrame*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.webkitwebprocessextension6.frame.Frame]
class FrameGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkitwebprocessextension6.frame.Frame]
final class FrameGidBuilder : FrameGidBuilderImpl!FrameGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Frame build() nothrow
  {
    return new Frame(cast(void*)createGObject(Frame._getGType), Yes.Take);
  }
}
