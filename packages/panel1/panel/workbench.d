/// Module for [Workbench] class
module panel.workbench;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gtk.widget;
import gtk.window_group;
import panel.c.functions;
import panel.c.types;
import panel.types;
import panel.workspace;

/** */
class Workbench : gtk.window_group.WindowGroup
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
    return cast(void function())panel_workbench_get_type != &gidSymbolNotFound ? panel_workbench_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Workbench self()
  {
    return this;
  }

  /**
      Get `id` property.
      Returns: The "id" of the workbench.
        
        This is generally used by applications to help destinguish between
        projects, so that the project-id matches the workbench-id.
  */
  @property string id()
  {
    return getId();
  }

  /**
      Set `id` property.
      Params:
        propval = The "id" of the workbench.
          
          This is generally used by applications to help destinguish between
          projects, so that the project-id matches the workbench-id.
  */
  @property void id(string propval)
  {
    return setId(propval);
  }

  /** */
  this()
  {
    PanelWorkbench* _cretval;
    _cretval = panel_workbench_new();
    this(_cretval, Yes.Take);
  }

  /**
      Finds the workbench that contains widget.
  
      Params:
        widget = a #GtkWidget
      Returns: a #PanelWorkbench or null
  */
  static panel.workbench.Workbench findFromWidget(gtk.widget.Widget widget)
  {
    PanelWorkbench* _cretval;
    _cretval = panel_workbench_find_from_widget(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.workbench.Workbench)(cast(PanelWorkbench*)_cretval, No.Take);
    return _retval;
  }

  /** */
  void actionSetEnabled(string actionName, bool enabled)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    panel_workbench_action_set_enabled(cast(PanelWorkbench*)this._cPtr, _actionName, enabled);
  }

  /** */
  void activate()
  {
    panel_workbench_activate(cast(PanelWorkbench*)this._cPtr);
  }

  /** */
  void addWorkspace(panel.workspace.Workspace workspace)
  {
    panel_workbench_add_workspace(cast(PanelWorkbench*)this._cPtr, workspace ? cast(PanelWorkspace*)workspace._cPtr(No.Dup) : null);
  }

  /**
      Locates a workspace in self with a type matching type.
  
      Params:
        workspaceType = 
      Returns: a #PanelWorkspace or null
  */
  panel.workspace.Workspace findWorkspaceTyped(gobject.types.GType workspaceType)
  {
    PanelWorkspace* _cretval;
    _cretval = panel_workbench_find_workspace_typed(cast(PanelWorkbench*)this._cPtr, workspaceType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.workspace.Workspace)(cast(PanelWorkspace*)_cretval, No.Take);
    return _retval;
  }

  /** */
  void focusWorkspace(panel.workspace.Workspace workspace)
  {
    panel_workbench_focus_workspace(cast(PanelWorkbench*)this._cPtr, workspace ? cast(PanelWorkspace*)workspace._cPtr(No.Dup) : null);
  }

  /**
      Calls foreach_func for each workspace in the workbench.
  
      Params:
        foreachFunc = a function to call for each workspace
  */
  void foreachWorkspace(panel.types.WorkspaceForeach foreachFunc)
  {
    extern(C) void _foreachFuncCallback(PanelWorkspace* workspace, void* userData)
    {
      auto _dlg = cast(panel.types.WorkspaceForeach*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(panel.workspace.Workspace)(cast(void*)workspace, No.Take));
    }
    auto _foreachFuncCB = foreachFunc ? &_foreachFuncCallback : null;
    auto _foreachFunc = foreachFunc ? cast(void*)&(foreachFunc) : null;
    panel_workbench_foreach_workspace(cast(PanelWorkbench*)this._cPtr, _foreachFuncCB, _foreachFunc);
  }

  /** */
  string getId()
  {
    const(char)* _cretval;
    _cretval = panel_workbench_get_id(cast(PanelWorkbench*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  void removeWorkspace(panel.workspace.Workspace workspace)
  {
    panel_workbench_remove_workspace(cast(PanelWorkbench*)this._cPtr, workspace ? cast(PanelWorkspace*)workspace._cPtr(No.Dup) : null);
  }

  /** */
  void setId(string id)
  {
    const(char)* _id = id.toCString(No.Alloc);
    panel_workbench_set_id(cast(PanelWorkbench*)this._cPtr, _id);
  }

  /**
      Connect to `Activate` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(panel.workbench.Workbench workbench))
  
          `workbench` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.workbench.Workbench)))
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
    return connectSignalClosure("activate", closure, after);
  }
}
