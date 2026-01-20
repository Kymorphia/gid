/// Module for [UserStyleSheet] class
module webkit.user_style_sheet;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    A CSS style sheet which can be injected in loaded pages.
*/
class UserStyleSheet : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_user_style_sheet_get_type != &gidSymbolNotFound ? webkit_user_style_sheet_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UserStyleSheet self()
  {
    return this;
  }

  /**
      Creates a new user style sheet.
      
      Style sheets can be applied to some URIs
      only by passing non-null values for allow_list or block_list. Passing a
      null allow_list implies that all URIs are on the allow_list. The style
      sheet is applied if an URI matches the allow_list and not the block_list.
      URI patterns must be of the form `[protocol]://[host]/[path]`, where the
      *host* and *path* components can contain the wildcard character (`*`) to
      represent zero or more other characters.
  
      Params:
        source = Source code of the user style sheet.
        injectedFrames = A #WebKitUserContentInjectedFrames value
        level = A #WebKitUserStyleLevel
        allowList = An allow_list of URI patterns or null
        blockList = A block_list of URI patterns or null
      Returns: A new #WebKitUserStyleSheet
  */
  this(string source, webkit.types.UserContentInjectedFrames injectedFrames, webkit.types.UserStyleLevel level, string[] allowList = null, string[] blockList = null)
  {
    WebKitUserStyleSheet* _cretval;
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

    _cretval = webkit_user_style_sheet_new(_source, injectedFrames, level, _allowList, _blockList);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new user style sheet for script world.
      
      Creates a new user style sheet for script world with name world_name.
      See [webkit.user_style_sheet.UserStyleSheet.new_] for a full description.
  
      Params:
        source = Source code of the user style sheet.
        injectedFrames = A #WebKitUserContentInjectedFrames value
        level = A #WebKitUserStyleLevel
        worldName = the name of a #WebKitScriptWorld
        allowList = An allow_list of URI patterns or null
        blockList = A block_list of URI patterns or null
      Returns: A new #WebKitUserStyleSheet
  */
  static webkit.user_style_sheet.UserStyleSheet newForWorld(string source, webkit.types.UserContentInjectedFrames injectedFrames, webkit.types.UserStyleLevel level, string worldName, string[] allowList = null, string[] blockList = null)
  {
    WebKitUserStyleSheet* _cretval;
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

    _cretval = webkit_user_style_sheet_new_for_world(_source, injectedFrames, level, _worldName, _allowList, _blockList);
    auto _retval = _cretval ? new webkit.user_style_sheet.UserStyleSheet(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
