//!gir Panel-1
//!info description "D binding for the Panel library - helps create IDE-like applications using GTK 4 and libadwaita"
//!info homepage https://gitlab.gnome.org/GNOME/libpanel
//!info docs https://www.kymorphia.com/gid/gid~panel1/
//!info capi https://gnome.pages.gitlab.gnome.org/libpanel/panel-1.0

//# Object parameters are GObject instances (gpointer in the C API)
//!set class[Settings].method[bind].parameters.parameter[object].type '<type name="GObject.Object" c:type="gpointer"/>'
//!set class[LayeredSettings].method[bind].parameters.parameter[object].type '<type name="GObject.Object" c:type="gpointer"/>'

//# Hand-written below: Mapping callbacks share one closure data (GValue result copied back to the C value)
//!set class[LayeredSettings].method[bind_with_mapping][ignore] 1
//!set class[Settings].method[bind_with_mapping][ignore] 1

//!class LayeredSettings pre

import gid.glib2.variant_type;
import gid.gobject2.value;

//!class LayeredSettings

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

//!class Settings

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
