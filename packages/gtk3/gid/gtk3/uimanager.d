/// Module for [UIManager] class
module gid.gtk3.uimanager;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.accel_group;
import gid.gtk3.action;
import gid.gtk3.action_group;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    A #GtkUIManager constructs a user interface (menus and toolbars) from
    one or more UI definitions, which reference actions from one or more
    action groups.
    
    > GtkUIManager is deprecated since GTK+ 3.10. To construct user interfaces
    > from XML definitions, you should use #GtkBuilder, #GMenuModel, et al. To
    > work with actions, use #GAction, #GtkActionable et al. These newer classes
    > support richer functionality and integration with various desktop shells.
    > It should be possible to migrate most/all functionality from GtkUIManager.
    
    # UI Definitions # {#XML-UI}
    
    The UI definitions are specified in an XML format which can be
    roughly described by the following DTD.
    
    > Do not confuse the GtkUIManager UI Definitions described here with
    > the similarly named [GtkBuilder UI Definitions][BUILDER-UI].
    
    ```
    <!ELEMENT ui          (menubar|toolbar|popup|accelerator)* >
    <!ELEMENT menubar     (menuitem|separator|placeholder|menu)* >
    <!ELEMENT menu        (menuitem|separator|placeholder|menu)* >
    <!ELEMENT popup       (menuitem|separator|placeholder|menu)* >
    <!ELEMENT toolbar     (toolitem|separator|placeholder)* >
    <!ELEMENT placeholder (menuitem|toolitem|separator|placeholder|menu)* >
    <!ELEMENT menuitem     EMPTY >
    <!ELEMENT toolitem     (menu?) >
    <!ELEMENT separator    EMPTY >
    <!ELEMENT accelerator  EMPTY >
    <!ATTLIST menubar      name                      #IMPLIED
                           action                    #IMPLIED >
    <!ATTLIST toolbar      name                      #IMPLIED
                           action                    #IMPLIED >
    <!ATTLIST popup        name                      #IMPLIED
                           action                    #IMPLIED
                           accelerators (true|false) #IMPLIED >
    <!ATTLIST placeholder  name                      #IMPLIED
                           action                    #IMPLIED >
    <!ATTLIST separator    name                      #IMPLIED
                           action                    #IMPLIED
                           expand       (true|false) #IMPLIED >
    <!ATTLIST menu         name                      #IMPLIED
                           action                    #REQUIRED
                           position     (top|bot)    #IMPLIED >
    <!ATTLIST menuitem     name                      #IMPLIED
                           action                    #REQUIRED
                           position     (top|bot)    #IMPLIED
                           always-show-image (true|false) #IMPLIED >
    <!ATTLIST toolitem     name                      #IMPLIED
                           action                    #REQUIRED
                           position     (top|bot)    #IMPLIED >
    <!ATTLIST accelerator  name                      #IMPLIED
                           action                    #REQUIRED >
    ```
    
    There are some additional restrictions beyond those specified in the
    DTD, e.g. every toolitem must have a toolbar in its anchestry and
    every menuitem must have a menubar or popup in its anchestry. Since
    a #GMarkupParser is used to parse the UI description, it must not only
    be valid XML, but valid markup.
    
    If a name is not specified, it defaults to the action. If an action is
    not specified either, the element name is used. The name and action
    attributes must not contain “/” characters after parsing (since that
    would mess up path lookup) and must be usable as XML attributes when
    enclosed in doublequotes, thus they must not “"” characters or references
    to the &quot; entity.
    
    # A UI definition #
    
    ```xml
    <ui>
      <menubar>
        <menu name="FileMenu" action="FileMenuAction">
          <menuitem name="New" action="New2Action" />
          <placeholder name="FileMenuAdditions" />
        </menu>
        <menu name="JustifyMenu" action="JustifyMenuAction">
          <menuitem name="Left" action="justify-left"/>
          <menuitem name="Centre" action="justify-center"/>
          <menuitem name="Right" action="justify-right"/>
          <menuitem name="Fill" action="justify-fill"/>
        </menu>
      </menubar>
      <toolbar action="toolbar1">
        <placeholder name="JustifyToolItems">
          <separator/>
          <toolitem name="Left" action="justify-left"/>
          <toolitem name="Centre" action="justify-center"/>
          <toolitem name="Right" action="justify-right"/>
          <toolitem name="Fill" action="justify-fill"/>
          <separator/>
        </placeholder>
      </toolbar>
    </ui>
    ```
    
    The constructed widget hierarchy is very similar to the element tree
    of the XML, with the exception that placeholders are merged into their
    parents. The correspondence of XML elements to widgets should be
    almost obvious:
    
    - menubar
    
       a #GtkMenuBar
    
    - toolbar
    
       a #GtkToolbar
    
    - popup
    
       a toplevel #GtkMenu
    
    - menu
    
       a #GtkMenu attached to a menuitem
    
    - menuitem
    
       a #GtkMenuItem subclass, the exact type depends on the action
    
    - toolitem
    
       a #GtkToolItem subclass, the exact type depends on the
       action. Note that toolitem elements may contain a menu element,
       but only if their associated action specifies a
       #GtkMenuToolButton as proxy.
    
    - separator
    
       a #GtkSeparatorMenuItem or #GtkSeparatorToolItem
    
    - accelerator
    
       a keyboard accelerator
    
    The “position” attribute determines where a constructed widget is positioned
    wrt. to its siblings in the partially constructed tree. If it is
    “top”, the widget is prepended, otherwise it is appended.
    
    # UI Merging # {#UI-Merging}
    
    The most remarkable feature of #GtkUIManager is that it can overlay a set
    of menuitems and toolitems over another one, and demerge them later.
    
    Merging is done based on the names of the XML elements. Each element is
    identified by a path which consists of the names of its anchestors, separated
    by slashes. For example, the menuitem named “Left” in the example above
    has the path `/ui/menubar/JustifyMenu/Left` and the
    toolitem with the same name has path
    `/ui/toolbar1/JustifyToolItems/Left`.
    
    # Accelerators #
    
    Every action has an accelerator path. Accelerators are installed together
    with menuitem proxies, but they can also be explicitly added with
    `<accelerator>` elements in the UI definition. This makes it possible to
    have accelerators for actions even if they have no visible proxies.
    
    # Smart Separators # {#Smart-Separators}
    
    The separators created by #GtkUIManager are “smart”, i.e. they do not show up
    in the UI unless they end up between two visible menu or tool items. Separators
    which are located at the very beginning or end of the menu or toolbar
    containing them, or multiple separators next to each other, are hidden. This
    is a useful feature, since the merging of UI elements from multiple sources
    can make it hard or impossible to determine in advance whether a separator
    will end up in such an unfortunate position.
    
    For separators in toolbars, you can set `expand="true"` to
    turn them from a small, visible separator to an expanding, invisible one.
    Toolitems following an expanding separator are effectively right-aligned.
    
    # Empty Menus
    
    Submenus pose similar problems to separators inconnection with merging. It is
    impossible to know in advance whether they will end up empty after merging.
    #GtkUIManager offers two ways to treat empty submenus:
    
    - make them disappear by hiding the menu item they’re attached to
    
    - add an insensitive “Empty” item
    
    The behaviour is chosen based on the “hide_if_empty” property of the action
    to which the submenu is associated.
    
    # GtkUIManager as GtkBuildable # {#GtkUIManager-BUILDER-UI}
    
    The GtkUIManager implementation of the GtkBuildable interface accepts
    GtkActionGroup objects as `<child>` elements in UI definitions.
    
    A GtkUIManager UI definition as described above can be embedded in
    an GtkUIManager `<object>` element in a GtkBuilder UI definition.
    
    The widgets that are constructed by a GtkUIManager can be embedded in
    other parts of the constructed user interface with the help of the
    “constructor” attribute. See the example below.
    
    ## An embedded GtkUIManager UI definition
    
    ```xml
    <object class="GtkUIManager" id="uiman">
      <child>
        <object class="GtkActionGroup" id="actiongroup">
          <child>
            <object class="GtkAction" id="file">
              <property name="label">_File</property>
            </object>
          </child>
        </object>
      </child>
      <ui>
        <menubar name="menubar1">
          <menu action="file">
          </menu>
        </menubar>
      </ui>
    </object>
    <object class="GtkWindow" id="main-window">
      <child>
        <object class="GtkMenuBar" id="menubar1" constructor="uiman"/>
      </child>
    </object>
    ```
