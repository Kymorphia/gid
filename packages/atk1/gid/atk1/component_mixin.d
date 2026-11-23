/// Module for [Component] interface mixin
module gid.atk1.component_mixin;

public import gid.core.basictypes;
public import gid.atk1.component_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.object;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The ATK interface provided by UI components
    which occupy a physical area on the screen.
    which the user can activate/interact with.
    
    #AtkComponent should be implemented by most if not all UI elements
    with an actual on-screen presence, i.e. components which can be
    said to have a screen-coordinate bounding box.  Virtually all
    widgets will need to have #AtkComponent implementations provided
    for their corresponding #AtkObject class.  In short, only UI
    elements which are *not* GUI elements will omit this ATK interface.
    
    A possible exception might be textual information with a
    transparent background, in which case text glyph bounding box
    information is provided by #AtkText.
*/
template ComponentT()
{

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncBoundsChanged(gid.atk1.types.Rectangle bounds)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.boundsChanged)
      return;

    _klass.boundsChanged(cast(AtkComponent*)this._cPtr, cast(AtkRectangle*)&bounds);
  }

  /**
      Checks whether the specified point is within the extent of the component.
      
      Toolkit implementor note: ATK provides a default implementation for
      this virtual method. In general there are little reason to
      re-implement it.
  
      Params:
        x = x coordinate
        y = y coordinate
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
      Returns: true or false indicating whether the specified point is within
        the extent of the component or not
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncContains`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncContains(int x, int y, gid.atk1.types.CoordType coordType)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.contains)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.contains(cast(AtkComponent*)this._cPtr, x, y, coordType);
    return _retval;
  }

  /**
      Returns the alpha value (i.e. the opacity) for this
      component, on a scale from 0 (fully transparent) to 1.0
      (fully opaque).
      Returns: An alpha value from 0 to 1.0, inclusive.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetAlpha`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected double vfuncGetAlpha()
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.getAlpha)
      return typeof(return).init;

    double _retval;
    _retval = _klass.getAlpha(cast(AtkComponent*)this._cPtr);
    return _retval;
  }

  /**
      Gets the rectangle which gives the extent of the component.
      
      If the extent can not be obtained (e.g. a non-embedded plug or missing
      support), all of x, y, width, height are set to -1.
  
      Params:
        x = address of #gint to put x coordinate
        y = address of #gint to put y coordinate
        width = address of #gint to put width
        height = address of #gint to put height
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetExtents`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetExtents(out int x, out int y, out int width, out int height, gid.atk1.types.CoordType coordType)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.getExtents)
      return;

    _klass.getExtents(cast(AtkComponent*)this._cPtr, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height, coordType);
  }

  /**
      Gets the layer of the component.
      Returns: an #AtkLayer which is the layer of the component
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncComponentGetLayer`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.types.Layer vfuncComponentGetLayer()
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.getLayer)
      return typeof(return).init;

    AtkLayer _cretval;
    _cretval = _klass.getLayer(cast(AtkComponent*)this._cPtr);
    gid.atk1.types.Layer _retval = cast(gid.atk1.types.Layer)_cretval;
    return _retval;
  }

  /**
      Gets the zorder of the component. The value G_MININT will be returned
      if the layer of the component is not ATK_LAYER_MDI or ATK_LAYER_WINDOW.
      Returns: a gint which is the zorder of the component, i.e. the depth at
        which the component is shown in relation to other components in the same
        container.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncComponentGetMdiZorder`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncComponentGetMdiZorder()
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.getMdiZorder)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getMdiZorder(cast(AtkComponent*)this._cPtr);
    return _retval;
  }

  /**
      Gets the position of component in the form of
      a point specifying component's top-left corner.
      
      If the position can not be obtained (e.g. a non-embedded plug or missing
      support), x and y are set to -1.
  
      Params:
        x = address of #gint to put x coordinate position
        y = address of #gint to put y coordinate position
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncComponentGetPosition`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Since 2.12. Use [gid.atk1.component.Component.getExtents] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncComponentGetPosition(out int x, out int y, gid.atk1.types.CoordType coordType)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.getPosition)
      return;

    _klass.getPosition(cast(AtkComponent*)this._cPtr, cast(int*)&x, cast(int*)&y, coordType);
  }

  /**
      Gets the size of the component in terms of width and height.
      
      If the size can not be obtained (e.g. a non-embedded plug or missing
      support), width and height are set to -1.
  
      Params:
        width = address of #gint to put width of component
        height = address of #gint to put height of component
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSize`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Since 2.12. Use [gid.atk1.component.Component.getExtents] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetSize(out int width, out int height)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.getSize)
      return;

    _klass.getSize(cast(AtkComponent*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Grabs focus for this component.
      Returns: true if successful, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncComponentGrabFocus`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncComponentGrabFocus()
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.grabFocus)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.grabFocus(cast(AtkComponent*)this._cPtr);
    return _retval;
  }

  /**
      Gets a reference to the accessible child, if one exists, at the
      coordinate point specified by `x` and `y`.
  
      Params:
        x = x coordinate
        y = y coordinate
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
      Returns: a reference to the accessible
        child, if one exists
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRefAccessibleAtPoint`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap vfuncRefAccessibleAtPoint(int x, int y, gid.atk1.types.CoordType coordType)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.refAccessibleAtPoint)
      return typeof(return).init;

    AtkObject* _cretval;
    _cretval = _klass.refAccessibleAtPoint(cast(AtkComponent*)this._cPtr, x, y, coordType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Remove the handler specified by handler_id from the list of
      functions to be executed when this object receives focus events
      (in or out).
  
      Params:
        handlerId = the handler id of the focus handler to be removed
          from component
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRemoveFocusHandler`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: If you need to track when an object gains or
        lose the focus, use the #AtkObject::state-change "focused" notification instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRemoveFocusHandler(uint handlerId)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.removeFocusHandler)
      return;

    _klass.removeFocusHandler(cast(AtkComponent*)this._cPtr, handlerId);
  }

  /**
      Makes component visible on the screen by scrolling all necessary parents.
      
      Contrary to atk_component_set_position, this does not actually move
      component in its parent, this only makes the parents scroll so that the
      object shows up on the screen, given its current position within the parents.
  
      Params:
        type = specify where the object should be made visible.
      Returns: whether scrolling was successful.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncScrollTo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncScrollTo(gid.atk1.types.ScrollType type)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.scrollTo)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.scrollTo(cast(AtkComponent*)this._cPtr, type);
    return _retval;
  }

  /**
      Move the top-left of component to a given position of the screen by
      scrolling all necessary parents.
  
      Params:
        coords = specify whether coordinates are relative to the screen or to the
          parent object.
        x = x-position where to scroll to
        y = y-position where to scroll to
      Returns: whether scrolling was successful.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncScrollToPoint`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncScrollToPoint(gid.atk1.types.CoordType coords, int x, int y)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.scrollToPoint)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.scrollToPoint(cast(AtkComponent*)this._cPtr, coords, x, y);
    return _retval;
  }

  /**
      Sets the extents of component.
  
      Params:
        x = x coordinate
        y = y coordinate
        width = width to set for component
        height = height to set for component
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
      Returns: true or false whether the extents were set or not
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetExtents`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetExtents(int x, int y, int width, int height, gid.atk1.types.CoordType coordType)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.setExtents)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setExtents(cast(AtkComponent*)this._cPtr, x, y, width, height, coordType);
    return _retval;
  }

  /**
      Sets the position of component.
      
      Contrary to atk_component_scroll_to, this does not trigger any scrolling,
      this just moves component in its parent.
  
      Params:
        x = x coordinate
        y = y coordinate
        coordType = specifies whether the coordinates are relative to the screen
          or to the component's top level window
      Returns: true or false whether or not the position was set or not
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetPosition`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetPosition(int x, int y, gid.atk1.types.CoordType coordType)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.setPosition)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setPosition(cast(AtkComponent*)this._cPtr, x, y, coordType);
    return _retval;
  }

  /**
      Set the size of the component in terms of width and height.
  
      Params:
        width = width to set for component
        height = height to set for component
      Returns: true or false whether the size was set or not
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetSize`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetSize(int width, int height)
  {
    auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.component.Component._getGType);
    if (!_klass || !_klass.setSize)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setSize(cast(AtkComponent*)this._cPtr, width, height);
    return _retval;
  }

  /**
      Checks whether the specified point is within the extent of the component.
      
      Toolkit implementor note: ATK provides a default implementation for
      this virtual method. In general there are little reason to
      re-implement it.
  
      Params:
        x = x coordinate
        y = y coordinate
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
      Returns: true or false indicating whether the specified point is within
        the extent of the component or not
  */
  override bool contains(int x, int y, gid.atk1.types.CoordType coordType) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_component_contains(cast(AtkComponent*)this._cPtr, x, y, coordType);
    return _retval;
  }

  /**
      Returns the alpha value (i.e. the opacity) for this
      component, on a scale from 0 (fully transparent) to 1.0
      (fully opaque).
      Returns: An alpha value from 0 to 1.0, inclusive.
  */
  override double getAlpha() nothrow
  {
    double _retval;
    _retval = atk_component_get_alpha(cast(AtkComponent*)this._cPtr);
    return _retval;
  }

  /**
      Gets the rectangle which gives the extent of the component.
      
      If the extent can not be obtained (e.g. a non-embedded plug or missing
      support), all of x, y, width, height are set to -1.
  
      Params:
        x = address of #gint to put x coordinate
        y = address of #gint to put y coordinate
        width = address of #gint to put width
        height = address of #gint to put height
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
  */
  override void getExtents(out int x, out int y, out int width, out int height, gid.atk1.types.CoordType coordType) nothrow
  {
    atk_component_get_extents(cast(AtkComponent*)this._cPtr, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height, coordType);
  }

  /**
      Gets the layer of the component.
      Returns: an #AtkLayer which is the layer of the component
  */
  override gid.atk1.types.Layer getLayer() nothrow
  {
    AtkLayer _cretval;
    _cretval = atk_component_get_layer(cast(AtkComponent*)this._cPtr);
    gid.atk1.types.Layer _retval = cast(gid.atk1.types.Layer)_cretval;
    return _retval;
  }

  /**
      Gets the zorder of the component. The value G_MININT will be returned
      if the layer of the component is not ATK_LAYER_MDI or ATK_LAYER_WINDOW.
      Returns: a gint which is the zorder of the component, i.e. the depth at
        which the component is shown in relation to other components in the same
        container.
  */
  override int getMdiZorder() nothrow
  {
    int _retval;
    _retval = atk_component_get_mdi_zorder(cast(AtkComponent*)this._cPtr);
    return _retval;
  }

  /**
      Gets the position of component in the form of
      a point specifying component's top-left corner.
      
      If the position can not be obtained (e.g. a non-embedded plug or missing
      support), x and y are set to -1.
  
      Params:
        x = address of #gint to put x coordinate position
        y = address of #gint to put y coordinate position
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
  
      Deprecated: Since 2.12. Use [gid.atk1.component.Component.getExtents] instead.
  */
  override void getPosition(out int x, out int y, gid.atk1.types.CoordType coordType) nothrow
  {
    atk_component_get_position(cast(AtkComponent*)this._cPtr, cast(int*)&x, cast(int*)&y, coordType);
  }

  /**
      Gets the size of the component in terms of width and height.
      
      If the size can not be obtained (e.g. a non-embedded plug or missing
      support), width and height are set to -1.
  
      Params:
        width = address of #gint to put width of component
        height = address of #gint to put height of component
  
      Deprecated: Since 2.12. Use [gid.atk1.component.Component.getExtents] instead.
  */
  override void getSize(out int width, out int height) nothrow
  {
    atk_component_get_size(cast(AtkComponent*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Grabs focus for this component.
      Returns: true if successful, false otherwise.
  */
  override bool grabFocus() nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_component_grab_focus(cast(AtkComponent*)this._cPtr);
    return _retval;
  }

  /**
      Gets a reference to the accessible child, if one exists, at the
      coordinate point specified by `x` and `y`.
  
      Params:
        x = x coordinate
        y = y coordinate
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
      Returns: a reference to the accessible
        child, if one exists
  */
  override gid.atk1.object.ObjectWrap refAccessibleAtPoint(int x, int y, gid.atk1.types.CoordType coordType) nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_component_ref_accessible_at_point(cast(AtkComponent*)this._cPtr, x, y, coordType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Remove the handler specified by handler_id from the list of
      functions to be executed when this object receives focus events
      (in or out).
  
      Params:
        handlerId = the handler id of the focus handler to be removed
          from component
  
      Deprecated: If you need to track when an object gains or
        lose the focus, use the #AtkObject::state-change "focused" notification instead.
  */
  override void removeFocusHandler(uint handlerId) nothrow
  {
    atk_component_remove_focus_handler(cast(AtkComponent*)this._cPtr, handlerId);
  }

  /**
      Makes component visible on the screen by scrolling all necessary parents.
      
      Contrary to atk_component_set_position, this does not actually move
      component in its parent, this only makes the parents scroll so that the
      object shows up on the screen, given its current position within the parents.
  
      Params:
        type = specify where the object should be made visible.
      Returns: whether scrolling was successful.
  */
  override bool scrollTo(gid.atk1.types.ScrollType type) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_component_scroll_to(cast(AtkComponent*)this._cPtr, type);
    return _retval;
  }

  /**
      Move the top-left of component to a given position of the screen by
      scrolling all necessary parents.
  
      Params:
        coords = specify whether coordinates are relative to the screen or to the
          parent object.
        x = x-position where to scroll to
        y = y-position where to scroll to
      Returns: whether scrolling was successful.
  */
  override bool scrollToPoint(gid.atk1.types.CoordType coords, int x, int y) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_component_scroll_to_point(cast(AtkComponent*)this._cPtr, coords, x, y);
    return _retval;
  }

  /**
      Sets the extents of component.
  
      Params:
        x = x coordinate
        y = y coordinate
        width = width to set for component
        height = height to set for component
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
      Returns: true or false whether the extents were set or not
  */
  override bool setExtents(int x, int y, int width, int height, gid.atk1.types.CoordType coordType) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_component_set_extents(cast(AtkComponent*)this._cPtr, x, y, width, height, coordType);
    return _retval;
  }

  /**
      Sets the position of component.
      
      Contrary to atk_component_scroll_to, this does not trigger any scrolling,
      this just moves component in its parent.
  
      Params:
        x = x coordinate
        y = y coordinate
        coordType = specifies whether the coordinates are relative to the screen
          or to the component's top level window
      Returns: true or false whether or not the position was set or not
  */
  override bool setPosition(int x, int y, gid.atk1.types.CoordType coordType) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_component_set_position(cast(AtkComponent*)this._cPtr, x, y, coordType);
    return _retval;
  }

  /**
      Set the size of the component in terms of width and height.
  
      Params:
        width = width to set for component
        height = height to set for component
      Returns: true or false whether the size was set or not
  */
  override bool setSize(int width, int height) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_component_set_size(cast(AtkComponent*)this._cPtr, width, height);
    return _retval;
  }

  /**
      Connect to `BoundsChanged` signal.
  
      The 'bounds-changed" signal is emitted when the position or
        size of the component changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.atk1.types.Rectangle arg1, gid.atk1.component.Component component)`
  
          `arg1` The AtkRectangle giving the new position and size. (optional)
  
          `component` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectBoundsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.atk1.types.Rectangle)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.atk1.component.Component)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.boundsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("bounds-changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.component.Component (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_component_Component(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncBoundsChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncContains", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetAlpha", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetExtents", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncComponentGetLayer", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncComponentGetMdiZorder", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncComponentGetPosition", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSize", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncComponentGrabFocus", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRefAccessibleAtPoint", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveFocusHandler", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncScrollTo", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncScrollToPoint", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetExtents", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetPosition", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSize", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.component.Component vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_component_Component(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncBoundsChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "bounds_changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncContains", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "contains");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetAlpha", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "get_alpha");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetExtents", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "get_extents");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncComponentGetLayer", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "get_layer");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncComponentGetMdiZorder", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "get_mdi_zorder");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncComponentGetPosition", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "get_position");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSize", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "get_size");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncComponentGrabFocus", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "grab_focus");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRefAccessibleAtPoint", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "ref_accessible_at_point");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveFocusHandler", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "remove_focus_handler");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncScrollTo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "scroll_to");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncScrollToPoint", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "scroll_to_point");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetExtents", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "set_extents");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetPosition", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "set_position");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSize", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_component_Component(iface, "set_size");
  }

  private static void _installIfaceVfunc_gid_atk1_component_Component(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkComponentIface*)iface;

    switch (vfunc)
    {
      case "bounds_changed":
      {
        static extern(C) void _vfuncBoundsChangedTramp(AtkComponent* component, AtkRectangle* bounds) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.boundsChanged)
              return (cast(typeof(&_vfuncBoundsChangedTramp))_klass.boundsChanged)(component, bounds);
            return;
          }

          try
          {
            _obj.vfuncBoundsChanged(*cast(gid.atk1.types.Rectangle*)bounds);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncBoundsChanged");
          }
        }

        _klass.boundsChanged = cast(typeof(_klass.boundsChanged))&_vfuncBoundsChangedTramp;
        break;
      }
      case "contains":
      {
        static extern(C) gboolean _vfuncContainsTramp(AtkComponent* component, int x, int y, AtkCoordType coordType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.contains)
              return (cast(typeof(&_vfuncContainsTramp))_klass.contains)(component, x, y, coordType);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncContains(x, y, coordType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncContains");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.contains = cast(typeof(_klass.contains))&_vfuncContainsTramp;
        break;
      }
      case "get_alpha":
      {
        static extern(C) double _vfuncGetAlphaTramp(AtkComponent* component) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.getAlpha)
              return (cast(typeof(&_vfuncGetAlphaTramp))_klass.getAlpha)(component);
            return typeof(return).init;
          }

          double _retval;

          try
          {
            _retval = _obj.vfuncGetAlpha();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncGetAlpha");
          }
          return _retval;
        }

        _klass.getAlpha = cast(typeof(_klass.getAlpha))&_vfuncGetAlphaTramp;
        break;
      }
      case "get_extents":
      {
        static extern(C) void _vfuncGetExtentsTramp(AtkComponent* component, int* x, int* y, int* width, int* height, AtkCoordType coordType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.getExtents)
              return (cast(typeof(&_vfuncGetExtentsTramp))_klass.getExtents)(component, x, y, width, height, coordType);
            return;
          }

          typeof(*x) _xNull;
          if (!x)
            x = &_xNull;

          typeof(*y) _yNull;
          if (!y)
            y = &_yNull;

          typeof(*width) _widthNull;
          if (!width)
            width = &_widthNull;

          typeof(*height) _heightNull;
          if (!height)
            height = &_heightNull;

          try
          {
            _obj.vfuncGetExtents(*x, *y, *width, *height, coordType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncGetExtents");
          }
        }

        _klass.getExtents = cast(typeof(_klass.getExtents))&_vfuncGetExtentsTramp;
        break;
      }
      case "get_layer":
      {
        static extern(C) AtkLayer _vfuncComponentGetLayerTramp(AtkComponent* component) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.getLayer)
              return (cast(typeof(&_vfuncComponentGetLayerTramp))_klass.getLayer)(component);
            return typeof(return).init;
          }

          gid.atk1.types.Layer _dretval;

          try
          {
            _dretval = _obj.vfuncComponentGetLayer();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncComponentGetLayer");
          }
          auto _retval = cast(AtkLayer)_dretval;

          return _retval;
        }

        _klass.getLayer = cast(typeof(_klass.getLayer))&_vfuncComponentGetLayerTramp;
        break;
      }
      case "get_mdi_zorder":
      {
        static extern(C) int _vfuncComponentGetMdiZorderTramp(AtkComponent* component) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.getMdiZorder)
              return (cast(typeof(&_vfuncComponentGetMdiZorderTramp))_klass.getMdiZorder)(component);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncComponentGetMdiZorder();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncComponentGetMdiZorder");
          }
          return _retval;
        }

        _klass.getMdiZorder = cast(typeof(_klass.getMdiZorder))&_vfuncComponentGetMdiZorderTramp;
        break;
      }
      case "get_position":
      {
        static extern(C) void _vfuncComponentGetPositionTramp(AtkComponent* component, int* x, int* y, AtkCoordType coordType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.getPosition)
              return (cast(typeof(&_vfuncComponentGetPositionTramp))_klass.getPosition)(component, x, y, coordType);
            return;
          }

          typeof(*x) _xNull;
          if (!x)
            x = &_xNull;

          typeof(*y) _yNull;
          if (!y)
            y = &_yNull;

          try
          {
            _obj.vfuncComponentGetPosition(*x, *y, coordType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncComponentGetPosition");
          }
        }

        _klass.getPosition = cast(typeof(_klass.getPosition))&_vfuncComponentGetPositionTramp;
        break;
      }
      case "get_size":
      {
        static extern(C) void _vfuncGetSizeTramp(AtkComponent* component, int* width, int* height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.getSize)
              return (cast(typeof(&_vfuncGetSizeTramp))_klass.getSize)(component, width, height);
            return;
          }

          typeof(*width) _widthNull;
          if (!width)
            width = &_widthNull;

          typeof(*height) _heightNull;
          if (!height)
            height = &_heightNull;

          try
          {
            _obj.vfuncGetSize(*width, *height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncGetSize");
          }
        }

        _klass.getSize = cast(typeof(_klass.getSize))&_vfuncGetSizeTramp;
        break;
      }
      case "grab_focus":
      {
        static extern(C) gboolean _vfuncComponentGrabFocusTramp(AtkComponent* component) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.grabFocus)
              return (cast(typeof(&_vfuncComponentGrabFocusTramp))_klass.grabFocus)(component);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncComponentGrabFocus();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncComponentGrabFocus");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.grabFocus = cast(typeof(_klass.grabFocus))&_vfuncComponentGrabFocusTramp;
        break;
      }
      case "ref_accessible_at_point":
      {
        static extern(C) AtkObject* _vfuncRefAccessibleAtPointTramp(AtkComponent* component, int x, int y, AtkCoordType coordType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.refAccessibleAtPoint)
              return (cast(typeof(&_vfuncRefAccessibleAtPointTramp))_klass.refAccessibleAtPoint)(component, x, y, coordType);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncRefAccessibleAtPoint(x, y, coordType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncRefAccessibleAtPoint");
          }
          auto _retval = _dretval ? cast(AtkObject*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.refAccessibleAtPoint = cast(typeof(_klass.refAccessibleAtPoint))&_vfuncRefAccessibleAtPointTramp;
        break;
      }
      case "remove_focus_handler":
      {
        static extern(C) void _vfuncRemoveFocusHandlerTramp(AtkComponent* component, uint handlerId) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.removeFocusHandler)
              return (cast(typeof(&_vfuncRemoveFocusHandlerTramp))_klass.removeFocusHandler)(component, handlerId);
            return;
          }

          try
          {
            _obj.vfuncRemoveFocusHandler(handlerId);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncRemoveFocusHandler");
          }
        }

        _klass.removeFocusHandler = cast(typeof(_klass.removeFocusHandler))&_vfuncRemoveFocusHandlerTramp;
        break;
      }
      case "scroll_to":
      {
        static extern(C) gboolean _vfuncScrollToTramp(AtkComponent* component, AtkScrollType type) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.scrollTo)
              return (cast(typeof(&_vfuncScrollToTramp))_klass.scrollTo)(component, type);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncScrollTo(type);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncScrollTo");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.scrollTo = cast(typeof(_klass.scrollTo))&_vfuncScrollToTramp;
        break;
      }
      case "scroll_to_point":
      {
        static extern(C) gboolean _vfuncScrollToPointTramp(AtkComponent* component, AtkCoordType coords, int x, int y) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.scrollToPoint)
              return (cast(typeof(&_vfuncScrollToPointTramp))_klass.scrollToPoint)(component, coords, x, y);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncScrollToPoint(coords, x, y);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncScrollToPoint");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.scrollToPoint = cast(typeof(_klass.scrollToPoint))&_vfuncScrollToPointTramp;
        break;
      }
      case "set_extents":
      {
        static extern(C) gboolean _vfuncSetExtentsTramp(AtkComponent* component, int x, int y, int width, int height, AtkCoordType coordType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.setExtents)
              return (cast(typeof(&_vfuncSetExtentsTramp))_klass.setExtents)(component, x, y, width, height, coordType);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetExtents(x, y, width, height, coordType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncSetExtents");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setExtents = cast(typeof(_klass.setExtents))&_vfuncSetExtentsTramp;
        break;
      }
      case "set_position":
      {
        static extern(C) gboolean _vfuncSetPositionTramp(AtkComponent* component, int x, int y, AtkCoordType coordType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.setPosition)
              return (cast(typeof(&_vfuncSetPositionTramp))_klass.setPosition)(component, x, y, coordType);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetPosition(x, y, coordType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncSetPosition");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setPosition = cast(typeof(_klass.setPosition))&_vfuncSetPositionTramp;
        break;
      }
      case "set_size":
      {
        static extern(C) gboolean _vfuncSetSizeTramp(AtkComponent* component, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)component);
          if (!_obj)
          {
            auto _klass = cast(AtkComponentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)component), gid.atk1.component.Component._getGType);
            if (_klass && _klass.setSize)
              return (cast(typeof(&_vfuncSetSizeTramp))_klass.setSize)(component, width, height);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetSize(width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.component.Component.vfuncSetSize");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setSize = cast(typeof(_klass.setSize))&_vfuncSetSizeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.component.Component]
template ComponentGidBuilderT()
{
}
