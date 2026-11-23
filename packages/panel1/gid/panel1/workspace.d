/// Module for [Workspace] class
module gid.panel1.workspace;

public import gid.core.basictypes;
import gid.adw1.application_window;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.action_map;
import gid.gio2.action_map_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.application_window;
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
import gid.gtk4.types;
import gid.gtk4.widget;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.inhibitor;
import gid.panel1.types;
import gid.panel1.workbench;

/** */
class Workspace : gid.adw1.application_window.ApplicationWindow
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
    return cast(void function())panel_workspace_get_type != &gidSymbolNotFound ? panel_workspace_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelWorkspace";
  }

  /** Returns `this`, for use in `with` statements. */
  override Workspace self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.workspace.Workspace]
      Returns: New builder object
  */
  static WorkspaceGidBuilder builder() nothrow
  {
    return new WorkspaceGidBuilder;
  }

  /**
      Get `id` property.
      Returns: The "id" of the workspace.
        
        This is generally used by applications to help destinguish between
        types of workspaces, particularly when saving session state.
  */
  @property string id() nothrow
  {
    return getId();
  }

  /**
      Set `id` property.
      Params:
        propval = The "id" of the workspace.
          
          This is generally used by applications to help destinguish between
          types of workspaces, particularly when saving session state.
  */
  @property void id(string propval) nothrow
  {
    setId(propval);
  }

  /**
      Finds the workspace that contains widget.
  
      Params:
        widget = a #GtkWidget
      Returns: a #PanelWorkspace or null
  */
  static gid.panel1.workspace.Workspace findFromWidget(gid.gtk4.widget.Widget widget) nothrow
  {
    PanelWorkspace* _cretval;
    _cretval = panel_workspace_find_from_widget(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.workspace.Workspace)(cast(PanelWorkspace*)_cretval, No.Take);
    return _retval;
  }

  /** */
  override void actionSetEnabled(string actionName, bool enabled) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    panel_workspace_action_set_enabled(cast(PanelWorkspace*)this._cPtr, _actionName, enabled);
  }

  alias getId = gid.gtk4.application_window.ApplicationWindow.getId;

  /** */
  string getId() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_workspace_get_id(cast(PanelWorkspace*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the #PanelWorkbench self is a part of.
      Returns: a #PanelWorkbench, or null
  */
  gid.panel1.workbench.Workbench getWorkbench() nothrow
  {
    PanelWorkbench* _cretval;
    _cretval = panel_workspace_get_workbench(cast(PanelWorkspace*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.workbench.Workbench)(cast(PanelWorkbench*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inhibits one or more particular actions in the session.
      
      When the resulting #PanelInhibitor releases it's last reference
      the inhibitor will be dismissed. Alternatively, you may force the
      release of the inhibit using [gid.panel1.inhibitor.Inhibitor.uninhibit].
  
      Params:
        flags = the inhibit flags
        reason = the reason for the inhibit
      Returns: a #PanelInhibitor or null
  */
  gid.panel1.inhibitor.Inhibitor inhibit(gid.gtk4.types.ApplicationInhibitFlags flags, string reason) nothrow
  {
    PanelInhibitor* _cretval;
    const(char)* _reason = reason.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_workspace_inhibit(cast(PanelWorkspace*)this._cPtr, flags, _reason);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.inhibitor.Inhibitor)(cast(PanelInhibitor*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void setId(string id) nothrow
  {
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    panel_workspace_set_id(cast(PanelWorkspace*)this._cPtr, _id);
  }
}

/// Fluent builder implementation template for [gid.panel1.workspace.Workspace]
class WorkspaceGidBuilderImpl(T) : gid.adw1.application_window.ApplicationWindowGidBuilderImpl!T
{


  /**
      Set `id` property.
      Params:
        propval = The "id" of the workspace.
          
          This is generally used by applications to help destinguish between
          types of workspaces, particularly when saving session state.
      Returns: Builder instance for fluent chaining
  */
  T id(string propval) nothrow
  {
    return setProperty("id", propval);
  }
}

/// Fluent builder for [gid.panel1.workspace.Workspace]
final class WorkspaceGidBuilder : WorkspaceGidBuilderImpl!WorkspaceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Workspace build() nothrow
  {
    return new Workspace(cast(void*)createGObject(Workspace._getGType), Yes.Take);
  }
}
