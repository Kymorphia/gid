/// Module for [LayeredSettings] class
module gid.panel1.layered_settings;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.settings;
import gid.gio2.settings_schema_key;
import gid.gio2.types;
import gid.glib2.variant;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.types;


import gid.glib2.variant_type;
import gid.gobject2.value;

/** */
class LayeredSettings : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())panel_layered_settings_get_type != &gidSymbolNotFound ? panel_layered_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelLayeredSettings";
  }

  /** Returns `this`, for use in `with` statements. */
  override LayeredSettings self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.layered_settings.LayeredSettings]
      Returns: New builder object
  */
  static LayeredSettingsGidBuilder builder() nothrow
  {
    return new LayeredSettingsGidBuilder;
  }

  /** */
  @property string path() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("path");
  }

  /** */
  @property string schemaId() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("schema-id");
  }

  /**
  Creates a new binding similar to [gid.gio2.settings.Settings.bind] but applying from the resolved value via the layered
  settings and allowing transforming to and from settings storage using getMapping and setMapping.
  Params:
  key = the settings key to bind
  object = the target object
  property = the property on object to apply
  flags = flags for the binding
  getMapping = the get mapping delegate (variant to value), it should set the value and return true on success,
  or null to use the default conversion
  setMapping = the set mapping delegate (value to variant), it should return a new variant or null on failure,
  or null to use the default conversion
  */
  void bindWithMapping(string key, gid.gobject2.object.ObjectWrap object, string property, gid.gio2.types.SettingsBindFlags flags,
  gid.gio2.types.SettingsBindGetMapping getMapping = null, gid.gio2.types.SettingsBindSetMapping setMapping = null) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    auto _data = _mappingData(getMapping, setMapping);
    panel_layered_settings_bind_with_mapping(cast(PanelLayeredSettings*)this._cPtr, _key,
    object ? cast(GObject*)object._cPtr(No.Dup) : null, _property, flags,
    getMapping ? &_getMappingCallback : null, setMapping ? &_setMappingCallback : null, _data,
    _data ? &thawPtrDestroyFunc : null);
  }

  // Both mapping delegates passed to C as one closure data, frozen until the binding is destroyed (thawPtrDestroyFunc),
  // null if there are no mapping delegates
  package static struct _MappingDelegates
  {
    gid.gio2.types.SettingsBindGetMapping getMapping;
    gid.gio2.types.SettingsBindSetMapping setMapping;
  }

  package static void* _mappingData(gid.gio2.types.SettingsBindGetMapping getMapping,
  gid.gio2.types.SettingsBindSetMapping setMapping) nothrow
  {
    if (!getMapping && !setMapping)
      return null;

    auto data = new _MappingDelegates(getMapping, setMapping);
    ptrFreezeGC(data);
    return data;
  }

  package static extern(C) gboolean _getMappingCallback(GValue* value, GVariant* variant, void* userData) nothrow
  {
    import gid.gobject2.c.functions : g_value_copy;

    auto _data = cast(_MappingDelegates*)userData;

    bool _dretval;

    try
    {
      auto _value = new gid.gobject2.value.Value(cast(void*)value, No.Take); // Copy of the initialized value, copied back on success
      _dretval = _data.getMapping(_value, variant ? new gid.glib2.variant.Variant(cast(void*)variant, No.Take) : null);

      if (_dretval)
        g_value_copy(cast(GValue*)_value._cPtr, value);
    }
    catch (Exception e)
    {
      gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.SettingsBindGetMapping");
      _dretval = false;
    }

    return cast(gboolean)_dretval;
  }

  package static extern(C) GVariant* _setMappingCallback(const(GValue)* value, const(GVariantType)* expectedType,
  void* userData) nothrow
  {
    auto _data = cast(_MappingDelegates*)userData;

    gid.glib2.variant.Variant _dretval;

    try
    {
      _dretval = _data.setMapping(value ? new gid.gobject2.value.Value(cast(void*)value, No.Take) : null,
      expectedType ? new gid.glib2.variant_type.VariantType(cast(void*)expectedType, No.Take) : null);
    }
    catch (Exception e)
    {
      gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.SettingsBindSetMapping");
      _dretval = null;
    }

    return _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;
  }


  /** */
  this(string schemaId, string path) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      PanelLayeredSettings* _cretval;
      const(char)* _schemaId = schemaId.toCString!(No.Malloc, No.Nullable);
      const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
      _cretval = panel_layered_settings_new(_schemaId, _path);
      this(_cretval, Yes.Take);
    }
  }

  /** */
  void append(gid.gio2.settings.Settings settings) nothrow
  {
    panel_layered_settings_append(cast(PanelLayeredSettings*)this._cPtr, settings ? cast(GSettings*)settings._cPtr(No.Dup) : null);
  }

  /** */
  void bind(string key, gid.gobject2.object.ObjectWrap object, string property, gid.gio2.types.SettingsBindFlags flags) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    panel_layered_settings_bind(cast(PanelLayeredSettings*)this._cPtr, _key, object ? cast(GObject*)object._cPtr(No.Dup) : null, _property, flags);
  }

  /** */
  bool getBoolean(string key) nothrow
  {
    bool _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)panel_layered_settings_get_boolean(cast(PanelLayeredSettings*)this._cPtr, _key);
    return _retval;
  }

  /** */
  gid.glib2.variant.Variant getDefaultValue(string key) nothrow
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_layered_settings_get_default_value(cast(PanelLayeredSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  double getDouble(string key) nothrow
  {
    double _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = panel_layered_settings_get_double(cast(PanelLayeredSettings*)this._cPtr, _key);
    return _retval;
  }

  /** */
  int getInt(string key) nothrow
  {
    int _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = panel_layered_settings_get_int(cast(PanelLayeredSettings*)this._cPtr, _key);
    return _retval;
  }

  /**
      Gets the #GSettingsSchemaKey denoted by key.
      
      It is a programming error to call this with a key that does not exist.
  
      Params:
        key = the name of the setting
      Returns: a #GSettingsSchemaKey
  */
  gid.gio2.settings_schema_key.SettingsSchemaKey getKey(string key) nothrow
  {
    GSettingsSchemaKey* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_layered_settings_get_key(cast(PanelLayeredSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new gid.gio2.settings_schema_key.SettingsSchemaKey(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  string getString(string key) nothrow
  {
    char* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_layered_settings_get_string(cast(PanelLayeredSettings*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /** */
  uint getUint(string key) nothrow
  {
    uint _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = panel_layered_settings_get_uint(cast(PanelLayeredSettings*)this._cPtr, _key);
    return _retval;
  }

  /** */
  gid.glib2.variant.Variant getUserValue(string key) nothrow
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_layered_settings_get_user_value(cast(PanelLayeredSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the value of key from the first layer that is modified.
  
      Params:
        key = 
      Returns: a #GVariant
  */
  gid.glib2.variant.Variant getValue(string key) nothrow
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_layered_settings_get_value(cast(PanelLayeredSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Lists the available keys.
      Returns: an array of keys that can be retrieved from the #PanelLayeredSettings.
  */
  string[] listKeys() nothrow
  {
    char** _cretval;
    _cretval = panel_layered_settings_list_keys(cast(PanelLayeredSettings*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  void setBoolean(string key, bool val) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    panel_layered_settings_set_boolean(cast(PanelLayeredSettings*)this._cPtr, _key, val);
  }

  /** */
  void setDouble(string key, double val) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    panel_layered_settings_set_double(cast(PanelLayeredSettings*)this._cPtr, _key, val);
  }

  /** */
  void setInt(string key, int val) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    panel_layered_settings_set_int(cast(PanelLayeredSettings*)this._cPtr, _key, val);
  }

  /** */
  void setString(string key, string val) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _val = val.toCString!(No.Malloc, No.Nullable);
    panel_layered_settings_set_string(cast(PanelLayeredSettings*)this._cPtr, _key, _val);
  }

  /** */
  void setUint(string key, uint val) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    panel_layered_settings_set_uint(cast(PanelLayeredSettings*)this._cPtr, _key, val);
  }

  /** */
  void setValue(string key, gid.glib2.variant.Variant value) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    panel_layered_settings_set_value(cast(PanelLayeredSettings*)this._cPtr, _key, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /** */
  void unbind(string property) nothrow
  {
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    panel_layered_settings_unbind(cast(PanelLayeredSettings*)this._cPtr, _property);
  }

  /**
      Connect to `Changed` signal.
  
      
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(string object, gid.panel1.layered_settings.LayeredSettings layeredSettings)`
  
          `object`  (optional)
  
          `layeredSettings` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.panel1.layered_settings.LayeredSettings)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.layered_settings.LayeredSettings.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}

/// Fluent builder implementation template for [gid.panel1.layered_settings.LayeredSettings]
class LayeredSettingsGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T path(string propval) nothrow
  {
    return setProperty("path", propval);
  }

  /** */
  T schemaId(string propval) nothrow
  {
    return setProperty("schema-id", propval);
  }
}

/// Fluent builder for [gid.panel1.layered_settings.LayeredSettings]
final class LayeredSettingsGidBuilder : LayeredSettingsGidBuilderImpl!LayeredSettingsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LayeredSettings build() nothrow
  {
    return new LayeredSettings(cast(void*)createGObject(LayeredSettings._getGType), Yes.Take);
  }
}
