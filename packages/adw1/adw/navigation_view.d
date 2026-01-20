/// Module for [NavigationView] class
module adw.navigation_view;

import adw.c.functions;
import adw.c.types;
import adw.navigation_page;
import adw.swipeable;
import adw.swipeable_mixin;
import adw.types;
import gid.gid;
import gio.list_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A page-based navigation container.
    
    <picture>
      <source srcset="navigation-view-dark.png" media="(prefers-color-scheme: dark)">
      <img src="navigation-view.png" alt="navigation-view">
    </picture>
    
    [adw.navigation_view.NavigationView] presents one child at a time, similar to
    [gtk.stack.Stack].
    
    [adw.navigation_view.NavigationView] can only contain `class@NavigationPage` children.
    
    It maintains a navigation stack that can be controlled with
    [adw.navigation_view.NavigationView.push] and [adw.navigation_view.NavigationView.pop]. The whole
    navigation stack can also be replaced using [adw.navigation_view.NavigationView.replace].
    
    [adw.navigation_view.NavigationView] allows to manage pages statically or dynamically.
    
    Static pages can be added using the [adw.navigation_view.NavigationView.add] method. The
    [adw.navigation_view.NavigationView] will keep a reference to these pages, but they aren't
    accessible to the user until [adw.navigation_view.NavigationView.push] is called (except
    for the first page, which is pushed automatically). Use the
    [adw.navigation_view.NavigationView.remove] method to remove them. This is useful for
    applications that have a small number of unique pages and just need
    navigation between them.
    
    Dynamic pages are automatically destroyed once they are popped off the
    navigation stack. To add a page like this, push it using the
    [adw.navigation_view.NavigationView.push] method without calling
    [adw.navigation_view.NavigationView.add] first.
    
    ## Tags
    
    Static pages, as well as any pages in the navigation stack, can be accessed
    by their `property@NavigationPage:tag`. For example,
    [adw.navigation_view.NavigationView.pushByTag] can be used to push a static page that's
    not in the navigation stack without having to keep a reference to it manually.
    
    ## Header Bar Integration
    
    When used inside [adw.navigation_view.NavigationView], `class@HeaderBar` will automatically
    display a back button that can be used to go back to the previous page when
    possible. The button also has a context menu, allowing to pop multiple pages
    at once, potentially across multiple navigation views.
    
    Set `property@HeaderBar:show-back-button` to `FALSE` to disable this behavior
    in rare scenarios where it's unwanted.
    
    [adw.header_bar.HeaderBar] will also display the title of the [adw.navigation_page.NavigationPage] it's
    placed into, so most applications shouldn't need to customize it at all.
    
    ## Shortcuts and Gestures
    
    [adw.navigation_view.NavigationView] supports the following shortcuts for going to the
    previous page:
    
    $(LIST
      * <kbd>Escape</kbd> (unless `property@NavigationView:pop-on-escape` is set to
        `FALSE`)
      * <kbd>Alt</kbd>+<kbd>←</kbd>
      * Back mouse button
    )
      
    Additionally, it supports interactive gestures:
    
    $(LIST
      * One-finger swipe towards the right on touchscreens
      * Scrolling towards the right on touchpads (usually two-finger swipe)
    )
      
    These gestures have transitions enabled regardless of the
    `property@NavigationView:animate-transitions` value.
    
    Applications can also enable shortcuts for pushing another page onto the
    navigation stack via connecting to the `signal@NavigationView::get-next-page`
    signal, in that case the following shortcuts are supported:
    
    $(LIST
      * <kbd>Alt</kbd>+<kbd>→</kbd>
      * Forward mouse button
      * Swipe/scrolling towards the left
    )
      
    For right-to-left locales, the gestures and shortcuts are reversed.
    
    `property@NavigationPage:can-pop` can be used to disable them, along with the
    header bar back buttons.
    
    ## Actions
    
    [adw.navigation_view.NavigationView] defines actions for controlling the navigation stack.
    actions for controlling the navigation stack:
    
    $(LIST
      * `navigation.push` takes a string parameter specifying the tag of the page to
    )
    push, and is equivalent to calling [adw.navigation_view.NavigationView.pushByTag].
    
    $(LIST
      * `navigation.pop` doesn't take any parameters and pops the current page from
    )
    the navigation stack, equivalent to calling [adw.navigation_view.NavigationView.pop].
    
    ## [adw.navigation_view.NavigationView] as [gtk.buildable.Buildable]
    
    [adw.navigation_view.NavigationView] allows to add pages as children, equivalent to using the
    [adw.navigation_view.NavigationView.add] method.
    
    Example of an [adw.navigation_view.NavigationView] UI definition:
    
    ```xml
    <object class="AdwNavigationView">
      <child>
        <object class="AdwNavigationPage">
          <property name="title" translatable="yes">Page 1</property>
          <property name="child">
            <object class="AdwToolbarView">
              <child type="top">
                <object class="AdwHeaderBar"/>
              </child>
              <property name="content">
                <object class="GtkButton">
                  <property name="label" translatable="yes">Open Page 2</property>
                  <property name="halign">center</property>
                  <property name="valign">center</property>
                  <property name="action-name">navigation.push</property>
                  <property name="action-target">'page-2'</property>
                  <style>
                    <class name="pill"/>
                   </style>
                </object>
              </property>
            </object>
          </property>
        </object>
      </child>
      <child>
        <object class="AdwNavigationPage">
          <property name="title" translatable="yes">Page 2</property>
          <property name="tag">page-2</property>
          <property name="child">
            <object class="AdwToolbarView">
              <child type="top">
                <object class="AdwHeaderBar"/>
              </child>
              <property name="content">
                <!-- ... -->
              </property>
            </object>
          </property>
        </object>
      </child>
    </object>
    ```
    
    <picture>
      <source srcset="navigation-view-example-dark.png" media="(prefers-color-scheme: dark)">
      <img src="navigation-view-example.png" alt="navigation-view-example">
    </picture>
    
    ## CSS nodes
    
    [adw.navigation_view.NavigationView] has a single CSS node with the name `navigation-view`.
    
    ## Accessibility
    
    [adw.navigation_view.NavigationView] uses the [gtk.types.AccessibleRole.Group] role.
