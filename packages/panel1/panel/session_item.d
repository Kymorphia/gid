/// Module for [SessionItem] class
module panel.session_item;

import gid.gid;
import glib.variant;
import glib.variant_type;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.position;
import panel.types;

/** */
class SessionItem : gobject.object.ObjectWrap
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
    return cast(void function())panel_session_item_get_type != &gidSymbolNotFound ? panel_session_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SessionItem self()
  {
    return this;
  }

  /** */
  @property string id()
  {
    return getId();
  }

  /** */
  @property void id(string propval)
  {
    return setId(propval);
  }

  /** */
  @property string moduleName()
  {
    return getModuleName();
  }

  /** */
  @property void moduleName(string propval)
  {
    return setModuleName(propval);
  }

  /** */
  @property panel.position.Position position()
  {
    return getPosition();
  }

  /** */
  @property void position(panel.position.Position propval)
  {
    return setPosition(propval);
  }

  /** */
  @property string typeHint()
  {
    return getTypeHint();
  }

  /** */
  @property void typeHint(string propval)
  {
    return setTypeHint(propval);
  }

  /** */
  @property string workspace()
  {
    return getWorkspace();
  }

  /** */
  @property void workspace(string propval)
  {
    return setWorkspace(propval);
  }

  /** */
  this()
  {
    PanelSessionItem* _cretval;
    _cretval = panel_session_item_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the id for the session item, if any.
      Returns: a string containing the id; otherwise null
  */
  string getId()
  {
    const(char)* _cretval;
    _cretval = panel_session_item_get_id(cast(PanelSessionItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the metadata value for key.
      
      If expected_type is non-null, any non-null value returned from this
      function will match expected_type.
  
      Params:
        key = the metadata key
        expectedType = a #GVariantType or null
      Returns: a non-floating #GVariant which should
          be released with [glib.variant.Variant.unref]; otherwise null.
  */
  glib.variant.Variant getMetadataValue(string key, glib.variant_type.VariantType expectedType = null)
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = panel_session_item_get_metadata_value(cast(PanelSessionItem*)this._cPtr, _key, expectedType ? cast(const(GVariantType)*)expectedType._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the module-name that created an item.
      Returns: a module-name or null
  */
  string getModuleName()
  {
    const(char)* _cretval;
    _cretval = panel_session_item_get_module_name(cast(PanelSessionItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #PanelPosition for the item.
      Returns: a #PanelPosition or null
  */
  panel.position.Position getPosition()
  {
    PanelPosition* _cretval;
    _cretval = panel_session_item_get_position(cast(PanelSessionItem*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.position.Position)(cast(PanelPosition*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the type hint for an item.
      Returns: a type-hint or null
  */
  string getTypeHint()
  {
    const(char)* _cretval;
    _cretval = panel_session_item_get_type_hint(cast(PanelSessionItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the workspace id for the item.
      Returns: a workspace or null
  */
  string getWorkspace()
  {
    const(char)* _cretval;
    _cretval = panel_session_item_get_workspace(cast(PanelSessionItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      If the item contains a metadata value for key.
      
      Checks if a value exists for a metadata key and retrieves the #GVariantType
      for that key.
  
      Params:
        key = the name of the metadata
        valueType = a location for a #GVariantType or null
      Returns: true if self contains metadata named key and value_type is set
          to the value's #GVariantType. Otherwise false and value_type is unchanged.
  */
  bool hasMetadata(string key, out glib.variant_type.VariantType valueType)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    const(GVariantType)* _valueType;
    _retval = cast(bool)panel_session_item_has_metadata(cast(PanelSessionItem*)this._cPtr, _key, &_valueType);
    valueType = new glib.variant_type.VariantType(cast(void*)_valueType, Yes.Take);
    return _retval;
  }

  /**
      Checks if the item contains metadata key with expected_type.
  
      Params:
        key = the metadata key
        expectedType = the #GVariantType to check for key
      Returns: true if a value was found for key matching expected_typed;
          otherwise false is returned.
  */
  bool hasMetadataWithType(string key, glib.variant_type.VariantType expectedType)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)panel_session_item_has_metadata_with_type(cast(PanelSessionItem*)this._cPtr, _key, expectedType ? cast(const(GVariantType)*)expectedType._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the identifier for the item.
      
      The identifier should generally be global to the session as it would
      not be expected to come across multiple items with the same id.
  
      Params:
        id = an optional identifier for the item
  */
  void setId(string id = null)
  {
    const(char)* _id = id.toCString(No.Alloc);
    panel_session_item_set_id(cast(PanelSessionItem*)this._cPtr, _id);
  }

  /**
      Sets the value for metadata key.
      
      If value is null, the metadata key is unset.
  
      Params:
        key = the metadata key
        value = the value for key or null
  */
  void setMetadataValue(string key, glib.variant.Variant value = null)
  {
    const(char)* _key = key.toCString(No.Alloc);
    panel_session_item_set_metadata_value(cast(PanelSessionItem*)this._cPtr, _key, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the module-name for the session item.
      
      This is generally used to help determine which plugin created
      the item when decoding them at project load time.
  
      Params:
        moduleName = the module name owning the item
  */
  void setModuleName(string moduleName = null)
  {
    const(char)* _moduleName = moduleName.toCString(No.Alloc);
    panel_session_item_set_module_name(cast(PanelSessionItem*)this._cPtr, _moduleName);
  }

  /**
      Sets the position for self, if any.
  
      Params:
        position = a #PanelPosition or null
  */
  void setPosition(panel.position.Position position = null)
  {
    panel_session_item_set_position(cast(PanelSessionItem*)this._cPtr, position ? cast(PanelPosition*)position._cPtr(No.Dup) : null);
  }

  /**
      Sets the type-hint value for the item.
      
      This is generally used to help inflate the right version of
      an object when loading session items.
  
      Params:
        typeHint = a type hint string for the item
  */
  void setTypeHint(string typeHint = null)
  {
    const(char)* _typeHint = typeHint.toCString(No.Alloc);
    panel_session_item_set_type_hint(cast(PanelSessionItem*)this._cPtr, _typeHint);
  }

  /**
      Sets the workspace id for the item.
      
      This is generally used to tie an item to a specific workspace.
  
      Params:
        workspace = a workspace string for the item
  */
  void setWorkspace(string workspace = null)
  {
    const(char)* _workspace = workspace.toCString(No.Alloc);
    panel_session_item_set_workspace(cast(PanelSessionItem*)this._cPtr, _workspace);
  }
}
