/// Module for [LayeredSettings] class
module panel.layered_settings;

import gid.gid;
import gio.settings;
import gio.settings_schema_key;
import gio.types;
import glib.variant;
import glib.variant_type;
import gobject.dclosure;
import gobject.object;
import gobject.value;
import panel.c.functions;
import panel.c.types;
import panel.types;

/** */
class LayeredSettings : gobject.object.ObjectWrap
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
    return cast(void function())panel_layered_settings_get_type != &gidSymbolNotFound ? panel_layered_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LayeredSettings self()
  {
    return this;
  }

  /** */
  this(string schemaId, string path)
  {
    PanelLayeredSettings* _cretval;
    const(char)* _schemaId = schemaId.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = panel_layered_settings_new(_schemaId, _path);
    this(_cretval, Yes.Take);
  }

  /** */
  void append(gio.settings.Settings settings)
  {
    panel_layered_settings_append(cast(PanelLayeredSettings*)this._cPtr, settings ? cast(GSettings*)settings._cPtr(No.Dup) : null);
  }

  /** */
  void bind(string key, void* object, string property, gio.types.SettingsBindFlags flags)
  {
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _property = property.toCString(No.Alloc);
    panel_layered_settings_bind(cast(PanelLayeredSettings*)this._cPtr, _key, object, _property, flags);
  }

  /**
      Creates a new binding similar to [gio.settings.Settings.bindWithMapping] but applying
      from the resolved value via the layered settings.
  
      Params:
        key = the settings key to bind.
          object (type GObject.Object): the target object.
        object = 
        property = the property on object to apply.
        flags = flags for the binding.
        getMapping = the get mapping function
        setMapping = the set mapping function
  */
  void bindWithMapping(string key, void* object, string property, gio.types.SettingsBindFlags flags, gio.types.SettingsBindGetMapping getMapping, gio.types.SettingsBindSetMapping setMapping)
  {
    extern(C) gboolean _getMappingCallback(GValue* value, GVariant* variant, void* userData)
    {
      auto _dlg = cast(gio.types.SettingsBindGetMapping*)userData;

      gboolean _retval = (*_dlg)(value ? new gobject.value.Value(cast(void*)value, No.Take) : null, variant ? new glib.variant.Variant(cast(void*)variant, No.Take) : null);
      return _retval;
    }
    auto _getMappingCB = getMapping ? &_getMappingCallback : null;

    extern(C) GVariant* _setMappingCallback(const(GValue)* value, const(GVariantType)* expectedType, void* userData)
    {
      glib.variant.Variant _dretval;
      auto _dlg = cast(gio.types.SettingsBindSetMapping*)userData;

      _dretval = (*_dlg)(value ? new gobject.value.Value(cast(void*)value, No.Take) : null, expectedType ? new glib.variant_type.VariantType(cast(void*)expectedType, No.Take) : null);
      GVariant* _retval = cast(GVariant*)_dretval._cPtr(Yes.Dup);

      return _retval;
    }
    auto _setMappingCB = setMapping ? &_setMappingCallback : null;

    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _property = property.toCString(No.Alloc);
    auto _setMapping = setMapping ? freezeDelegate(cast(void*)&setMapping) : null;
    GDestroyNotify _setMappingDestroyCB = setMapping ? &thawDelegate : null;
    panel_layered_settings_bind_with_mapping(cast(PanelLayeredSettings*)this._cPtr, _key, object, _property, flags, _getMappingCB, _setMappingCB, _setMapping, _setMappingDestroyCB);
  }

  /** */
  bool getBoolean(string key)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)panel_layered_settings_get_boolean(cast(PanelLayeredSettings*)this._cPtr, _key);
    return _retval;
  }

  /** */
  glib.variant.Variant getDefaultValue(string key)
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = panel_layered_settings_get_default_value(cast(PanelLayeredSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  double getDouble(string key)
  {
    double _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = panel_layered_settings_get_double(cast(PanelLayeredSettings*)this._cPtr, _key);
    return _retval;
  }

  /** */
  int getInt(string key)
  {
    int _retval;
    const(char)* _key = key.toCString(No.Alloc);
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
  gio.settings_schema_key.SettingsSchemaKey getKey(string key)
  {
    GSettingsSchemaKey* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = panel_layered_settings_get_key(cast(PanelLayeredSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new gio.settings_schema_key.SettingsSchemaKey(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  string getString(string key)
  {
    char* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = panel_layered_settings_get_string(cast(PanelLayeredSettings*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  uint getUint(string key)
  {
    uint _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = panel_layered_settings_get_uint(cast(PanelLayeredSettings*)this._cPtr, _key);
    return _retval;
  }

  /** */
  glib.variant.Variant getUserValue(string key)
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = panel_layered_settings_get_user_value(cast(PanelLayeredSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the value of key from the first layer that is modified.
  
      Params:
        key = 
      Returns: a #GVariant
  */
  glib.variant.Variant getValue(string key)
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = panel_layered_settings_get_value(cast(PanelLayeredSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Lists the available keys.
      Returns: an array of keys that can be retrieved from the #PanelLayeredSettings.
  */
  string[] listKeys()
  {
    char** _cretval;
    _cretval = panel_layered_settings_list_keys(cast(PanelLayeredSettings*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  void setBoolean(string key, bool val)
  {
    const(char)* _key = key.toCString(No.Alloc);
    panel_layered_settings_set_boolean(cast(PanelLayeredSettings*)this._cPtr, _key, val);
  }

  /** */
  void setDouble(string key, double val)
  {
    const(char)* _key = key.toCString(No.Alloc);
    panel_layered_settings_set_double(cast(PanelLayeredSettings*)this._cPtr, _key, val);
  }

  /** */
  void setInt(string key, int val)
  {
    const(char)* _key = key.toCString(No.Alloc);
    panel_layered_settings_set_int(cast(PanelLayeredSettings*)this._cPtr, _key, val);
  }

  /** */
  void setString(string key, string val)
  {
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _val = val.toCString(No.Alloc);
    panel_layered_settings_set_string(cast(PanelLayeredSettings*)this._cPtr, _key, _val);
  }

  /** */
  void setUint(string key, uint val)
  {
    const(char)* _key = key.toCString(No.Alloc);
    panel_layered_settings_set_uint(cast(PanelLayeredSettings*)this._cPtr, _key, val);
  }

  /** */
  void setValue(string key, glib.variant.Variant value)
  {
    const(char)* _key = key.toCString(No.Alloc);
    panel_layered_settings_set_value(cast(PanelLayeredSettings*)this._cPtr, _key, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /** */
  void unbind(string property)
  {
    const(char)* _property = property.toCString(No.Alloc);
    panel_layered_settings_unbind(cast(PanelLayeredSettings*)this._cPtr, _property);
  }

  /**
      Connect to `Changed` signal.
  
      
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string object, panel.layered_settings.LayeredSettings layeredSettings))
  
          `object`  (optional)
  
          `layeredSettings` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.layered_settings.LayeredSettings)))
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
    return connectSignalClosure("changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