*/
class NavigationView : gtk.widget.Widget, adw.swipeable.Swipeable
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
    return cast(void function())adw_navigation_view_get_type != &gidSymbolNotFound ? adw_navigation_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NavigationView self()
  {
    return this;
  }

  /**
      Get `animateTransitions` property.
      Returns: Whether to animate page transitions.
        
        Gesture-based transitions are always animated.
  */
  @property bool animateTransitions()
  {
    return getAnimateTransitions();
  }

  /**
      Set `animateTransitions` property.
      Params:
        propval = Whether to animate page transitions.
          
          Gesture-based transitions are always animated.
  */
  @property void animateTransitions(bool propval)
  {
    return setAnimateTransitions(propval);
  }

  /**
      Get `navigationStack` property.
      Returns: A list model that contains the pages in navigation stack.
        
        The pages are sorted from root page to visible page.
        
        This can be used to keep an up-to-date view.
  */
  @property gio.list_model.ListModel navigationStack()
  {
    return getNavigationStack();
  }

  /**
      Get `popOnEscape` property.
      Returns: Whether pressing Escape pops the current page.
        
        Applications using [adw.navigation_view.NavigationView] to implement a browser may want to
        disable it.
  */
  @property bool popOnEscape()
  {
    return getPopOnEscape();
  }

  /**
      Set `popOnEscape` property.
      Params:
        propval = Whether pressing Escape pops the current page.
          
          Applications using [adw.navigation_view.NavigationView] to implement a browser may want to
          disable it.
  */
  @property void popOnEscape(bool propval)
  {
    return setPopOnEscape(propval);
  }

  /**
      Get `visiblePage` property.
      Returns: The currently visible page.
  */
  @property adw.navigation_page.NavigationPage visiblePage()
  {
    return getVisiblePage();
  }

  mixin SwipeableT!();

  /**
      Creates a new [adw.navigation_view.NavigationView].
      Returns: the new created [adw.navigation_view.NavigationView]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_navigation_view_new();
    this(_cretval, No.Take);
  }

  /**
      Permanently adds page to self.
      
      Any page that has been added will stay in self even after being popped from
      the navigation stack.
      
      Adding a page while no page is visible will automatically push it to the
      navigation stack.
      
      See [adw.navigation_view.NavigationView.remove].
  
      Params:
        page = the page to add
  */
  void add(adw.navigation_page.NavigationPage page)
  {
    adw_navigation_view_add(cast(AdwNavigationView*)this._cPtr, page ? cast(AdwNavigationPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Finds a page in self by its tag.
      
      See `propertyNavigationPage:tag`.
  
      Params:
        tag = a page tag
      Returns: the page with the given tag
  */
  adw.navigation_page.NavigationPage findPage(string tag)
  {
    AdwNavigationPage* _cretval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _cretval = adw_navigation_view_find_page(cast(AdwNavigationView*)this._cPtr, _tag);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.navigation_page.NavigationPage)(cast(AdwNavigationPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self animates page transitions.
      Returns: whether to animate page transitions
  */
  bool getAnimateTransitions()
  {
    bool _retval;
    _retval = cast(bool)adw_navigation_view_get_animate_transitions(cast(AdwNavigationView*)this._cPtr);
    return _retval;
  }

  /**
      Returns a [gio.list_model.ListModel] that contains the pages in navigation stack.
      
      The pages are sorted from root page to visible page.
      
      This can be used to keep an up-to-date view.
      Returns: a list model for the navigation stack
  */
  gio.list_model.ListModel getNavigationStack()
  {
    GListModel* _cretval;
    _cretval = adw_navigation_view_get_navigation_stack(cast(AdwNavigationView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets whether pressing Escape pops the current page on self.
      Returns: whether to pop the current page
  */
  bool getPopOnEscape()
  {
    bool _retval;
    _retval = cast(bool)adw_navigation_view_get_pop_on_escape(cast(AdwNavigationView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the previous page for page.
      
      If page is in the navigation stack, returns the page popping page will
      reveal.
      
      If page is the root page or is not in the navigation stack, returns `NULL`.
  
      Params:
        page = a page in self
      Returns: the previous page
  */
  adw.navigation_page.NavigationPage getPreviousPage(adw.navigation_page.NavigationPage page)
  {
    AdwNavigationPage* _cretval;
    _cretval = adw_navigation_view_get_previous_page(cast(AdwNavigationView*)this._cPtr, page ? cast(AdwNavigationPage*)page._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.navigation_page.NavigationPage)(cast(AdwNavigationPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently visible page in self.
      Returns: the currently visible page
  */
  adw.navigation_page.NavigationPage getVisiblePage()
  {
    AdwNavigationPage* _cretval;
    _cretval = adw_navigation_view_get_visible_page(cast(AdwNavigationView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.navigation_page.NavigationPage)(cast(AdwNavigationPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Pops the visible page from the navigation stack.
      
      Does nothing if the navigation stack contains less than two pages.
      
      If [adw.navigation_view.NavigationView.add] hasn't been called, the page is automatically
      removed.
      
      `signalNavigationView::popped` will be emitted for the current visible page.
      
      See [adw.navigation_view.NavigationView.popToPage] and
      [adw.navigation_view.NavigationView.popToTag].
      Returns: `TRUE` if a page has been popped
  */
  bool pop()
  {
    bool _retval;
    _retval = cast(bool)adw_navigation_view_pop(cast(AdwNavigationView*)this._cPtr);
    return _retval;
  }

  /**
      Pops pages from the navigation stack until page is visible.
      
      page must be in the navigation stack.
      
      If [adw.navigation_view.NavigationView.add] hasn't been called for any of the popped pages,
      they are automatically removed.
      
      `signalNavigationView::popped` will be be emitted for each of the popped
      pages.
      
      See [adw.navigation_view.NavigationView.pop] and [adw.navigation_view.NavigationView.popToTag].
  
      Params:
        page = the page to pop to
      Returns: `TRUE` if any pages have been popped
  */
  bool popToPage(adw.navigation_page.NavigationPage page)
  {
    bool _retval;
    _retval = cast(bool)adw_navigation_view_pop_to_page(cast(AdwNavigationView*)this._cPtr, page ? cast(AdwNavigationPage*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Pops pages from the navigation stack until page with the tag tag is visible.
      
      The page must be in the navigation stack.
      
      If [adw.navigation_view.NavigationView.add] hasn't been called for any of the popped pages,
      they are automatically removed.
      
      `signalNavigationView::popped` will be emitted for each of the popped pages.
      
      See [adw.navigation_view.NavigationView.popToPage] and `propertyNavigationPage:tag`.
  
      Params:
        tag = a page tag
      Returns: `TRUE` if any pages have been popped
  */
  bool popToTag(string tag)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)adw_navigation_view_pop_to_tag(cast(AdwNavigationView*)this._cPtr, _tag);
    return _retval;
  }

  /**
      Pushes page onto the navigation stack.
      
      If [adw.navigation_view.NavigationView.add] hasn't been called, the page is automatically
      removed once it's popped.
      
      `signalNavigationView::pushed` will be emitted for page.
      
      See [adw.navigation_view.NavigationView.pushByTag].
  
      Params:
        page = the page to push
  */
  void push(adw.navigation_page.NavigationPage page)
  {
    adw_navigation_view_push(cast(AdwNavigationView*)this._cPtr, page ? cast(AdwNavigationPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Pushes the page with the tag tag onto the navigation stack.
      
      If [adw.navigation_view.NavigationView.add] hasn't been called, the page is automatically
      removed once it's popped.
      
      `signalNavigationView::pushed` will be emitted for the page.
      
      See [adw.navigation_view.NavigationView.push] and `propertyNavigationPage:tag`.
  
      Params:
        tag = the page tag
  */
  void pushByTag(string tag)
  {
    const(char)* _tag = tag.toCString(No.Alloc);
    adw_navigation_view_push_by_tag(cast(AdwNavigationView*)this._cPtr, _tag);
  }

  /**
      Removes page from self.
      
      If page is currently in the navigation stack, it will be removed once it's
      popped. Otherwise, it's removed immediately.
      
      See [adw.navigation_view.NavigationView.add].
  
      Params:
        page = the page to remove
  */
  void remove(adw.navigation_page.NavigationPage page)
  {
    adw_navigation_view_remove(cast(AdwNavigationView*)this._cPtr, page ? cast(AdwNavigationPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Replaces the current navigation stack with pages.
      
      The last page becomes the visible page.
      
      Replacing the navigation stack has no animation.
      
      If [adw.navigation_view.NavigationView.add] hasn't been called for any pages that are no
      longer in the navigation stack, they are automatically removed.
      
      n_pages can be 0, in that case no page will be visible after calling this
      method. This can be useful for removing all pages from self.
      
      The `signalNavigationView::replaced` signal will be emitted.
      
      See [adw.navigation_view.NavigationView.replaceWithTags].
  
      Params:
        pages = the new navigation stack
  */
  void replace(adw.navigation_page.NavigationPage[] pages)
  {
    int _nPages;
    if (pages)
      _nPages = cast(int)pages.length;

    AdwNavigationPage*[] _tmppages;
    foreach (obj; pages)
      _tmppages ~= obj ? cast(AdwNavigationPage*)obj._cPtr : null;
    AdwNavigationPage** _pages = cast(AdwNavigationPage**)_tmppages.ptr;

    adw_navigation_view_replace(cast(AdwNavigationView*)this._cPtr, _pages, _nPages);
  }

  /**
      Replaces the current navigation stack with pages with the tags tags.
      
      The last page becomes the visible page.
      
      Replacing the navigation stack has no animation.
      
      If [adw.navigation_view.NavigationView.add] hasn't been called for any pages that are no
      longer in the navigation stack, they are automatically removed.
      
      n_tags can be 0, in that case no page will be visible after calling this
      method. This can be useful for removing all pages from self.
      
      The `signalNavigationView::replaced` signal will be emitted.
      
      See [adw.navigation_view.NavigationView.replace] and `propertyNavigationPage:tag`.
  
      Params:
        tags = tags of the pages in the
            navigation stack
  */
  void replaceWithTags(string[] tags)
  {
    int _nTags;
    if (tags)
      _nTags = cast(int)tags.length;

    const(char)*[] _tmptags;
    foreach (s; tags)
      _tmptags ~= s.toCString(No.Alloc);
    const(char*)* _tags = _tmptags.ptr;

    adw_navigation_view_replace_with_tags(cast(AdwNavigationView*)this._cPtr, _tags, _nTags);
  }

  /**
      Sets whether self should animate page transitions.
      
      Gesture-based transitions are always animated.
  
      Params:
        animateTransitions = whether to animate page transitions
  */
  void setAnimateTransitions(bool animateTransitions)
  {
    adw_navigation_view_set_animate_transitions(cast(AdwNavigationView*)this._cPtr, animateTransitions);
  }

  /**
      Sets whether pressing Escape pops the current page on self.
      
      Applications using [adw.navigation_view.NavigationView] to implement a browser may want to
      disable it.
  
      Params:
        popOnEscape = whether to pop the current page when pressing Escape
  */
  void setPopOnEscape(bool popOnEscape)
  {
    adw_navigation_view_set_pop_on_escape(cast(AdwNavigationView*)this._cPtr, popOnEscape);
  }

  /**
      Connect to `GetNextPage` signal.
  
      Emitted when a push shortcut or a gesture is triggered.
        
        To support the push shortcuts and gestures, the application is expected to
        return the page to push in the handler.
        
        This signal can be emitted multiple times for the gestures, for example
        when the gesture is cancelled by the user. As such, the application must
        not make any irreversible changes in the handler, such as removing the page
        from a forward stack.
        
        Instead, it should be done in the `signalNavigationView::pushed` handler.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D adw.navigation_page.NavigationPage callback(adw.navigation_view.NavigationView navigationView))
  
          `navigationView` the instance the signal is connected to (optional)
  
          `Returns` the page to push
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGetNextPage(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : adw.navigation_page.NavigationPage)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.navigation_view.NavigationView)))
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
      setVal!(adw.navigation_page.NavigationPage)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("get-next-page", closure, after);
  }

  /**
      Connect to `Popped` signal.
  
      Emitted after page has been popped from the navigation stack.
        
        See [adw.navigation_view.NavigationView.pop].
        
        When using [adw.navigation_view.NavigationView.popToPage] or
        [adw.navigation_view.NavigationView.popToTag], this signal is emitted for each of the
        popped pages.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.navigation_page.NavigationPage page, adw.navigation_view.NavigationView navigationView))
  
          `page` the popped page (optional)
  
          `navigationView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPopped(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.navigation_page.NavigationPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : adw.navigation_view.NavigationView)))
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
    return connectSignalClosure("popped", closure, after);
  }

  /**
      Connect to `Pushed` signal.
  
      Emitted after a page has been pushed to the navigation stack.
        
        See [adw.navigation_view.NavigationView.push].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.navigation_view.NavigationView navigationView))
  
          `navigationView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPushed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.navigation_view.NavigationView)))
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
    return connectSignalClosure("pushed", closure, after);
  }

  /**
      Connect to `Replaced` signal.
  
      Emitted after the navigation stack has been replaced.
        
        See [adw.navigation_view.NavigationView.replace].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.navigation_view.NavigationView navigationView))
  
          `navigationView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectReplaced(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.navigation_view.NavigationView)))
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
    return connectSignalClosure("replaced", closure, after);
  }
}
