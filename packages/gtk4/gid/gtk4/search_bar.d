/// Module for [SearchBar] class
module gid.gtk4.search_bar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.editable;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Reveals a search entry when search is started.
    
    <picture>
      <source srcset="search-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkSearchBar" src="search-bar.png">
    </picture>
    
    It can also contain additional widgets, such as drop-down menus,
    or buttons.  The search bar would appear when a search is started
    through typing on the keyboard, or the application’s search mode
    is toggled on.
    
    For keyboard presses to start a search, the search bar must be told
    of a widget to capture key events from through
    [gid.gtk4.search_bar.SearchBar.setKeyCaptureWidget]. This widget will
    typically be the top-level window, or a parent container of the
    search bar. Common shortcuts such as Ctrl+F should be handled as an
    application action, or through the menu items.
    
    You will also need to tell the search bar about which entry you
    are using as your search entry using [gid.gtk4.search_bar.SearchBar.connectEntry].
    
    ## Creating a search bar
    
    The following example shows you how to create a more complex search
    entry.
    
    [A simple example](https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/search-bar.c)
    
    # Shortcuts and Gestures
    
    [gid.gtk4.search_bar.SearchBar] supports the following keyboard shortcuts:
    
    - <kbd>Escape</kbd> hides the search bar.
    
    # CSS nodes
    
    ```
    searchbar
    ╰── revealer
        ╰── box
             ├── [child]
             ╰── [button.close]
    ```
    
    [gid.gtk4.search_bar.SearchBar] has a main CSS node with name searchbar. It has a child
    node with name revealer that contains a node with name box. The box node
    contains both the CSS node of the child widget as well as an optional button
    node which gets the .close style class applied.
    
    # Accessibility
    
    [gid.gtk4.search_bar.SearchBar] uses the [gid.gtk4.types.AccessibleRole.Search] role.
*/
@gidGir("SearchBar")
class SearchBar : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_search_bar_get_type != &gidSymbolNotFound ? gtk_search_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSearchBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override SearchBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.search_bar.SearchBar]
      Returns: New builder object
  */
  static SearchBarGidBuilder builder() nothrow
  {
    return new SearchBarGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `keyCaptureWidget` property.
      Returns: The key capture widget.
  */
  @property gid.gtk4.widget.Widget keyCaptureWidget() nothrow
  {
    return getKeyCaptureWidget();
  }

  /**
      Set `keyCaptureWidget` property.
      Params:
        propval = The key capture widget.
  */
  @property void keyCaptureWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setKeyCaptureWidget(propval);
  }

  /**
      Get `searchModeEnabled` property.
      Returns: Whether the search mode is on and the search bar shown.
  */
  @property bool searchModeEnabled() nothrow
  {
    return getSearchMode();
  }

  /**
      Set `searchModeEnabled` property.
      Params:
        propval = Whether the search mode is on and the search bar shown.
  */
  @property void searchModeEnabled(bool propval) nothrow
  {
    setSearchMode(propval);
  }

  /**
      Get `showCloseButton` property.
      Returns: Whether to show the close button in the search bar.
  */
  @property bool showCloseButton() nothrow
  {
    return getShowCloseButton();
  }

  /**
      Set `showCloseButton` property.
      Params:
        propval = Whether to show the close button in the search bar.
  */
  @property void showCloseButton(bool propval) nothrow
  {
    setShowCloseButton(propval);
  }

  /**
      Creates a [gid.gtk4.search_bar.SearchBar].
      
      You will need to tell it about which widget is going to be your text
      entry using [gid.gtk4.search_bar.SearchBar.connectEntry].
      Returns: a new [gid.gtk4.search_bar.SearchBar]
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
      _cretval = gtk_search_bar_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Connects the [gid.gtk4.editable.Editable] widget passed as the one to be used in
      this search bar.
      
      The entry should be a descendant of the search bar. Calling this
      function manually is only required if the entry isn’t the direct
      child of the search bar (as in our main example).
  
      Params:
        entry = a [gid.gtk4.editable.Editable]
  */
  void connectEntry(gid.gtk4.editable.Editable entry) nothrow
  {
    gtk_search_bar_connect_entry(cast(GtkSearchBar*)this._cPtr, entry ? cast(GtkEditable*)(cast(gid.gobject2.object.ObjectWrap)entry)._cPtr(No.Dup) : null);
  }

  /**
      Gets the child widget of bar.
      Returns: the child widget of bar
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_bar_get_child(cast(GtkSearchBar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the widget that bar is capturing key events from.
      Returns: The key capture widget.
  */
  gid.gtk4.widget.Widget getKeyCaptureWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_bar_get_key_capture_widget(cast(GtkSearchBar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the search mode is on or off.
      Returns: whether search mode is toggled on
  */
  bool getSearchMode() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_search_bar_get_search_mode(cast(GtkSearchBar*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the close button is shown.
      Returns: whether the close button is shown
  */
  bool getShowCloseButton() nothrow
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
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
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
      [gid.gtk4.event_controller_key.EventControllerKey.forward].
  
      Params:
        widget = a [gid.gtk4.widget.Widget]
  */
  void setKeyCaptureWidget(gid.gtk4.widget.Widget widget = null) nothrow
  {
    gtk_search_bar_set_key_capture_widget(cast(GtkSearchBar*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Switches the search mode on or off.
  
      Params:
        searchMode = the new state of the search mode
  */
  void setSearchMode(bool searchMode) nothrow
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
  void setShowCloseButton(bool visible) nothrow
  {
    gtk_search_bar_set_show_close_button(cast(GtkSearchBar*)this._cPtr, visible);
  }
}

/// Fluent builder implementation template for [gid.gtk4.search_bar.SearchBar]
class SearchBarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `keyCaptureWidget` property.
      Params:
        propval = The key capture widget.
      Returns: Builder instance for fluent chaining
  */
  T keyCaptureWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("key-capture-widget", propval);
  }

  /**
      Set `searchModeEnabled` property.
      Params:
        propval = Whether the search mode is on and the search bar shown.
      Returns: Builder instance for fluent chaining
  */
  T searchModeEnabled(bool propval) nothrow
  {
    return setProperty("search-mode-enabled", propval);
  }

  /**
      Set `showCloseButton` property.
      Params:
        propval = Whether to show the close button in the search bar.
      Returns: Builder instance for fluent chaining
  */
  T showCloseButton(bool propval) nothrow
  {
    return setProperty("show-close-button", propval);
  }
}

/// Fluent builder for [gid.gtk4.search_bar.SearchBar]
final class SearchBarGidBuilder : SearchBarGidBuilderImpl!SearchBarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SearchBar build() nothrow
  {
    return new SearchBar(cast(void*)createGObject(SearchBar._getGType), Yes.Take);
  }
}
