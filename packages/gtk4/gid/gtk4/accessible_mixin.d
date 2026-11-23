/// Module for [Accessible] interface mixin
module gid.gtk4.accessible_mixin;

public import gid.core.basictypes;
public import gid.gtk4.accessible_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.value;
public import gid.gtk4.atcontext;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    An interface for describing UI elements for Assistive Technologies.
    
    Every accessible implementation has:
    
     - a “role”, represented by a value of the [gid.gtk4.types.AccessibleRole] enumeration
     - “attributes”, represented by a set of [gid.gtk4.types.AccessibleState],
       [gid.gtk4.types.AccessibleProperty] and [gid.gtk4.types.AccessibleRelation] values
    
    The role cannot be changed after instantiating a [gid.gtk4.accessible.Accessible]
    implementation.
    
    The attributes are updated every time a UI element's state changes in
    a way that should be reflected by assistive technologies. For instance,
    if a [gid.gtk4.widget.Widget] visibility changes, the [gid.gtk4.types.AccessibleState.Hidden]
    state will also change to reflect the [gid.gtk4.widget.Widget.visible] property.
    
    Every accessible implementation is part of a tree of accessible objects.
    Normally, this tree corresponds to the widget tree, but can be customized
    by reimplementing the `vfunc@Gtk.Accessible.get_accessible_parent`,
    `vfunc@Gtk.Accessible.get_first_accessible_child` and
    `vfunc@Gtk.Accessible.get_next_accessible_sibling` virtual functions.
    
    Note that you can not create a top-level accessible object as of now,
    which means that you must always have a parent accessible object.
    
    Also note that when an accessible object does not correspond to a widget,
    and it has children, whose implementation you don't control,
    it is necessary to ensure the correct shape of the a11y tree
    by calling [gid.gtk4.accessible.Accessible.setAccessibleParent] and
    updating the sibling by [gid.gtk4.accessible.Accessible.updateNextAccessibleSibling].
