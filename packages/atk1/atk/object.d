/// Module for [ObjectWrap] class
module atk.object;

import atk.c.functions;
import atk.c.types;
import atk.property_values;
import atk.relation_set;
import atk.state_set;
import atk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    The base object class for the Accessibility Toolkit API.
    
    This class is the primary class for accessibility support via the
    Accessibility ToolKit (ATK).  Objects which are instances of
    #AtkObject (or instances of AtkObject-derived types) are queried
    for properties which relate basic (and generic) properties of a UI
    component such as name and description.  Instances of #AtkObject
    may also be queried as to whether they implement other ATK
    interfaces (e.g. #AtkAction, #AtkComponent, etc.), as appropriate
    to the role which a given UI component plays in a user interface.
    
    All UI components in an application which provide useful
    information or services to the user must provide corresponding
    #AtkObject instances on request (in GTK+, for instance, usually on
    a call to #gtk_widget_get_accessible ()), either via ATK support
    built into the toolkit for the widget class or ancestor class, or
    in the case of custom widgets, if the inherited #AtkObject
    implementation is insufficient, via instances of a new #AtkObject
    subclass.
    
    See `class@AtkObjectFactory`, `class@AtkRegistry`.  (GTK+ users see also
    #GtkAccessible).
*/
class ObjectWrap : gobject.object.ObjectWrap
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
    return cast(void function())atk_object_get_type != &gidSymbolNotFound ? atk_object_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ObjectWrap self()
  {
    return this;
  }

  /** */
  @property int accessibleComponentLayer()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("accessible-component-layer");
  }

  /** */
  @property int accessibleComponentMdiZorder()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("accessible-component-mdi-zorder");
  }

  /** */
  @property string accessibleDescription()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("accessible-description");
  }

  /** */
  @property void accessibleDescription(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("accessible-description", propval);
  }

  /** */
  @property string accessibleHelpText()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("accessible-help-text");
  }

  /** */
  @property void accessibleHelpText(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("accessible-help-text", propval);
  }

  /** */
  @property int accessibleHypertextNlinks()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("accessible-hypertext-nlinks");
  }

  /** */
  @property string accessibleId()
  {
    return getAccessibleId();
  }

  /** */
  @property void accessibleId(string propval)
  {
    return setAccessibleId(propval);
  }

  /** */
  @property string accessibleName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("accessible-name");
  }

  /** */
  @property void accessibleName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("accessible-name", propval);
  }

  /** */
  @property atk.object.ObjectWrap accessibleParent()
  {
    return gobject.object.ObjectWrap.getProperty!(atk.object.ObjectWrap)("accessible-parent");
  }

  /** */
  @property void accessibleParent(atk.object.ObjectWrap propval)
  {
    gobject.object.ObjectWrap.setProperty!(atk.object.ObjectWrap)("accessible-parent", propval);
  }

  /** */
  @property atk.types.Role accessibleRole()
  {
    return gobject.object.ObjectWrap.getProperty!(atk.types.Role)("accessible-role");
  }

  /** */
  @property void accessibleRole(atk.types.Role propval)
  {
    gobject.object.ObjectWrap.setProperty!(atk.types.Role)("accessible-role", propval);
  }

  /**
      Get `accessibleTableCaption` property.
      Returns: Table caption.
  
      Deprecated: Since 1.3. Use table-caption-object instead.
  */
  @property string accessibleTableCaption()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("accessible-table-caption");
  }

  /**
      Set `accessibleTableCaption` property.
      Params:
        propval = Table caption.
  
      Deprecated: Since 1.3. Use table-caption-object instead.
  */
  @property void accessibleTableCaption(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("accessible-table-caption", propval);
  }

  /** */
  @property atk.object.ObjectWrap accessibleTableCaptionObject()
  {
    return gobject.object.ObjectWrap.getProperty!(atk.object.ObjectWrap)("accessible-table-caption-object");
  }

  /** */
  @property void accessibleTableCaptionObject(atk.object.ObjectWrap propval)
  {
    gobject.object.ObjectWrap.setProperty!(atk.object.ObjectWrap)("accessible-table-caption-object", propval);
  }

  /**
      Get `accessibleTableColumnDescription` property.
      Returns: Accessible table column description.
  
      Deprecated: Since 2.12. Use [atk.table.Table.getColumnDescription]
        and [atk.table.Table.setColumnDescription] instead.
  */
  @property string accessibleTableColumnDescription()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("accessible-table-column-description");
  }

  /**
      Set `accessibleTableColumnDescription` property.
      Params:
        propval = Accessible table column description.
  
      Deprecated: Since 2.12. Use [atk.table.Table.getColumnDescription]
        and [atk.table.Table.setColumnDescription] instead.
  */
  @property void accessibleTableColumnDescription(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("accessible-table-column-description", propval);
  }

  /**
      Get `accessibleTableColumnHeader` property.
      Returns: Accessible table column header.
  
      Deprecated: Since 2.12. Use [atk.table.Table.getColumnHeader] and
        [atk.table.Table.setColumnHeader] instead.
  */
  @property atk.object.ObjectWrap accessibleTableColumnHeader()
  {
    return gobject.object.ObjectWrap.getProperty!(atk.object.ObjectWrap)("accessible-table-column-header");
  }

  /**
      Set `accessibleTableColumnHeader` property.
      Params:
        propval = Accessible table column header.
  
      Deprecated: Since 2.12. Use [atk.table.Table.getColumnHeader] and
        [atk.table.Table.setColumnHeader] instead.
  */
  @property void accessibleTableColumnHeader(atk.object.ObjectWrap propval)
  {
    gobject.object.ObjectWrap.setProperty!(atk.object.ObjectWrap)("accessible-table-column-header", propval);
  }

  /**
      Get `accessibleTableRowDescription` property.
      Returns: Accessible table row description.
  
      Deprecated: Since 2.12. Use [atk.table.Table.getRowDescription] and
        [atk.table.Table.setRowDescription] instead.
  */
  @property string accessibleTableRowDescription()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("accessible-table-row-description");
  }

  /**
      Set `accessibleTableRowDescription` property.
      Params:
        propval = Accessible table row description.
  
      Deprecated: Since 2.12. Use [atk.table.Table.getRowDescription] and
        [atk.table.Table.setRowDescription] instead.
  */
  @property void accessibleTableRowDescription(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("accessible-table-row-description", propval);
  }

  /**
      Get `accessibleTableRowHeader` property.
      Returns: Accessible table row header.
  
      Deprecated: Since 2.12. Use [atk.table.Table.getRowHeader] and
        [atk.table.Table.setRowHeader] instead.
  */
  @property atk.object.ObjectWrap accessibleTableRowHeader()
  {
    return gobject.object.ObjectWrap.getProperty!(atk.object.ObjectWrap)("accessible-table-row-header");
  }

  /**
      Set `accessibleTableRowHeader` property.
      Params:
        propval = Accessible table row header.
  
      Deprecated: Since 2.12. Use [atk.table.Table.getRowHeader] and
        [atk.table.Table.setRowHeader] instead.
  */
  @property void accessibleTableRowHeader(atk.object.ObjectWrap propval)
  {
    gobject.object.ObjectWrap.setProperty!(atk.object.ObjectWrap)("accessible-table-row-header", propval);
  }

  /** */
  @property atk.object.ObjectWrap accessibleTableSummary()
  {
    return gobject.object.ObjectWrap.getProperty!(atk.object.ObjectWrap)("accessible-table-summary");
  }

  /** */
  @property void accessibleTableSummary(atk.object.ObjectWrap propval)
  {
    gobject.object.ObjectWrap.setProperty!(atk.object.ObjectWrap)("accessible-table-summary", propval);
  }

  /**
      Get `accessibleValue` property.
      Returns: Numeric value of this object, in case being and AtkValue.
  
      Deprecated: Since 2.12. Use [atk.value.Value.getValueAndText] to get
        the value, and value-changed signal to be notified on their value
        changes.
  */
  @property double accessibleValue()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("accessible-value");
  }

  /**
      Set `accessibleValue` property.
      Params:
        propval = Numeric value of this object, in case being and AtkValue.
  
      Deprecated: Since 2.12. Use [atk.value.Value.getValueAndText] to get
        the value, and value-changed signal to be notified on their value
        changes.
  */
  @property void accessibleValue(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("accessible-value", propval);
  }

  /**
      Adds a relationship of the specified type with the specified target.
  
      Params:
        relationship = The #AtkRelationType of the relation
        target = The #AtkObject which is to be the target of the relation.
      Returns: TRUE if the relationship is added.
  */
  bool addRelationship(atk.types.RelationType relationship, atk.object.ObjectWrap target)
  {
    bool _retval;
    _retval = cast(bool)atk_object_add_relationship(cast(AtkObject*)this._cPtr, relationship, target ? cast(AtkObject*)target._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the accessible id of the accessible.
      Returns: a character string representing the accessible id of the object, or
        NULL if no such string was set.
  */
  string getAccessibleId()
  {
    const(char)* _cretval;
    _cretval = atk_object_get_accessible_id(cast(AtkObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the accessible description of the accessible.
      Returns: a character string representing the accessible description
        of the accessible.
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = atk_object_get_description(cast(AtkObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the help text associated with the accessible.
      Returns: a character string representing the help text or the object, or
        NULL if no such string was set.
  */
  string getHelpText()
  {
    const(char)* _cretval;
    _cretval = atk_object_get_help_text(cast(AtkObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the 0-based index of this accessible in its parent; returns -1 if the
      accessible does not have an accessible parent.
      Returns: an integer which is the index of the accessible in its parent
  */
  int getIndexInParent()
  {
    int _retval;
    _retval = atk_object_get_index_in_parent(cast(AtkObject*)this._cPtr);
    return _retval;
  }

  /**
      Gets the layer of the accessible.
      Returns: an #AtkLayer which is the layer of the accessible
  
      Deprecated: Use atk_component_get_layer instead.
  */
  atk.types.Layer getLayer()
  {
    AtkLayer _cretval;
    _cretval = atk_object_get_layer(cast(AtkObject*)this._cPtr);
    atk.types.Layer _retval = cast(atk.types.Layer)_cretval;
    return _retval;
  }

  /**
      Gets the zorder of the accessible. The value G_MININT will be returned
      if the layer of the accessible is not ATK_LAYER_MDI.
      Returns: a gint which is the zorder of the accessible, i.e. the depth at
        which the component is shown in relation to other components in the same
        container.
  
      Deprecated: Use atk_component_get_mdi_zorder instead.
  */
  int getMdiZorder()
  {
    int _retval;
    _retval = atk_object_get_mdi_zorder(cast(AtkObject*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of accessible children of the accessible.
      Returns: an integer representing the number of accessible children
        of the accessible.
  */
  int getNAccessibleChildren()
  {
    int _retval;
    _retval = atk_object_get_n_accessible_children(cast(AtkObject*)this._cPtr);
    return _retval;
  }

  /**
      Gets the accessible name of the accessible.
      Returns: a character string representing the accessible name of the object.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = atk_object_get_name(cast(AtkObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a UTF-8 string indicating the POSIX-style LC_MESSAGES locale
      of accessible.
      Returns: a UTF-8 string indicating the POSIX-style LC_MESSAGES
                 locale of accessible.
  */
  string getObjectLocale()
  {
    const(char)* _cretval;
    _cretval = atk_object_get_object_locale(cast(AtkObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the accessible parent of the accessible. By default this is
      the one assigned with [atk.object.ObjectWrap.setParent], but it is assumed
      that ATK implementors have ways to get the parent of the object
      without the need of assigning it manually with
      [atk.object.ObjectWrap.setParent], and will return it with this method.
      
      If you are only interested on the parent assigned with
      [atk.object.ObjectWrap.setParent], use [atk.object.ObjectWrap.peekParent].
      Returns: an #AtkObject representing the accessible
        parent of the accessible
  */
  atk.object.ObjectWrap getParent()
  {
    AtkObject* _cretval;
    _cretval = atk_object_get_parent(cast(AtkObject*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the role of the accessible.
      Returns: an #AtkRole which is the role of the accessible
  */
  atk.types.Role getRole()
  {
    AtkRole _cretval;
    _cretval = atk_object_get_role(cast(AtkObject*)this._cPtr);
    atk.types.Role _retval = cast(atk.types.Role)_cretval;
    return _retval;
  }

  /**
      This function is called when implementing subclasses of #AtkObject.
      It does initialization required for the new object. It is intended
      that this function should called only in the ..._new() functions used
      to create an instance of a subclass of #AtkObject
  
      Params:
        data = a #gpointer which identifies the object for which the AtkObject was created.
  */
  void initialize(void* data = null)
  {
    atk_object_initialize(cast(AtkObject*)this._cPtr, data);
  }

  /**
      Emits a state-change signal for the specified state.
      
      Note that as a general rule when the state of an existing object changes,
      emitting a notification is expected.
  
      Params:
        state = an #AtkState whose state is changed
        value = a gboolean which indicates whether the state is being set on or off
  */
  void notifyStateChange(atk.types.State state, bool value)
  {
    atk_object_notify_state_change(cast(AtkObject*)this._cPtr, state, value);
  }

  /**
      Gets the accessible parent of the accessible, if it has been
      manually assigned with atk_object_set_parent. Otherwise, this
      function returns null.
      
      This method is intended as an utility for ATK implementors, and not
      to be exposed to accessible tools. See [atk.object.ObjectWrap.getParent] for
      further reference.
      Returns: an #AtkObject representing the accessible
        parent of the accessible if assigned
  */
  atk.object.ObjectWrap peekParent()
  {
    AtkObject* _cretval;
    _cretval = atk_object_peek_parent(cast(AtkObject*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a reference to the specified accessible child of the object.
      The accessible children are 0-based so the first accessible child is
      at index 0, the second at index 1 and so on.
  
      Params:
        i = a gint representing the position of the child, starting from 0
      Returns: an #AtkObject representing the specified
        accessible child of the accessible.
  */
  atk.object.ObjectWrap refAccessibleChild(int i)
  {
    AtkObject* _cretval;
    _cretval = atk_object_ref_accessible_child(cast(AtkObject*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the #AtkRelationSet associated with the object.
      Returns: an #AtkRelationSet representing the relation set
        of the object.
  */
  atk.relation_set.RelationSet refRelationSet()
  {
    AtkRelationSet* _cretval;
    _cretval = atk_object_ref_relation_set(cast(AtkObject*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.relation_set.RelationSet)(cast(AtkRelationSet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a reference to the state set of the accessible; the caller must
      unreference it when it is no longer needed.
      Returns: a reference to an #AtkStateSet which is the state
        set of the accessible
  */
  atk.state_set.StateSet refStateSet()
  {
    AtkStateSet* _cretval;
    _cretval = atk_object_ref_state_set(cast(AtkObject*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.state_set.StateSet)(cast(AtkStateSet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Removes a property change handler.
  
      Params:
        handlerId = a guint which identifies the handler to be removed.
  
      Deprecated: See [atk.object.ObjectWrap.connectPropertyChangeHandler]
  */
  void removePropertyChangeHandler(uint handlerId)
  {
    atk_object_remove_property_change_handler(cast(AtkObject*)this._cPtr, handlerId);
  }

  /**
      Removes a relationship of the specified type with the specified target.
  
      Params:
        relationship = The #AtkRelationType of the relation
        target = The #AtkObject which is the target of the relation to be removed.
      Returns: TRUE if the relationship is removed.
  */
  bool removeRelationship(atk.types.RelationType relationship, atk.object.ObjectWrap target)
  {
    bool _retval;
    _retval = cast(bool)atk_object_remove_relationship(cast(AtkObject*)this._cPtr, relationship, target ? cast(AtkObject*)target._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the accessible ID of the accessible.  This is not meant to be presented
      to the user, but to be an ID which is stable over application development.
      Typically, this is the gtkbuilder ID. Such an ID will be available for
      instance to identify a given well-known accessible object for tailored screen
      reading, or for automatic regression testing.
  
      Params:
        id = a character string to be set as the accessible id
  */
  void setAccessibleId(string id)
  {
    const(char)* _id = id.toCString(No.Alloc);
    atk_object_set_accessible_id(cast(AtkObject*)this._cPtr, _id);
  }

  /**
      Sets the accessible description of the accessible. You can't set
      the description to NULL. This is reserved for the initial value. In
      this aspect NULL is similar to ATK_ROLE_UNKNOWN. If you want to set
      the name to a empty value you can use "".
  
      Params:
        description = a character string to be set as the accessible description
  */
  void setDescription(string description)
  {
    const(char)* _description = description.toCString(No.Alloc);
    atk_object_set_description(cast(AtkObject*)this._cPtr, _description);
  }

  /**
      Sets the help text associated with the accessible. This can be used to
      expose context-sensitive information to help a user understand how to
      interact with the object.
  
      Params:
        helpText = a character string to be set as the accessible's help text
  */
  void setHelpText(string helpText)
  {
    const(char)* _helpText = helpText.toCString(No.Alloc);
    atk_object_set_help_text(cast(AtkObject*)this._cPtr, _helpText);
  }

  /**
      Sets the accessible name of the accessible. You can't set the name
      to NULL. This is reserved for the initial value. In this aspect
      NULL is similar to ATK_ROLE_UNKNOWN. If you want to set the name to
      a empty value you can use "".
  
      Params:
        name = a character string to be set as the accessible name
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    atk_object_set_name(cast(AtkObject*)this._cPtr, _name);
  }

  /**
      Sets the accessible parent of the accessible. parent can be NULL.
  
      Params:
        parent = an #AtkObject to be set as the accessible parent
  */
  void setParent(atk.object.ObjectWrap parent)
  {
    atk_object_set_parent(cast(AtkObject*)this._cPtr, parent ? cast(AtkObject*)parent._cPtr(No.Dup) : null);
  }

  /**
      Sets the role of the accessible.
  
      Params:
        role = an #AtkRole to be set as the role
  */
  void setRole(atk.types.Role role)
  {
    atk_object_set_role(cast(AtkObject*)this._cPtr, role);
  }

  /**
      Connect to `ActiveDescendantChanged` signal.
  
      The "active-descendant-changed" signal is emitted by an object
        which has the state ATK_STATE_MANAGES_DESCENDANTS when the focus
        object in the object changes. For instance, a table will emit the
        signal when the cell in the table which has focus changes.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.object.ObjectWrap arg1, atk.object.ObjectWrap objectWrap))
  
          `arg1` the newly focused object. (optional)
  
          `objectWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActiveDescendantChanged(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : atk.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : atk.object.ObjectWrap)))
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
    return connectSignalClosure("active-descendant-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `Announcement` signal.
  
      The "announcement" signal can be emitted to pass an announcement on to
        be read by a screen reader.
        
        Depcrecated (2.50): Use AtkObject::notification instead.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string arg1, atk.object.ObjectWrap objectWrap))
  
          `arg1` the text to be announced. (optional)
  
          `objectWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAnnouncement(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : atk.object.ObjectWrap)))
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
    return connectSignalClosure("announcement", closure, after);
  }

  /**
      Connect to `AttributeChanged` signal.
  
      The "attribute-changed" signal should be emitted when one of an object's
        attributes changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string arg1, string arg2, atk.object.ObjectWrap objectWrap))
  
          `arg1` the name of the attribute being modified, or null if not
                     available. (optional)
  
          `arg2` the attribute's new value, or null if not available. (optional)
  
          `objectWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAttributeChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : atk.object.ObjectWrap)))
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
    return connectSignalClosure("attribute-changed", closure, after);
  }

  /**
      Connect to `ChildrenChanged` signal.
  
      The signal "children-changed" is emitted when a child is added or
        removed from an object. It supports two details: "add" and
        "remove"
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint arg1, atk.object.ObjectWrap arg2, atk.object.ObjectWrap objectWrap))
  
          `arg1` The index of the added or removed child. The value can be
            -1. This is used if the value is not known by the implementor
            when the child is added/removed or irrelevant. (optional)
  
          `arg2` A gpointer to the child AtkObject which was added or
            removed. If the child was removed, it is possible that it is not
            available for the implementor. In that case this pointer can be
            NULL. (optional)
  
          `objectWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChildrenChanged(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : atk.object.ObjectWrap)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : atk.object.ObjectWrap)))
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
    return connectSignalClosure("children-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `FocusEvent` signal.
  
      The signal "focus-event" is emitted when an object gained or lost
        focus.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(bool arg1, atk.object.ObjectWrap objectWrap))
  
          `arg1` a boolean value which indicates whether the object gained
            or lost focus. (optional)
  
          `objectWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #AtkObject::state-change signal instead.
  */
  ulong connectFocusEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : atk.object.ObjectWrap)))
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
    return connectSignalClosure("focus-event", closure, after);
  }

  /**
      Connect to `Notification` signal.
  
      The "notification" signal can be emitted to pass an announcement on to
        be read by a screen reader.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string arg1, int arg2, atk.object.ObjectWrap objectWrap))
  
          `arg1` the text to be announced. (optional)
  
          `arg2` an #AtkLive specifying the politeness of the notification.
            Should be either ATK_LIVE_POLITE or ATK_LIVE_ASSERTIVE. (optional)
  
          `objectWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNotification(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : atk.object.ObjectWrap)))
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
    return connectSignalClosure("notification", closure, after);
  }

  /**
      Connect to `PropertyChange` signal.
  
      The signal "property-change" is emitted when an object's property
        value changes. arg1 contains an #AtkPropertyValues with the name
        and the new value of the property whose value has changed. Note
        that, as with GObject notify, getting this signal does not
        guarantee that the value of the property has actually changed; it
        may also be emitted when the setter of the property is called to
        reinstate the previous value.
        
        Toolkit implementor note: ATK implementors should use
        [gobject.object.ObjectWrap.notify] to emit property-changed
        notifications. #AtkObject::property-changed is needed by the
        implementation of [atk.global.addGlobalEventListener] because GObject
        notify doesn't support emission hooks.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.property_values.PropertyValues arg1, atk.object.ObjectWrap objectWrap))
  
          `arg1` an #AtkPropertyValues containing the new
            value of the property which changed. (optional)
  
          `objectWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPropertyChange(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == atk.property_values.PropertyValues)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : atk.object.ObjectWrap)))
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
    return connectSignalClosure("property-change"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `StateChange` signal.
  
      The "state-change" signal is emitted when an object's state
        changes.  The detail value identifies the state type which has
        changed.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string arg1, bool arg2, atk.object.ObjectWrap objectWrap))
  
          `arg1` The name of the state which has changed (optional)
  
          `arg2` A boolean which indicates whether the state has been set or unset. (optional)
  
          `objectWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStateChange(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : atk.object.ObjectWrap)))
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
    return connectSignalClosure("state-change"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `VisibleDataChanged` signal.
  
      The "visible-data-changed" signal is emitted when the visual
        appearance of the object changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.object.ObjectWrap objectWrap))
  
          `objectWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectVisibleDataChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : atk.object.ObjectWrap)))
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
    return connectSignalClosure("visible-data-changed", closure, after);
  }
}
