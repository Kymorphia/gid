/// Module for [Container] class
module gtk.container;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import cairo.context;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.param_spec;
import gobject.types;
import gobject.value;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;
import gtk.widget_path;

/**
    A GTK+ user interface is constructed by nesting widgets inside widgets.
    Container widgets are the inner nodes in the resulting tree of widgets:
    they contain other widgets. So, for example, you might have a #GtkWindow
    containing a #GtkFrame containing a #GtkLabel. If you wanted an image instead
    of a textual label inside the frame, you might replace the #GtkLabel widget
    with a #GtkImage widget.
    
    There are two major kinds of container widgets in GTK+. Both are subclasses
    of the abstract GtkContainer base class.
    
    The first type of container widget has a single child widget and derives
    from #GtkBin. These containers are decorators, which
    add some kind of functionality to the child. For example, a #GtkButton makes
    its child into a clickable button; a #GtkFrame draws a frame around its child
    and a #GtkWindow places its child widget inside a top-level window.
    
    The second type of container can have more than one child; its purpose is to
    manage layout. This means that these containers assign
    sizes and positions to their children. For example, a #GtkHBox arranges its
    children in a horizontal row, and a #GtkGrid arranges the widgets it contains
    in a two-dimensional grid.
    
    For implementations of #GtkContainer the virtual method #GtkContainerClass.forall()
    is always required, since it's used for drawing and other internal operations
    on the children.
    If the #GtkContainer implementation expect to have non internal children
    it's needed to implement both #GtkContainerClass.add() and #GtkContainerClass.remove().
    If the GtkContainer implementation has internal children, they should be added
    with [gtk.widget.Widget.setParent] on init() and removed with [gtk.widget.Widget.unparent]
    in the #GtkWidgetClass.destroy() implementation.
    See more about implementing custom widgets at https://wiki.gnome.org/HowDoI/CustomWidgets
    
    # Height for width geometry management
    
    GTK+ uses a height-for-width (and width-for-height) geometry management system.
    Height-for-width means that a widget can change how much vertical space it needs,
    depending on the amount of horizontal space that it is given (and similar for
    width-for-height).
    
    There are some things to keep in mind when implementing container widgets
    that make use of GTK+’s height for width geometry management system. First,
    it’s important to note that a container must prioritize one of its
    dimensions, that is to say that a widget or container can only have a
    #GtkSizeRequestMode that is [gtk.types.SizeRequestMode.HeightForWidth] or
    [gtk.types.SizeRequestMode.WidthForHeight]. However, every widget and container
    must be able to respond to the APIs for both dimensions, i.e. even if a
    widget has a request mode that is height-for-width, it is possible that
    its parent will request its sizes using the width-for-height APIs.
    
    To ensure that everything works properly, here are some guidelines to follow
    when implementing height-for-width (or width-for-height) containers.
    
    Each request mode involves 2 virtual methods. Height-for-width apis run
    through [gtk.widget.Widget.getPreferredWidth] and then through [gtk.widget.Widget.getPreferredHeightForWidth].
    When handling requests in the opposite #GtkSizeRequestMode it is important that
    every widget request at least enough space to display all of its content at all times.
    
    When [gtk.widget.Widget.getPreferredHeight] is called on a container that is height-for-width,
    the container must return the height for its minimum width. This is easily achieved by
    simply calling the reverse apis implemented for itself as follows:
    
    ```c
    static void
    foo_container_get_preferred_height (GtkWidget *widget,
                                        gint *min_height,
                                        gint *nat_height)
    {
       if (i_am_in_height_for_width_mode)
         {
           gint min_width;
    
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_width (widget,
                                                               &min_width,
                                                               NULL);
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_height_for_width
                                                              (widget,
                                                               min_width,
                                                               min_height,
                                                               nat_height);
         }
       else
         {
           ... many containers support both request modes, execute the
           real width-for-height request here by returning the
           collective heights of all widgets that are stacked
           vertically (or whatever is appropriate for this container)
           ...
         }
    }
    ```
    
    Similarly, when [gtk.widget.Widget.getPreferredWidthForHeight] is called for a container or widget
    that is height-for-width, it then only needs to return the base minimum width like so:
    
    ```c
    static void
    foo_container_get_preferred_width_for_height (GtkWidget *widget,
                                                  gint for_height,
                                                  gint *min_width,
                                                  gint *nat_width)
    {
       if (i_am_in_height_for_width_mode)
         {
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_width (widget,
                                                               min_width,
                                                               nat_width);
         }
       else
         {
           ... execute the real width-for-height request here based on
           the required width of the children collectively if the
           container were to be allocated the said height ...
         }
    }
    ```
    
    Height for width requests are generally implemented in terms of a virtual allocation
    of widgets in the input orientation. Assuming an height-for-width request mode, a container
    would implement the get_preferred_height_for_width() virtual function by first calling
    [gtk.widget.Widget.getPreferredWidth] for each of its children.
    
    For each potential group of children that are lined up horizontally, the values returned by
    [gtk.widget.Widget.getPreferredWidth] should be collected in an array of #GtkRequestedSize structures.
    Any child spacing should be removed from the input @for_width and then the collective size should be
    allocated using the [gtk.global.distributeNaturalAllocation] convenience function.
    
    The container will then move on to request the preferred height for each child by using
    [gtk.widget.Widget.getPreferredHeightForWidth] and using the sizes stored in the #GtkRequestedSize array.
    
    To allocate a height-for-width container, it’s again important
    to consider that a container must prioritize one dimension over the other. So if
    a container is a height-for-width container it must first allocate all widgets horizontally
    using a #GtkRequestedSize array and [gtk.global.distributeNaturalAllocation] and then add any
    extra space (if and where appropriate) for the widget to expand.
    
    After adding all the expand space, the container assumes it was allocated sufficient
    height to fit all of its content. At this time, the container must use the total horizontal sizes
    of each widget to request the height-for-width of each of its children and store the requests in a
    #GtkRequestedSize array for any widgets that stack vertically (for tabular containers this can
    be generalized into the heights and widths of rows and columns).
    The vertical space must then again be distributed using [gtk.global.distributeNaturalAllocation]
    while this time considering the allocated height of the widget minus any vertical spacing
    that the container adds. Then vertical expand space should be added where appropriate and available
    and the container should go on to actually allocating the child widgets.
    
    See [GtkWidget’s geometry management section][geometry-management]
    to learn more about implementing height-for-width geometry management for widgets.
    
    # Child properties
    
    GtkContainer introduces child properties.
    These are object properties that are not specific
    to either the container or the contained widget, but rather to their relation.
    Typical examples of child properties are the position or pack-type of a widget
    which is contained in a #GtkBox.
    
    Use [gtk.container_class.ContainerClass.installChildProperty] to install child properties
    for a container class and [gtk.container_class.ContainerClass.findChildProperty] or
    [gtk.container_class.ContainerClass.listChildProperties] to get information about existing
    child properties.
    
    To set the value of a child property, use [gtk.container.Container.childSetProperty],
    [gtk.container.Container.childSet] or [gtk.container.Container.childSetValist].
    To obtain the value of a child property, use
    [gtk.container.Container.childGetProperty], [gtk.container.Container.childGet] or
    [gtk.container.Container.childGetValist]. To emit notification about child property
    changes, use [gtk.widget.Widget.childNotify].
    
    # GtkContainer as GtkBuildable
    
    The GtkContainer implementation of the GtkBuildable interface supports
    a `<packing>` element for children, which can contain multiple `<property>`
    elements that specify child properties for the child.
    
    Since 2.16, child properties can also be marked as translatable using
    the same “translatable”, “comments” and “context” attributes that are used
    for regular properties.
    
    Since 3.16, containers can have a `<focus-chain>` element containing multiple
    `<widget>` elements, one for each child that should be added to the focus
    chain. The ”name” attribute gives the id of the widget.
    
    An example of these properties in UI definitions:
    
    ```xml
    <object class="GtkBox">
      <child>
        <object class="GtkEntry" id="entry1"/>
        <packing>
          <property name="pack-type">start</property>
        </packing>
      </child>
      <child>
        <object class="GtkEntry" id="entry2"/>
      </child>
      <focus-chain>
        <widget name="entry1"/>
        <widget name="entry2"/>
      </focus-chain>
    </object>
    ```
*/
class Container : gtk.widget.Widget
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
    return cast(void function())gtk_container_get_type != &gidSymbolNotFound ? gtk_container_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Container self()
  {
    return this;
  }

  /** */
  @property uint borderWidth()
  {
    return getBorderWidth();
  }

  /** */
  @property void borderWidth(uint propval)
  {
    return setBorderWidth(propval);
  }

  /** */
  @property void child(gtk.widget.Widget propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.widget.Widget)("child", propval);
  }

  /** */
  @property gtk.types.ResizeMode resizeMode()
  {
    return getResizeMode();
  }

  /** */
  @property void resizeMode(gtk.types.ResizeMode propval)
  {
    return setResizeMode(propval);
  }

  /**
      Adds widget to container. Typically used for simple containers
      such as #GtkWindow, #GtkFrame, or #GtkButton; for more complicated
      layout containers such as #GtkBox or #GtkGrid, this function will
      pick default packing parameters that may not be correct.  So
      consider functions such as [gtk.box.Box.packStart] and
      [gtk.grid.Grid.attach] as an alternative to [gtk.container.Container.add] in
      those cases. A widget may be added to only one container at a time;
      you can’t place the same widget inside two different containers.
      
      Note that some containers, such as #GtkScrolledWindow or #GtkListBox,
      may add intermediate children between the added widget and the
      container.
  
      Params:
        widget = a widget to be placed inside container
  */
  void add(gtk.widget.Widget widget)
  {
    gtk_container_add(cast(GtkContainer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /** */
  void checkResize()
  {
    gtk_container_check_resize(cast(GtkContainer*)this._cPtr);
  }

  /**
      Gets the value of a child property for child and container.
  
      Params:
        child = a widget which is a child of container
        propertyName = the name of the property to get
        value = a location to return the value
  */
  void childGetProperty(gtk.widget.Widget child, string propertyName, gobject.value.Value value)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    gtk_container_child_get_property(cast(GtkContainer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _propertyName, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  alias childNotify = gtk.widget.Widget.childNotify;

  /**
      Emits a #GtkWidget::child-notify signal for the
      [child property][child-properties]
      child_property on the child.
      
      This is an analogue of [gobject.object.ObjectWrap.notify] for child properties.
      
      Also see [gtk.widget.Widget.childNotify].
  
      Params:
        child = the child widget
        childProperty = the name of a child property installed on
              the class of container
  */
  void childNotify(gtk.widget.Widget child, string childProperty)
  {
    const(char)* _childProperty = childProperty.toCString(No.Alloc);
    gtk_container_child_notify(cast(GtkContainer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _childProperty);
  }

  /**
      Emits a #GtkWidget::child-notify signal for the
      [child property][child-properties] specified by
      pspec on the child.
      
      This is an analogue of [gobject.object.ObjectWrap.notifyByPspec] for child properties.
  
      Params:
        child = the child widget
        pspec = the #GParamSpec of a child property instealled on
              the class of container
  */
  void childNotifyByPspec(gtk.widget.Widget child, gobject.param_spec.ParamSpec pspec)
  {
    gtk_container_child_notify_by_pspec(cast(GtkContainer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
  }

  /**
      Sets a child property for child and container.
  
      Params:
        child = a widget which is a child of container
        propertyName = the name of the property to set
        value = the value to set the property to
  */
  void childSetProperty(gtk.widget.Widget child, string propertyName, gobject.value.Value value)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    gtk_container_child_set_property(cast(GtkContainer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _propertyName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Returns the type of the children supported by the container.
      
      Note that this may return `G_TYPE_NONE` to indicate that no more
      children can be added, e.g. for a #GtkPaned which already has two
      children.
      Returns: a #GType.
  */
  gobject.types.GType childType()
  {
    gobject.types.GType _retval;
    _retval = gtk_container_child_type(cast(GtkContainer*)this._cPtr);
    return _retval;
  }

  /**
      Invokes callback on each direct child of container, including
      children that are considered “internal” (implementation details
      of the container). “Internal” children generally weren’t added
      by the user of the container, but were added by the container
      implementation itself.
      
      Most applications should use [gtk.container.Container.foreach_], rather
      than [gtk.container.Container.forall].
  
      Params:
        callback = a callback
  */
  void forall(gtk.types.Callback callback)
  {
    extern(C) void _callbackCallback(GtkWidget* widget, void* data)
    {
      auto _dlg = cast(gtk.types.Callback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(void*)widget, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? cast(void*)&(callback) : null;
    gtk_container_forall(cast(GtkContainer*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Invokes callback on each non-internal child of container.
      See [gtk.container.Container.forall] for details on what constitutes
      an “internal” child. For all practical purposes, this function
      should iterate over precisely those child widgets that were
      added to the container by the application with explicit add()
      calls.
      
      It is permissible to remove the child from the callback handler.
      
      Most applications should use [gtk.container.Container.foreach_],
      rather than [gtk.container.Container.forall].
  
      Params:
        callback = a callback
  */
  void foreach_(gtk.types.Callback callback)
  {
    extern(C) void _callbackCallback(GtkWidget* widget, void* data)
    {
      auto _dlg = cast(gtk.types.Callback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(void*)widget, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? cast(void*)&(callback) : null;
    gtk_container_foreach(cast(GtkContainer*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Retrieves the border width of the container. See
      [gtk.container.Container.setBorderWidth].
      Returns: the current border width
  */
  uint getBorderWidth()
  {
    uint _retval;
    _retval = gtk_container_get_border_width(cast(GtkContainer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the container’s non-internal children. See
      [gtk.container.Container.forall] for details on what constitutes an "internal" child.
      Returns: a newly-allocated list of the container’s non-internal children.
  */
  gtk.widget.Widget[] getChildren()
  {
    GList* _cretval;
    _cretval = gtk_container_get_children(cast(GtkContainer*)this._cPtr);
    auto _retval = gListToD!(gtk.widget.Widget, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Retrieves the focus chain of the container, if one has been
      set explicitly. If no focus chain has been explicitly
      set, GTK+ computes the focus chain based on the positions
      of the children. In that case, GTK+ stores null in
      focusable_widgets and returns false.
  
      Params:
        focusableWidgets = location
                              to store the focus chain of the
                              container, or null. You should free this list
                              using [glib.list.List.free] when you are done with it, however
                              no additional reference count is added to the
                              individual widgets in the focus chain.
      Returns: true if the focus chain of the container
        has been set explicitly.
  
      Deprecated: For overriding focus behavior, use the
            GtkWidgetClass::focus signal.
  */
  bool getFocusChain(out gtk.widget.Widget[] focusableWidgets)
  {
    bool _retval;
    GList* _focusableWidgets;
    _retval = cast(bool)gtk_container_get_focus_chain(cast(GtkContainer*)this._cPtr, &_focusableWidgets);
    focusableWidgets = gListToD!(gtk.widget.Widget, GidOwnership.Container)(_focusableWidgets);
    return _retval;
  }

  /**
      Returns the current focus child widget inside container. This is not the
      currently focused widget. That can be obtained by calling
      [gtk.window.Window.getFocus].
      Returns: The child widget which will receive the
                 focus inside container when the container is focused,
                 or null if none is set.
  */
  gtk.widget.Widget getFocusChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_container_get_focus_child(cast(GtkContainer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the horizontal focus adjustment for the container. See
      gtk_container_set_focus_hadjustment ().
      Returns: the horizontal focus adjustment, or null if
          none has been set.
  */
  gtk.adjustment.Adjustment getFocusHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_container_get_focus_hadjustment(cast(GtkContainer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the vertical focus adjustment for the container. See
      [gtk.container.Container.setFocusVadjustment].
      Returns: the vertical focus adjustment, or
          null if none has been set.
  */
  gtk.adjustment.Adjustment getFocusVadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_container_get_focus_vadjustment(cast(GtkContainer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a newly created widget path representing all the widget hierarchy
      from the toplevel down to and including child.
  
      Params:
        child = a child of container
      Returns: A newly created #GtkWidgetPath
  */
  gtk.widget_path.WidgetPath getPathForChild(gtk.widget.Widget child)
  {
    GtkWidgetPath* _cretval;
    _cretval = gtk_container_get_path_for_child(cast(GtkContainer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.widget_path.WidgetPath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the resize mode for the container. See
      gtk_container_set_resize_mode ().
      Returns: the current resize mode
  
      Deprecated: Resize modes are deprecated. They aren’t necessary
            anymore since frame clocks and might introduce obscure bugs if
            used.
  */
  gtk.types.ResizeMode getResizeMode()
  {
    GtkResizeMode _cretval;
    _cretval = gtk_container_get_resize_mode(cast(GtkContainer*)this._cPtr);
    gtk.types.ResizeMode _retval = cast(gtk.types.ResizeMode)_cretval;
    return _retval;
  }

  /**
      When a container receives a call to the draw function, it must send
      synthetic #GtkWidget::draw calls to all children that don’t have their
      own #GdkWindows. This function provides a convenient way of doing this.
      A container, when it receives a call to its #GtkWidget::draw function,
      calls [gtk.container.Container.propagateDraw] once for each child, passing in
      the cr the container received.
      
      [gtk.container.Container.propagateDraw] takes care of translating the origin of cr,
      and deciding whether the draw needs to be sent to the child. It is a
      convenient and optimized way of getting the same effect as calling
      [gtk.widget.Widget.draw] on the child directly.
      
      In most cases, a container can simply either inherit the
      #GtkWidget::draw implementation from #GtkContainer, or do some drawing
      and then chain to the ::draw implementation from #GtkContainer.
  
      Params:
        child = a child of container
        cr = Cairo context as passed to the container. If you want to use cr
            in container’s draw function, consider using [cairo.context.Context.save] and
            [cairo.context.Context.restore] before calling this function.
  */
  void propagateDraw(gtk.widget.Widget child, cairo.context.Context cr)
  {
    gtk_container_propagate_draw(cast(GtkContainer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  }

  /**
      Removes widget from container. widget must be inside container.
      Note that container will own a reference to widget, and that this
      may be the last reference held; so removing a widget from its
      container can destroy that widget. If you want to use widget
      again, you need to add a reference to it before removing it from
      a container, using [gobject.object.ObjectWrap.ref_]. If you don’t want to use widget
      again it’s usually more efficient to simply destroy it directly
      using [gtk.widget.Widget.destroy] since this will remove it from the
      container and help break any circular reference count cycles.
  
      Params:
        widget = a current child of container
  */
  void remove(gtk.widget.Widget widget)
  {
    gtk_container_remove(cast(GtkContainer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /** */
  void resizeChildren()
  {
    gtk_container_resize_children(cast(GtkContainer*)this._cPtr);
  }

  /**
      Sets the border width of the container.
      
      The border width of a container is the amount of space to leave
      around the outside of the container. The only exception to this is
      #GtkWindow; because toplevel windows can’t leave space outside,
      they leave the space inside. The border is added on all sides of
      the container. To add space to only one side, use a specific
      #GtkWidget:margin property on the child widget, for example
      #GtkWidget:margin-top.
  
      Params:
        borderWidth = amount of blank space to leave outside
            the container. Valid values are in the range 0-65535 pixels.
  */
  void setBorderWidth(uint borderWidth)
  {
    gtk_container_set_border_width(cast(GtkContainer*)this._cPtr, borderWidth);
  }

  /**
      Sets a focus chain, overriding the one computed automatically by GTK+.
      
      In principle each widget in the chain should be a descendant of the
      container, but this is not enforced by this method, since it’s allowed
      to set the focus chain before you pack the widgets, or have a widget
      in the chain that isn’t always packed. The necessary checks are done
      when the focus chain is actually traversed.
  
      Params:
        focusableWidgets = the new focus chain
  
      Deprecated: For overriding focus behavior, use the
            GtkWidgetClass::focus signal.
  */
  void setFocusChain(gtk.widget.Widget[] focusableWidgets)
  {
    auto _focusableWidgets = gListFromD!(gtk.widget.Widget)(focusableWidgets);
    scope(exit) containerFree!(GList*, gtk.widget.Widget, GidOwnership.None)(_focusableWidgets);
    gtk_container_set_focus_chain(cast(GtkContainer*)this._cPtr, _focusableWidgets);
  }

  /**
      Sets, or unsets if child is null, the focused child of container.
      
      This function emits the GtkContainer::set_focus_child signal of
      container. Implementations of #GtkContainer can override the
      default behaviour by overriding the class closure of this signal.
      
      This is function is mostly meant to be used by widgets. Applications can use
      [gtk.widget.Widget.grabFocus] to manually set the focus to a specific widget.
  
      Params:
        child = a #GtkWidget, or null
  */
  void setFocusChild(gtk.widget.Widget child = null)
  {
    gtk_container_set_focus_child(cast(GtkContainer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Hooks up an adjustment to focus handling in a container, so when a child
      of the container is focused, the adjustment is scrolled to show that
      widget. This function sets the horizontal alignment.
      See [gtk.scrolled_window.ScrolledWindow.getHadjustment] for a typical way of obtaining
      the adjustment and [gtk.container.Container.setFocusVadjustment] for setting
      the vertical adjustment.
      
      The adjustments have to be in pixel units and in the same coordinate
      system as the allocation for immediate children of the container.
  
      Params:
        adjustment = an adjustment which should be adjusted when the focus is
            moved among the descendents of container
  */
  void setFocusHadjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_container_set_focus_hadjustment(cast(GtkContainer*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Hooks up an adjustment to focus handling in a container, so when a
      child of the container is focused, the adjustment is scrolled to
      show that widget. This function sets the vertical alignment. See
      [gtk.scrolled_window.ScrolledWindow.getVadjustment] for a typical way of obtaining
      the adjustment and [gtk.container.Container.setFocusHadjustment] for setting
      the horizontal adjustment.
      
      The adjustments have to be in pixel units and in the same coordinate
      system as the allocation for immediate children of the container.
  
      Params:
        adjustment = an adjustment which should be adjusted when the focus
            is moved among the descendents of container
  */
  void setFocusVadjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_container_set_focus_vadjustment(cast(GtkContainer*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the reallocate_redraws flag of the container to the given value.
      
      Containers requesting reallocation redraws get automatically
      redrawn if any of their children changed allocation.
  
      Params:
        needsRedraws = the new value for the container’s reallocate_redraws flag
  
      Deprecated: Call [gtk.widget.Widget.queueDraw] in your size_allocate handler.
  */
  void setReallocateRedraws(bool needsRedraws)
  {
    gtk_container_set_reallocate_redraws(cast(GtkContainer*)this._cPtr, needsRedraws);
  }

  /**
      Sets the resize mode for the container.
      
      The resize mode of a container determines whether a resize request
      will be passed to the container’s parent, queued for later execution
      or executed immediately.
  
      Params:
        resizeMode = the new resize mode
  
      Deprecated: Resize modes are deprecated. They aren’t necessary
            anymore since frame clocks and might introduce obscure bugs if
            used.
  */
  void setResizeMode(gtk.types.ResizeMode resizeMode)
  {
    gtk_container_set_resize_mode(cast(GtkContainer*)this._cPtr, resizeMode);
  }

  /**
      Removes a focus chain explicitly set with [gtk.container.Container.setFocusChain].
  
      Deprecated: For overriding focus behavior, use the
            GtkWidgetClass::focus signal.
  */
  void unsetFocusChain()
  {
    gtk_container_unset_focus_chain(cast(GtkContainer*)this._cPtr);
  }

  /**
      Connect to `Add` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget object, gtk.container.Container container))
  
          `object`  (optional)
  
          `container` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAdd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.container.Container)))
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
    return connectSignalClosure("add", closure, after);
  }

  /**
      Connect to `CheckResize` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.container.Container container))
  
          `container` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCheckResize(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.container.Container)))
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
    return connectSignalClosure("check-resize", closure, after);
  }

  /**
      Connect to `Remove` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget object, gtk.container.Container container))
  
          `object`  (optional)
  
          `container` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRemove(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.container.Container)))
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
    return connectSignalClosure("remove", closure, after);
  }

  /**
      Connect to `SetFocusChild` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget object, gtk.container.Container container))
  
          `object`  (optional)
  
          `container` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSetFocusChild(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.container.Container)))
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
    return connectSignalClosure("set-focus-child", closure, after);
  }
}
