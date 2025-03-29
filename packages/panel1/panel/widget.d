module panel.widget;

import gid.gid;
import gio.action_group;
import gio.icon;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.position;
import panel.save_delegate;
import panel.types;

/**
    PanelWidget is the base widget class for widgets added to a
    #PanelFrame. It can be use as-is or you can subclass it.
*/
class Widget : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_widget_get_type != &gidSymbolNotFound ? panel_widget_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Widget self()
  {
    return this;
  }

  /**
      Create a new #PanelWidget.
      Returns: a newly created #PanelWidget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_widget_new();
    this(_cretval, No.Take);
  }

  /** */
  override void actionSetEnabled(string actionName, bool enabled)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    panel_widget_action_set_enabled(cast(PanelWidget*)cPtr, _actionName, enabled);
  }

  /** */
  void close()
  {
    panel_widget_close(cast(PanelWidget*)cPtr);
  }

  /** */
  bool focusDefault()
  {
    bool _retval;
    _retval = panel_widget_focus_default(cast(PanelWidget*)cPtr);
    return _retval;
  }

  /**
      Closes the widget without any save dialogs.
  */
  void forceClose()
  {
    panel_widget_force_close(cast(PanelWidget*)cPtr);
  }

  /** */
  bool getBusy()
  {
    bool _retval;
    _retval = panel_widget_get_busy(cast(PanelWidget*)cPtr);
    return _retval;
  }

  /** */
  bool getCanMaximize()
  {
    bool _retval;
    _retval = panel_widget_get_can_maximize(cast(PanelWidget*)cPtr);
    return _retval;
  }

  /**
      Gets the child widget of the panel.
      Returns: a #GtkWidget or null
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = panel_widget_get_child(cast(PanelWidget*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Discovers the widget that should be focused as the default widget
      for the #PanelWidget.
      
      For example, if you want to focus a text editor by default, you might
      return the #GtkTextView inside your widgetry.
      Returns: the default widget to focus within
          the #PanelWidget.
  */
  gtk.widget.Widget getDefaultFocus()
  {
    GtkWidget* _cretval;
    _cretval = panel_widget_get_default_focus(cast(PanelWidget*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a #GIcon for the widget.
      Returns: a #GIcon or null
  */
  gio.icon.Icon getIcon()
  {
    GIcon* _cretval;
    _cretval = panel_widget_get_icon(cast(PanelWidget*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name for the widget.
      Returns: the icon name or null
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = panel_widget_get_icon_name(cast(PanelWidget*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the id of the panel widget.
      Returns: The id of the panel widget.
  */
  string getId()
  {
    const(char)* _cretval;
    _cretval = panel_widget_get_id(cast(PanelWidget*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getKind()
  {
    const(char)* _cretval;
    _cretval = panel_widget_get_kind(cast(PanelWidget*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #GMenuModel for the widget.
      
      #PanelFrameHeader may use this model to display additional options
      for the page to the user via menus.
      Returns: a #GMenuModel
  */
  gio.menu_model.MenuModel getMenuModel()
  {
    GMenuModel* _cretval;
    _cretval = panel_widget_get_menu_model(cast(PanelWidget*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the modified status of a panel widget
      Returns: the modified status of the panel widget.
  */
  bool getModified()
  {
    bool _retval;
    _retval = panel_widget_get_modified(cast(PanelWidget*)cPtr);
    return _retval;
  }

  /** */
  bool getNeedsAttention()
  {
    bool _retval;
    _retval = panel_widget_get_needs_attention(cast(PanelWidget*)cPtr);
    return _retval;
  }

  /**
      Gets teh position of the widget within the dock.
      Returns: a #PanelPosition or null if the
          widget isn't within a #PanelFrame.
  */
  panel.position.Position getPosition()
  {
    PanelPosition* _cretval;
    _cretval = panel_widget_get_position(cast(PanelWidget*)cPtr);
    auto _retval = ObjectG.getDObject!(panel.position.Position)(cast(PanelPosition*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool getReorderable()
  {
    bool _retval;
    _retval = panel_widget_get_reorderable(cast(PanelWidget*)cPtr);
    return _retval;
  }

  /**
      Gets the #PanelWidget:save-delegate property.
      
      The save delegate may be used to perform save operations on the
      content within the widget.
      
      Document editors might use this to save the file to disk.
      Returns: a #PanelSaveDelegate or null
  */
  panel.save_delegate.SaveDelegate getSaveDelegate()
  {
    PanelSaveDelegate* _cretval;
    _cretval = panel_widget_get_save_delegate(cast(PanelWidget*)cPtr);
    auto _retval = ObjectG.getDObject!(panel.save_delegate.SaveDelegate)(cast(PanelSaveDelegate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the title for the widget.
      Returns: the title or null
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = panel_widget_get_title(cast(PanelWidget*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the tooltip for the widget.
      Returns: the tooltip or null
  */
  string getTooltip()
  {
    const(char)* _cretval;
    _cretval = panel_widget_get_tooltip(cast(PanelWidget*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  override void insertActionGroup(string prefix, gio.action_group.ActionGroup group)
  {
    const(char)* _prefix = prefix.toCString(No.Alloc);
    panel_widget_insert_action_group(cast(PanelWidget*)cPtr, _prefix, group ? cast(GActionGroup*)(cast(ObjectG)group).cPtr(No.Dup) : null);
  }

  /** */
  void markBusy()
  {
    panel_widget_mark_busy(cast(PanelWidget*)cPtr);
  }

  /** */
  void maximize()
  {
    panel_widget_maximize(cast(PanelWidget*)cPtr);
  }

  /** */
  void raise()
  {
    panel_widget_raise(cast(PanelWidget*)cPtr);
  }

  /** */
  void setCanMaximize(bool canMaximize)
  {
    panel_widget_set_can_maximize(cast(PanelWidget*)cPtr, canMaximize);
  }

  /**
      Sets the child widget of the panel.
  
      Params:
        child = a #GtkWidget or null
  */
  void setChild(gtk.widget.Widget child = null)
  {
    panel_widget_set_child(cast(PanelWidget*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Sets a #GIcon for the widget.
  
      Params:
        icon = a #GIcon or null
  */
  void setIcon(gio.icon.Icon icon = null)
  {
    panel_widget_set_icon(cast(PanelWidget*)cPtr, icon ? cast(GIcon*)(cast(ObjectG)icon).cPtr(No.Dup) : null);
  }

  /**
      Sets the icon name for the widget.
  
      Params:
        iconName = the icon name or null
  */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    panel_widget_set_icon_name(cast(PanelWidget*)cPtr, _iconName);
  }

  /**
      Sets the id of the panel widget.
  
      Params:
        id = the id to set for the panel widget.
  */
  void setId(string id)
  {
    const(char)* _id = id.toCString(No.Alloc);
    panel_widget_set_id(cast(PanelWidget*)cPtr, _id);
  }

  /**
      Sets the kind of the widget.
  
      Params:
        kind = the kind of this widget
  */
  void setKind(string kind = null)
  {
    const(char)* _kind = kind.toCString(No.Alloc);
    panel_widget_set_kind(cast(PanelWidget*)cPtr, _kind);
  }

  /**
      Sets the #GMenuModel for the widget.
      
      #PanelFrameHeader may use this model to display additional options
      for the page to the user via menus.
  
      Params:
        menuModel = a #GMenuModel
  */
  void setMenuModel(gio.menu_model.MenuModel menuModel = null)
  {
    panel_widget_set_menu_model(cast(PanelWidget*)cPtr, menuModel ? cast(GMenuModel*)menuModel.cPtr(No.Dup) : null);
  }

  /**
      Sets the modified status of a panel widget.
  
      Params:
        modified = the modified status
  */
  void setModified(bool modified)
  {
    panel_widget_set_modified(cast(PanelWidget*)cPtr, modified);
  }

  /** */
  void setNeedsAttention(bool needsAttention)
  {
    panel_widget_set_needs_attention(cast(PanelWidget*)cPtr, needsAttention);
  }

  /** */
  void setReorderable(bool reorderable)
  {
    panel_widget_set_reorderable(cast(PanelWidget*)cPtr, reorderable);
  }

  /**
      Sets the #PanelWidget:save-delegate property.
      
      The save delegate may be used to perform save operations on the
      content within the widget.
      
      Document editors might use this to save the file to disk.
  
      Params:
        saveDelegate = a #PanelSaveDelegate or null
  */
  void setSaveDelegate(panel.save_delegate.SaveDelegate saveDelegate = null)
  {
    panel_widget_set_save_delegate(cast(PanelWidget*)cPtr, saveDelegate ? cast(PanelSaveDelegate*)saveDelegate.cPtr(No.Dup) : null);
  }

  /**
      Sets the title for the widget.
  
      Params:
        title = the title or null
  */
  void setTitle(string title = null)
  {
    const(char)* _title = title.toCString(No.Alloc);
    panel_widget_set_title(cast(PanelWidget*)cPtr, _title);
  }

  /**
      Sets the tooltip for the widget to be displayed in tabs.
  
      Params:
        tooltip = the tooltip or null
  */
  void setTooltip(string tooltip = null)
  {
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    panel_widget_set_tooltip(cast(PanelWidget*)cPtr, _tooltip);
  }

  /** */
  void unmarkBusy()
  {
    panel_widget_unmark_busy(cast(PanelWidget*)cPtr);
  }

  /** */
  void unmaximize()
  {
    panel_widget_unmaximize(cast(PanelWidget*)cPtr);
  }

  /**
      Connect to `GetDefaultFocus` signal.
  
      Gets the default widget to focus within the #PanelWidget. The first
      handler for this signal is expected to return a widget, or null if
      there is nothing to focus.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gtk.widget.Widget callback(panel.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` a #GtkWidget within #PanelWidget
            or null.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGetDefaultFocus(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gtk.widget.Widget)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!gtk.widget.Widget(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("get-default-focus", closure, after);
  }

  /**
      Connect to `Presented` signal.
  
      The "presented" signal is emitted when the widget is brought
      to the front of a frame.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(panel.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPresented(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.widget.Widget)))
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
    return connectSignalClosure("presented", closure, after);
  }
}
