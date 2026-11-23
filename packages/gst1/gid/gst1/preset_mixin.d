/// Module for [Preset] interface mixin
module gid.gst1.preset_mixin;

public import gid.core.basictypes;
public import gid.gst1.preset_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gst1.c.functions;
public import gid.gst1.c.types;
public import gid.gst1.types;

/**
    This interface offers methods to query and manipulate parameter preset sets.
    A preset is a bunch of property settings, together with meta data and a name.
    The name of a preset serves as key for subsequent method calls to manipulate
    single presets.
    All instances of one type will share the list of presets. The list is created
    on demand, if presets are not used, the list is not created.
    
    The interface comes with a default implementation that serves most plugins.
    Wrapper plugins will override most methods to implement support for the
    native preset format of those wrapped plugins.
    One method that is useful to be overridden is [gid.gst1.preset.Preset.getPropertyNames].
    With that one can control which properties are saved and in which order.
    When implementing support for read-only presets, one should set the vmethods
    for [gid.gst1.preset.Preset.savePreset] and [gid.gst1.preset.Preset.deletePreset] to null.
    Applications can use [gid.gst1.preset.Preset.isEditable] to check for that.
    
    The default implementation supports presets located in a system directory,
    application specific directory and in the users home directory. When getting
    a list of presets individual presets are read and overlaid in 1) system,
    2) application and 3) user order. Whenever an earlier entry is newer, the
    later entries will be updated. Since 1.8 you can also provide extra paths
    where to find presets through the GST_PRESET_PATH environment variable.
    Presets found in those paths will be considered as "app presets".
*/
template PresetT()
{



  /**
      Delete the given preset.
  
      Params:
        name = preset name to remove
      Returns: true for success, false if e.g. there is no preset with that name
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDeletePreset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncDeletePreset(string name)
  {
    auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.preset.Preset._getGType);
    if (!_klass || !_klass.deletePreset)
      return typeof(return).init;

    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.deletePreset(cast(GstPreset*)this._cPtr, _name);
    return _retval;
  }

  /**
      Gets the value for an existing meta data tag. Meta data tag names can be
      something like e.g. "comment". Returned values need to be released when done.
  
      Params:
        name = preset name
        tag = meta data item name
        value = value
      Returns: true for success, false if e.g. there is no preset with that name
        or no value for the given tag
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetMeta`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetMeta(string name, string tag, out string value)
  {
    auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.preset.Preset._getGType);
    if (!_klass || !_klass.getMeta)
      return typeof(return).init;

    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _tag = tag.toCString!(No.Malloc, No.Nullable);
    char* _value;
    _retval = cast(bool)_klass.getMeta(cast(GstPreset*)this._cPtr, _name, _tag, &_value);
    value = _value.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get a copy of preset names as a null terminated string array.
      Returns: list with names, use [gid.glib2.global.strfreev] after usage.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetPresetNames`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string[] vfuncGetPresetNames()
  {
    auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.preset.Preset._getGType);
    if (!_klass || !_klass.getPresetNames)
      return typeof(return).init;

    char** _cretval;
    _cretval = _klass.getPresetNames(cast(GstPreset*)this._cPtr);
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

  /**
      Get a the names of the GObject properties that can be used for presets.
      Returns: an
          array of property names which should be freed with [gid.glib2.global.strfreev] after use.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetPropertyNames`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string[] vfuncGetPropertyNames()
  {
    auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.preset.Preset._getGType);
    if (!_klass || !_klass.getPropertyNames)
      return typeof(return).init;

    char** _cretval;
    _cretval = _klass.getPropertyNames(cast(GstPreset*)this._cPtr);
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

  /**
      Load the given preset.
  
      Params:
        name = preset name to load
      Returns: true for success, false if e.g. there is no preset with that name
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLoadPreset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncLoadPreset(string name)
  {
    auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.preset.Preset._getGType);
    if (!_klass || !_klass.loadPreset)
      return typeof(return).init;

    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.loadPreset(cast(GstPreset*)this._cPtr, _name);
    return _retval;
  }

  /**
      Renames a preset. If there is already a preset by the new_name it will be
      overwritten.
  
      Params:
        oldName = current preset name
        newName = new preset name
      Returns: true for success, false if e.g. there is no preset with old_name
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRenamePreset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncRenamePreset(string oldName, string newName)
  {
    auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.preset.Preset._getGType);
    if (!_klass || !_klass.renamePreset)
      return typeof(return).init;

    bool _retval;
    const(char)* _oldName = oldName.toCString!(No.Malloc, No.Nullable);
    const(char)* _newName = newName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.renamePreset(cast(GstPreset*)this._cPtr, _oldName, _newName);
    return _retval;
  }

  /**
      Save the current object settings as a preset under the given name. If there
      is already a preset by this name it will be overwritten.
  
      Params:
        name = preset name to save
      Returns: true for success, false
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSavePreset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSavePreset(string name)
  {
    auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.preset.Preset._getGType);
    if (!_klass || !_klass.savePreset)
      return typeof(return).init;

    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.savePreset(cast(GstPreset*)this._cPtr, _name);
    return _retval;
  }

  /**
      Sets a new value for an existing meta data item or adds a new item. Meta
      data tag names can be something like e.g. "comment". Supplying null for the
      value will unset an existing value.
  
      Params:
        name = preset name
        tag = meta data item name
        value = new value
      Returns: true for success, false if e.g. there is no preset with that name
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetMeta`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetMeta(string name, string tag, string value = null)
  {
    auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.preset.Preset._getGType);
    if (!_klass || !_klass.setMeta)
      return typeof(return).init;

    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _tag = tag.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, Yes.Nullable);
    _retval = cast(bool)_klass.setMeta(cast(GstPreset*)this._cPtr, _name, _tag, _value);
    return _retval;
  }

  /**
      Delete the given preset.
  
      Params:
        name = preset name to remove
      Returns: true for success, false if e.g. there is no preset with that name
  */
  override bool deletePreset(string name) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_preset_delete_preset(cast(GstPreset*)this._cPtr, _name);
    return _retval;
  }

  /**
      Gets the value for an existing meta data tag. Meta data tag names can be
      something like e.g. "comment". Returned values need to be released when done.
  
      Params:
        name = preset name
        tag = meta data item name
        value = value
      Returns: true for success, false if e.g. there is no preset with that name
        or no value for the given tag
  */
  override bool getMeta(string name, string tag, out string value) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _tag = tag.toCString!(No.Malloc, No.Nullable);
    char* _value;
    _retval = cast(bool)gst_preset_get_meta(cast(GstPreset*)this._cPtr, _name, _tag, &_value);
    value = _value.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get a copy of preset names as a null terminated string array.
      Returns: list with names, use [gid.glib2.global.strfreev] after usage.
  */
  override string[] getPresetNames() nothrow
  {
    char** _cretval;
    _cretval = gst_preset_get_preset_names(cast(GstPreset*)this._cPtr);
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

  /**
      Get a the names of the GObject properties that can be used for presets.
      Returns: an
          array of property names which should be freed with [gid.glib2.global.strfreev] after use.
  */
  override string[] getPropertyNames() nothrow
  {
    char** _cretval;
    _cretval = gst_preset_get_property_names(cast(GstPreset*)this._cPtr);
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

  /**
      Check if one can add new presets, change existing ones and remove presets.
      Returns: true if presets are editable or false if they are static
  */
  override bool isEditable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_preset_is_editable(cast(GstPreset*)this._cPtr);
    return _retval;
  }

  /**
      Load the given preset.
  
      Params:
        name = preset name to load
      Returns: true for success, false if e.g. there is no preset with that name
  */
  override bool loadPreset(string name) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_preset_load_preset(cast(GstPreset*)this._cPtr, _name);
    return _retval;
  }

  /**
      Renames a preset. If there is already a preset by the new_name it will be
      overwritten.
  
      Params:
        oldName = current preset name
        newName = new preset name
      Returns: true for success, false if e.g. there is no preset with old_name
  */
  override bool renamePreset(string oldName, string newName) nothrow
  {
    bool _retval;
    const(char)* _oldName = oldName.toCString!(No.Malloc, No.Nullable);
    const(char)* _newName = newName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_preset_rename_preset(cast(GstPreset*)this._cPtr, _oldName, _newName);
    return _retval;
  }

  /**
      Save the current object settings as a preset under the given name. If there
      is already a preset by this name it will be overwritten.
  
      Params:
        name = preset name to save
      Returns: true for success, false
  */
  override bool savePreset(string name) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_preset_save_preset(cast(GstPreset*)this._cPtr, _name);
    return _retval;
  }

  /**
      Sets a new value for an existing meta data item or adds a new item. Meta
      data tag names can be something like e.g. "comment". Supplying null for the
      value will unset an existing value.
  
      Params:
        name = preset name
        tag = meta data item name
        value = new value
      Returns: true for success, false if e.g. there is no preset with that name
  */
  override bool setMeta(string name, string tag, string value = null) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _tag = tag.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, Yes.Nullable);
    _retval = cast(bool)gst_preset_set_meta(cast(GstPreset*)this._cPtr, _name, _tag, _value);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gst1.preset.Preset (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gst1_preset_Preset(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeletePreset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMeta", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPresetNames", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPropertyNames", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLoadPreset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRenamePreset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSavePreset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetMeta", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gst1.preset.Preset vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gst1_preset_Preset(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeletePreset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_preset_Preset(iface, "delete_preset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMeta", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_preset_Preset(iface, "get_meta");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPresetNames", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_preset_Preset(iface, "get_preset_names");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPropertyNames", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_preset_Preset(iface, "get_property_names");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLoadPreset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_preset_Preset(iface, "load_preset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRenamePreset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_preset_Preset(iface, "rename_preset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSavePreset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_preset_Preset(iface, "save_preset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetMeta", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_preset_Preset(iface, "set_meta");
  }

  private static void _installIfaceVfunc_gid_gst1_preset_Preset(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GstPresetInterface*)iface;

    switch (vfunc)
    {
      case "delete_preset":
      {
        static extern(C) gboolean _vfuncDeletePresetTramp(GstPreset* preset, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)preset);
          if (!_obj)
          {
            auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preset), gid.gst1.preset.Preset._getGType);
            if (_klass && _klass.deletePreset)
              return (cast(typeof(&_vfuncDeletePresetTramp))_klass.deletePreset)(preset, name);
            return typeof(return).init;
          }

          bool _dretval;
          string _name = name.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncDeletePreset(_name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.preset.Preset.vfuncDeletePreset");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.deletePreset = cast(typeof(_klass.deletePreset))&_vfuncDeletePresetTramp;
        break;
      }
      case "get_meta":
      {
        static extern(C) gboolean _vfuncGetMetaTramp(GstPreset* preset, const(char)* name, const(char)* tag, char** value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)preset);
          if (!_obj)
          {
            auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preset), gid.gst1.preset.Preset._getGType);
            if (_klass && _klass.getMeta)
              return (cast(typeof(&_vfuncGetMetaTramp))_klass.getMeta)(preset, name, tag, value);
            return typeof(return).init;
          }

          bool _dretval;
          string _name = name.fromCString!(No.Free);
          string _tag = tag.fromCString!(No.Free);
          string _value;

          try
          {
            _dretval = _obj.vfuncGetMeta(_name, _tag, _value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.preset.Preset.vfuncGetMeta");
          }
          auto _retval = cast(gboolean)_dretval;
          *value = _value.toCString!(Yes.Malloc, No.Nullable);

          return _retval;
        }

        _klass.getMeta = cast(typeof(_klass.getMeta))&_vfuncGetMetaTramp;
        break;
      }
      case "get_preset_names":
      {
        static extern(C) char** _vfuncGetPresetNamesTramp(GstPreset* preset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)preset);
          if (!_obj)
          {
            auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preset), gid.gst1.preset.Preset._getGType);
            if (_klass && _klass.getPresetNames)
              return (cast(typeof(&_vfuncGetPresetNamesTramp))_klass.getPresetNames)(preset);
            return typeof(return).init;
          }

          string[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetPresetNames();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.preset.Preset.vfuncGetPresetNames");
          }
          char** _retval;

          if (_dretval.length > 0)
          {
            _retval = cast(typeof(_retval))gMalloc((_dretval.length + 1) * (*_retval).sizeof);

            foreach (i; 0 .. _dretval.length)
              _retval[i] = toCString!(Yes.Malloc)(_dretval[i]);
          }


          return _retval;
        }

        _klass.getPresetNames = cast(typeof(_klass.getPresetNames))&_vfuncGetPresetNamesTramp;
        break;
      }
      case "get_property_names":
      {
        static extern(C) char** _vfuncGetPropertyNamesTramp(GstPreset* preset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)preset);
          if (!_obj)
          {
            auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preset), gid.gst1.preset.Preset._getGType);
            if (_klass && _klass.getPropertyNames)
              return (cast(typeof(&_vfuncGetPropertyNamesTramp))_klass.getPropertyNames)(preset);
            return typeof(return).init;
          }

          string[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetPropertyNames();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.preset.Preset.vfuncGetPropertyNames");
          }
          char** _retval;

          if (_dretval.length > 0)
          {
            _retval = cast(typeof(_retval))gMalloc((_dretval.length + 1) * (*_retval).sizeof);

            foreach (i; 0 .. _dretval.length)
              _retval[i] = toCString!(Yes.Malloc)(_dretval[i]);
          }


          return _retval;
        }

        _klass.getPropertyNames = cast(typeof(_klass.getPropertyNames))&_vfuncGetPropertyNamesTramp;
        break;
      }
      case "load_preset":
      {
        static extern(C) gboolean _vfuncLoadPresetTramp(GstPreset* preset, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)preset);
          if (!_obj)
          {
            auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preset), gid.gst1.preset.Preset._getGType);
            if (_klass && _klass.loadPreset)
              return (cast(typeof(&_vfuncLoadPresetTramp))_klass.loadPreset)(preset, name);
            return typeof(return).init;
          }

          bool _dretval;
          string _name = name.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncLoadPreset(_name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.preset.Preset.vfuncLoadPreset");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.loadPreset = cast(typeof(_klass.loadPreset))&_vfuncLoadPresetTramp;
        break;
      }
      case "rename_preset":
      {
        static extern(C) gboolean _vfuncRenamePresetTramp(GstPreset* preset, const(char)* oldName, const(char)* newName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)preset);
          if (!_obj)
          {
            auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preset), gid.gst1.preset.Preset._getGType);
            if (_klass && _klass.renamePreset)
              return (cast(typeof(&_vfuncRenamePresetTramp))_klass.renamePreset)(preset, oldName, newName);
            return typeof(return).init;
          }

          bool _dretval;
          string _oldName = oldName.fromCString!(No.Free);
          string _newName = newName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncRenamePreset(_oldName, _newName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.preset.Preset.vfuncRenamePreset");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.renamePreset = cast(typeof(_klass.renamePreset))&_vfuncRenamePresetTramp;
        break;
      }
      case "save_preset":
      {
        static extern(C) gboolean _vfuncSavePresetTramp(GstPreset* preset, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)preset);
          if (!_obj)
          {
            auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preset), gid.gst1.preset.Preset._getGType);
            if (_klass && _klass.savePreset)
              return (cast(typeof(&_vfuncSavePresetTramp))_klass.savePreset)(preset, name);
            return typeof(return).init;
          }

          bool _dretval;
          string _name = name.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSavePreset(_name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.preset.Preset.vfuncSavePreset");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.savePreset = cast(typeof(_klass.savePreset))&_vfuncSavePresetTramp;
        break;
      }
      case "set_meta":
      {
        static extern(C) gboolean _vfuncSetMetaTramp(GstPreset* preset, const(char)* name, const(char)* tag, const(char)* value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)preset);
          if (!_obj)
          {
            auto _klass = cast(GstPresetInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)preset), gid.gst1.preset.Preset._getGType);
            if (_klass && _klass.setMeta)
              return (cast(typeof(&_vfuncSetMetaTramp))_klass.setMeta)(preset, name, tag, value);
            return typeof(return).init;
          }

          bool _dretval;
          string _name = name.fromCString!(No.Free);
          string _tag = tag.fromCString!(No.Free);
          string _value = value.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSetMeta(_name, _tag, _value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.preset.Preset.vfuncSetMeta");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setMeta = cast(typeof(_klass.setMeta))&_vfuncSetMetaTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gst1.preset.Preset]
template PresetGidBuilderT()
{
}
