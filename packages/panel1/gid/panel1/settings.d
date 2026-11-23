/// Module for [Settings] class
module gid.panel1.settings;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.types;
import gid.glib2.variant;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.types;

/** */
class Settings : gid.gobject2.object.ObjectWrap, gid.gio2.action_group.ActionGroup
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())panel_settings_get_type != &gidSymbolNotFound ? panel_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelSettings";
  }

  /** Returns `this`, for use in `with` statements. */
  override Settings self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.settings.Settings]
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
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("identifier");
  }

  /** */
  @property string path() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("path");
  }

  /** */
  @property string pathPrefix() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("path-prefix");
  }

  /** */
  @property string pathSuffix() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("path-suffix");
  }

  /** */
  @property string schemaId() nothrow
  {
    return getSchemaId();
  }

  /** */
  @property string schemaIdPrefix() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("schema-id-prefix");
  }

  mixin ActionGroupT!();

  /**
  Like [gid.panel1.settings.Settings.bind] but allows transforming to and from settings storage using getMapping and
  setMapping.
  Call [gid.panel1.settings.Settings.unbind] to unbind the mapping.
  Params:
  key = the settings key
  object = the object to bind to
  property = the property of object to bind to
  flags = flags for the binding
  getMapping = the get mapping delegate (variant to value), it should set the value and return true on success,
  or null to use the default conversion
  setMapping = the set mapping delegate (value to variant), it should return a new variant or null on failure,
  or null to use the default conversion
  */
  void bindWithMapping(string key, gid.gobject2.object.ObjectWrap object, string property, gid.gio2.types.SettingsBindFlags flags,
  gid.gio2.types.SettingsBindGetMapping getMapping = null, gid.gio2.types.SettingsBindSetMapping setMapping = null) nothrow
  {
    import gid.panel1.layered_settings : LayeredSettings;

    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    auto _data = LayeredSettings._mappingData(getMapping, setMapping);
    panel_settings_bind_with_mapping(cast(PanelSettings*)this._cPtr, _key,
    object ? cast(GObject*)object._cPtr(No.Dup) : null, _property, flags,
    getMapping ? &LayeredSettings._getMappingCallback : null,
    setMapping ? &LayeredSettings._setMappingCallback : null, _data, _data ? &thawPtrDestroyFunc : null);
  }

  /** */
  this(string identifier, string schemaId) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      PanelSettings* _cretval;
      const(char)* _identifier = identifier.toCString!(No.Malloc, No.Nullable);
      const(char)* _schemaId = schemaId.toCString!(No.Malloc, No.Nullable);
      _cretval = panel_settings_new(_identifier, _schemaId);
      this(_cretval, Yes.Take);
    }
  }

  /** */
  static gid.panel1.settings.Settings newRelocatable(string identifier, string schemaId, string schemaIdPrefix, string pathPrefix, string pathSuffix) nothrow
  {
    PanelSettings* _cretval;
    const(char)* _identifier = identifier.toCString!(No.Malloc, No.Nullable);
    const(char)* _schemaId = schemaId.toCString!(No.Malloc, No.Nullable);
    const(char)* _schemaIdPrefix = schemaIdPrefix.toCString!(No.Malloc, No.Nullable);
    const(char)* _pathPrefix = pathPrefix.toCString!(No.Malloc, No.Nullable);
    const(char)* _pathSuffix = pathSuffix.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_new_relocatable(_identifier, _schemaId, _schemaIdPrefix, _pathPrefix, _pathSuffix);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.settings.Settings)(cast(PanelSettings*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static gid.panel1.settings.Settings newWithPath(string identifier, string schemaId, string path) nothrow
  {
    PanelSettings* _cretval;
    const(char)* _identifier = identifier.toCString!(No.Malloc, No.Nullable);
    const(char)* _schemaId = schemaId.toCString!(No.Malloc, No.Nullable);
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_new_with_path(_identifier, _schemaId, _path);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.settings.Settings)(cast(PanelSettings*)_cretval, Yes.Take);
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
  void bind(string key, gid.gobject2.object.ObjectWrap object, string property, gid.gio2.types.SettingsBindFlags flags) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    panel_settings_bind(cast(PanelSettings*)this._cPtr, _key, object ? cast(GObject*)object._cPtr(No.Dup) : null, _property, flags);
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
  gid.glib2.variant.Variant getDefaultValue(string key) nothrow
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_get_default_value(cast(PanelSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
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
  gid.glib2.variant.Variant getUserValue(string key) nothrow
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_get_user_value(cast(PanelSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  gid.glib2.variant.Variant getValue(string key) nothrow
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_settings_get_value(cast(PanelSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
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
  void setValue(string key, gid.glib2.variant.Variant value) nothrow
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
  
          `void callback(string object, gid.panel1.settings.Settings settings)`
  
          `object`  (optional)
  
          `settings` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.panel1.settings.Settings)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.settings.Settings.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}

/// Fluent builder implementation template for [gid.panel1.settings.Settings]
class SettingsGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.action_group.ActionGroupGidBuilderImpl!T
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

/// Fluent builder for [gid.panel1.settings.Settings]
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
