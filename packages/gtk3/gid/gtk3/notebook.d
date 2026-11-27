/// Module for [Notebook] class
module gid.gtk3.notebook;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    The #GtkNotebook widget is a #GtkContainer whose children are pages that
    can be switched between using tab labels along one edge.
    
    There are many configuration options for GtkNotebook. Among other
    things, you can choose on which edge the tabs appear
    (see [gid.gtk4.notebook.Notebook.setTabPos]), whether, if there are too many
    tabs to fit the notebook should be made bigger or scrolling
    arrows added (see [gid.gtk4.notebook.Notebook.setScrollable]), and whether there
    will be a popup menu allowing the users to switch pages.
    (see [gid.gtk4.notebook.Notebook.popupEnable], [gid.gtk4.notebook.Notebook.popupDisable])
    
    # GtkNotebook as GtkBuildable
    
    The GtkNotebook implementation of the #GtkBuildable interface
    supports placing children into tabs by specifying “tab” as the
    “type” attribute of a `<child>` element. Note that the content
    of the tab must be created before the tab can be filled.
    A tab child can be specified without specifying a `<child>`
    type attribute.
    
    To add a child widget in the notebooks action area, specify
    "action-start" or “action-end” as the “type” attribute of the
    `<child>` element.
    
    An example of a UI definition fragment with GtkNotebook:
    
    ```xml
    <object class="GtkNotebook">
      <child>
        <object class="GtkLabel" id="notebook-content">
          <property name="label">Content</property>
        </object>
      </child>
      <child type="tab">
        <object class="GtkLabel" id="notebook-tab">
          <property name="label">Tab</property>
        </object>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```plain
    notebook
    ├── header.top
    │   ├── [<action widget>]
    │   ├── tabs
    │   │   ├── [arrow]
    │   │   ├── tab
    │   │   │   ╰── <tab label>
    ┊   ┊   ┊
    │   │   ├── tab[.reorderable-page]
    │   │   │   ╰── <tab label>
    │   │   ╰── [arrow]
    │   ╰── [<action widget>]
    │
    ╰── stack
        ├── <child>
        ┊
        ╰── <child>
    ```
    
    GtkNotebook has a main CSS node with name notebook, a subnode
    with name header and below that a subnode with name tabs which
    contains one subnode per tab with name tab.
    
    If action widgets are present, their CSS nodes are placed next
    to the tabs node. If the notebook is scrollable, CSS nodes with
    name arrow are placed as first and last child of the tabs node.
    
    The main node gets the .frame style class when the notebook
    has a border (see [gid.gtk4.notebook.Notebook.setShowBorder]).
    
    The header node gets one of the style class .top, .bottom,
    .left or .right, depending on where the tabs are placed. For
    reorderable pages, the tab node gets the .reorderable-page class.
    
    A tab node gets the .dnd style class while it is moved with drag-and-drop.
    
    The nodes are always arranged from left-to-right, regarldess of text direction.
*/
@gidGir("Notebook", "NotebookClass")
class Notebook : gid.gtk3.container.Container
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
    return cast(void function())gtk_notebook_get_type != &gidSymbolNotFound ? gtk_notebook_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkNotebook";
  }

  /** Returns `this`, for use in `with` statements. */
  override Notebook self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.notebook.Notebook]
      Returns: New builder object
  */
  static NotebookGidBuilder builder() nothrow
  {
    return new NotebookGidBuilder;
  }

  /** */
  @property bool enablePopup() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("enable-popup");
  }

  /** */
  @property void enablePopup(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("enable-popup", propval);
  }

  /**
      Get `groupName` property.
      Returns: Group name for tab drag and drop.
  */
  @property string groupName() nothrow
  {
    return getGroupName();
  }

  /**
      Set `groupName` property.
      Params:
        propval = Group name for tab drag and drop.
  */
  @property void groupName(string propval) nothrow
  {
    setGroupName(propval);
  }

  /** */
  @property int page() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("page");
  }

  /** */
  @property void page(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("page", propval);
  }

  /** */
  @property bool scrollable() nothrow
  {
    return getScrollable();
  }

  /** */
  @property void scrollable(bool propval) nothrow
  {
    setScrollable(propval);
  }

  /** */
  @property bool showBorder() nothrow
  {
    return getShowBorder();
  }

  /** */
  @property void showBorder(bool propval) nothrow
  {
    setShowBorder(propval);
  }

  /** */
  @property bool showTabs() nothrow
  {
    return getShowTabs();
  }

  /** */
  @property void showTabs(bool propval) nothrow
  {
    setShowTabs(propval);
  }

  /** */
  @property gid.gtk3.types.PositionType tabPos() nothrow
  {
    return getTabPos();
  }

  /** */
  @property void tabPos(gid.gtk3.types.PositionType propval) nothrow
  {
    setTabPos(propval);
  }

  /**
      Creates a new #GtkNotebook widget with no pages.
      Returns: the newly created #GtkNotebook
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
      _cretval = gtk_notebook_new();
      this(_cretval, No.Take);
    }
  }

  /** */
  protected bool vfuncChangeCurrentPage(int offset)
  {
    auto _klass = cast(GtkNotebookClass*)_vfuncClass;
    if (!_klass.changeCurrentPage)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.changeCurrentPage(cast(GtkNotebook*)this._cPtr, offset);
    return _retval;
  }

  /** */
  protected bool vfuncFocusTab(gid.gtk3.types.NotebookTab type)
  {
    auto _klass = cast(GtkNotebookClass*)_vfuncClass;
    if (!_klass.focusTab)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.focusTab(cast(GtkNotebook*)this._cPtr, type);
    return _retval;
  }

  /** */
  protected int vfuncInsertPage(gid.gtk3.widget.Widget child, gid.gtk3.widget.Widget tabLabel, gid.gtk3.widget.Widget menuLabel, int position)
  {
    auto _klass = cast(GtkNotebookClass*)_vfuncClass;
    if (!_klass.insertPage)
      return typeof(return).init;

    int _retval;
    _retval = _klass.insertPage(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel._cPtr(No.Dup) : null, menuLabel ? cast(GtkWidget*)menuLabel._cPtr(No.Dup) : null, position);
    return _retval;
  }

  /** */
  protected void vfuncMoveFocusOut(gid.gtk3.types.DirectionType direction)
  {
    auto _klass = cast(GtkNotebookClass*)_vfuncClass;
    if (!_klass.moveFocusOut)
      return;

    _klass.moveFocusOut(cast(GtkNotebook*)this._cPtr, direction);
  }

  /** */
  protected void vfuncPageAdded(gid.gtk3.widget.Widget child, uint pageNum)
  {
    auto _klass = cast(GtkNotebookClass*)_vfuncClass;
    if (!_klass.pageAdded)
      return;

    _klass.pageAdded(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, pageNum);
  }

  /** */
  protected void vfuncPageRemoved(gid.gtk3.widget.Widget child, uint pageNum)
  {
    auto _klass = cast(GtkNotebookClass*)_vfuncClass;
    if (!_klass.pageRemoved)
      return;

    _klass.pageRemoved(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, pageNum);
  }

  /** */
  protected void vfuncPageReordered(gid.gtk3.widget.Widget child, uint pageNum)
  {
    auto _klass = cast(GtkNotebookClass*)_vfuncClass;
    if (!_klass.pageReordered)
      return;

    _klass.pageReordered(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, pageNum);
  }

  /** */
  protected bool vfuncReorderTab(gid.gtk3.types.DirectionType direction, bool moveToLast)
  {
    auto _klass = cast(GtkNotebookClass*)_vfuncClass;
    if (!_klass.reorderTab)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.reorderTab(cast(GtkNotebook*)this._cPtr, direction, moveToLast);
    return _retval;
  }

  /** */
  protected bool vfuncSelectPage(bool moveFocus)
  {
    auto _klass = cast(GtkNotebookClass*)_vfuncClass;
    if (!_klass.selectPage)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.selectPage(cast(GtkNotebook*)this._cPtr, moveFocus);
    return _retval;
  }

  /** */
  protected void vfuncSwitchPage(gid.gtk3.widget.Widget page, uint pageNum)
  {
    auto _klass = cast(GtkNotebookClass*)_vfuncClass;
    if (!_klass.switchPage)
      return;

    _klass.switchPage(cast(GtkNotebook*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null, pageNum);
  }

  /**
      Appends a page to notebook.
  
      Params:
        child = the #GtkWidget to use as the contents of the page
        tabLabel = the #GtkWidget to be used as the label
              for the page, or null to use the default label, “page N”
      Returns: the index (starting from 0) of the appended
            page in the notebook, or -1 if function fails
  */
  int appendPage(gid.gtk3.widget.Widget child, gid.gtk3.widget.Widget tabLabel = null) nothrow
  {
    int _retval;
    _retval = gtk_notebook_append_page(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Appends a page to notebook, specifying the widget to use as the
      label in the popup menu.
  
      Params:
        child = the #GtkWidget to use as the contents of the page
        tabLabel = the #GtkWidget to be used as the label
              for the page, or null to use the default label, “page N”
        menuLabel = the widget to use as a label for the
              page-switch menu, if that is enabled. If null, and tab_label
              is a #GtkLabel or null, then the menu label will be a newly
              created label with the same text as tab_label; if tab_label
              is not a #GtkLabel, menu_label must be specified if the
              page-switch menu is to be used.
      Returns: the index (starting from 0) of the appended
            page in the notebook, or -1 if function fails
  */
  int appendPageMenu(gid.gtk3.widget.Widget child, gid.gtk3.widget.Widget tabLabel = null, gid.gtk3.widget.Widget menuLabel = null) nothrow
  {
    int _retval;
    _retval = gtk_notebook_append_page_menu(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel._cPtr(No.Dup) : null, menuLabel ? cast(GtkWidget*)menuLabel._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes the child from the notebook.
      
      This function is very similar to [gid.gtk3.container.Container.remove],
      but additionally informs the notebook that the removal
      is happening as part of a tab DND operation, which should
      not be cancelled.
  
      Params:
        child = a child
  */
  void detachTab(gid.gtk3.widget.Widget child) nothrow
  {
    gtk_notebook_detach_tab(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Gets one of the action widgets. See [gid.gtk4.notebook.Notebook.setActionWidget].
  
      Params:
        packType = pack type of the action widget to receive
      Returns: The action widget with the given
        pack_type or null when this action widget has not been set
  */
  gid.gtk3.widget.Widget getActionWidget(gid.gtk3.types.PackType packType) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_get_action_widget(cast(GtkNotebook*)this._cPtr, packType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the page number of the current page.
      Returns: the index (starting from 0) of the current
            page in the notebook. If the notebook has no pages,
            then -1 will be returned.
  */
  int getCurrentPage() nothrow
  {
    int _retval;
    _retval = gtk_notebook_get_current_page(cast(GtkNotebook*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current group name for notebook.
      Returns: the group name, or null if none is set
  */
  string getGroupName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_notebook_get_group_name(cast(GtkNotebook*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the menu label widget of the page containing child.
  
      Params:
        child = a widget contained in a page of notebook
      Returns: the menu label, or null if the
        notebook page does not have a menu label other than the default (the tab
        label).
  */
  gid.gtk3.widget.Widget getMenuLabel(gid.gtk3.widget.Widget child) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_get_menu_label(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the text of the menu label for the page containing
      child.
  
      Params:
        child = the child widget of a page of the notebook.
      Returns: the text of the tab label, or null if the widget does
        not have a menu label other than the default menu label, or the menu label
        widget is not a #GtkLabel. The string is owned by the widget and must not be
        freed.
  */
  string getMenuLabelText(gid.gtk3.widget.Widget child) nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_notebook_get_menu_label_text(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of pages in a notebook.
      Returns: the number of pages in the notebook
  */
  int getNPages() nothrow
  {
    int _retval;
    _retval = gtk_notebook_get_n_pages(cast(GtkNotebook*)this._cPtr);
    return _retval;
  }

  /**
      Returns the child widget contained in page number page_num.
  
      Params:
        pageNum = the index of a page in the notebook, or -1
              to get the last page
      Returns: the child widget, or null if page_num
        is out of bounds
  */
  gid.gtk3.widget.Widget getNthPage(int pageNum) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_get_nth_page(cast(GtkNotebook*)this._cPtr, pageNum);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the tab label area has arrows for scrolling.
      See [gid.gtk4.notebook.Notebook.setScrollable].
      Returns: true if arrows for scrolling are present
  */
  bool getScrollable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_notebook_get_scrollable(cast(GtkNotebook*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether a bevel will be drawn around the notebook pages.
      See [gid.gtk4.notebook.Notebook.setShowBorder].
      Returns: true if the bevel is drawn
  */
  bool getShowBorder() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_notebook_get_show_border(cast(GtkNotebook*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the tabs of the notebook are shown.
      See [gid.gtk4.notebook.Notebook.setShowTabs].
      Returns: true if the tabs are shown
  */
  bool getShowTabs() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_notebook_get_show_tabs(cast(GtkNotebook*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the tab contents can be detached from notebook.
  
      Params:
        child = a child #GtkWidget
      Returns: true if the tab is detachable.
  */
  bool getTabDetachable(gid.gtk3.widget.Widget child) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_notebook_get_tab_detachable(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the horizontal width of a tab border.
      Returns: horizontal width of a tab border
  
      Deprecated: this function returns zero
  */
  ushort getTabHborder() nothrow
  {
    ushort _retval;
    _retval = gtk_notebook_get_tab_hborder(cast(GtkNotebook*)this._cPtr);
    return _retval;
  }

  /**
      Returns the tab label widget for the page child.
      null is returned if child is not in notebook or
      if no tab label has specifically been set for child.
  
      Params:
        child = the page
      Returns: the tab label
  */
  gid.gtk3.widget.Widget getTabLabel(gid.gtk3.widget.Widget child) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_get_tab_label(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the text of the tab label for the page containing
      child.
  
      Params:
        child = a widget contained in a page of notebook
      Returns: the text of the tab label, or null if the tab label
        widget is not a #GtkLabel. The string is owned by the widget and must not be
        freed.
  */
  string getTabLabelText(gid.gtk3.widget.Widget child) nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_notebook_get_tab_label_text(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the edge at which the tabs for switching pages in the
      notebook are drawn.
      Returns: the edge at which the tabs are drawn
  */
  gid.gtk3.types.PositionType getTabPos() nothrow
  {
    GtkPositionType _cretval;
    _cretval = gtk_notebook_get_tab_pos(cast(GtkNotebook*)this._cPtr);
    gid.gtk3.types.PositionType _retval = cast(gid.gtk3.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Gets whether the tab can be reordered via drag and drop or not.
  
      Params:
        child = a child #GtkWidget
      Returns: true if the tab is reorderable.
  */
  bool getTabReorderable(gid.gtk3.widget.Widget child) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_notebook_get_tab_reorderable(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the vertical width of a tab border.
      Returns: vertical width of a tab border
  
      Deprecated: this function returns zero
  */
  ushort getTabVborder() nothrow
  {
    ushort _retval;
    _retval = gtk_notebook_get_tab_vborder(cast(GtkNotebook*)this._cPtr);
    return _retval;
  }

  /**
      Insert a page into notebook at the given position.
  
      Params:
        child = the #GtkWidget to use as the contents of the page
        tabLabel = the #GtkWidget to be used as the label
              for the page, or null to use the default label, “page N”
        position = the index (starting at 0) at which to insert the page,
              or -1 to append the page after all other pages
      Returns: the index (starting from 0) of the inserted
            page in the notebook, or -1 if function fails
  */
  int insertPage(gid.gtk3.widget.Widget child, gid.gtk3.widget.Widget tabLabel, int position) nothrow
  {
    int _retval;
    _retval = gtk_notebook_insert_page(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel._cPtr(No.Dup) : null, position);
    return _retval;
  }

  /**
      Insert a page into notebook at the given position, specifying
      the widget to use as the label in the popup menu.
  
      Params:
        child = the #GtkWidget to use as the contents of the page
        tabLabel = the #GtkWidget to be used as the label
              for the page, or null to use the default label, “page N”
        menuLabel = the widget to use as a label for the
              page-switch menu, if that is enabled. If null, and tab_label
              is a #GtkLabel or null, then the menu label will be a newly
              created label with the same text as tab_label; if tab_label
              is not a #GtkLabel, menu_label must be specified if the
              page-switch menu is to be used.
        position = the index (starting at 0) at which to insert the page,
              or -1 to append the page after all other pages.
      Returns: the index (starting from 0) of the inserted
            page in the notebook
  */
  int insertPageMenu(gid.gtk3.widget.Widget child, gid.gtk3.widget.Widget tabLabel, gid.gtk3.widget.Widget menuLabel, int position) nothrow
  {
    int _retval;
    _retval = gtk_notebook_insert_page_menu(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel._cPtr(No.Dup) : null, menuLabel ? cast(GtkWidget*)menuLabel._cPtr(No.Dup) : null, position);
    return _retval;
  }

  /**
      Switches to the next page. Nothing happens if the current page is
      the last page.
  */
  void nextPage() nothrow
  {
    gtk_notebook_next_page(cast(GtkNotebook*)this._cPtr);
  }

  /**
      Finds the index of the page which contains the given child
      widget.
  
      Params:
        child = a #GtkWidget
      Returns: the index of the page containing child, or
            -1 if child is not in the notebook
  */
  int pageNum(gid.gtk3.widget.Widget child) nothrow
  {
    int _retval;
    _retval = gtk_notebook_page_num(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Disables the popup menu.
  */
  void popupDisable() nothrow
  {
    gtk_notebook_popup_disable(cast(GtkNotebook*)this._cPtr);
  }

  /**
      Enables the popup menu: if the user clicks with the right
      mouse button on the tab labels, a menu with all the pages
      will be popped up.
  */
  void popupEnable() nothrow
  {
    gtk_notebook_popup_enable(cast(GtkNotebook*)this._cPtr);
  }

  /**
      Prepends a page to notebook.
  
      Params:
        child = the #GtkWidget to use as the contents of the page
        tabLabel = the #GtkWidget to be used as the label
              for the page, or null to use the default label, “page N”
      Returns: the index (starting from 0) of the prepended
            page in the notebook, or -1 if function fails
  */
  int prependPage(gid.gtk3.widget.Widget child, gid.gtk3.widget.Widget tabLabel = null) nothrow
  {
    int _retval;
    _retval = gtk_notebook_prepend_page(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Prepends a page to notebook, specifying the widget to use as the
      label in the popup menu.
  
      Params:
        child = the #GtkWidget to use as the contents of the page
        tabLabel = the #GtkWidget to be used as the label
              for the page, or null to use the default label, “page N”
        menuLabel = the widget to use as a label for the
              page-switch menu, if that is enabled. If null, and tab_label
              is a #GtkLabel or null, then the menu label will be a newly
              created label with the same text as tab_label; if tab_label
              is not a #GtkLabel, menu_label must be specified if the
              page-switch menu is to be used.
      Returns: the index (starting from 0) of the prepended
            page in the notebook, or -1 if function fails
  */
  int prependPageMenu(gid.gtk3.widget.Widget child, gid.gtk3.widget.Widget tabLabel = null, gid.gtk3.widget.Widget menuLabel = null) nothrow
  {
    int _retval;
    _retval = gtk_notebook_prepend_page_menu(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel._cPtr(No.Dup) : null, menuLabel ? cast(GtkWidget*)menuLabel._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Switches to the previous page. Nothing happens if the current page
      is the first page.
  */
  void prevPage() nothrow
  {
    gtk_notebook_prev_page(cast(GtkNotebook*)this._cPtr);
  }

  /**
      Removes a page from the notebook given its index
      in the notebook.
  
      Params:
        pageNum = the index of a notebook page, starting
              from 0. If -1, the last page will be removed.
  */
  void removePage(int pageNum) nothrow
  {
    gtk_notebook_remove_page(cast(GtkNotebook*)this._cPtr, pageNum);
  }

  /**
      Reorders the page containing child, so that it appears in position
      position. If position is greater than or equal to the number of
      children in the list or negative, child will be moved to the end
      of the list.
  
      Params:
        child = the child to move
        position = the new position, or -1 to move to the end
  */
  void reorderChild(gid.gtk3.widget.Widget child, int position) nothrow
  {
    gtk_notebook_reorder_child(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, position);
  }

  /**
      Sets widget as one of the action widgets. Depending on the pack type
      the widget will be placed before or after the tabs. You can use
      a #GtkBox if you need to pack more than one widget on the same side.
      
      Note that action widgets are “internal” children of the notebook and thus
      not included in the list returned from [gid.gtk3.container.Container.foreach_].
  
      Params:
        widget = a #GtkWidget
        packType = pack type of the action widget
  */
  void setActionWidget(gid.gtk3.widget.Widget widget, gid.gtk3.types.PackType packType) nothrow
  {
    gtk_notebook_set_action_widget(cast(GtkNotebook*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, packType);
  }

  /**
      Switches to the page number page_num.
      
      Note that due to historical reasons, GtkNotebook refuses
      to switch to a page unless the child widget is visible.
      Therefore, it is recommended to show child widgets before
      adding them to a notebook.
  
      Params:
        pageNum = index of the page to switch to, starting from 0.
              If negative, the last page will be used. If greater
              than the number of pages in the notebook, nothing
              will be done.
  */
  void setCurrentPage(int pageNum) nothrow
  {
    gtk_notebook_set_current_page(cast(GtkNotebook*)this._cPtr, pageNum);
  }

  /**
      Sets a group name for notebook.
      
      Notebooks with the same name will be able to exchange tabs
      via drag and drop. A notebook with a null group name will
      not be able to exchange tabs with any other notebook.
  
      Params:
        groupName = the name of the notebook group,
              or null to unset it
  */
  void setGroupName(string groupName = null) nothrow
  {
    const(char)* _groupName = groupName.toCString!(No.Malloc, Yes.Nullable);
    gtk_notebook_set_group_name(cast(GtkNotebook*)this._cPtr, _groupName);
  }

  /**
      Changes the menu label for the page containing child.
  
      Params:
        child = the child widget
        menuLabel = the menu label, or null for default
  */
  void setMenuLabel(gid.gtk3.widget.Widget child, gid.gtk3.widget.Widget menuLabel = null) nothrow
  {
    gtk_notebook_set_menu_label(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, menuLabel ? cast(GtkWidget*)menuLabel._cPtr(No.Dup) : null);
  }

  /**
      Creates a new label and sets it as the menu label of child.
  
      Params:
        child = the child widget
        menuText = the label text
  */
  void setMenuLabelText(gid.gtk3.widget.Widget child, string menuText) nothrow
  {
    const(char)* _menuText = menuText.toCString!(No.Malloc, No.Nullable);
    gtk_notebook_set_menu_label_text(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _menuText);
  }

  /**
      Sets whether the tab label area will have arrows for
      scrolling if there are too many tabs to fit in the area.
  
      Params:
        scrollable = true if scroll arrows should be added
  */
  void setScrollable(bool scrollable) nothrow
  {
    gtk_notebook_set_scrollable(cast(GtkNotebook*)this._cPtr, scrollable);
  }

  /**
      Sets whether a bevel will be drawn around the notebook pages.
      This only has a visual effect when the tabs are not shown.
      See [gid.gtk4.notebook.Notebook.setShowTabs].
  
      Params:
        showBorder = true if a bevel should be drawn around the notebook
  */
  void setShowBorder(bool showBorder) nothrow
  {
    gtk_notebook_set_show_border(cast(GtkNotebook*)this._cPtr, showBorder);
  }

  /**
      Sets whether to show the tabs for the notebook or not.
  
      Params:
        showTabs = true if the tabs should be shown
  */
  void setShowTabs(bool showTabs) nothrow
  {
    gtk_notebook_set_show_tabs(cast(GtkNotebook*)this._cPtr, showTabs);
  }

  /**
      Sets whether the tab can be detached from notebook to another
      notebook or widget.
      
      Note that 2 notebooks must share a common group identificator
      (see [gid.gtk4.notebook.Notebook.setGroupName]) to allow automatic tabs
      interchange between them.
      
      If you want a widget to interact with a notebook through DnD
      (i.e.: accept dragged tabs from it) it must be set as a drop
      destination and accept the target “GTK_NOTEBOOK_TAB”. The notebook
      will fill the selection with a GtkWidget** pointing to the child
      widget that corresponds to the dropped tab.
      
      Note that you should use [gid.gtk4.notebook.Notebook.detachTab] instead
      of [gid.gtk3.container.Container.remove] if you want to remove the tab from
      the source notebook as part of accepting a drop. Otherwise,
      the source notebook will think that the dragged tab was
      removed from underneath the ongoing drag operation, and
      will initiate a drag cancel animation.
      
      ```c
       static void
       on_drag_data_received (GtkWidget        *widget,
                              GdkDragContext   *context,
                              gint              x,
                              gint              y,
                              GtkSelectionData *data,
                              guint             info,
                              guint             time,
                              gpointer          user_data)
       {
         GtkWidget *notebook;
         GtkWidget **child;
      
         notebook = gtk_drag_get_source_widget (context);
         child = (void*) gtk_selection_data_get_data (data);
      
         // process_widget (*child);
      
         gtk_notebook_detach_tab (GTK_NOTEBOOK (notebook), *child);
       }
      ```
      
      If you want a notebook to accept drags from other widgets,
      you will have to set your own DnD code to do it.
  
      Params:
        child = a child #GtkWidget
        detachable = whether the tab is detachable or not
  */
  void setTabDetachable(gid.gtk3.widget.Widget child, bool detachable) nothrow
  {
    gtk_notebook_set_tab_detachable(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, detachable);
  }

  /**
      Changes the tab label for child.
      If null is specified for tab_label, then the page will
      have the label “page N”.
  
      Params:
        child = the page
        tabLabel = the tab label widget to use, or null
              for default tab label
  */
  void setTabLabel(gid.gtk3.widget.Widget child, gid.gtk3.widget.Widget tabLabel = null) nothrow
  {
    gtk_notebook_set_tab_label(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel._cPtr(No.Dup) : null);
  }

  /**
      Creates a new label and sets it as the tab label for the page
      containing child.
  
      Params:
        child = the page
        tabText = the label text
  */
  void setTabLabelText(gid.gtk3.widget.Widget child, string tabText) nothrow
  {
    const(char)* _tabText = tabText.toCString!(No.Malloc, No.Nullable);
    gtk_notebook_set_tab_label_text(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _tabText);
  }

  /**
      Sets the edge at which the tabs for switching pages in the
      notebook are drawn.
  
      Params:
        pos = the edge to draw the tabs at
  */
  void setTabPos(gid.gtk3.types.PositionType pos) nothrow
  {
    gtk_notebook_set_tab_pos(cast(GtkNotebook*)this._cPtr, pos);
  }

  /**
      Sets whether the notebook tab can be reordered
      via drag and drop or not.
  
      Params:
        child = a child #GtkWidget
        reorderable = whether the tab is reorderable or not
  */
  void setTabReorderable(gid.gtk3.widget.Widget child, bool reorderable) nothrow
  {
    gtk_notebook_set_tab_reorderable(cast(GtkNotebook*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, reorderable);
  }

  /**
      Connect to `ChangeCurrentPage` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(int object, gid.gtk3.notebook.Notebook notebook)`
  
          `object`  (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChangeCurrentPage(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.notebook.Notebook)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.changeCurrentPage");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-current-page", closure, after);
  }

  /**
      Connect to `CreateWindow` signal.
  
      The ::create-window signal is emitted when a detachable
        tab is dropped on the root window.
        
        A handler for this signal can create a window containing
        a notebook where the tab will be attached. It is also
        responsible for moving/resizing the window and adding the
        necessary properties to the notebook (e.g. the
        #GtkNotebook:group-name ).
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gtk3.notebook.Notebook callback(gid.gtk3.widget.Widget page, int x, int y, gid.gtk3.notebook.Notebook notebook)`
  
          `page` the tab of notebook that is being detached (optional)
  
          `x` the X coordinate where the drop happens (optional)
  
          `y` the Y coordinate where the drop happens (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
          `Returns` a #GtkNotebook that page should be
                added to, or null.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCreateWindow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T : gid.gtk3.notebook.Notebook)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.notebook.Notebook)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gtk3.notebook.Notebook _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.createWindow");
      }

      setVal!(gid.gtk3.notebook.Notebook)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-window", closure, after);
  }

  /**
      Connect to `FocusTab` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.types.NotebookTab object, gid.gtk3.notebook.Notebook notebook)`
  
          `object`  (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFocusTab(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.NotebookTab)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.notebook.Notebook)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.focusTab");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus-tab", closure, after);
  }

  /**
      Connect to `MoveFocusOut` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.DirectionType object, gid.gtk3.notebook.Notebook notebook)`
  
          `object`  (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveFocusOut(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.notebook.Notebook)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.moveFocusOut");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-focus-out", closure, after);
  }

  /**
      Connect to `PageAdded` signal.
  
      the ::page-added signal is emitted in the notebook
        right after a page is added to the notebook.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget child, uint pageNum, gid.gtk3.notebook.Notebook notebook)`
  
          `child` the child #GtkWidget affected (optional)
  
          `pageNum` the new page number for child (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPageAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.notebook.Notebook)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.pageAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-added", closure, after);
  }

  /**
      Connect to `PageRemoved` signal.
  
      the ::page-removed signal is emitted in the notebook
        right after a page is removed from the notebook.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget child, uint pageNum, gid.gtk3.notebook.Notebook notebook)`
  
          `child` the child #GtkWidget affected (optional)
  
          `pageNum` the child page number (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPageRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.notebook.Notebook)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.pageRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-removed", closure, after);
  }

  /**
      Connect to `PageReordered` signal.
  
      the ::page-reordered signal is emitted in the notebook
        right after a page has been reordered.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget child, uint pageNum, gid.gtk3.notebook.Notebook notebook)`
  
          `child` the child #GtkWidget affected (optional)
  
          `pageNum` the new page number for child (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPageReordered(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.notebook.Notebook)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.pageReordered");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-reordered", closure, after);
  }

  /**
      Connect to `ReorderTab` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.types.DirectionType object, bool p0, gid.gtk3.notebook.Notebook notebook)`
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectReorderTab(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.notebook.Notebook)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.reorderTab");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("reorder-tab", closure, after);
  }

  /**
      Connect to `SelectPage` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(bool object, gid.gtk3.notebook.Notebook notebook)`
  
          `object`  (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectPage(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.notebook.Notebook)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.selectPage");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-page", closure, after);
  }

  /**
      Connect to `SwitchPage` signal.
  
      Emitted when the user or a function changes the current page.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget page, uint pageNum, gid.gtk3.notebook.Notebook notebook)`
  
          `page` the new current page (optional)
  
          `pageNum` the index of the page (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSwitchPage(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.notebook.Notebook)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.switchPage");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("switch-page", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Notebook
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.notebook.Notebook), T.stringof ~ " is not derived from gid.gtk3.notebook.Notebook");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChangeCurrentPage", true)[0]) == gid.gtk3.notebook.Notebook))
      _installVfunc(klass, "change_current_page");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFocusTab", true)[0]) == gid.gtk3.notebook.Notebook))
      _installVfunc(klass, "focus_tab");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertPage", true)[0]) == gid.gtk3.notebook.Notebook))
      _installVfunc(klass, "insert_page");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveFocusOut", true)[0]) == gid.gtk3.notebook.Notebook))
      _installVfunc(klass, "move_focus_out");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPageAdded", true)[0]) == gid.gtk3.notebook.Notebook))
      _installVfunc(klass, "page_added");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPageRemoved", true)[0]) == gid.gtk3.notebook.Notebook))
      _installVfunc(klass, "page_removed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPageReordered", true)[0]) == gid.gtk3.notebook.Notebook))
      _installVfunc(klass, "page_reordered");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReorderTab", true)[0]) == gid.gtk3.notebook.Notebook))
      _installVfunc(klass, "reorder_tab");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectPage", true)[0]) == gid.gtk3.notebook.Notebook))
      _installVfunc(klass, "select_page");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSwitchPage", true)[0]) == gid.gtk3.notebook.Notebook))
      _installVfunc(klass, "switch_page");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkNotebookClass*)klass;

    switch (vfunc)
    {
      case "change_current_page":
      {
        static extern(C) gboolean _vfuncChangeCurrentPageTramp(GtkNotebook* notebook, int offset) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.notebook.Notebook)(cast(void*)notebook);
          if (!_obj)
          {
            auto _klass = cast(GtkNotebookClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)notebook);
            if (_klass.changeCurrentPage)
              return (cast(typeof(&_vfuncChangeCurrentPageTramp))_klass.changeCurrentPage)(notebook, offset);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncChangeCurrentPage(offset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.vfuncChangeCurrentPage");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.changeCurrentPage = cast(typeof(_klass.changeCurrentPage))&_vfuncChangeCurrentPageTramp;
        break;
      }
      case "focus_tab":
      {
        static extern(C) gboolean _vfuncFocusTabTramp(GtkNotebook* notebook, GtkNotebookTab type) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.notebook.Notebook)(cast(void*)notebook);
          if (!_obj)
          {
            auto _klass = cast(GtkNotebookClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)notebook);
            if (_klass.focusTab)
              return (cast(typeof(&_vfuncFocusTabTramp))_klass.focusTab)(notebook, type);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncFocusTab(type);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.vfuncFocusTab");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.focusTab = cast(typeof(_klass.focusTab))&_vfuncFocusTabTramp;
        break;
      }
      case "insert_page":
      {
        static extern(C) int _vfuncInsertPageTramp(GtkNotebook* notebook, GtkWidget* child, GtkWidget* tabLabel, GtkWidget* menuLabel, int position) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.notebook.Notebook)(cast(void*)notebook);
          if (!_obj)
          {
            auto _klass = cast(GtkNotebookClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)notebook);
            if (_klass.insertPage)
              return (cast(typeof(&_vfuncInsertPageTramp))_klass.insertPage)(notebook, child, tabLabel, menuLabel, position);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncInsertPage(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)child, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)tabLabel, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)menuLabel, No.Take), position);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.vfuncInsertPage");
          }
          return _retval;
        }

        _klass.insertPage = cast(typeof(_klass.insertPage))&_vfuncInsertPageTramp;
        break;
      }
      case "move_focus_out":
      {
        static extern(C) void _vfuncMoveFocusOutTramp(GtkNotebook* notebook, GtkDirectionType direction) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.notebook.Notebook)(cast(void*)notebook);
          if (!_obj)
          {
            auto _klass = cast(GtkNotebookClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)notebook);
            if (_klass.moveFocusOut)
              return (cast(typeof(&_vfuncMoveFocusOutTramp))_klass.moveFocusOut)(notebook, direction);
            return;
          }

          try
          {
            _obj.vfuncMoveFocusOut(direction);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.vfuncMoveFocusOut");
          }
        }

        _klass.moveFocusOut = cast(typeof(_klass.moveFocusOut))&_vfuncMoveFocusOutTramp;
        break;
      }
      case "page_added":
      {
        static extern(C) void _vfuncPageAddedTramp(GtkNotebook* notebook, GtkWidget* child, uint pageNum) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.notebook.Notebook)(cast(void*)notebook);
          if (!_obj)
          {
            auto _klass = cast(GtkNotebookClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)notebook);
            if (_klass.pageAdded)
              return (cast(typeof(&_vfuncPageAddedTramp))_klass.pageAdded)(notebook, child, pageNum);
            return;
          }

          try
          {
            _obj.vfuncPageAdded(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)child, No.Take), pageNum);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.vfuncPageAdded");
          }
        }

        _klass.pageAdded = cast(typeof(_klass.pageAdded))&_vfuncPageAddedTramp;
        break;
      }
      case "page_removed":
      {
        static extern(C) void _vfuncPageRemovedTramp(GtkNotebook* notebook, GtkWidget* child, uint pageNum) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.notebook.Notebook)(cast(void*)notebook);
          if (!_obj)
          {
            auto _klass = cast(GtkNotebookClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)notebook);
            if (_klass.pageRemoved)
              return (cast(typeof(&_vfuncPageRemovedTramp))_klass.pageRemoved)(notebook, child, pageNum);
            return;
          }

          try
          {
            _obj.vfuncPageRemoved(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)child, No.Take), pageNum);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.vfuncPageRemoved");
          }
        }

        _klass.pageRemoved = cast(typeof(_klass.pageRemoved))&_vfuncPageRemovedTramp;
        break;
      }
      case "page_reordered":
      {
        static extern(C) void _vfuncPageReorderedTramp(GtkNotebook* notebook, GtkWidget* child, uint pageNum) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.notebook.Notebook)(cast(void*)notebook);
          if (!_obj)
          {
            auto _klass = cast(GtkNotebookClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)notebook);
            if (_klass.pageReordered)
              return (cast(typeof(&_vfuncPageReorderedTramp))_klass.pageReordered)(notebook, child, pageNum);
            return;
          }

          try
          {
            _obj.vfuncPageReordered(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)child, No.Take), pageNum);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.vfuncPageReordered");
          }
        }

        _klass.pageReordered = cast(typeof(_klass.pageReordered))&_vfuncPageReorderedTramp;
        break;
      }
      case "reorder_tab":
      {
        static extern(C) gboolean _vfuncReorderTabTramp(GtkNotebook* notebook, GtkDirectionType direction, gboolean moveToLast) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.notebook.Notebook)(cast(void*)notebook);
          if (!_obj)
          {
            auto _klass = cast(GtkNotebookClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)notebook);
            if (_klass.reorderTab)
              return (cast(typeof(&_vfuncReorderTabTramp))_klass.reorderTab)(notebook, direction, moveToLast);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncReorderTab(direction, cast(bool)moveToLast);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.vfuncReorderTab");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.reorderTab = cast(typeof(_klass.reorderTab))&_vfuncReorderTabTramp;
        break;
      }
      case "select_page":
      {
        static extern(C) gboolean _vfuncSelectPageTramp(GtkNotebook* notebook, gboolean moveFocus) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.notebook.Notebook)(cast(void*)notebook);
          if (!_obj)
          {
            auto _klass = cast(GtkNotebookClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)notebook);
            if (_klass.selectPage)
              return (cast(typeof(&_vfuncSelectPageTramp))_klass.selectPage)(notebook, moveFocus);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSelectPage(cast(bool)moveFocus);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.vfuncSelectPage");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.selectPage = cast(typeof(_klass.selectPage))&_vfuncSelectPageTramp;
        break;
      }
      case "switch_page":
      {
        static extern(C) void _vfuncSwitchPageTramp(GtkNotebook* notebook, GtkWidget* page, uint pageNum) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.notebook.Notebook)(cast(void*)notebook);
          if (!_obj)
          {
            auto _klass = cast(GtkNotebookClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)notebook);
            if (_klass.switchPage)
              return (cast(typeof(&_vfuncSwitchPageTramp))_klass.switchPage)(notebook, page, pageNum);
            return;
          }

          try
          {
            _obj.vfuncSwitchPage(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)page, No.Take), pageNum);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.notebook.Notebook.vfuncSwitchPage");
          }
        }

        _klass.switchPage = cast(typeof(_klass.switchPage))&_vfuncSwitchPageTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.notebook.Notebook]
class NotebookGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T
{


  /** */
  T enablePopup(bool propval) nothrow
  {
    return setProperty("enable-popup", propval);
  }

  /**
      Set `groupName` property.
      Params:
        propval = Group name for tab drag and drop.
      Returns: Builder instance for fluent chaining
  */
  T groupName(string propval) nothrow
  {
    return setProperty("group-name", propval);
  }

  /** */
  T page(int propval) nothrow
  {
    return setProperty("page", propval);
  }

  /** */
  T scrollable(bool propval) nothrow
  {
    return setProperty("scrollable", propval);
  }

  /** */
  T showBorder(bool propval) nothrow
  {
    return setProperty("show-border", propval);
  }

  /** */
  T showTabs(bool propval) nothrow
  {
    return setProperty("show-tabs", propval);
  }

  /** */
  T tabPos(gid.gtk3.types.PositionType propval) nothrow
  {
    return setProperty("tab-pos", propval);
  }
}

/// Fluent builder for [gid.gtk3.notebook.Notebook]
final class NotebookGidBuilder : NotebookGidBuilderImpl!NotebookGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Notebook build() nothrow
  {
    return new Notebook(cast(void*)createGObject(Notebook._getGType), Yes.Take);
  }
}