*/
class UIManager : gid.gobject2.object.ObjectWrap, gid.gtk3.buildable.Buildable
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
    return cast(void function())gtk_ui_manager_get_type != &gidSymbolNotFound ? gtk_ui_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkUIManager";
  }

  /** Returns `this`, for use in `with` statements. */
  override UIManager self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.uimanager.UIManager]
      Returns: New builder object
  */
  static UIManagerGidBuilder builder() nothrow
  {
    return new UIManagerGidBuilder;
  }

  /**
      Get `addTearoffs` property.
      Returns: The "add-tearoffs" property controls whether generated menus
        have tearoff menu items.
        
        Note that this only affects regular menus. Generated popup
        menus never have tearoff menu items.
  
      Deprecated: Tearoff menus are deprecated and should not
            be used in newly written code.
  */
  @property bool addTearoffs() nothrow
  {
    return getAddTearoffs();
  }

  /**
      Set `addTearoffs` property.
      Params:
        propval = The "add-tearoffs" property controls whether generated menus
          have tearoff menu items.
          
          Note that this only affects regular menus. Generated popup
          menus never have tearoff menu items.
  
      Deprecated: Tearoff menus are deprecated and should not
            be used in newly written code.
  */
  @property void addTearoffs(bool propval) nothrow
  {
    setAddTearoffs(propval);
  }

  /** */
  @property string ui() nothrow
  {
    return getUi();
  }

  mixin BuildableT!();

  /**
      Creates a new ui manager object.
      Returns: a new ui manager object.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkUIManager* _cretval;
      _cretval = gtk_ui_manager_new();
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected void vfuncActionsChanged()
  {
    auto _klass = cast(GtkUIManagerClass*)_vfuncClass;
    if (!_klass.actionsChanged)
      return;

    _klass.actionsChanged(cast(GtkUIManager*)this._cPtr);
  }

  /** */
  protected void vfuncAddWidget(gid.gtk3.widget.Widget widget)
  {
    auto _klass = cast(GtkUIManagerClass*)_vfuncClass;
    if (!_klass.addWidget)
      return;

    _klass.addWidget(cast(GtkUIManager*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncConnectProxy(gid.gtk3.action.Action action, gid.gtk3.widget.Widget proxy)
  {
    auto _klass = cast(GtkUIManagerClass*)_vfuncClass;
    if (!_klass.connectProxy)
      return;

    _klass.connectProxy(cast(GtkUIManager*)this._cPtr, action ? cast(GtkAction*)action._cPtr(No.Dup) : null, proxy ? cast(GtkWidget*)proxy._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncDisconnectProxy(gid.gtk3.action.Action action, gid.gtk3.widget.Widget proxy)
  {
    auto _klass = cast(GtkUIManagerClass*)_vfuncClass;
    if (!_klass.disconnectProxy)
      return;

    _klass.disconnectProxy(cast(GtkUIManager*)this._cPtr, action ? cast(GtkAction*)action._cPtr(No.Dup) : null, proxy ? cast(GtkWidget*)proxy._cPtr(No.Dup) : null);
  }

  /**
      Looks up an action by following a path. See [gid.gtk3.uimanager.UIManager.getWidget]
      for more information about paths.
  
      Params:
        path = a path
      Returns: the action whose proxy widget is found by following the path,
            or null if no widget was found.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetAction` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk3.action.Action vfuncGetAction(string path)
  {
    auto _klass = cast(GtkUIManagerClass*)_vfuncClass;
    if (!_klass.getAction)
      return typeof(return).init;

    GtkAction* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getAction(cast(GtkUIManager*)this._cPtr, _path);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.action.Action)(cast(GtkAction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Looks up a widget by following a path.
      The path consists of the names specified in the XML description of the UI.
      separated by “/”. Elements which don’t have a name or action attribute in
      the XML (e.g. `<popup>`) can be addressed by their XML element name
      (e.g. "popup"). The root element ("/ui") can be omitted in the path.
      
      Note that the widget found by following a path that ends in a `<menu>`;
      element is the menuitem to which the menu is attached, not the menu it
      manages.
      
      Also note that the widgets constructed by a ui manager are not tied to
      the lifecycle of the ui manager. If you add the widgets returned by this
      function to some container or explicitly ref them, they will survive the
      destruction of the ui manager.
  
      Params:
        path = a path
      Returns: the widget found by following the path,
            or null if no widget was found
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetWidget` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk3.widget.Widget vfuncGetWidget(string path)
  {
    auto _klass = cast(GtkUIManagerClass*)_vfuncClass;
    if (!_klass.getWidget)
      return typeof(return).init;

    GtkWidget* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getWidget(cast(GtkUIManager*)this._cPtr, _path);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  protected void vfuncPostActivate(gid.gtk3.action.Action action)
  {
    auto _klass = cast(GtkUIManagerClass*)_vfuncClass;
    if (!_klass.postActivate)
      return;

    _klass.postActivate(cast(GtkUIManager*)this._cPtr, action ? cast(GtkAction*)action._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncPreActivate(gid.gtk3.action.Action action)
  {
    auto _klass = cast(GtkUIManagerClass*)_vfuncClass;
    if (!_klass.preActivate)
      return;

    _klass.preActivate(cast(GtkUIManager*)this._cPtr, action ? cast(GtkAction*)action._cPtr(No.Dup) : null);
  }

  /**
      Adds a UI element to the current contents of manager.
      
      If type is [gid.gtk3.types.UIManagerItemType.Auto], GTK+ inserts a menuitem, toolitem or
      separator if such an element can be inserted at the place determined by
      path. Otherwise type must indicate an element that can be inserted at
      the place determined by path.
      
      If path points to a menuitem or toolitem, the new element will be inserted
      before or after this item, depending on top.
  
      Params:
        mergeId = the merge id for the merged UI, see [gid.gtk3.uimanager.UIManager.newMergeId]
        path = a path
        name = the name for the added UI element
        action = the name of the action to be proxied, or null to add a separator
        type = the type of UI element to add.
        top = if true, the UI element is added before its siblings, otherwise it
            is added after its siblings.
  */
  void addUi(uint mergeId, string path, string name, string action, gid.gtk3.types.UIManagerItemType type, bool top) nothrow
  {
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _action = action.toCString!(No.Malloc, Yes.Nullable);
    gtk_ui_manager_add_ui(cast(GtkUIManager*)this._cPtr, mergeId, _path, _name, _action, type, top);
  }

  /**
      Parses a file containing a [UI definition][XML-UI] and
      merges it with the current contents of manager.
  
      Params:
        filename = the name of the file to parse
      Returns: The merge id for the merged UI. The merge id can be used
          to unmerge the UI with [gid.gtk3.uimanager.UIManager.removeUi]. If an error occurred,
          the return value is 0.
      Throws: [ErrorWrap]
  */
  uint addUiFromFile(string filename)
  {
    uint _retval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = gtk_ui_manager_add_ui_from_file(cast(GtkUIManager*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Parses a resource file containing a [UI definition][XML-UI] and
      merges it with the current contents of manager.
  
      Params:
        resourcePath = the resource path of the file to parse
      Returns: The merge id for the merged UI. The merge id can be used
          to unmerge the UI with [gid.gtk3.uimanager.UIManager.removeUi]. If an error occurred,
          the return value is 0.
      Throws: [ErrorWrap]
  */
  uint addUiFromResource(string resourcePath)
  {
    uint _retval;
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = gtk_ui_manager_add_ui_from_resource(cast(GtkUIManager*)this._cPtr, _resourcePath, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Parses a string containing a [UI definition][XML-UI] and merges it with
      the current contents of manager. An enclosing `<ui>` element is added if
      it is missing.
  
      Params:
        buffer = the string to parse
      Returns: The merge id for the merged UI. The merge id can be used
          to unmerge the UI with [gid.gtk3.uimanager.UIManager.removeUi]. If an error occurred,
          the return value is 0.
      Throws: [ErrorWrap]
  */
  uint addUiFromString(string buffer)
  {
    uint _retval;
    ptrdiff_t _length;
    if (buffer)
      _length = cast(ptrdiff_t)buffer.length;

    auto _buffer = cast(char*)buffer.ptr;
    GError *_err;
    _retval = gtk_ui_manager_add_ui_from_string(cast(GtkUIManager*)this._cPtr, _buffer, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Makes sure that all pending updates to the UI have been completed.
      
      This may occasionally be necessary, since #GtkUIManager updates the
      UI in an idle function. A typical example where this function is
      useful is to enforce that the menubar and toolbar have been added to
      the main window before showing it:
      ```c
      gtk_container_add (GTK_CONTAINER (window), vbox);
      g_signal_connect (merge, "add-widget",
                        G_CALLBACK (add_widget), vbox);
      gtk_ui_manager_add_ui_from_file (merge, "my-menus");
      gtk_ui_manager_add_ui_from_file (merge, "my-toolbars");
      gtk_ui_manager_ensure_update (merge);
      gtk_widget_show (window);
      ```
  */
  void ensureUpdate() nothrow
  {
    gtk_ui_manager_ensure_update(cast(GtkUIManager*)this._cPtr);
  }

  /**
      Returns the #GtkAccelGroup associated with manager.
      Returns: the #GtkAccelGroup.
  */
  gid.gtk3.accel_group.AccelGroup getAccelGroup() nothrow
  {
    GtkAccelGroup* _cretval;
    _cretval = gtk_ui_manager_get_accel_group(cast(GtkUIManager*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.accel_group.AccelGroup)(cast(GtkAccelGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Looks up an action by following a path. See [gid.gtk3.uimanager.UIManager.getWidget]
      for more information about paths.
  
      Params:
        path = a path
      Returns: the action whose proxy widget is found by following the path,
            or null if no widget was found.
  */
  gid.gtk3.action.Action getAction(string path) nothrow
  {
    GtkAction* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_ui_manager_get_action(cast(GtkUIManager*)this._cPtr, _path);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.action.Action)(cast(GtkAction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the list of action groups associated with manager.
      Returns: a #GList of
          action groups. The list is owned by GTK+
          and should not be modified.
  */
  gid.gtk3.action_group.ActionGroup[] getActionGroups() nothrow
  {
    GList* _cretval;
    _cretval = gtk_ui_manager_get_action_groups(cast(GtkUIManager*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.action_group.ActionGroup, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns whether menus generated by this #GtkUIManager
      will have tearoff menu items.
      Returns: whether tearoff menu items are added
  
      Deprecated: Tearoff menus are deprecated and should not
            be used in newly written code.
  */
  bool getAddTearoffs() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_ui_manager_get_add_tearoffs(cast(GtkUIManager*)this._cPtr);
    return _retval;
  }

  /**
      Obtains a list of all toplevel widgets of the requested types.
  
      Params:
        types = specifies the types of toplevel widgets to include. Allowed
            types are #GTK_UI_MANAGER_MENUBAR, #GTK_UI_MANAGER_TOOLBAR and
            #GTK_UI_MANAGER_POPUP.
      Returns: a newly-allocated #GSList of
        all toplevel widgets of the requested types.  Free the returned list with [gid.glib2.slist.SList.free].
  */
  gid.gtk3.widget.Widget[] getToplevels(gid.gtk3.types.UIManagerItemType types) nothrow
  {
    GSList* _cretval;
    _cretval = gtk_ui_manager_get_toplevels(cast(GtkUIManager*)this._cPtr, types);
    auto _retval = gSListToD!(gid.gtk3.widget.Widget, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Creates a [UI definition][XML-UI] of the merged UI.
      Returns: A newly allocated string containing an XML representation of
        the merged UI.
  */
  string getUi() nothrow
  {
    char* _cretval;
    _cretval = gtk_ui_manager_get_ui(cast(GtkUIManager*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Looks up a widget by following a path.
      The path consists of the names specified in the XML description of the UI.
      separated by “/”. Elements which don’t have a name or action attribute in
      the XML (e.g. `<popup>`) can be addressed by their XML element name
      (e.g. "popup"). The root element ("/ui") can be omitted in the path.
      
      Note that the widget found by following a path that ends in a `<menu>`;
      element is the menuitem to which the menu is attached, not the menu it
      manages.
      
      Also note that the widgets constructed by a ui manager are not tied to
      the lifecycle of the ui manager. If you add the widgets returned by this
      function to some container or explicitly ref them, they will survive the
      destruction of the ui manager.
  
      Params:
        path = a path
      Returns: the widget found by following the path,
            or null if no widget was found
  */
  gid.gtk3.widget.Widget getWidget(string path) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_ui_manager_get_widget(cast(GtkUIManager*)this._cPtr, _path);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts an action group into the list of action groups associated
      with manager. Actions in earlier groups hide actions with the same
      name in later groups.
      
      If pos is larger than the number of action groups in manager, or
      negative, action_group will be inserted at the end of the internal
      list.
  
      Params:
        actionGroup = the action group to be inserted
        pos = the position at which the group will be inserted.
  */
  void insertActionGroup(gid.gtk3.action_group.ActionGroup actionGroup, int pos) nothrow
  {
    gtk_ui_manager_insert_action_group(cast(GtkUIManager*)this._cPtr, actionGroup ? cast(GtkActionGroup*)actionGroup._cPtr(No.Dup) : null, pos);
  }

  /**
      Returns an unused merge id, suitable for use with
      [gid.gtk3.uimanager.UIManager.addUi].
      Returns: an unused merge id.
  */
  uint newMergeId() nothrow
  {
    uint _retval;
    _retval = gtk_ui_manager_new_merge_id(cast(GtkUIManager*)this._cPtr);
    return _retval;
  }

  /**
      Removes an action group from the list of action groups associated
      with manager.
  
      Params:
        actionGroup = the action group to be removed
  */
  void removeActionGroup(gid.gtk3.action_group.ActionGroup actionGroup) nothrow
  {
    gtk_ui_manager_remove_action_group(cast(GtkUIManager*)this._cPtr, actionGroup ? cast(GtkActionGroup*)actionGroup._cPtr(No.Dup) : null);
  }

  /**
      Unmerges the part of manager's content identified by merge_id.
  
      Params:
        mergeId = a merge id as returned by [gid.gtk3.uimanager.UIManager.addUiFromString]
  */
  void removeUi(uint mergeId) nothrow
  {
    gtk_ui_manager_remove_ui(cast(GtkUIManager*)this._cPtr, mergeId);
  }

  /**
      Sets the “add_tearoffs” property, which controls whether menus
      generated by this #GtkUIManager will have tearoff menu items.
      
      Note that this only affects regular menus. Generated popup
      menus never have tearoff menu items.
  
      Params:
        addTearoffs = whether tearoff menu items are added
  
      Deprecated: Tearoff menus are deprecated and should not
            be used in newly written code.
  */
  void setAddTearoffs(bool addTearoffs) nothrow
  {
    gtk_ui_manager_set_add_tearoffs(cast(GtkUIManager*)this._cPtr, addTearoffs);
  }

  /**
      Connect to `ActionsChanged` signal.
  
      The ::actions-changed signal is emitted whenever the set of actions
        changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.uimanager.UIManager uIManager)`
  
          `uIManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActionsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.uimanager.UIManager)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.actionsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("actions-changed", closure, after);
  }

  /**
      Connect to `AddWidget` signal.
  
      The ::add-widget signal is emitted for each generated menubar and toolbar.
        It is not emitted for generated popup menus, which can be obtained by
        [gid.gtk3.uimanager.UIManager.getWidget].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget, gid.gtk3.uimanager.UIManager uIManager)`
  
          `widget` the added widget (optional)
  
          `uIManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAddWidget(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.uimanager.UIManager)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.addWidget");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("add-widget", closure, after);
  }

  /**
      Connect to `ConnectProxy` signal.
  
      The ::connect-proxy signal is emitted after connecting a proxy to
        an action in the group.
        
        This is intended for simple customizations for which a custom action
        class would be too clumsy, e.g. showing tooltips for menuitems in the
        statusbar.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.action.Action action, gid.gtk3.widget.Widget proxy, gid.gtk3.uimanager.UIManager uIManager)`
  
          `action` the action (optional)
  
          `proxy` the proxy (optional)
  
          `uIManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectConnectProxy(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.action.Action)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.uimanager.UIManager)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.connectProxy");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("connect-proxy", closure, after);
  }

  /**
      Connect to `DisconnectProxy` signal.
  
      The ::disconnect-proxy signal is emitted after disconnecting a proxy
        from an action in the group.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.action.Action action, gid.gtk3.widget.Widget proxy, gid.gtk3.uimanager.UIManager uIManager)`
  
          `action` the action (optional)
  
          `proxy` the proxy (optional)
  
          `uIManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDisconnectProxy(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.action.Action)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.uimanager.UIManager)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.disconnectProxy");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("disconnect-proxy", closure, after);
  }

  /**
      Connect to `PostActivate` signal.
  
      The ::post-activate signal is emitted just after the action
        is activated.
        
        This is intended for applications to get notification
        just after any action is activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.action.Action action, gid.gtk3.uimanager.UIManager uIManager)`
  
          `action` the action (optional)
  
          `uIManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPostActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.action.Action)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.uimanager.UIManager)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.postActivate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("post-activate", closure, after);
  }

  /**
      Connect to `PreActivate` signal.
  
      The ::pre-activate signal is emitted just before the action
        is activated.
        
        This is intended for applications to get notification
        just before any action is activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.action.Action action, gid.gtk3.uimanager.UIManager uIManager)`
  
          `action` the action (optional)
  
          `uIManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.action.Action)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.uimanager.UIManager)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.preActivate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pre-activate", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from UIManager
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.uimanager.UIManager), T.stringof ~ " is not derived from gid.gtk3.uimanager.UIManager");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActionsChanged", true)[0]) == gid.gtk3.uimanager.UIManager))
      _installVfunc(klass, "actions_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAddWidget", true)[0]) == gid.gtk3.uimanager.UIManager))
      _installVfunc(klass, "add_widget");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncConnectProxy", true)[0]) == gid.gtk3.uimanager.UIManager))
      _installVfunc(klass, "connect_proxy");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDisconnectProxy", true)[0]) == gid.gtk3.uimanager.UIManager))
      _installVfunc(klass, "disconnect_proxy");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetAction", true)[0]) == gid.gtk3.uimanager.UIManager))
      _installVfunc(klass, "get_action");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetWidget", true)[0]) == gid.gtk3.uimanager.UIManager))
      _installVfunc(klass, "get_widget");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPostActivate", true)[0]) == gid.gtk3.uimanager.UIManager))
      _installVfunc(klass, "post_activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPreActivate", true)[0]) == gid.gtk3.uimanager.UIManager))
      _installVfunc(klass, "pre_activate");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkUIManagerClass*)klass;

    switch (vfunc)
    {
      case "actions_changed":
      {
        static extern(C) void _vfuncActionsChangedTramp(GtkUIManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.uimanager.UIManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkUIManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.actionsChanged)
              return (cast(typeof(&_vfuncActionsChangedTramp))_klass.actionsChanged)(manager);
            return;
          }

          try
          {
            _obj.vfuncActionsChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.vfuncActionsChanged");
          }
        }

        _klass.actionsChanged = cast(typeof(_klass.actionsChanged))&_vfuncActionsChangedTramp;
        break;
      }
      case "add_widget":
      {
        static extern(C) void _vfuncAddWidgetTramp(GtkUIManager* manager, GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.uimanager.UIManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkUIManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.addWidget)
              return (cast(typeof(&_vfuncAddWidgetTramp))_klass.addWidget)(manager, widget);
            return;
          }

          try
          {
            _obj.vfuncAddWidget(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.vfuncAddWidget");
          }
        }

        _klass.addWidget = cast(typeof(_klass.addWidget))&_vfuncAddWidgetTramp;
        break;
      }
      case "connect_proxy":
      {
        static extern(C) void _vfuncConnectProxyTramp(GtkUIManager* manager, GtkAction* action, GtkWidget* proxy) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.uimanager.UIManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkUIManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.connectProxy)
              return (cast(typeof(&_vfuncConnectProxyTramp))_klass.connectProxy)(manager, action, proxy);
            return;
          }

          try
          {
            _obj.vfuncConnectProxy(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.action.Action)(cast(void*)action, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)proxy, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.vfuncConnectProxy");
          }
        }

        _klass.connectProxy = cast(typeof(_klass.connectProxy))&_vfuncConnectProxyTramp;
        break;
      }
      case "disconnect_proxy":
      {
        static extern(C) void _vfuncDisconnectProxyTramp(GtkUIManager* manager, GtkAction* action, GtkWidget* proxy) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.uimanager.UIManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkUIManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.disconnectProxy)
              return (cast(typeof(&_vfuncDisconnectProxyTramp))_klass.disconnectProxy)(manager, action, proxy);
            return;
          }

          try
          {
            _obj.vfuncDisconnectProxy(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.action.Action)(cast(void*)action, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)proxy, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.vfuncDisconnectProxy");
          }
        }

        _klass.disconnectProxy = cast(typeof(_klass.disconnectProxy))&_vfuncDisconnectProxyTramp;
        break;
      }
      case "get_action":
      {
        static extern(C) GtkAction* _vfuncGetActionTramp(GtkUIManager* manager, const(char)* path) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.uimanager.UIManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkUIManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.getAction)
              return (cast(typeof(&_vfuncGetActionTramp))_klass.getAction)(manager, path);
            return typeof(return).init;
          }

          gid.gtk3.action.Action _dretval;
          string _path = path.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetAction(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.vfuncGetAction");
          }
          auto _retval = _dretval ? cast(GtkAction*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getAction = cast(typeof(_klass.getAction))&_vfuncGetActionTramp;
        break;
      }
      case "get_widget":
      {
        static extern(C) GtkWidget* _vfuncGetWidgetTramp(GtkUIManager* manager, const(char)* path) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.uimanager.UIManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkUIManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.getWidget)
              return (cast(typeof(&_vfuncGetWidgetTramp))_klass.getWidget)(manager, path);
            return typeof(return).init;
          }

          gid.gtk3.widget.Widget _dretval;
          string _path = path.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetWidget(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.vfuncGetWidget");
          }
          auto _retval = _dretval ? cast(GtkWidget*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getWidget = cast(typeof(_klass.getWidget))&_vfuncGetWidgetTramp;
        break;
      }
      case "post_activate":
      {
        static extern(C) void _vfuncPostActivateTramp(GtkUIManager* manager, GtkAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.uimanager.UIManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkUIManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.postActivate)
              return (cast(typeof(&_vfuncPostActivateTramp))_klass.postActivate)(manager, action);
            return;
          }

          try
          {
            _obj.vfuncPostActivate(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.action.Action)(cast(void*)action, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.vfuncPostActivate");
          }
        }

        _klass.postActivate = cast(typeof(_klass.postActivate))&_vfuncPostActivateTramp;
        break;
      }
      case "pre_activate":
      {
        static extern(C) void _vfuncPreActivateTramp(GtkUIManager* manager, GtkAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.uimanager.UIManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkUIManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.preActivate)
              return (cast(typeof(&_vfuncPreActivateTramp))_klass.preActivate)(manager, action);
            return;
          }

          try
          {
            _obj.vfuncPreActivate(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.action.Action)(cast(void*)action, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.uimanager.UIManager.vfuncPreActivate");
          }
        }

        _klass.preActivate = cast(typeof(_klass.preActivate))&_vfuncPreActivateTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.uimanager.UIManager]
class UIManagerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk3.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();

  /**
      Set `addTearoffs` property.
      Params:
        propval = The "add-tearoffs" property controls whether generated menus
          have tearoff menu items.
          
          Note that this only affects regular menus. Generated popup
          menus never have tearoff menu items.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Tearoff menus are deprecated and should not
            be used in newly written code.
  */
  T addTearoffs(bool propval) nothrow
  {
    return setProperty("add-tearoffs", propval);
  }
}

/// Fluent builder for [gid.gtk3.uimanager.UIManager]
final class UIManagerGidBuilder : UIManagerGidBuilderImpl!UIManagerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UIManager build() nothrow
  {
    return new UIManager(cast(void*)createGObject(UIManager._getGType), Yes.Take);
  }
}
