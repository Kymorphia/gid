/// Module for [SearchBar] class
module gtk.search_bar;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.editable;
import gtk.types;
import gtk.widget;

/**
    [gtk.search_bar.SearchBar] is a container made to have a search entry.
    
    ![An example GtkSearchBar](search-bar.png)
    
    It can also contain additional widgets, such as drop-down menus,
    or buttons.  The search bar would appear when a search is started
    through typing on the keyboard, or the application’s search mode
    is toggled on.
    
    For keyboard presses to start a search, the search bar must be told
    of a widget to capture key events from through
    [gtk.search_bar.SearchBar.setKeyCaptureWidget]. This widget will
    typically be the top-level window, or a parent container of the
    search bar. Common shortcuts such as Ctrl+F should be handled as an
    application action, or through the menu items.
    
    You will also need to tell the search bar about which entry you
    are using as your search entry using [gtk.search_bar.SearchBar.connectEntry].
    
    ## Creating a search bar
    
    The following example shows you how to create a more complex search
    entry.
    
    [A simple example](https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/search-bar.c)
    
    # CSS nodes
    
    ```
    searchbar
    ╰── revealer
        ╰── box
             ├── [child]
             ╰── [button.close]
    ```
    
    [gtk.search_bar.SearchBar] has a main CSS node with name searchbar. It has a child
    node with name revealer that contains a node with name box. The box node
    contains both the CSS node of the child widget as well as an optional button
    node which gets the .close style class applied.
    
    # Accessibility
    
    [gtk.search_bar.SearchBar] uses the [gtk.types.AccessibleRole.Search] role.
*/
class SearchBar : gtk.widget.Widget
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
    return cast(void function())gtk_search_bar_get_type != &gidSymbolNotFound ? gtk_search_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SearchBar self()
  {
    return this;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `keyCaptureWidget` property.
      Returns: The key capture widget.
  */
  @property gtk.widget.Widget keyCaptureWidget()
  {
    return getKeyCaptureWidget();
  }

  /**
      Set `keyCaptureWidget` property.
      Params:
        propval = The key capture widget.
  */
  @property void keyCaptureWidget(gtk.widget.Widget propval)
  {
    return setKeyCaptureWidget(propval);
  }

  /**
      Get `searchModeEnabled` property.
      Returns: Whether the search mode is on and the search bar shown.
  */
  @property bool searchModeEnabled()
  {
    return getSearchMode();
  }

  /**
      Set `searchModeEnabled` property.
      Params:
        propval = Whether the search mode is on and the search bar shown.
  */
  @property void searchModeEnabled(bool propval)
  {
    return setSearchMode(propval);
  }

  /**
      Get `showCloseButton` property.
      Returns: Whether to show the close button in the search bar.
  */
  @property bool showCloseButton()
  {
    return getShowCloseButton();
  }

  /**
      Set `showCloseButton` property.
      Params:
        propval = Whether to show the close button in the search bar.
  */
  @property void showCloseButton(bool propval)
  {
    return setShowCloseButton(propval);
  }

  /**
      Creates a [gtk.search_bar.SearchBar].
      
      You will need to tell it about which widget is going to be your text
      entry using [gtk.search_bar.SearchBar.connectEntry].
      Returns: a new [gtk.search_bar.SearchBar]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Connects the [gtk.editable.Editable] widget passed as the one to be used in
      this search bar.
      
      The entry should be a descendant of the search bar. Calling this
      function manually is only required if the entry isn’t the direct
      child of the search bar (as in our main example).
  
      Params:
        entry = a [gtk.editable.Editable]
  */
  void connectEntry(gtk.editable.Editable entry)
  {
    gtk_search_bar_connect_entry(cast(GtkSearchBar*)this._cPtr, entry ? cast(GtkEditable*)(cast(gobject.object.ObjectWrap)entry)._cPtr(No.Dup) : null);
  }

  /**
      Gets the child widget of bar.
      Returns: the child widget of bar
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_bar_get_child(cast(GtkSearchBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the widget that bar is capturing key events from.
      Returns: The key capture widget.
  */
  gtk.widget.Widget getKeyCaptureWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_bar_get_key_capture_widget(cast(GtkSearchBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the search mode is on or off.
      Returns: whether search mode is toggled on
  */
  bool getSearchMode()
  {
    bool _retval;
    _retval = cast(bool)gtk_search_bar_get_search_mode(cast(GtkSearchBar*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the close button is shown.
      Returns: whether the close button is shown
  */
  bool getShowCloseButton()
  {
    bool _retval;
    _retval = cast(bool)gtk_search_bar_get_show_close_button(cast(GtkSearchBar*)this._cPtr);
    return _retval;
  }

  /**
      Sets the child widget of bar.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_search_bar_set_child(cast(GtkSearchBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets widget as the widget that bar will capture key events
      from.
      
      If key events are handled by the search bar, the bar will
      be shown, and the entry populated with the entered text.
      
      Note that despite the name of this function, the events
      are only 'captured' in the bubble phase, which means that
      editable child widgets of widget will receive text input
      before it gets captured. If that is not desired, you can
      capture and forward the events yourself with
      [gtk.event_controller_key.EventControllerKey.forward].
  
      Params:
        widget = a [gtk.widget.Widget]
  */
  void setKeyCaptureWidget(gtk.widget.Widget widget = null)
  {
    gtk_search_bar_set_key_capture_widget(cast(GtkSearchBar*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Switches the search mode on or off.
  
      Params:
        searchMode = the new state of the search mode
  */
  void setSearchMode(bool searchMode)
  {
    gtk_search_bar_set_search_mode(cast(GtkSearchBar*)this._cPtr, searchMode);
  }

  /**
      Shows or hides the close button.
      
      Applications that already have a “search” toggle button should not
      show a close button in their search bar, as it duplicates the role
      of the toggle button.
  
      Params:
        visible = whether the close button will be shown or not
  */
  void setShowCloseButton(bool visible)
  {
    gtk_search_bar_set_show_close_button(cast(GtkSearchBar*)this._cPtr, visible);
  }
}
