/// Module for [Workbench] class
module gid.panel1.workbench;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.widget;
import gid.gtk4.window_group;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.types;
import gid.panel1.workspace;

/** */
class Workbench : gid.gtk4.window_group.WindowGroup
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())panel_workbench_get_type != &gidSymbolNotFound ? panel_workbench_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelWorkbench";
  }

  /** Returns `this`, for use in `with` statements. */
  override Workbench self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.workbench.Workbench]
      Returns: New builder object
  */
  static WorkbenchGidBuilder builder() nothrow
  {
    return new WorkbenchGidBuilder;
  }

  /**
      Get `id` property.
      Returns: The "id" of the workbench.
        
        This is generally used by applications to help destinguish between
        projects, so that the project-id matches the workbench-id.
  */
  @property string id() nothrow
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
  @property void id(string propval) nothrow
  {
    setId(propval);
  }

  /** */
  this() nothrow
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
  static gid.panel1.workbench.Workbench findFromWidget(gid.gtk4.widget.Widget widget) nothrow
  {
    PanelWorkbench* _cretval;
    _cretval = panel_workbench_find_from_widget(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.workbench.Workbench)(cast(PanelWorkbench*)_cretval, No.Take);
    return _retval;
  }

  /** */
  void actionSetEnabled(string actionName, bool enabled) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    panel_workbench_action_set_enabled(cast(PanelWorkbench*)this._cPtr, _actionName, enabled);
  }

  /** */
  void activate() nothrow
  {
    panel_workbench_activate(cast(PanelWorkbench*)this._cPtr);
  }

  /** */
  void addWorkspace(gid.panel1.workspace.Workspace workspace) nothrow
  {
    panel_workbench_add_workspace(cast(PanelWorkbench*)this._cPtr, workspace ? cast(PanelWorkspace*)workspace._cPtr(No.Dup) : null);
  }

  /**
      Locates a workspace in self with a type matching type.
  
      Params:
        workspaceType = 
      Returns: a #PanelWorkspace or null
  */
  gid.panel1.workspace.Workspace findWorkspaceTyped(gid.gobject2.types.GType workspaceType) nothrow
  {
    PanelWorkspace* _cretval;
    _cretval = panel_workbench_find_workspace_typed(cast(PanelWorkbench*)this._cPtr, workspaceType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.workspace.Workspace)(cast(PanelWorkspace*)_cretval, No.Take);
    return _retval;
  }

  /** */
  void focusWorkspace(gid.panel1.workspace.Workspace workspace) nothrow
  {
    panel_workbench_focus_workspace(cast(PanelWorkbench*)this._cPtr, workspace ? cast(PanelWorkspace*)workspace._cPtr(No.Dup) : null);
  }

  /**
      Calls foreach_func for each workspace in the workbench.
  
      Params:
        foreachFunc = a function to call for each workspace
  */
  void foreachWorkspace(gid.panel1.types.WorkspaceForeach foreachFunc) nothrow
  {
    extern(C) void _foreachFuncCallback(PanelWorkspace* workspace, void* userData) nothrow
    {
      auto _dlg = cast(gid.panel1.types.WorkspaceForeach*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.workspace.Workspace)(cast(void*)workspace, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.types.WorkspaceForeach");
      }
    }
    auto _foreachFuncCB = foreachFunc ? &_foreachFuncCallback : null;
    auto _foreachFunc = foreachFunc ? cast(void*)&(foreachFunc) : null;
    panel_workbench_foreach_workspace(cast(PanelWorkbench*)this._cPtr, _foreachFuncCB, _foreachFunc);
  }

  /** */
  string getId() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_workbench_get_id(cast(PanelWorkbench*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  void removeWorkspace(gid.panel1.workspace.Workspace workspace) nothrow
  {
    panel_workbench_remove_workspace(cast(PanelWorkbench*)this._cPtr, workspace ? cast(PanelWorkspace*)workspace._cPtr(No.Dup) : null);
  }

  /** */
  void setId(string id) nothrow
  {
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    panel_workbench_set_id(cast(PanelWorkbench*)this._cPtr, _id);
  }

  /**
      Connect to `Activate` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.panel1.workbench.Workbench workbench)`
  
          `workbench` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.panel1.workbench.Workbench)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.workbench.Workbench.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}

/// Fluent builder implementation template for [gid.panel1.workbench.Workbench]
class WorkbenchGidBuilderImpl(T) : gid.gtk4.window_group.WindowGroupGidBuilderImpl!T
{

  /**
      Set `id` property.
      Params:
        propval = The "id" of the workbench.
          
          This is generally used by applications to help destinguish between
          projects, so that the project-id matches the workbench-id.
      Returns: Builder instance for fluent chaining
  */
  T id(string propval) nothrow
  {
    return setProperty("id", propval);
  }
}

/// Fluent builder for [gid.panel1.workbench.Workbench]
final class WorkbenchGidBuilder : WorkbenchGidBuilderImpl!WorkbenchGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Workbench build() nothrow
  {
    return new Workbench(cast(void*)createGObject(Workbench._getGType), Yes.Take);
  }
}
