/// Module for [ActionMuxer] class
module panel.action_muxer;

import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.types;

/** */
class ActionMuxer : gobject.object.ObjectWrap, gio.action_group.ActionGroup
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
    return cast(void function())panel_action_muxer_get_type != &gidSymbolNotFound ? panel_action_muxer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ActionMuxer self()
  {
    return this;
  }

  mixin ActionGroupT!();

  /** */
  this()
  {
    PanelActionMuxer* _cretval;
    _cretval = panel_action_muxer_new();
    this(_cretval, Yes.Take);
  }

  /**
      Locates the #GActionGroup inserted as prefix.
      
      If no group was found matching group, null is returned.
  
      Params:
        prefix = the name of the inserted action group
      Returns: a #GActionGroup matching prefix if
          found, otherwise null.
  */
  gio.action_group.ActionGroup getActionGroup(string prefix)
  {
    GActionGroup* _cretval;
    const(char)* _prefix = prefix.toCString(No.Alloc);
    _cretval = panel_action_muxer_get_action_group(cast(PanelActionMuxer*)this._cPtr, _prefix);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.action_group.ActionGroup)(cast(GActionGroup*)_cretval, No.Take);
    return _retval;
  }

  /** */
  void insertActionGroup(string prefix, gio.action_group.ActionGroup actionGroup)
  {
    const(char)* _prefix = prefix.toCString(No.Alloc);
    panel_action_muxer_insert_action_group(cast(PanelActionMuxer*)this._cPtr, _prefix, actionGroup ? cast(GActionGroup*)(cast(gobject.object.ObjectWrap)actionGroup)._cPtr(No.Dup) : null);
  }

  /**
      Gets a list of group names in the muxer.
      Returns: an array containing the names of groups within the muxer
  */
  string[] listGroups()
  {
    char** _cretval;
    _cretval = panel_action_muxer_list_groups(cast(PanelActionMuxer*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  void removeActionGroup(string prefix)
  {
    const(char)* _prefix = prefix.toCString(No.Alloc);
    panel_action_muxer_remove_action_group(cast(PanelActionMuxer*)this._cPtr, _prefix);
  }

  /** */
  void removeAll()
  {
    panel_action_muxer_remove_all(cast(PanelActionMuxer*)this._cPtr);
  }
}
