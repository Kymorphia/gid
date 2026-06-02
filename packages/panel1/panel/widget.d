/// Module for [Widget] class
module panel.widget;

public import gid.basictypes;
import gid.gid;
import gio.action_group;
import gio.icon;
import gio.menu_model;
import gobject.dclosure;
import gobject.gid_builder;
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

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_widget_get_type != &gidSymbolNotFound ? panel_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Widget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [panel.widget.Widget]
      Returns: New builder object
  */
  static WidgetGidBuilder builder() nothrow
  {
    return new WidgetGidBuilder;
  }

  /** */
  @property bool busy() nothrow
  {
    return getBusy();
  }

  /** */
  @property bool canMaximize() nothrow
  {
    return getCanMaximize();
  }

  /** */
  @property void canMaximize(bool propval) nothrow
  {
    setCanMaximize(propval);
  }

  /**
      Get `child` property.
      Returns: The child inside this widget.
  */
  @property gtk.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child inside this widget.
  */
  @property void child(gtk.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `icon` property.
      Returns: The icon for this widget.
  */
  @property gio.icon.Icon icon() nothrow
  {
    return getIcon();
  }

  /**
      Set `icon` property.
      Params:
        propval = The icon for this widget.
  */
  @property void icon(gio.icon.Icon propval) nothrow
  {
    setIcon(propval);
  }

  /**
      Get `iconName` property.
      Returns: The icon name for this widget.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for this widget.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /** */
  @property string id() nothrow
  {
    return getId();
  }

  /** */
  @property void id(string propval) nothrow
  {
    setId(propval);
  }

  /** */
  @property string kind() nothrow
  {
    return getKind();
  }

  /** */
  @property void kind(string propval) nothrow
  {
    setKind(propval);
  }

  /**
      Get `menuModel` property.
      Returns: A menu model to display additional options for the page to the user via
        menus.
  */
  @property gio.menu_model.MenuModel menuModel() nothrow
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = A menu model to display additional options for the page to the user via
          menus.
  */
  @property void menuModel(gio.menu_model.MenuModel propval) nothrow
  {
    setMenuModel(propval);
  }

  /** */
  @property bool modified() nothrow
  {
    return getModified();
  }

  /** */
  @property void modified(bool propval) nothrow
  {
    setModified(propval);
  }

  /** */
  @property bool needsAttention() nothrow
  {
    return getNeedsAttention();
  }

  /** */
  @property void needsAttention(bool propval) nothrow
  {
    setNeedsAttention(propval);
  }

  /** */
  @property bool reorderable() nothrow
  {
    return getReorderable();
  }

  /** */
  @property void reorderable(bool propval) nothrow
  {
    setReorderable(propval);
  }

  /**
      Get `saveDelegate` property.
      Returns: The save delegate attached to this widget.
  */
  @property panel.save_delegate.SaveDelegate saveDelegate() nothrow
  {
    return getSaveDelegate();
  }

  /**
      Set `saveDelegate` property.
      Params:
        propval = The save delegate attached to this widget.
  */
  @property void saveDelegate(panel.save_delegate.SaveDelegate propval) nothrow
  {
    setSaveDelegate(propval);
  }

  /**
      Get `title` property.
      Returns: The title for this widget.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this widget.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Get `tooltip` property.
      Returns: The tooltip to display in tabs for the widget.
  */
  @property string tooltip() nothrow
  {
    return getTooltip();
  }

  /**
      Set `tooltip` property.
      Params:
        propval = The tooltip to display in tabs for the widget.
  */
  @property void tooltip(string propval) nothrow
  {
    setTooltip(propval);
  }

  /**
      Create a new #PanelWidget.
      Returns: a newly created #PanelWidget
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = panel_widget_new();
    this(_cretval, No.Take);
  }

  /** */
  override void actionSetEnabled(string actionName, bool enabled) nothrow
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    panel_widget_action_set_enabled(cast(PanelWidget*)this._cPtr, _actionName, enabled);
  }

  /** */
  void close() nothrow
  {
    panel_widget_close(cast(PanelWidget*)this._cPtr);
  }

  /** */
  bool focusDefault() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_widget_focus_default(cast(PanelWidget*)this._cPtr);
    return _retval;
  }

  /**
      Closes the widget without any save dialogs.
  */
  void forceClose() nothrow
  {
    panel_widget_force_close(cast(PanelWidget*)this._cPtr);
  }

  /** */
  bool getBusy() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_widget_get_busy(cast(PanelWidget*)this._cPtr);
    return _retval;
  }

  /** */
  bool getCanMaximize() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_widget_get_can_maximize(cast(PanelWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child widget of the panel.
      Returns: a #GtkWidget or null
  */
  gtk.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = panel_widget_get_child(cast(PanelWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
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
  gtk.widget.Widget getDefaultFocus() nothrow
  {
    GtkWidget* _cretval;
    _cretval = panel_widget_get_default_focus(cast(PanelWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a #GIcon for the widget.
      Returns: a #GIcon or null
  */
  gio.icon.Icon getIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = panel_widget_get_icon(cast(PanelWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name for the widget.
      Returns: the icon name or null
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_widget_get_icon_name(cast(PanelWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the id of the panel widget.
      Returns: The id of the panel widget.
  */
  string getId() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_widget_get_id(cast(PanelWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getKind() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_widget_get_kind(cast(PanelWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #GMenuModel for the widget.
      
      #PanelFrameHeader may use this model to display additional options
      for the page to the user via menus.
      Returns: a #GMenuModel
  */
  gio.menu_model.MenuModel getMenuModel() nothrow
  {
    GMenuModel* _cretval;
    _cretval = panel_widget_get_menu_model(cast(PanelWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the modified status of a panel widget
      Returns: the modified status of the panel widget.
  */
  bool getModified() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_widget_get_modified(cast(PanelWidget*)this._cPtr);
    return _retval;
  }

  /** */
  bool getNeedsAttention() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_widget_get_needs_attention(cast(PanelWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets teh position of the widget within the dock.
      Returns: a #PanelPosition or null if the
          widget isn't within a #PanelFrame.
  */
  panel.position.Position getPosition() nothrow
  {
    PanelPosition* _cretval;
    _cretval = panel_widget_get_position(cast(PanelWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.position.Position)(cast(PanelPosition*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool getReorderable() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_widget_get_reorderable(cast(PanelWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #PanelWidget:save-delegate property.
      
      The save delegate may be used to perform save operations on the
      content within the widget.
      
      Document editors might use this to save the file to disk.
      Returns: a #PanelSaveDelegate or null
  */
  panel.save_delegate.SaveDelegate getSaveDelegate() nothrow
  {
    PanelSaveDelegate* _cretval;
    _cretval = panel_widget_get_save_delegate(cast(PanelWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.save_delegate.SaveDelegate)(cast(PanelSaveDelegate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the title for the widget.
      Returns: the title or null
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_widget_get_title(cast(PanelWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the tooltip for the widget.
      Returns: the tooltip or null
  */
  string getTooltip() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_widget_get_tooltip(cast(PanelWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  override void insertActionGroup(string prefix, gio.action_group.ActionGroup group) nothrow
  {
    const(char)* _prefix = prefix.toCString(No.Alloc);
    panel_widget_insert_action_group(cast(PanelWidget*)this._cPtr, _prefix, group ? cast(GActionGroup*)(cast(gobject.object.ObjectWrap)group)._cPtr(No.Dup) : null);
  }

  /** */
  void markBusy() nothrow
  {
    panel_widget_mark_busy(cast(PanelWidget*)this._cPtr);
  }

  /** */
  void maximize() nothrow
  {
    panel_widget_maximize(cast(PanelWidget*)this._cPtr);
  }

  /** */
  void raise() nothrow
  {
    panel_widget_raise(cast(PanelWidget*)this._cPtr);
  }

  /** */
  void setCanMaximize(bool canMaximize) nothrow
  {
    panel_widget_set_can_maximize(cast(PanelWidget*)this._cPtr, canMaximize);
  }

  /**
      Sets the child widget of the panel.
  
      Params:
        child = a #GtkWidget or null
  */
  void setChild(gtk.widget.Widget child = null) nothrow
  {
    panel_widget_set_child(cast(PanelWidget*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets a #GIcon for the widget.
  
      Params:
        icon = a #GIcon or null
  */
  void setIcon(gio.icon.Icon icon = null) nothrow
  {
    panel_widget_set_icon(cast(PanelWidget*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon name for the widget.
  
      Params:
        iconName = the icon name or null
  */
  void setIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    panel_widget_set_icon_name(cast(PanelWidget*)this._cPtr, _iconName);
  }

  /**
      Sets the id of the panel widget.
  
      Params:
        id = the id to set for the panel widget.
  */
  void setId(string id) nothrow
  {
    const(char)* _id = id.toCString(No.Alloc);
    panel_widget_set_id(cast(PanelWidget*)this._cPtr, _id);
  }

  /**
      Sets the kind of the widget.
  
      Params:
        kind = the kind of this widget
  */
  void setKind(string kind = null) nothrow
  {
    const(char)* _kind = kind.toCString(No.Alloc);
    panel_widget_set_kind(cast(PanelWidget*)this._cPtr, _kind);
  }

  /**
      Sets the #GMenuModel for the widget.
      
      #PanelFrameHeader may use this model to display additional options
      for the page to the user via menus.
  
      Params:
        menuModel = a #GMenuModel
  */
  void setMenuModel(gio.menu_model.MenuModel menuModel = null) nothrow
  {
    panel_widget_set_menu_model(cast(PanelWidget*)this._cPtr, menuModel ? cast(GMenuModel*)menuModel._cPtr(No.Dup) : null);
  }

  /**
      Sets the modified status of a panel widget.
  
      Params:
        modified = the modified status
  */
  void setModified(bool modified) nothrow
  {
    panel_widget_set_modified(cast(PanelWidget*)this._cPtr, modified);
  }

  /** */
  void setNeedsAttention(bool needsAttention) nothrow
  {
    panel_widget_set_needs_attention(cast(PanelWidget*)this._cPtr, needsAttention);
  }

  /** */
  void setReorderable(bool reorderable) nothrow
  {
    panel_widget_set_reorderable(cast(PanelWidget*)this._cPtr, reorderable);
  }

  /**
      Sets the #PanelWidget:save-delegate property.
      
      The save delegate may be used to perform save operations on the
      content within the widget.
      
      Document editors might use this to save the file to disk.
  
      Params:
        saveDelegate = a #PanelSaveDelegate or null
  */
  void setSaveDelegate(panel.save_delegate.SaveDelegate saveDelegate = null) nothrow
  {
    panel_widget_set_save_delegate(cast(PanelWidget*)this._cPtr, saveDelegate ? cast(PanelSaveDelegate*)saveDelegate._cPtr(No.Dup) : null);
  }

  /**
      Sets the title for the widget.
  
      Params:
        title = the title or null
  */
  void setTitle(string title = null) nothrow
  {
    const(char)* _title = title.toCString(No.Alloc);
    panel_widget_set_title(cast(PanelWidget*)this._cPtr, _title);
  }

  /**
      Sets the tooltip for the widget to be displayed in tabs.
  
      Params:
        tooltip = the tooltip or null
  */
  void setTooltip(string tooltip = null) nothrow
  {
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    panel_widget_set_tooltip(cast(PanelWidget*)this._cPtr, _tooltip);
  }

  /** */
  void unmarkBusy() nothrow
  {
    panel_widget_unmark_busy(cast(PanelWidget*)this._cPtr);
  }

  /** */
  void unmaximize() nothrow
  {
    panel_widget_unmaximize(cast(PanelWidget*)this._cPtr);
  }

  /**
      Connect to `GetDefaultFocus` signal.
  
      Gets the default widget to focus within the #PanelWidget. The first
        handler for this signal is expected to return a widget, or null if
        there is nothing to focus.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gtk.widget.Widget callback(panel.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` a #GtkWidget within #PanelWidget
              or null.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGetDefaultFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T : gtk.widget.Widget)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gtk.widget.Widget _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "panel.widget.Widget.getDefaultFocus");
      }

      setVal!(gtk.widget.Widget)(_returnValue, _retval);
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
  
          `void callback(panel.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPresented(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "panel.widget.Widget.presented");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("presented", closure, after);
  }
}

/// Fluent builder implementation template for [panel.widget.Widget]
class WidgetGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /** */
  T canMaximize(bool propval) nothrow
  {
    return setProperty("can-maximize", propval);
  }

  /**
      Set `child` property.
      Params:
        propval = The child inside this widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `icon` property.
      Params:
        propval = The icon for this widget.
      Returns: Builder instance for fluent chaining
  */
  T icon(gio.icon.Icon propval) nothrow
  {
    return setProperty("icon", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for this widget.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /** */
  T id(string propval) nothrow
  {
    return setProperty("id", propval);
  }

  /** */
  T kind(string propval) nothrow
  {
    return setProperty("kind", propval);
  }

  /**
      Set `menuModel` property.
      Params:
        propval = A menu model to display additional options for the page to the user via
          menus.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gio.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menu-model", propval);
  }

  /** */
  T modified(bool propval) nothrow
  {
    return setProperty("modified", propval);
  }

  /** */
  T needsAttention(bool propval) nothrow
  {
    return setProperty("needs-attention", propval);
  }

  /** */
  T reorderable(bool propval) nothrow
  {
    return setProperty("reorderable", propval);
  }

  /**
      Set `saveDelegate` property.
      Params:
        propval = The save delegate attached to this widget.
      Returns: Builder instance for fluent chaining
  */
  T saveDelegate(panel.save_delegate.SaveDelegate propval) nothrow
  {
    return setProperty("save-delegate", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this widget.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `tooltip` property.
      Params:
        propval = The tooltip to display in tabs for the widget.
      Returns: Builder instance for fluent chaining
  */
  T tooltip(string propval) nothrow
  {
    return setProperty("tooltip", propval);
  }
}

/// Fluent builder for [panel.widget.Widget]
final class WidgetGidBuilder : WidgetGidBuilderImpl!WidgetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Widget build() nothrow
  {
    return new Widget(cast(void*)createGObject(Widget._getGType), No.Take);
  }
}
