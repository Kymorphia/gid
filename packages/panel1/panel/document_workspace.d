/// Module for [DocumentWorkspace] class
module panel.document_workspace;

import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.action_map;
import gio.action_map_mixin;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.dock;
import panel.frame;
import panel.grid;
import panel.position;
import panel.statusbar;
import panel.types;
import panel.widget;
import panel.workspace;

/** */
class DocumentWorkspace : panel.workspace.Workspace
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
    return cast(void function())panel_document_workspace_get_type != &gidSymbolNotFound ? panel_document_workspace_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DocumentWorkspace self()
  {
    return this;
  }

  /** */
  @property panel.dock.Dock dock()
  {
    return getDock();
  }

  /** */
  @property panel.grid.Grid grid()
  {
    return getGrid();
  }

  /** */
  @property panel.statusbar.Statusbar statusbar()
  {
    return getStatusbar();
  }

  /**
      Creates a new #PanelDocumentWorkspace.
      Returns: a #PanelDocumentWorkspace
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_document_workspace_new();
    this(_cretval, Yes.Take);
  }

  /**
      Requests the workspace add widget to the dock at position.
  
      Params:
        widget = a #PanelWidget
        position = a #PanelPosition or null
      Returns: true if widget was added; otherwise false and widget
          will have [gobject.object.ObjectWrap.refSink] called and unref'd from an idle
          callback.
  */
  bool addWidget(panel.widget.Widget widget, panel.position.Position position = null)
  {
    bool _retval;
    _retval = cast(bool)panel_document_workspace_add_widget(cast(PanelDocumentWorkspace*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null, position ? cast(PanelPosition*)position._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the #PanelDock for the workspace.
      Returns: a #PanelDock
  */
  panel.dock.Dock getDock()
  {
    PanelDock* _cretval;
    _cretval = panel_document_workspace_get_dock(cast(PanelDocumentWorkspace*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.dock.Dock)(cast(PanelDock*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the document grid for the workspace.
      Returns: a #PanelGrid
  */
  panel.grid.Grid getGrid()
  {
    PanelGrid* _cretval;
    _cretval = panel_document_workspace_get_grid(cast(PanelDocumentWorkspace*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.grid.Grid)(cast(PanelGrid*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the statusbar for the workspace.
      Returns: a #PanelStatusbar
  */
  panel.statusbar.Statusbar getStatusbar()
  {
    PanelStatusbar* _cretval;
    _cretval = panel_document_workspace_get_statusbar(cast(PanelDocumentWorkspace*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.statusbar.Statusbar)(cast(PanelStatusbar*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the titlebar for the workspace.
      Returns: a #GtkWidget or null
  */
  override gtk.widget.Widget getTitlebar()
  {
    GtkWidget* _cretval;
    _cretval = panel_document_workspace_get_titlebar(cast(PanelDocumentWorkspace*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  override void setTitlebar(gtk.widget.Widget titlebar)
  {
    panel_document_workspace_set_titlebar(cast(PanelDocumentWorkspace*)this._cPtr, titlebar ? cast(GtkWidget*)titlebar._cPtr(No.Dup) : null);
  }

  /**
      Connect to `AddWidget` signal.
  
      This signal is used to add a #PanelWidget to the document workspace,
      generally in the document grid.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(panel.widget.Widget widget, panel.position.Position position, panel.document_workspace.DocumentWorkspace documentWorkspace))
  
          `widget` a #PanelWidget (optional)
  
          `position` a #PanelPosition (optional)
  
          `documentWorkspace` the instance the signal is connected to (optional)
  
          `Returns` true if the widget was added and no more signal handlers
             will be notified.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAddWidget(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.position.Position)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : panel.document_workspace.DocumentWorkspace)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
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
  
          $(D panel.frame.Frame callback(panel.position.Position position, panel.document_workspace.DocumentWorkspace documentWorkspace))
  
          `position` the position of the frame (optional)
  
          `documentWorkspace` the instance the signal is connected to (optional)
  
          `Returns` a #PanelFrame
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreateFrame(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : panel.frame.Frame)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.position.Position)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.document_workspace.DocumentWorkspace)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(panel.frame.Frame)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-frame", closure, after);
  }
}
