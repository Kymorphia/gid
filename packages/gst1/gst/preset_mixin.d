/// Module for [Preset] interface mixin
module gst.preset_mixin;

public import gst.preset_iface_proxy;
public import gid.gid;
public import gst.c.functions;
public import gst.c.types;
public import gst.types;

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
    One method that is useful to be overridden is [gst.preset.Preset.getPropertyNames].
    With that one can control which properties are saved and in which order.
    When implementing support for read-only presets, one should set the vmethods
    for [gst.preset.Preset.savePreset] and [gst.preset.Preset.deletePreset] to null.
    Applications can use [gst.preset.Preset.isEditable] to check for that.
    
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
  */
  override bool deletePreset(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = gst_preset_delete_preset(cast(GstPreset*)this._cPtr, _name);
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
  override bool getMeta(string name, string tag, out string value)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _tag = tag.toCString(No.Alloc);
    char* _value;
    _retval = gst_preset_get_meta(cast(GstPreset*)this._cPtr, _name, _tag, &_value);
    value = _value.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get a copy of preset names as a null terminated string array.
      Returns: list with names, use [glib.global.strfreev] after usage.
  */
  override string[] getPresetNames()
  {
    char** _cretval;
    _cretval = gst_preset_get_preset_names(cast(GstPreset*)this._cPtr);
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

  /**
      Get a the names of the GObject properties that can be used for presets.
      Returns: an
          array of property names which should be freed with [glib.global.strfreev] after use.
  */
  override string[] getPropertyNames()
  {
    char** _cretval;
    _cretval = gst_preset_get_property_names(cast(GstPreset*)this._cPtr);
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

  /**
      Check if one can add new presets, change existing ones and remove presets.
      Returns: true if presets are editable or false if they are static
  */
  override bool isEditable()
  {
    bool _retval;
    _retval = gst_preset_is_editable(cast(GstPreset*)this._cPtr);
    return _retval;
  }

  /**
      Load the given preset.
  
      Params:
        name = preset name to load
      Returns: true for success, false if e.g. there is no preset with that name
  */
  override bool loadPreset(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = gst_preset_load_preset(cast(GstPreset*)this._cPtr, _name);
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
  override bool renamePreset(string oldName, string newName)
  {
    bool _retval;
    const(char)* _oldName = oldName.toCString(No.Alloc);
    const(char)* _newName = newName.toCString(No.Alloc);
    _retval = gst_preset_rename_preset(cast(GstPreset*)this._cPtr, _oldName, _newName);
    return _retval;
  }

  /**
      Save the current object settings as a preset under the given name. If there
      is already a preset by this name it will be overwritten.
  
      Params:
        name = preset name to save
      Returns: true for success, false
  */
  override bool savePreset(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = gst_preset_save_preset(cast(GstPreset*)this._cPtr, _name);
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
  override bool setMeta(string name, string tag, string value = null)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _tag = tag.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    _retval = gst_preset_set_meta(cast(GstPreset*)this._cPtr, _name, _tag, _value);
    return _retval;
  }
}
