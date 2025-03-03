module gtk.action_group;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accel_group;
import gtk.action;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
 * Actions are organised into groups. An action group is essentially a
 * map from names to #GtkAction objects.
 * All actions that would make sense to use in a particular context
 * should be in a single group. Multiple action groups may be used for a
 * particular user interface. In fact, it is expected that most nontrivial
 * applications will make use of multiple groups. For example, in an
 * application that can edit multiple documents, one group holding global
 * actions $(LPAREN)e.g. quit, about, new$(RPAREN), and one group per document holding
 * actions that act on that document $(LPAREN)eg. save, cut/copy/paste, etc$(RPAREN). Each
 * window’s menus would be constructed from a combination of two action
 * groups.
 * ## Accelerators ## {#Action-Accel}
 * Accelerators are handled by the GTK+ accelerator map. All actions are
 * assigned an accelerator path $(LPAREN)which normally has the form
 * `<Actions>/group-name/action-name`$(RPAREN) and a shortcut is associated with
 * this accelerator path. All menuitems and toolitems take on this accelerator
 * path. The GTK+ accelerator map code makes sure that the correct shortcut
 * is displayed next to the menu item.
 * # GtkActionGroup as GtkBuildable # {#GtkActionGroup-BUILDER-UI}
 * The #GtkActionGroup implementation of the #GtkBuildable interface accepts
 * #GtkAction objects as `<child>` elements in UI definitions.
 * Note that it is probably more common to define actions and action groups
 * in the code, since they are directly related to what the code can do.
 * The GtkActionGroup implementation of the GtkBuildable interface supports
 * a custom `<accelerator>` element, which has attributes named “key“ and
 * “modifiers“ and allows to specify accelerators. This is similar to the
 * `<accelerator>` element of #GtkWidget, the main difference is that
 * it doesn’t allow you to specify a signal.
 * ## A #GtkDialog UI definition fragment. ##
 * |[<!-- language\="xml" -->
 * <object class\="GtkActionGroup" id\="actiongroup">
 * <child>
 * <object class\="GtkAction" id\="About">
 * <property name\="name">About</property>
 * <property name\="stock_id">gtk-about</property>
 * <signal handler\="about_activate" name\="activate"/>
 * </object>
 * <accelerator key\="F1" modifiers\="GDK_CONTROL_MASK | GDK_SHIFT_MASK"/>
 * </child>
 * </object>
 * ]|
 */
