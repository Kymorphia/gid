/// Module for [DocumentWorkspace] class
module gid.panel1.document_workspace;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.action_map;
import gid.gio2.action_map_mixin;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.widget;
import gid.gtk4.window;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.dock;
import gid.panel1.frame;
import gid.panel1.grid;
import gid.panel1.position;
import gid.panel1.statusbar;
import gid.panel1.types;
import gid.panel1.widget;
import gid.panel1.workspace;

/** */
@gidGir("DocumentWorkspace", "DocumentWorkspaceClass")
class DocumentWorkspace : gid.panel1.workspace.Workspace
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
    return cast(void function())panel_document_workspace_get_type != &gidSymbolNotFound ? panel_document_workspace_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelDocumentWorkspace";
  }

  /** Returns `this`, for use in `with` statements. */
  override DocumentWorkspace self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.document_workspace.DocumentWorkspace]
      Returns: New builder object
  */
  static DocumentWorkspaceGidBuilder builder() nothrow
  {
    return new DocumentWorkspaceGidBuilder;
  }

  /** */
  @property gid.panel1.dock.Dock dock() nothrow
  {
    return getDock();
  }

  /** */
  @property gid.panel1.grid.Grid grid() nothrow
  {
    return getGrid();
  }

  /** */
  @property gid.panel1.statusbar.Statusbar statusbar() nothrow
  {
    return getStatusbar();
  }

  /**
      Creates a new #PanelDocumentWorkspace.
      Returns: a #PanelDocumentWorkspace
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = panel_document_workspace_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Requests the workspace add widget to the dock at position.
  
      Params:
        widget = a #PanelWidget
        position = a #PanelPosition or null
      Returns: true if widget was added; otherwise false and widget
          will have [gid.gobject2.object.ObjectWrap.refSink] called and unref'd from an idle
          callback.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAddWidget` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncAddWidget(gid.panel1.widget.Widget widget, gid.panel1.position.Position position = null)
  {
    auto _klass = cast(PanelDocumentWorkspaceClass*)_vfuncClass;
    if (!_klass.addWidget)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.addWidget(cast(PanelDocumentWorkspace*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null, position ? cast(PanelPosition*)position._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Requests the workspace add widget to the dock at position.
  
      Params:
        widget = a #PanelWidget
        position = a #PanelPosition or null
      Returns: true if widget was added; otherwise false and widget
          will have [gid.gobject2.object.ObjectWrap.refSink] called and unref'd from an idle
          callback.
  */
  bool addWidget(gid.panel1.widget.Widget widget, gid.panel1.position.Position position = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_document_workspace_add_widget(cast(PanelDocumentWorkspace*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null, position ? cast(PanelPosition*)position._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the #PanelDock for the workspace.
      Returns: a #PanelDock
  */
  gid.panel1.dock.Dock getDock() nothrow
  {
    PanelDock* _cretval;
    _cretval = panel_document_workspace_get_dock(cast(PanelDocumentWorkspace*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.dock.Dock)(cast(PanelDock*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the document grid for the workspace.
      Returns: a #PanelGrid
  */
  gid.panel1.grid.Grid getGrid() nothrow
  {
    PanelGrid* _cretval;
    _cretval = panel_document_workspace_get_grid(cast(PanelDocumentWorkspace*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.grid.Grid)(cast(PanelGrid*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the statusbar for the workspace.
      Returns: a #PanelStatusbar
  */
  gid.panel1.statusbar.Statusbar getStatusbar() nothrow
  {
    PanelStatusbar* _cretval;
    _cretval = panel_document_workspace_get_statusbar(cast(PanelDocumentWorkspace*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.statusbar.Statusbar)(cast(PanelStatusbar*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the titlebar for the workspace.
      Returns: a #GtkWidget or null
  */
  override gid.gtk4.widget.Widget getTitlebar() nothrow
  {
    GtkWidget* _cretval;
    _cretval = panel_document_workspace_get_titlebar(cast(PanelDocumentWorkspace*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  override void setTitlebar(gid.gtk4.widget.Widget titlebar) nothrow
  {
    panel_document_workspace_set_titlebar(cast(PanelDocumentWorkspace*)this._cPtr, titlebar ? cast(GtkWidget*)titlebar._cPtr(No.Dup) : null);
  }

  /**
      Connect to `AddWidget` signal.
  
      This signal is used to add a #PanelWidget to the document workspace,
        generally in the document grid.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.panel1.widget.Widget widget, gid.panel1.position.Position position, gid.panel1.document_workspace.DocumentWorkspace documentWorkspace)`
  
          `widget` a #PanelWidget (optional)
  
          `position` a #PanelPosition (optional)
  
          `documentWorkspace` the instance the signal is connected to (optional)
  
          `Returns` true if the widget was added and no more signal handlers
               will be notified.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAddWidget(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.panel1.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.panel1.position.Position)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.panel1.document_workspace.DocumentWorkspace)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.document_workspace.DocumentWorkspace.addWidget");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("add-widget", closure, after);
  }

  /**
      Connect to `CreateFrame` signal.
  
      Creates a new #PanelFrame to be added to the document grid.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.panel1.frame.Frame callback(gid.panel1.position.Position position, gid.panel1.document_workspace.DocumentWorkspace documentWorkspace)`
  
          `position` the position of the frame (optional)
  
          `documentWorkspace` the instance the signal is connected to (optional)
  
          `Returns` a #PanelFrame
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCreateFrame(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T : gid.panel1.frame.Frame)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.panel1.position.Position)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.panel1.document_workspace.DocumentWorkspace)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.panel1.frame.Frame _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.document_workspace.DocumentWorkspace.createFrame");
      }

      setVal!(gid.panel1.frame.Frame)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-frame", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from DocumentWorkspace
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.panel1.document_workspace.DocumentWorkspace), T.stringof ~ " is not derived from gid.panel1.document_workspace.DocumentWorkspace");

    gid.gtk4.window.Window._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAddWidget", true)[0]) == gid.panel1.document_workspace.DocumentWorkspace))
      _installVfunc(klass, "add_widget");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(PanelDocumentWorkspaceClass*)klass;

    switch (vfunc)
    {
      case "add_widget":
      {
        static extern(C) gboolean _vfuncAddWidgetTramp(PanelDocumentWorkspace* self, PanelWidget* widget, PanelPosition* position) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.panel1.document_workspace.DocumentWorkspace)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelDocumentWorkspaceClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.addWidget)
              return (cast(typeof(&_vfuncAddWidgetTramp))_klass.addWidget)(self, widget, position);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncAddWidget(gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.widget.Widget)(cast(void*)widget, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.position.Position)(cast(void*)position, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.panel1.document_workspace.DocumentWorkspace.vfuncAddWidget");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.addWidget = cast(typeof(_klass.addWidget))&_vfuncAddWidgetTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.panel1.document_workspace.DocumentWorkspace]
class DocumentWorkspaceGidBuilderImpl(T) : gid.panel1.workspace.WorkspaceGidBuilderImpl!T
{

}

/// Fluent builder for [gid.panel1.document_workspace.DocumentWorkspace]
final class DocumentWorkspaceGidBuilder : DocumentWorkspaceGidBuilderImpl!DocumentWorkspaceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DocumentWorkspace build() nothrow
  {
    return new DocumentWorkspace(cast(void*)createGObject(DocumentWorkspace._getGType), Yes.Take);
  }
}
