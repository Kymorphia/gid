/// Module for [UserScript] class
module webkit.user_script;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    A JavaScript snippet which can be injected in loaded pages.
*/
class UserScript : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_user_script_get_type != &gidSymbolNotFound ? webkit_user_script_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UserScript self()
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
  this(string source, webkit.types.UserContentInjectedFrames injectedFrames, webkit.types.UserScriptInjectionTime injectionTime, string[] allowList = null, string[] blockList = null)
  {
    WebKitUserScript* _cretval;
    const(char)* _source = source.toCString(No.Alloc);
    char*[] _tmpallowList;
    foreach (s; allowList)
      _tmpallowList ~= s.toCString(No.Alloc);
    _tmpallowList ~= null;
    const(char*)* _allowList = _tmpallowList.ptr;

    char*[] _tmpblockList;
    foreach (s; blockList)
      _tmpblockList ~= s.toCString(No.Alloc);
    _tmpblockList ~= null;
    const(char*)* _blockList = _tmpblockList.ptr;

    _cretval = webkit_user_script_new(_source, injectedFrames, injectionTime, _allowList, _blockList);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new user script for script world with name world_name.
      
      See [webkit.user_script.UserScript.new_] for a full description.
  
      Params:
        source = Source code of the user script.
        injectedFrames = A #WebKitUserContentInjectedFrames value
        injectionTime = A #WebKitUserScriptInjectionTime value
        worldName = the name of a #WebKitScriptWorld
        allowList = An allow_list of URI patterns or null
        blockList = A block_list of URI patterns or null
      Returns: A new #WebKitUserScript
  */
  static webkit.user_script.UserScript newForWorld(string source, webkit.types.UserContentInjectedFrames injectedFrames, webkit.types.UserScriptInjectionTime injectionTime, string worldName, string[] allowList = null, string[] blockList = null)
  {
    WebKitUserScript* _cretval;
    const(char)* _source = source.toCString(No.Alloc);
    const(char)* _worldName = worldName.toCString(No.Alloc);
    char*[] _tmpallowList;
    foreach (s; allowList)
      _tmpallowList ~= s.toCString(No.Alloc);
    _tmpallowList ~= null;
    const(char*)* _allowList = _tmpallowList.ptr;

    char*[] _tmpblockList;
    foreach (s; blockList)
      _tmpblockList ~= s.toCString(No.Alloc);
    _tmpblockList ~= null;
    const(char*)* _blockList = _tmpblockList.ptr;

    _cretval = webkit_user_script_new_for_world(_source, injectedFrames, injectionTime, _worldName, _allowList, _blockList);
    auto _retval = _cretval ? new webkit.user_script.UserScript(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