*/
template AccessibleT()
{

  /**
      Get `accessibleRole` property.
      Returns: The accessible role of the given [gid.gtk4.accessible.Accessible] implementation.
        
        The accessible role cannot be changed once set.
  */
  @property gid.gtk4.types.AccessibleRole accessibleRole() nothrow
  {
    return getAccessibleRole();
  }

  /**
      Set `accessibleRole` property.
      Params:
        propval = The accessible role of the given [gid.gtk4.accessible.Accessible] implementation.
          
          The accessible role cannot be changed once set.
  */
  @property void accessibleRole(gid.gtk4.types.AccessibleRole propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.types.AccessibleRole)("accessible-role", propval);
  }

  /**
      Retrieves the accessible identifier for the accessible object.
      
      This functionality can be overridden by [gid.gtk4.accessible.Accessible]
      implementations.
      
      It is left to the accessible implementation to define the scope
      and uniqueness of the identifier.
      Returns: the accessible identifier
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetAccessibleId`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetAccessibleId()
  {
    auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible.Accessible._getGType);
    if (!_klass || !_klass.getAccessibleId)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getAccessibleId(cast(GtkAccessible*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Retrieves the accessible parent for an accessible object.
      
      This function returns `NULL` for top level widgets.
      Returns: the accessible parent
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetAccessibleParent`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk4.accessible.Accessible vfuncGetAccessibleParent()
  {
    auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible.Accessible._getGType);
    if (!_klass || !_klass.getAccessibleParent)
      return typeof(return).init;

    GtkAccessible* _cretval;
    _cretval = _klass.getAccessibleParent(cast(GtkAccessible*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.accessible.Accessible)(cast(GtkAccessible*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the implementation for the given accessible object.
      Returns: the accessible implementation object
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetAtContext`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk4.atcontext.ATContext vfuncGetAtContext()
  {
    auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible.Accessible._getGType);
    if (!_klass || !_klass.getAtContext)
      return typeof(return).init;

    GtkATContext* _cretval;
    _cretval = _klass.getAtContext(cast(GtkAccessible*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.atcontext.ATContext)(cast(GtkATContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Queries the coordinates and dimensions of this accessible
      
      This functionality can be overridden by [gid.gtk4.accessible.Accessible]
      implementations, e.g. to get the bounds from an ignored
      child widget.
  
      Params:
        x = the x coordinate of the top left corner of the accessible
        y = the y coordinate of the top left corner of the widget
        width = the width of the accessible object
        height = the height of the accessible object
      Returns: true if the bounds are valid, and false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetBounds`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetBounds(out int x, out int y, out int width, out int height)
  {
    auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible.Accessible._getGType);
    if (!_klass || !_klass.getBounds)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getBounds(cast(GtkAccessible*)this._cPtr, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height);
    return _retval;
  }

  /**
      Retrieves the first accessible child of an accessible object.
      Returns: the first accessible child
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetFirstAccessibleChild`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk4.accessible.Accessible vfuncGetFirstAccessibleChild()
  {
    auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible.Accessible._getGType);
    if (!_klass || !_klass.getFirstAccessibleChild)
      return typeof(return).init;

    GtkAccessible* _cretval;
    _cretval = _klass.getFirstAccessibleChild(cast(GtkAccessible*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.accessible.Accessible)(cast(GtkAccessible*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the next accessible sibling of an accessible object
      Returns: the next accessible sibling
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetNextAccessibleSibling`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk4.accessible.Accessible vfuncGetNextAccessibleSibling()
  {
    auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible.Accessible._getGType);
    if (!_klass || !_klass.getNextAccessibleSibling)
      return typeof(return).init;

    GtkAccessible* _cretval;
    _cretval = _klass.getNextAccessibleSibling(cast(GtkAccessible*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.accessible.Accessible)(cast(GtkAccessible*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Queries a platform state, such as focus.
      
      This functionality can be overridden by [gid.gtk4.accessible.Accessible]
      implementations, e.g. to get platform state from an ignored
      child widget, as is the case for [gid.gtk4.text.Text] wrappers.
  
      Params:
        state = platform state to query
      Returns: the value of state for the accessible
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetPlatformState`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetPlatformState(gid.gtk4.types.AccessiblePlatformState state)
  {
    auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible.Accessible._getGType);
    if (!_klass || !_klass.getPlatformState)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getPlatformState(cast(GtkAccessible*)this._cPtr, state);
    return _retval;
  }

  /**
      Requests the user's screen reader to announce the given message.
      
      This kind of notification is useful for messages that
      either have only a visual representation or that are not
      exposed visually at all, e.g. a notification about a
      successful operation.
      
      Also, by using this API, you can ensure that the message
      does not interrupts the user's current screen reader output.
  
      Params:
        message = the string to announce
        priority = the priority of the announcement
  */
  override void announce(string message, gid.gtk4.types.AccessibleAnnouncementPriority priority) nothrow
  {
    const(char)* _message = message.toCString!(No.Malloc, No.Nullable);
    gtk_accessible_announce(cast(GtkAccessible*)this._cPtr, _message, priority);
  }

  /**
      Retrieves the accessible identifier for the accessible object.
      
      This functionality can be overridden by [gid.gtk4.accessible.Accessible]
      implementations.
      
      It is left to the accessible implementation to define the scope
      and uniqueness of the identifier.
      Returns: the accessible identifier
  */
  override string getAccessibleId() nothrow
  {
    char* _cretval;
    _cretval = gtk_accessible_get_accessible_id(cast(GtkAccessible*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Retrieves the accessible parent for an accessible object.
      
      This function returns `NULL` for top level widgets.
      Returns: the accessible parent
  */
  override gid.gtk4.accessible.Accessible getAccessibleParent() nothrow
  {
    GtkAccessible* _cretval;
    _cretval = gtk_accessible_get_accessible_parent(cast(GtkAccessible*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.accessible.Accessible)(cast(GtkAccessible*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the accessible role of an accessible object.
      Returns: the accessible role
  */
  override gid.gtk4.types.AccessibleRole getAccessibleRole() nothrow
  {
    GtkAccessibleRole _cretval;
    _cretval = gtk_accessible_get_accessible_role(cast(GtkAccessible*)this._cPtr);
    gid.gtk4.types.AccessibleRole _retval = cast(gid.gtk4.types.AccessibleRole)_cretval;
    return _retval;
  }

  /**
      Retrieves the implementation for the given accessible object.
      Returns: the accessible implementation object
  */
  override gid.gtk4.atcontext.ATContext getAtContext() nothrow
  {
    GtkATContext* _cretval;
    _cretval = gtk_accessible_get_at_context(cast(GtkAccessible*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.atcontext.ATContext)(cast(GtkATContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Queries the coordinates and dimensions of this accessible
      
      This functionality can be overridden by [gid.gtk4.accessible.Accessible]
      implementations, e.g. to get the bounds from an ignored
      child widget.
  
      Params:
        x = the x coordinate of the top left corner of the accessible
        y = the y coordinate of the top left corner of the widget
        width = the width of the accessible object
        height = the height of the accessible object
      Returns: true if the bounds are valid, and false otherwise
  */
  override bool getBounds(out int x, out int y, out int width, out int height) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_accessible_get_bounds(cast(GtkAccessible*)this._cPtr, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height);
    return _retval;
  }

  /**
      Retrieves the first accessible child of an accessible object.
      Returns: the first accessible child
  */
  override gid.gtk4.accessible.Accessible getFirstAccessibleChild() nothrow
  {
    GtkAccessible* _cretval;
    _cretval = gtk_accessible_get_first_accessible_child(cast(GtkAccessible*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.accessible.Accessible)(cast(GtkAccessible*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the next accessible sibling of an accessible object
      Returns: the next accessible sibling
  */
  override gid.gtk4.accessible.Accessible getNextAccessibleSibling() nothrow
  {
    GtkAccessible* _cretval;
    _cretval = gtk_accessible_get_next_accessible_sibling(cast(GtkAccessible*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.accessible.Accessible)(cast(GtkAccessible*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Queries a platform state, such as focus.
      
      This functionality can be overridden by [gid.gtk4.accessible.Accessible]
      implementations, e.g. to get platform state from an ignored
      child widget, as is the case for [gid.gtk4.text.Text] wrappers.
  
      Params:
        state = platform state to query
      Returns: the value of state for the accessible
  */
  override bool getPlatformState(gid.gtk4.types.AccessiblePlatformState state) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_accessible_get_platform_state(cast(GtkAccessible*)this._cPtr, state);
    return _retval;
  }

  /**
      Resets the accessible property to its default value.
  
      Params:
        property = the accessible property
  */
  override void resetProperty(gid.gtk4.types.AccessibleProperty property) nothrow
  {
    gtk_accessible_reset_property(cast(GtkAccessible*)this._cPtr, property);
  }

  /**
      Resets the accessible relation to its default value.
  
      Params:
        relation = the accessible relation
  */
  override void resetRelation(gid.gtk4.types.AccessibleRelation relation) nothrow
  {
    gtk_accessible_reset_relation(cast(GtkAccessible*)this._cPtr, relation);
  }

  /**
      Resets the accessible state to its default value.
  
      Params:
        state = the accessible state
  */
  override void resetState(gid.gtk4.types.AccessibleState state) nothrow
  {
    gtk_accessible_reset_state(cast(GtkAccessible*)this._cPtr, state);
  }

  /**
      Sets the parent and sibling of an accessible object.
      
      This function is meant to be used by accessible implementations that are
      not part of the widget hierarchy, and but act as a logical bridge between
      widgets. For instance, if a widget creates an object that holds metadata
      for each child, and you want that object to implement the [gid.gtk4.accessible.Accessible]
      interface, you will use this function to ensure that the parent of each
      child widget is the metadata object, and the parent of each metadata
      object is the container widget.
  
      Params:
        parent = the parent accessible object
        nextSibling = the sibling accessible object
  */
  override void setAccessibleParent(gid.gtk4.accessible.Accessible parent = null, gid.gtk4.accessible.Accessible nextSibling = null) nothrow
  {
    gtk_accessible_set_accessible_parent(cast(GtkAccessible*)this._cPtr, parent ? cast(GtkAccessible*)(cast(gid.gobject2.object.ObjectWrap)parent)._cPtr(No.Dup) : null, nextSibling ? cast(GtkAccessible*)(cast(gid.gobject2.object.ObjectWrap)nextSibling)._cPtr(No.Dup) : null);
  }

  /**
      Updates the next accessible sibling.
      
      That might be useful when a new child of a custom accessible
      is created, and it needs to be linked to a previous child.
  
      Params:
        newSibling = the new next accessible sibling to set
  */
  override void updateNextAccessibleSibling(gid.gtk4.accessible.Accessible newSibling = null) nothrow
  {
    gtk_accessible_update_next_accessible_sibling(cast(GtkAccessible*)this._cPtr, newSibling ? cast(GtkAccessible*)(cast(gid.gobject2.object.ObjectWrap)newSibling)._cPtr(No.Dup) : null);
  }

  /**
      Informs ATs that the platform state has changed.
      
      This function should be used by [gid.gtk4.accessible.Accessible] implementations that
      have a platform state but are not widgets. Widgets handle platform
      states automatically.
  
      Params:
        state = the platform state to update
  */
  override void updatePlatformState(gid.gtk4.types.AccessiblePlatformState state) nothrow
  {
    gtk_accessible_update_platform_state(cast(GtkAccessible*)this._cPtr, state);
  }

  /**
      Updates an array of accessible properties.
      
      This function should be called by [gid.gtk4.widget.Widget] types whenever an accessible
      property change must be communicated to assistive technologies.
      
      This function is meant to be used by language bindings.
  
      Params:
        properties = an array of accessible properties
        values = an array of `GValues`, one for each property
  */
  override void updateProperty(gid.gtk4.types.AccessibleProperty[] properties, gid.gobject2.value.Value[] values) nothrow
  {
    int _nProperties;
    if (properties)
      _nProperties = cast(int)properties.length;

    auto _properties = cast(GtkAccessibleProperty*)properties.ptr;
    if (values)
      _nProperties = cast(int)values.length;

    auto _values_arr = new GValue[](values.length);
    auto _values = _values_arr.ptr;
    foreach (i, obj; values) _values[i] = obj ? *cast(GValue*)obj._cPtr(No.Dup) : GValue.init;
    gtk_accessible_update_property_value(cast(GtkAccessible*)this._cPtr, _nProperties, _properties, _values);
  }

  /**
      Updates an array of accessible relations.
      
      This function should be called by [gid.gtk4.widget.Widget] types whenever an accessible
      relation change must be communicated to assistive technologies.
      
      This function is meant to be used by language bindings.
  
      Params:
        relations = an array of accessible relations
        values = an array of `GValues`, one for each relation
  */
  override void updateRelation(gid.gtk4.types.AccessibleRelation[] relations, gid.gobject2.value.Value[] values) nothrow
  {
    int _nRelations;
    if (relations)
      _nRelations = cast(int)relations.length;

    auto _relations = cast(GtkAccessibleRelation*)relations.ptr;
    if (values)
      _nRelations = cast(int)values.length;

    auto _values_arr = new GValue[](values.length);
    auto _values = _values_arr.ptr;
    foreach (i, obj; values) _values[i] = obj ? *cast(GValue*)obj._cPtr(No.Dup) : GValue.init;
    gtk_accessible_update_relation_value(cast(GtkAccessible*)this._cPtr, _nRelations, _relations, _values);
  }

  /**
      Updates an array of accessible states.
      
      This function should be called by [gid.gtk4.widget.Widget] types whenever an accessible
      state change must be communicated to assistive technologies.
      
      This function is meant to be used by language bindings.
  
      Params:
        states = an array of accessible states
        values = an array of `GValues`, one for each state
  */
  override void updateState(gid.gtk4.types.AccessibleState[] states, gid.gobject2.value.Value[] values) nothrow
  {
    int _nStates;
    if (states)
      _nStates = cast(int)states.length;

    auto _states = cast(GtkAccessibleState*)states.ptr;
    if (values)
      _nStates = cast(int)values.length;

    auto _values_arr = new GValue[](values.length);
    auto _values = _values_arr.ptr;
    foreach (i, obj; values) _values[i] = obj ? *cast(GValue*)obj._cPtr(No.Dup) : GValue.init;
    gtk_accessible_update_state_value(cast(GtkAccessible*)this._cPtr, _nStates, _states, _values);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.accessible.Accessible (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_accessible_Accessible(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetAccessibleId", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetAccessibleParent", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetAtContext", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetBounds", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFirstAccessibleChild", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNextAccessibleSibling", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPlatformState", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.accessible.Accessible vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_accessible_Accessible(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetAccessibleId", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_Accessible(iface, "get_accessible_id");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetAccessibleParent", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_Accessible(iface, "get_accessible_parent");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetAtContext", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_Accessible(iface, "get_at_context");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetBounds", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_Accessible(iface, "get_bounds");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFirstAccessibleChild", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_Accessible(iface, "get_first_accessible_child");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNextAccessibleSibling", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_Accessible(iface, "get_next_accessible_sibling");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPlatformState", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_Accessible(iface, "get_platform_state");
  }

  private static void _installIfaceVfunc_gid_gtk4_accessible_Accessible(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkAccessibleInterface*)iface;

    switch (vfunc)
    {
      case "get_accessible_id":
      {
        static extern(C) char* _vfuncGetAccessibleIdTramp(GtkAccessible* self) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible.Accessible._getGType);
            if (_klass && _klass.getAccessibleId)
              return (cast(typeof(&_vfuncGetAccessibleIdTramp))_klass.getAccessibleId)(self);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetAccessibleId();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible.Accessible.vfuncGetAccessibleId");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getAccessibleId = cast(typeof(_klass.getAccessibleId))&_vfuncGetAccessibleIdTramp;
        break;
      }
      case "get_accessible_parent":
      {
        static extern(C) GtkAccessible* _vfuncGetAccessibleParentTramp(GtkAccessible* self) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible.Accessible._getGType);
            if (_klass && _klass.getAccessibleParent)
              return (cast(typeof(&_vfuncGetAccessibleParentTramp))_klass.getAccessibleParent)(self);
            return typeof(return).init;
          }

          gid.gtk4.accessible.Accessible _dretval;

          try
          {
            _dretval = _obj.vfuncGetAccessibleParent();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible.Accessible.vfuncGetAccessibleParent");
          }
          auto _retval = _dretval ? cast(GtkAccessible*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getAccessibleParent = cast(typeof(_klass.getAccessibleParent))&_vfuncGetAccessibleParentTramp;
        break;
      }
      case "get_at_context":
      {
        static extern(C) GtkATContext* _vfuncGetAtContextTramp(GtkAccessible* self) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible.Accessible._getGType);
            if (_klass && _klass.getAtContext)
              return (cast(typeof(&_vfuncGetAtContextTramp))_klass.getAtContext)(self);
            return typeof(return).init;
          }

          gid.gtk4.atcontext.ATContext _dretval;

          try
          {
            _dretval = _obj.vfuncGetAtContext();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible.Accessible.vfuncGetAtContext");
          }
          auto _retval = _dretval ? cast(GtkATContext*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getAtContext = cast(typeof(_klass.getAtContext))&_vfuncGetAtContextTramp;
        break;
      }
      case "get_bounds":
      {
        static extern(C) gboolean _vfuncGetBoundsTramp(GtkAccessible* self, int* x, int* y, int* width, int* height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible.Accessible._getGType);
            if (_klass && _klass.getBounds)
              return (cast(typeof(&_vfuncGetBoundsTramp))_klass.getBounds)(self, x, y, width, height);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGetBounds(*x, *y, *width, *height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible.Accessible.vfuncGetBounds");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getBounds = cast(typeof(_klass.getBounds))&_vfuncGetBoundsTramp;
        break;
      }
      case "get_first_accessible_child":
      {
        static extern(C) GtkAccessible* _vfuncGetFirstAccessibleChildTramp(GtkAccessible* self) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible.Accessible._getGType);
            if (_klass && _klass.getFirstAccessibleChild)
              return (cast(typeof(&_vfuncGetFirstAccessibleChildTramp))_klass.getFirstAccessibleChild)(self);
            return typeof(return).init;
          }

          gid.gtk4.accessible.Accessible _dretval;

          try
          {
            _dretval = _obj.vfuncGetFirstAccessibleChild();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible.Accessible.vfuncGetFirstAccessibleChild");
          }
          auto _retval = _dretval ? cast(GtkAccessible*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getFirstAccessibleChild = cast(typeof(_klass.getFirstAccessibleChild))&_vfuncGetFirstAccessibleChildTramp;
        break;
      }
      case "get_next_accessible_sibling":
      {
        static extern(C) GtkAccessible* _vfuncGetNextAccessibleSiblingTramp(GtkAccessible* self) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible.Accessible._getGType);
            if (_klass && _klass.getNextAccessibleSibling)
              return (cast(typeof(&_vfuncGetNextAccessibleSiblingTramp))_klass.getNextAccessibleSibling)(self);
            return typeof(return).init;
          }

          gid.gtk4.accessible.Accessible _dretval;

          try
          {
            _dretval = _obj.vfuncGetNextAccessibleSibling();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible.Accessible.vfuncGetNextAccessibleSibling");
          }
          auto _retval = _dretval ? cast(GtkAccessible*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getNextAccessibleSibling = cast(typeof(_klass.getNextAccessibleSibling))&_vfuncGetNextAccessibleSiblingTramp;
        break;
      }
      case "get_platform_state":
      {
        static extern(C) gboolean _vfuncGetPlatformStateTramp(GtkAccessible* self, GtkAccessiblePlatformState state) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible.Accessible._getGType);
            if (_klass && _klass.getPlatformState)
              return (cast(typeof(&_vfuncGetPlatformStateTramp))_klass.getPlatformState)(self, state);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGetPlatformState(state);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible.Accessible.vfuncGetPlatformState");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getPlatformState = cast(typeof(_klass.getPlatformState))&_vfuncGetPlatformStateTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.accessible.Accessible]
template AccessibleGidBuilderT()
{

  /**
      Set `accessibleRole` property.
      Params:
        propval = The accessible role of the given [gid.gtk4.accessible.Accessible] implementation.
          
          The accessible role cannot be changed once set.
      Returns: Builder instance for fluent chaining
  */
  T accessibleRole(gid.gtk4.types.AccessibleRole propval) nothrow
  {
    return setProperty("accessible-role", propval);
  }
}
