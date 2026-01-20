/// Module for [Workspace] class
module panel.workspace;

import adw.application_window;
import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.action_map;
import gio.action_map_mixin;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.application_window;
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
import gtk.types;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.inhibitor;
import panel.types;
import panel.workbench;

/** */
class Workspace : adw.application_window.ApplicationWindow
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
    return cast(void function())panel_workspace_get_type != &gidSymbolNotFound ? panel_workspace_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Workspace self()
  {
    return this;
  }

  /**
      Get `id` property.
      Returns: The "id" of the workspace.
        
        This is generally used by applications to help destinguish between
        types of workspaces, particularly when saving session state.
  */
  @property string id()
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
  @property void id(string propval)
  {
    return setId(propval);
  }

  /**
      Finds the workspace that contains widget.
  
      Params:
        widget = a #GtkWidget
      Returns: a #PanelWorkspace or null
  */
  static panel.workspace.Workspace findFromWidget(gtk.widget.Widget widget)
  {
    PanelWorkspace* _cretval;
    _cretval = panel_workspace_find_from_widget(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.workspace.Workspace)(cast(PanelWorkspace*)_cretval, No.Take);
    return _retval;
  }

  /** */
  override void actionSetEnabled(string actionName, bool enabled)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    panel_workspace_action_set_enabled(cast(PanelWorkspace*)this._cPtr, _actionName, enabled);
  }

  alias getId = gtk.application_window.ApplicationWindow.getId;

  /** */
  string getId()
  {
    const(char)* _cretval;
    _cretval = panel_workspace_get_id(cast(PanelWorkspace*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #PanelWorkbench self is a part of.
      Returns: a #PanelWorkbench, or null
  */
  panel.workbench.Workbench getWorkbench()
  {
    PanelWorkbench* _cretval;
    _cretval = panel_workspace_get_workbench(cast(PanelWorkspace*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.workbench.Workbench)(cast(PanelWorkbench*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inhibits one or more particular actions in the session.
      
      When the resulting #PanelInhibitor releases it's last reference
      the inhibitor will be dismissed. Alternatively, you may force the
      release of the inhibit using [panel.inhibitor.Inhibitor.uninhibit].
  
      Params:
        flags = the inhibit flags
        reason = the reason for the inhibit
      Returns: a #PanelInhibitor or null
  */
  panel.inhibitor.Inhibitor inhibit(gtk.types.ApplicationInhibitFlags flags, string reason)
  {
    PanelInhibitor* _cretval;
    const(char)* _reason = reason.toCString(No.Alloc);
    _cretval = panel_workspace_inhibit(cast(PanelWorkspace*)this._cPtr, flags, _reason);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.inhibitor.Inhibitor)(cast(PanelInhibitor*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void setId(string id)
  {
    const(char)* _id = id.toCString(No.Alloc);
    panel_workspace_set_id(cast(PanelWorkspace*)this._cPtr, _id);
  }
}
