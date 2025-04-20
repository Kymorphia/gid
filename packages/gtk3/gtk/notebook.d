/// Module for [Notebook] class
module gtk.notebook;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.types;
import gtk.widget;

/**
    The #GtkNotebook widget is a #GtkContainer whose children are pages that
    can be switched between using tab labels along one edge.
    
    There are many configuration options for GtkNotebook. Among other
    things, you can choose on which edge the tabs appear
    (see [gtk.notebook.Notebook.setTabPos]), whether, if there are too many
    tabs to fit the notebook should be made bigger or scrolling
    arrows added (see [gtk.notebook.Notebook.setScrollable]), and whether there
    will be a popup menu allowing the users to switch pages.
    (see [gtk.notebook.Notebook.popupEnable], [gtk.notebook.Notebook.popupDisable])
    
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
    has a border (see [gtk.notebook.Notebook.setShowBorder]).
    
    The header node gets one of the style class .top, .bottom,
    .left or .right, depending on where the tabs are placed. For
    reorderable pages, the tab node gets the .reorderable-page class.
    
    A tab node gets the .dnd style class while it is moved with drag-and-drop.
    
    The nodes are always arranged from left-to-right, regarldess of text direction.
*/
class Notebook : gtk.container.Container
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_notebook_get_type != &gidSymbolNotFound ? gtk_notebook_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Notebook self()
  {
    return this;
  }

  /** */
  @property bool enablePopup()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("enable-popup");
  }

  /** */
  @property void enablePopup(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("enable-popup", propval);
  }

  /**
      Get `groupName` property.
      Returns: Group name for tab drag and drop.
  */
  @property string groupName()
  {
    return getGroupName();
  }

  /**
      Set `groupName` property.
      Params:
        propval = Group name for tab drag and drop.
  */
  @property void groupName(string propval)
  {
    return setGroupName(propval);
  }

  /** */
  @property int page()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("page");
  }

  /** */
  @property void page(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("page", propval);
  }

  /** */
  @property bool scrollable()
  {
    return getScrollable();
  }

  /** */
  @property void scrollable(bool propval)
  {
    return setScrollable(propval);
  }

  /** */
  @property bool showBorder()
  {
    return getShowBorder();
  }

  /** */
  @property void showBorder(bool propval)
  {
    return setShowBorder(propval);
  }

  /** */
  @property bool showTabs()
  {
    return getShowTabs();
  }

  /** */
  @property void showTabs(bool propval)
  {
    return setShowTabs(propval);
  }

  /** */
  @property gtk.types.PositionType tabPos()
  {
    return getTabPos();
  }

  /** */
  @property void tabPos(gtk.types.PositionType propval)
  {
    return setTabPos(propval);
  }

  /**
      Creates a new #GtkNotebook widget with no pages.
      Returns: the newly created #GtkNotebook
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_new();
    this(_cretval, No.Take);
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
  int appendPage(gtk.widget.Widget child, gtk.widget.Widget tabLabel = null)
  {
    int _retval;
    _retval = gtk_notebook_append_page(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel.cPtr(No.Dup) : null);
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
  int appendPageMenu(gtk.widget.Widget child, gtk.widget.Widget tabLabel = null, gtk.widget.Widget menuLabel = null)
  {
    int _retval;
    _retval = gtk_notebook_append_page_menu(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel.cPtr(No.Dup) : null, menuLabel ? cast(GtkWidget*)menuLabel.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes the child from the notebook.
      
      This function is very similar to [gtk.container.Container.remove],
      but additionally informs the notebook that the removal
      is happening as part of a tab DND operation, which should
      not be cancelled.
  
      Params:
        child = a child
  */
  void detachTab(gtk.widget.Widget child)
  {
    gtk_notebook_detach_tab(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Gets one of the action widgets. See [gtk.notebook.Notebook.setActionWidget].
  
      Params:
        packType = pack type of the action widget to receive
      Returns: The action widget with the given
        pack_type or null when this action widget has not been set
  */
  gtk.widget.Widget getActionWidget(gtk.types.PackType packType)
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_get_action_widget(cast(GtkNotebook*)cPtr, packType);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the page number of the current page.
      Returns: the index (starting from 0) of the current
            page in the notebook. If the notebook has no pages,
            then -1 will be returned.
  */
  int getCurrentPage()
  {
    int _retval;
    _retval = gtk_notebook_get_current_page(cast(GtkNotebook*)cPtr);
    return _retval;
  }

  /**
      Gets the current group name for notebook.
      Returns: the group name, or null if none is set
  */
  string getGroupName()
  {
    const(char)* _cretval;
    _cretval = gtk_notebook_get_group_name(cast(GtkNotebook*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  gtk.widget.Widget getMenuLabel(gtk.widget.Widget child)
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_get_menu_label(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
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
  string getMenuLabelText(gtk.widget.Widget child)
  {
    const(char)* _cretval;
    _cretval = gtk_notebook_get_menu_label_text(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the number of pages in a notebook.
      Returns: the number of pages in the notebook
  */
  int getNPages()
  {
    int _retval;
    _retval = gtk_notebook_get_n_pages(cast(GtkNotebook*)cPtr);
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
  gtk.widget.Widget getNthPage(int pageNum)
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_get_nth_page(cast(GtkNotebook*)cPtr, pageNum);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the tab label area has arrows for scrolling.
      See [gtk.notebook.Notebook.setScrollable].
      Returns: true if arrows for scrolling are present
  */
  bool getScrollable()
  {
    bool _retval;
    _retval = gtk_notebook_get_scrollable(cast(GtkNotebook*)cPtr);
    return _retval;
  }

  /**
      Returns whether a bevel will be drawn around the notebook pages.
      See [gtk.notebook.Notebook.setShowBorder].
      Returns: true if the bevel is drawn
  */
  bool getShowBorder()
  {
    bool _retval;
    _retval = gtk_notebook_get_show_border(cast(GtkNotebook*)cPtr);
    return _retval;
  }

  /**
      Returns whether the tabs of the notebook are shown.
      See [gtk.notebook.Notebook.setShowTabs].
      Returns: true if the tabs are shown
  */
  bool getShowTabs()
  {
    bool _retval;
    _retval = gtk_notebook_get_show_tabs(cast(GtkNotebook*)cPtr);
    return _retval;
  }

  /**
      Returns whether the tab contents can be detached from notebook.
  
      Params:
        child = a child #GtkWidget
      Returns: true if the tab is detachable.
  */
  bool getTabDetachable(gtk.widget.Widget child)
  {
    bool _retval;
    _retval = gtk_notebook_get_tab_detachable(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the horizontal width of a tab border.
      Returns: horizontal width of a tab border
  
      Deprecated: this function returns zero
  */
  ushort getTabHborder()
  {
    ushort _retval;
    _retval = gtk_notebook_get_tab_hborder(cast(GtkNotebook*)cPtr);
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
  gtk.widget.Widget getTabLabel(gtk.widget.Widget child)
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_get_tab_label(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
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
  string getTabLabelText(gtk.widget.Widget child)
  {
    const(char)* _cretval;
    _cretval = gtk_notebook_get_tab_label_text(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the edge at which the tabs for switching pages in the
      notebook are drawn.
      Returns: the edge at which the tabs are drawn
  */
  gtk.types.PositionType getTabPos()
  {
    GtkPositionType _cretval;
    _cretval = gtk_notebook_get_tab_pos(cast(GtkNotebook*)cPtr);
    gtk.types.PositionType _retval = cast(gtk.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Gets whether the tab can be reordered via drag and drop or not.
  
      Params:
        child = a child #GtkWidget
      Returns: true if the tab is reorderable.
  */
  bool getTabReorderable(gtk.widget.Widget child)
  {
    bool _retval;
    _retval = gtk_notebook_get_tab_reorderable(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the vertical width of a tab border.
      Returns: vertical width of a tab border
  
      Deprecated: this function returns zero
  */
  ushort getTabVborder()
  {
    ushort _retval;
    _retval = gtk_notebook_get_tab_vborder(cast(GtkNotebook*)cPtr);
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
  int insertPage(gtk.widget.Widget child, gtk.widget.Widget tabLabel, int position)
  {
    int _retval;
    _retval = gtk_notebook_insert_page(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel.cPtr(No.Dup) : null, position);
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
  int insertPageMenu(gtk.widget.Widget child, gtk.widget.Widget tabLabel, gtk.widget.Widget menuLabel, int position)
  {
    int _retval;
    _retval = gtk_notebook_insert_page_menu(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel.cPtr(No.Dup) : null, menuLabel ? cast(GtkWidget*)menuLabel.cPtr(No.Dup) : null, position);
    return _retval;
  }

  /**
      Switches to the next page. Nothing happens if the current page is
      the last page.
  */
  void nextPage()
  {
    gtk_notebook_next_page(cast(GtkNotebook*)cPtr);
  }

  /**
      Finds the index of the page which contains the given child
      widget.
  
      Params:
        child = a #GtkWidget
      Returns: the index of the page containing child, or
            -1 if child is not in the notebook
  */
  int pageNum(gtk.widget.Widget child)
  {
    int _retval;
    _retval = gtk_notebook_page_num(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Disables the popup menu.
  */
  void popupDisable()
  {
    gtk_notebook_popup_disable(cast(GtkNotebook*)cPtr);
  }

  /**
      Enables the popup menu: if the user clicks with the right
      mouse button on the tab labels, a menu with all the pages
      will be popped up.
  */
  void popupEnable()
  {
    gtk_notebook_popup_enable(cast(GtkNotebook*)cPtr);
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
  int prependPage(gtk.widget.Widget child, gtk.widget.Widget tabLabel = null)
  {
    int _retval;
    _retval = gtk_notebook_prepend_page(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel.cPtr(No.Dup) : null);
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
  int prependPageMenu(gtk.widget.Widget child, gtk.widget.Widget tabLabel = null, gtk.widget.Widget menuLabel = null)
  {
    int _retval;
    _retval = gtk_notebook_prepend_page_menu(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel.cPtr(No.Dup) : null, menuLabel ? cast(GtkWidget*)menuLabel.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Switches to the previous page. Nothing happens if the current page
      is the first page.
  */
  void prevPage()
  {
    gtk_notebook_prev_page(cast(GtkNotebook*)cPtr);
  }

  /**
      Removes a page from the notebook given its index
      in the notebook.
  
      Params:
        pageNum = the index of a notebook page, starting
              from 0. If -1, the last page will be removed.
  */
  void removePage(int pageNum)
  {
    gtk_notebook_remove_page(cast(GtkNotebook*)cPtr, pageNum);
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
  void reorderChild(gtk.widget.Widget child, int position)
  {
    gtk_notebook_reorder_child(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, position);
  }

  /**
      Sets widget as one of the action widgets. Depending on the pack type
      the widget will be placed before or after the tabs. You can use
      a #GtkBox if you need to pack more than one widget on the same side.
      
      Note that action widgets are “internal” children of the notebook and thus
      not included in the list returned from [gtk.container.Container.foreach_].
  
      Params:
        widget = a #GtkWidget
        packType = pack type of the action widget
  */
  void setActionWidget(gtk.widget.Widget widget, gtk.types.PackType packType)
  {
    gtk_notebook_set_action_widget(cast(GtkNotebook*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, packType);
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
  void setCurrentPage(int pageNum)
  {
    gtk_notebook_set_current_page(cast(GtkNotebook*)cPtr, pageNum);
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
  void setGroupName(string groupName = null)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    gtk_notebook_set_group_name(cast(GtkNotebook*)cPtr, _groupName);
  }

  /**
      Changes the menu label for the page containing child.
  
      Params:
        child = the child widget
        menuLabel = the menu label, or null for default
  */
  void setMenuLabel(gtk.widget.Widget child, gtk.widget.Widget menuLabel = null)
  {
    gtk_notebook_set_menu_label(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, menuLabel ? cast(GtkWidget*)menuLabel.cPtr(No.Dup) : null);
  }

  /**
      Creates a new label and sets it as the menu label of child.
  
      Params:
        child = the child widget
        menuText = the label text
  */
  void setMenuLabelText(gtk.widget.Widget child, string menuText)
  {
    const(char)* _menuText = menuText.toCString(No.Alloc);
    gtk_notebook_set_menu_label_text(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, _menuText);
  }

  /**
      Sets whether the tab label area will have arrows for
      scrolling if there are too many tabs to fit in the area.
  
      Params:
        scrollable = true if scroll arrows should be added
  */
  void setScrollable(bool scrollable)
  {
    gtk_notebook_set_scrollable(cast(GtkNotebook*)cPtr, scrollable);
  }

  /**
      Sets whether a bevel will be drawn around the notebook pages.
      This only has a visual effect when the tabs are not shown.
      See [gtk.notebook.Notebook.setShowTabs].
  
      Params:
        showBorder = true if a bevel should be drawn around the notebook
  */
  void setShowBorder(bool showBorder)
  {
    gtk_notebook_set_show_border(cast(GtkNotebook*)cPtr, showBorder);
  }

  /**
      Sets whether to show the tabs for the notebook or not.
  
      Params:
        showTabs = true if the tabs should be shown
  */
  void setShowTabs(bool showTabs)
  {
    gtk_notebook_set_show_tabs(cast(GtkNotebook*)cPtr, showTabs);
  }

  /**
      Sets whether the tab can be detached from notebook to another
      notebook or widget.
      
      Note that 2 notebooks must share a common group identificator
      (see [gtk.notebook.Notebook.setGroupName]) to allow automatic tabs
      interchange between them.
      
      If you want a widget to interact with a notebook through DnD
      (i.e.: accept dragged tabs from it) it must be set as a drop
      destination and accept the target “GTK_NOTEBOOK_TAB”. The notebook
      will fill the selection with a GtkWidget** pointing to the child
      widget that corresponds to the dropped tab.
      
      Note that you should use [gtk.notebook.Notebook.detachTab] instead
      of [gtk.container.Container.remove] if you want to remove the tab from
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
  void setTabDetachable(gtk.widget.Widget child, bool detachable)
  {
    gtk_notebook_set_tab_detachable(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, detachable);
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
  void setTabLabel(gtk.widget.Widget child, gtk.widget.Widget tabLabel = null)
  {
    gtk_notebook_set_tab_label(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel.cPtr(No.Dup) : null);
  }

  /**
      Creates a new label and sets it as the tab label for the page
      containing child.
  
      Params:
        child = the page
        tabText = the label text
  */
  void setTabLabelText(gtk.widget.Widget child, string tabText)
  {
    const(char)* _tabText = tabText.toCString(No.Alloc);
    gtk_notebook_set_tab_label_text(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, _tabText);
  }

  /**
      Sets the edge at which the tabs for switching pages in the
      notebook are drawn.
  
      Params:
        pos = the edge to draw the tabs at
  */
  void setTabPos(gtk.types.PositionType pos)
  {
    gtk_notebook_set_tab_pos(cast(GtkNotebook*)cPtr, pos);
  }

  /**
      Sets whether the notebook tab can be reordered
      via drag and drop or not.
  
      Params:
        child = a child #GtkWidget
        reorderable = whether the tab is reorderable or not
  */
  void setTabReorderable(gtk.widget.Widget child, bool reorderable)
  {
    gtk_notebook_set_tab_reorderable(cast(GtkNotebook*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, reorderable);
  }

  /**
      Connect to `ChangeCurrentPage` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(int object, gtk.notebook.Notebook notebook))
  
          `object`  (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChangeCurrentPage(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.notebook.Notebook)))
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
      setVal!bool(_returnValue, _retval);
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
  
          $(D gtk.notebook.Notebook callback(gtk.widget.Widget page, int x, int y, gtk.notebook.Notebook notebook))
  
          `page` the tab of notebook that is being detached (optional)
  
          `x` the X coordinate where the drop happens (optional)
  
          `y` the Y coordinate where the drop happens (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
          `Returns` a #GtkNotebook that page should be
              added to, or null.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreateWindow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gtk.notebook.Notebook)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.notebook.Notebook)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!gtk.notebook.Notebook(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-window", closure, after);
  }

  /**
      Connect to `FocusTab` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.NotebookTab object, gtk.notebook.Notebook notebook))
  
          `object`  (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFocusTab(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.NotebookTab)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.notebook.Notebook)))
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
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus-tab", closure, after);
  }

  /**
      Connect to `MoveFocusOut` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.DirectionType object, gtk.notebook.Notebook notebook))
  
          `object`  (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveFocusOut(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.notebook.Notebook)))
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

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtk.widget.Widget child, uint pageNum, gtk.notebook.Notebook notebook))
  
          `child` the child #GtkWidget affected (optional)
  
          `pageNum` the new page number for child (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPageAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.notebook.Notebook)))
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

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtk.widget.Widget child, uint pageNum, gtk.notebook.Notebook notebook))
  
          `child` the child #GtkWidget affected (optional)
  
          `pageNum` the child page number (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPageRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.notebook.Notebook)))
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

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtk.widget.Widget child, uint pageNum, gtk.notebook.Notebook notebook))
  
          `child` the child #GtkWidget affected (optional)
  
          `pageNum` the new page number for child (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPageReordered(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.notebook.Notebook)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-reordered", closure, after);
  }

  /**
      Connect to `ReorderTab` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.DirectionType object, bool p0, gtk.notebook.Notebook notebook))
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectReorderTab(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.notebook.Notebook)))
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
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("reorder-tab", closure, after);
  }

  /**
      Connect to `SelectPage` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(bool object, gtk.notebook.Notebook notebook))
  
          `object`  (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectPage(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.notebook.Notebook)))
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
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-page", closure, after);
  }

  /**
      Connect to `SwitchPage` signal.
  
      Emitted when the user or a function changes the current page.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget page, uint pageNum, gtk.notebook.Notebook notebook))
  
          `page` the new current page (optional)
  
          `pageNum` the index of the page (optional)
  
          `notebook` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSwitchPage(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.notebook.Notebook)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("switch-page", closure, after);
  }
}