class ActionGroup : gobject.object.ObjectG, gtk.buildable.Buildable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_action_group_get_type != &gidSymbolNotFound ? gtk_action_group_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin BuildableT!();

  /**
   * Creates a new #GtkActionGroup object. The name of the action group
   * is used when associating [keybindings][Action-Accel]
   * with the actions.
   * Params:
   *   name = the name of the action group.
   * Returns: the new #GtkActionGroup
   */
  this(string name)
  {
    GtkActionGroup* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_action_group_new(_name);
    this(_cretval, Yes.Take);
  }

  /**
   * Adds an action object to the action group. Note that this function
   * does not set up the accel path of the action, which can lead to problems
   * if a user tries to modify the accelerator of a menuitem associated with
   * the action. Therefore you must either set the accel path yourself with
   * [gtk.action.Action.setAccelPath], or use
   * `gtk_action_group_add_action_with_accel $(LPAREN)..., NULL$(RPAREN)`.
   * Params:
   *   action = an action
   */
  void addAction(gtk.action.Action action)
  {
    gtk_action_group_add_action(cast(GtkActionGroup*)cPtr, action ? cast(GtkAction*)action.cPtr(No.Dup) : null);
  }

  /**
   * Adds an action object to the action group and sets up the accelerator.
   * If accelerator is %NULL, attempts to use the accelerator associated
   * with the stock_id of the action.
   * Accel paths are set to `<Actions>/group-name/action-name`.
   * Params:
   *   action = the action to add
   *   accelerator = the accelerator for the action, in
   *     the format understood by [gtk.global.acceleratorParse], or "" for no accelerator, or
   *     %NULL to use the stock accelerator
   */
  void addActionWithAccel(gtk.action.Action action, string accelerator)
  {
    const(char)* _accelerator = accelerator.toCString(No.Alloc);
    gtk_action_group_add_action_with_accel(cast(GtkActionGroup*)cPtr, action ? cast(GtkAction*)action.cPtr(No.Dup) : null, _accelerator);
  }

  /**
   * Gets the accelerator group.
   * Returns: the accelerator group associated with this action
   *   group or %NULL if there is none.
   */
  gtk.accel_group.AccelGroup getAccelGroup()
  {
    GtkAccelGroup* _cretval;
    _cretval = gtk_action_group_get_accel_group(cast(GtkActionGroup*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.accel_group.AccelGroup)(cast(GtkAccelGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Looks up an action in the action group by name.
   * Params:
   *   actionName = the name of the action
   * Returns: the action, or %NULL if no action by that name exists
   */
  gtk.action.Action getAction(string actionName)
  {
    GtkAction* _cretval;
    const(char)* _actionName = actionName.toCString(No.Alloc);
    _cretval = gtk_action_group_get_action(cast(GtkActionGroup*)cPtr, _actionName);
    auto _retval = ObjectG.getDObject!(gtk.action.Action)(cast(GtkAction*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the name of the action group.
   * Returns: the name of the action group.
   */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_action_group_get_name(cast(GtkActionGroup*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns %TRUE if the group is sensitive.  The constituent actions
   * can only be logically sensitive $(LPAREN)see [gtk.action.Action.isSensitive]$(RPAREN) if
   * they are sensitive $(LPAREN)see [gtk.action.Action.getSensitive]$(RPAREN) and their group
   * is sensitive.
   * Returns: %TRUE if the group is sensitive.
   */
  bool getSensitive()
  {
    bool _retval;
    _retval = gtk_action_group_get_sensitive(cast(GtkActionGroup*)cPtr);
    return _retval;
  }

  /**
   * Returns %TRUE if the group is visible.  The constituent actions
   * can only be logically visible $(LPAREN)see [gtk.action.Action.isVisible]$(RPAREN) if
   * they are visible $(LPAREN)see [gtk.action.Action.getVisible]$(RPAREN) and their group
   * is visible.
   * Returns: %TRUE if the group is visible.
   */
  bool getVisible()
  {
    bool _retval;
    _retval = gtk_action_group_get_visible(cast(GtkActionGroup*)cPtr);
    return _retval;
  }

  /**
   * Lists the actions in the action group.
   * Returns: an allocated list of the action objects in the action group
   */
  gtk.action.Action[] listActions()
  {
    GList* _cretval;
    _cretval = gtk_action_group_list_actions(cast(GtkActionGroup*)cPtr);
    auto _retval = gListToD!(gtk.action.Action, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
   * Removes an action object from the action group.
   * Params:
   *   action = an action
   */
  void removeAction(gtk.action.Action action)
  {
    gtk_action_group_remove_action(cast(GtkActionGroup*)cPtr, action ? cast(GtkAction*)action.cPtr(No.Dup) : null);
  }

  /**
   * Sets the accelerator group to be used by every action in this group.
   * Params:
   *   accelGroup = a #GtkAccelGroup to set or %NULL
   */
  void setAccelGroup(gtk.accel_group.AccelGroup accelGroup)
  {
    gtk_action_group_set_accel_group(cast(GtkActionGroup*)cPtr, accelGroup ? cast(GtkAccelGroup*)accelGroup.cPtr(No.Dup) : null);
  }

  /**
   * Changes the sensitivity of action_group
   * Params:
   *   sensitive = new sensitivity
   */
  void setSensitive(bool sensitive)
  {
    gtk_action_group_set_sensitive(cast(GtkActionGroup*)cPtr, sensitive);
  }

  /**
   * Sets a function to be used for translating the label and tooltip of
   * #GtkActionEntrys added by [gtk.action_group.ActionGroup.addActions].
   * If you’re using gettext$(LPAREN)$(RPAREN), it is enough to set the translation domain
   * with [gtk.action_group.ActionGroup.setTranslationDomain].
   * Params:
   *   func = a #GtkTranslateFunc
   */
  void setTranslateFunc(gtk.types.TranslateFunc func)
  {
    extern(C) char* _funcCallback(const(char)* path, void* funcData)
    {
      string _dretval;
      auto _dlg = cast(gtk.types.TranslateFunc*)funcData;
      string _path = path.fromCString(No.Free);

      _dretval = (*_dlg)(_path);
      char* _retval = _dretval.toCString(Yes.Alloc);

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_action_group_set_translate_func(cast(GtkActionGroup*)cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
   * Sets the translation domain and uses [glib.global.dgettext] for translating the
   * label and tooltip of #GtkActionEntrys added by
   * [gtk.action_group.ActionGroup.addActions].
   * If you’re not using gettext$(LPAREN)$(RPAREN) for localization, see
   * [gtk.action_group.ActionGroup.setTranslateFunc].
   * Params:
   *   domain = the translation domain to use for [glib.global.dgettext]
   *     calls, or %NULL to use the domain set with textdomain$(LPAREN)$(RPAREN)
   */
  void setTranslationDomain(string domain)
  {
    const(char)* _domain = domain.toCString(No.Alloc);
    gtk_action_group_set_translation_domain(cast(GtkActionGroup*)cPtr, _domain);
  }

  /**
   * Changes the visible of action_group.
   * Params:
   *   visible = new visiblity
   */
  void setVisible(bool visible)
  {
    gtk_action_group_set_visible(cast(GtkActionGroup*)cPtr, visible);
  }

  /**
   * Translates a string using the function set with
   * [gtk.action_group.ActionGroup.setTranslateFunc]. This
   * is mainly intended for language bindings.
   * Params:
   *   string_ = a string
   * Returns: the translation of string
   */
  string translateString(string string_)
  {
    const(char)* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gtk_action_group_translate_string(cast(GtkActionGroup*)cPtr, _string_);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * The ::connect-proxy signal is emitted after connecting a proxy to
   * an action in the group. Note that the proxy may have been connected
   * to a different action before.
   * This is intended for simple customizations for which a custom action
   * class would be too clumsy, e.g. showing tooltips for menuitems in the
   * statusbar.
   * #GtkUIManager proxies the signal and provides global notification
   * just before any action is connected to a proxy, which is probably more
   * convenient to use.
   * Params
   *   action = the action
   *   proxy = the proxy
   *   actionGroup = the instance the signal is connected to
   */
  alias ConnectProxyCallbackDlg = void delegate(gtk.action.Action action, gtk.widget.Widget proxy, gtk.action_group.ActionGroup actionGroup);
  alias ConnectProxyCallbackFunc = void function(gtk.action.Action action, gtk.widget.Widget proxy, gtk.action_group.ActionGroup actionGroup);

  /**
   * Connect to ConnectProxy signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectConnectProxy(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ConnectProxyCallbackDlg) || is(T : ConnectProxyCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto actionGroup = getVal!(gtk.action_group.ActionGroup)(_paramVals);
      auto action = getVal!(gtk.action.Action)(&_paramVals[1]);
      auto proxy = getVal!(gtk.widget.Widget)(&_paramVals[2]);
      _dClosure.dlg(action, proxy, actionGroup);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("connect-proxy", closure, after);
  }

  /**
   * The ::disconnect-proxy signal is emitted after disconnecting a proxy
   * from an action in the group.
   * #GtkUIManager proxies the signal and provides global notification
   * just before any action is connected to a proxy, which is probably more
   * convenient to use.
   * Params
   *   action = the action
   *   proxy = the proxy
   *   actionGroup = the instance the signal is connected to
   */
  alias DisconnectProxyCallbackDlg = void delegate(gtk.action.Action action, gtk.widget.Widget proxy, gtk.action_group.ActionGroup actionGroup);
  alias DisconnectProxyCallbackFunc = void function(gtk.action.Action action, gtk.widget.Widget proxy, gtk.action_group.ActionGroup actionGroup);

  /**
   * Connect to DisconnectProxy signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDisconnectProxy(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DisconnectProxyCallbackDlg) || is(T : DisconnectProxyCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto actionGroup = getVal!(gtk.action_group.ActionGroup)(_paramVals);
      auto action = getVal!(gtk.action.Action)(&_paramVals[1]);
      auto proxy = getVal!(gtk.widget.Widget)(&_paramVals[2]);
      _dClosure.dlg(action, proxy, actionGroup);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("disconnect-proxy", closure, after);
  }

  /**
   * The ::post-activate signal is emitted just after the action in the
   * action_group is activated
   * This is intended for #GtkUIManager to proxy the signal and provide global
   * notification just after any action is activated.
   * Params
   *   action = the action
   *   actionGroup = the instance the signal is connected to
   */
  alias PostActivateCallbackDlg = void delegate(gtk.action.Action action, gtk.action_group.ActionGroup actionGroup);
  alias PostActivateCallbackFunc = void function(gtk.action.Action action, gtk.action_group.ActionGroup actionGroup);

  /**
   * Connect to PostActivate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPostActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PostActivateCallbackDlg) || is(T : PostActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto actionGroup = getVal!(gtk.action_group.ActionGroup)(_paramVals);
      auto action = getVal!(gtk.action.Action)(&_paramVals[1]);
      _dClosure.dlg(action, actionGroup);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("post-activate", closure, after);
  }

  /**
   * The ::pre-activate signal is emitted just before the action in the
   * action_group is activated
   * This is intended for #GtkUIManager to proxy the signal and provide global
   * notification just before any action is activated.
   * Params
   *   action = the action
   *   actionGroup = the instance the signal is connected to
   */
  alias PreActivateCallbackDlg = void delegate(gtk.action.Action action, gtk.action_group.ActionGroup actionGroup);
  alias PreActivateCallbackFunc = void function(gtk.action.Action action, gtk.action_group.ActionGroup actionGroup);

  /**
   * Connect to PreActivate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPreActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PreActivateCallbackDlg) || is(T : PreActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto actionGroup = getVal!(gtk.action_group.ActionGroup)(_paramVals);
      auto action = getVal!(gtk.action.Action)(&_paramVals[1]);
      _dClosure.dlg(action, actionGroup);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pre-activate", closure, after);
  }
}
