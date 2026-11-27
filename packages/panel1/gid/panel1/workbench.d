/// Module for [Workbench] class
module gid.panel1.workbench;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
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
@gidGir("Workbench", "WorkbenchClass")
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
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      PanelWorkbench* _cretval;
      _cretval = panel_workbench_new();
      this(_cretval, Yes.Take);
    }
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
  protected void vfuncActivate()
  {
    auto _klass = cast(PanelWorkbenchClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(PanelWorkbench*)this._cPtr);
  }

  /** */
  protected void vfuncUnloadAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(PanelWorkbenchClass*)_vfuncClass;
    if (!_klass.unloadAsync)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.unloadAsync(cast(PanelWorkbench*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  protected bool vfuncUnloadFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(PanelWorkbenchClass*)_vfuncClass;
    if (!_klass.unloadFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.unloadFinish(cast(PanelWorkbench*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
      gidAttachThread();
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
      gidAttachThread();
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Workbench
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.panel1.workbench.Workbench), T.stringof ~ " is not derived from gid.panel1.workbench.Workbench");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.panel1.workbench.Workbench))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnloadAsync", true)[0]) == gid.panel1.workbench.Workbench))
      static assert(0, "Overriding gid.panel1.workbench.Workbench.vfuncUnloadAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnloadFinish", true)[0]) == gid.panel1.workbench.Workbench))
      _installVfunc(klass, "unload_finish");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(PanelWorkbenchClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(PanelWorkbench* self) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.panel1.workbench.Workbench)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelWorkbenchClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(self);
            return;
          }

          try
          {
            _obj.vfuncActivate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.panel1.workbench.Workbench.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "unload_finish":
      {
        static extern(C) gboolean _vfuncUnloadFinishTramp(PanelWorkbench* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.panel1.workbench.Workbench)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelWorkbenchClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.unloadFinish)
              return (cast(typeof(&_vfuncUnloadFinishTramp))_klass.unloadFinish)(self, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnloadFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unloadFinish = cast(typeof(_klass.unloadFinish))&_vfuncUnloadFinishTramp;
        break;
      }
      default:
      break;
    }
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
