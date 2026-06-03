/// Module for [Settings] class
module panel.settings;

public import gid.basictypes;
import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.types;
import glib.variant;
import glib.variant_type;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gobject.value;
import panel.c.functions;
import panel.c.types;
import panel.types;

/** */
class Settings : gobject.object.ObjectWrap, gio.action_group.ActionGroup
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_settings_get_type != &gidSymbolNotFound ? panel_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Settings self() nothrow
  {
    return this;
  }

  /**
      Get builder for [panel.settings.Settings]
      Returns: New builder object
  */
  static SettingsGidBuilder builder() nothrow
  {
    return new SettingsGidBuilder;
  }

  /**
      Get `identifier` property.
      Returns: The "identifier" property is used to make unique paths.
        
        This might be a unique "project-id" for example, in an IDE.
  */
  @property string identifier() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("identifier");
  }

  /** */
  @property string path() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("path");
  }

  /** */
  @property string pathPrefix() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("path-prefix");
  }

  /** */
  @property string pathSuffix() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("path-suffix");
  }

  /** */
  @property string schemaId() nothrow
  {
    return getSchemaId();
  }

  /** */
  @property string schemaIdPrefix() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("schema-id-prefix");
  }

  mixin ActionGroupT!();

  /** */
  this(string identifier, string schemaId) nothrow
  {
    PanelSettings* _cretval;
    const(char)* _identifier = identifier.toCString!(No.Malloc, No.Nullable);
    const(char)* _schemaId = schemaId.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_new(_identifier, _schemaId);
    this(_cretval, Yes.Take);
  }

  /** */
  static panel.settings.Settings newRelocatable(string identifier, string schemaId, string schemaIdPrefix, string pathPrefix, string pathSuffix) nothrow
  {
    PanelSettings* _cretval;
    const(char)* _identifier = identifier.toCString!(No.Malloc, No.Nullable);
    const(char)* _schemaId = schemaId.toCString!(No.Malloc, No.Nullable);
    const(char)* _schemaIdPrefix = schemaIdPrefix.toCString!(No.Malloc, No.Nullable);
    const(char)* _pathPrefix = pathPrefix.toCString!(No.Malloc, No.Nullable);
    const(char)* _pathSuffix = pathSuffix.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_new_relocatable(_identifier, _schemaId, _schemaIdPrefix, _pathPrefix, _pathSuffix);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.settings.Settings)(cast(PanelSettings*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static panel.settings.Settings newWithPath(string identifier, string schemaId, string path) nothrow
  {
    PanelSettings* _cretval;
    const(char)* _identifier = identifier.toCString!(No.Malloc, No.Nullable);
    const(char)* _schemaId = schemaId.toCString!(No.Malloc, No.Nullable);
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_new_with_path(_identifier, _schemaId, _path);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.settings.Settings)(cast(PanelSettings*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static string resolveSchemaPath(string schemaIdPrefix, string schemaId, string identifier, string pathPrefix, string pathSuffix) nothrow
  {
    char* _cretval;
    const(char)* _schemaIdPrefix = schemaIdPrefix.toCString!(No.Malloc, No.Nullable);
    const(char)* _schemaId = schemaId.toCString!(No.Malloc, No.Nullable);
    const(char)* _identifier = identifier.toCString!(No.Malloc, No.Nullable);
    const(char)* _pathPrefix = pathPrefix.toCString!(No.Malloc, No.Nullable);
    const(char)* _pathSuffix = pathSuffix.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_resolve_schema_path(_schemaIdPrefix, _schemaId, _identifier, _pathPrefix, _pathSuffix);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /** */
  void bind(string key, void* object, string property, gio.types.SettingsBindFlags flags) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    panel_settings_bind(cast(PanelSettings*)this._cPtr, _key, object, _property, flags);
  }

  /**
      Like [panel.settings.Settings.bind] but allows transforming to and from settings storage using
      get_mapping and set_mapping transformation functions.
      
      Call [panel.settings.Settings.unbind] to unbind the mapping.
  
      Params:
        key = The settings key
        object = the object to bind to
        property = the property of object to bind to
        flags = flags for the binding
        getMapping = variant to value mapping
        setMapping = value to variant mapping
  */
  void bindWithMapping(string key, void* object, string property, gio.types.SettingsBindFlags flags, gio.types.SettingsBindGetMapping getMapping = null, gio.types.SettingsBindSetMapping setMapping = null) nothrow
  {
    extern(C) gboolean _getMappingCallback(GValue* value, GVariant* variant, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gio.types.SettingsBindGetMapping*)userData;

      try
      {
        _dretval = (*_dlg)(value ? new gobject.value.Value(cast(void*)value, No.Take) : null, variant ? new glib.variant.Variant(cast(void*)variant, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.SettingsBindGetMapping");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _getMappingCB = getMapping ? &_getMappingCallback : null;
    extern(C) GVariant* _setMappingCallback(const(GValue)* value, const(GVariantType)* expectedType, void* userData) nothrow
    {
      glib.variant.Variant _dretval;
      auto _dlg = cast(gio.types.SettingsBindSetMapping*)userData;

      try
      {
        _dretval = (*_dlg)(value ? new gobject.value.Value(cast(void*)value, No.Take) : null, expectedType ? new glib.variant_type.VariantType(cast(void*)expectedType, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.SettingsBindSetMapping");
      }
      auto _retval = cast(GVariant*)_dretval._cPtr(Yes.Dup);

      return _retval;
    }
    auto _setMappingCB = setMapping ? &_setMappingCallback : null;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    auto _setMapping = setMapping ? freezeDelegate(cast(void*)&setMapping) : null;
    GDestroyNotify _setMappingDestroyCB = setMapping ? &thawDelegate : null;
    panel_settings_bind_with_mapping(cast(PanelSettings*)this._cPtr, _key, object, _property, flags, _getMappingCB, _setMappingCB, _setMapping, _setMappingDestroyCB);
  }

  /** */
  bool getBoolean(string key) nothrow
  {
    bool _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)panel_settings_get_boolean(cast(PanelSettings*)this._cPtr, _key);
    return _retval;
  }

  /** */
  glib.variant.Variant getDefaultValue(string key) nothrow
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_get_default_value(cast(PanelSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  double getDouble(string key) nothrow
  {
    double _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = panel_settings_get_double(cast(PanelSettings*)this._cPtr, _key);
    return _retval;
  }

  /** */
  int getInt(string key) nothrow
  {
    int _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = panel_settings_get_int(cast(PanelSettings*)this._cPtr, _key);
    return _retval;
  }

  /** */
  string getSchemaId() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_settings_get_schema_id(cast(PanelSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  string getString(string key) nothrow
  {
    char* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_get_string(cast(PanelSettings*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /** */
  uint getUint(string key) nothrow
  {
    uint _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = panel_settings_get_uint(cast(PanelSettings*)this._cPtr, _key);
    return _retval;
  }

  /** */
  glib.variant.Variant getUserValue(string key) nothrow
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_get_user_value(cast(PanelSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  glib.variant.Variant getValue(string key) nothrow
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_get_value(cast(PanelSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  void setBoolean(string key, bool val) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    panel_settings_set_boolean(cast(PanelSettings*)this._cPtr, _key, val);
  }

  /** */
  void setDouble(string key, double val) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    panel_settings_set_double(cast(PanelSettings*)this._cPtr, _key, val);
  }

  /** */
  void setInt(string key, int val) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    panel_settings_set_int(cast(PanelSettings*)this._cPtr, _key, val);
  }

  /** */
  void setString(string key, string val) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _val = val.toCString!(No.Malloc, No.Nullable);
    panel_settings_set_string(cast(PanelSettings*)this._cPtr, _key, _val);
  }

  /** */
  void setUint(string key, uint val) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    panel_settings_set_uint(cast(PanelSettings*)this._cPtr, _key, val);
  }

  /** */
  void setValue(string key, glib.variant.Variant value) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    panel_settings_set_value(cast(PanelSettings*)this._cPtr, _key, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /** */
  void unbind(string property) nothrow
  {
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    panel_settings_unbind(cast(PanelSettings*)this._cPtr, _property);
  }

  /**
      Connect to `Changed` signal.
  
      
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(string object, panel.settings.Settings settings)`
  
          `object`  (optional)
  
          `settings` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.settings.Settings)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "panel.settings.Settings.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}

/// Fluent builder implementation template for [panel.settings.Settings]
class SettingsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.action_group.ActionGroupGidBuilderImpl!T
{

  mixin ActionGroupGidBuilderT!();

  /**
      Set `identifier` property.
      Params:
        propval = The "identifier" property is used to make unique paths.
          
          This might be a unique "project-id" for example, in an IDE.
      Returns: Builder instance for fluent chaining
  */
  T identifier(string propval) nothrow
  {
    return setProperty("identifier", propval);
  }

  /** */
  T path(string propval) nothrow
  {
    return setProperty("path", propval);
  }

  /** */
  T pathPrefix(string propval) nothrow
  {
    return setProperty("path-prefix", propval);
  }

  /** */
  T pathSuffix(string propval) nothrow
  {
    return setProperty("path-suffix", propval);
  }

  /** */
  T schemaId(string propval) nothrow
  {
    return setProperty("schema-id", propval);
  }

  /** */
  T schemaIdPrefix(string propval) nothrow
  {
    return setProperty("schema-id-prefix", propval);
  }
}

/// Fluent builder for [panel.settings.Settings]
final class SettingsGidBuilder : SettingsGidBuilderImpl!SettingsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Settings build() nothrow
  {
    return new Settings(cast(void*)createGObject(Settings._getGType), Yes.Take);
  }
}
