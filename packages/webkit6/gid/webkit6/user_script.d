/// Module for [UserScript] class
module gid.webkit6.user_script;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    A JavaScript snippet which can be injected in loaded pages.
*/
class UserScript : gid.gobject2.boxed.BoxedWrap!(webkit_user_script_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override UserScript self() nothrow
  {
    return this;
  }

  /**
      Creates a new user script.
      
      Scripts can be applied to some URIs
      only by passing non-null values for allow_list or block_list. Passing a
      null allow_list implies that all URIs are on the allow_list. The script
      is applied if an URI matches the allow_list and not the block_list.
      URI patterns must be of the form `[protocol]://[host]/[path]`, where the
      *host* and *path* components can contain the wildcard character (`*`) to
      represent zero or more other characters.
  
      Params:
        source = Source code of the user script.
        injectedFrames = A #WebKitUserContentInjectedFrames value
        injectionTime = A #WebKitUserScriptInjectionTime value
        allowList = An allow_list of URI patterns or null
        blockList = A block_list of URI patterns or null
      Returns: A new #WebKitUserScript
  */
  this(string source, gid.webkit6.types.UserContentInjectedFrames injectedFrames, gid.webkit6.types.UserScriptInjectionTime injectionTime, string[] allowList = null, string[] blockList = null) nothrow
  {
    WebKitUserScript* _cretval;
    const(char)* _source = source.toCString!(No.Malloc, No.Nullable);
    auto _allowList_arr = new char*[](allowList.length + 1);
    auto _allowList = cast(char**)_allowList_arr.ptr;
    foreach (i, s; allowList) _allowList[i] = s.toCString!(No.Malloc);
    auto _blockList_arr = new char*[](blockList.length + 1);
    auto _blockList = cast(char**)_blockList_arr.ptr;
    foreach (i, s; blockList) _blockList[i] = s.toCString!(No.Malloc);
    _cretval = webkit_user_script_new(_source, injectedFrames, injectionTime, _allowList, _blockList);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new user script for script world with name world_name.
      
      See [gid.webkit6.user_script.UserScript.new_] for a full description.
  
      Params:
        source = Source code of the user script.
        injectedFrames = A #WebKitUserContentInjectedFrames value
        injectionTime = A #WebKitUserScriptInjectionTime value
        worldName = the name of a #WebKitScriptWorld
        allowList = An allow_list of URI patterns or null
        blockList = A block_list of URI patterns or null
      Returns: A new #WebKitUserScript
  */
  static gid.webkit6.user_script.UserScript newForWorld(string source, gid.webkit6.types.UserContentInjectedFrames injectedFrames, gid.webkit6.types.UserScriptInjectionTime injectionTime, string worldName, string[] allowList = null, string[] blockList = null) nothrow
  {
    WebKitUserScript* _cretval;
    const(char)* _source = source.toCString!(No.Malloc, No.Nullable);
    const(char)* _worldName = worldName.toCString!(No.Malloc, No.Nullable);
    auto _allowList_arr = new char*[](allowList.length + 1);
    auto _allowList = cast(char**)_allowList_arr.ptr;
    foreach (i, s; allowList) _allowList[i] = s.toCString!(No.Malloc);
    auto _blockList_arr = new char*[](blockList.length + 1);
    auto _blockList = cast(char**)_blockList_arr.ptr;
    foreach (i, s; blockList) _blockList[i] = s.toCString!(No.Malloc);
    _cretval = webkit_user_script_new_for_world(_source, injectedFrames, injectionTime, _worldName, _allowList, _blockList);
    auto _retval = _cretval ? new gid.webkit6.user_script.UserScript(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
