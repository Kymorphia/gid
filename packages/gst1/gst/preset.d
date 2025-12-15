/// Module for [Preset] interface
module gst.preset;

public import gst.preset_iface_proxy;
import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

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
interface Preset
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_preset_get_type != &gidSymbolNotFound ? gst_preset_get_type() : cast(GType)0;
  }

  /**
      Gets the directory for application specific presets if set by the
      application.
      Returns: the directory or null, don't free or modify
        the string
  */
  static string getAppDir()
  {
    const(char)* _cretval;
    _cretval = gst_preset_get_app_dir();
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets an extra directory as an absolute path that should be considered when
      looking for presets. Any presets in the application dir will shadow the
      system presets.
  
      Params:
        appDir = the application specific preset dir
      Returns: true for success, false if the dir already has been set
  */
  static bool setAppDir(string appDir)
  {
    bool _retval;
    const(char)* _appDir = appDir.toCString(No.Alloc);
    _retval = cast(bool)gst_preset_set_app_dir(_appDir);
    return _retval;
  }

  /**
      Delete the given preset.
  
      Params:
        name = preset name to remove
      Returns: true for success, false if e.g. there is no preset with that name
  */
  bool deletePreset(string name);

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
  bool getMeta(string name, string tag, out string value);

  /**
      Get a copy of preset names as a null terminated string array.
      Returns: list with names, use [glib.global.strfreev] after usage.
  */
  string[] getPresetNames();

  /**
      Get a the names of the GObject properties that can be used for presets.
      Returns: an
          array of property names which should be freed with [glib.global.strfreev] after use.
  */
  string[] getPropertyNames();

  /**
      Check if one can add new presets, change existing ones and remove presets.
      Returns: true if presets are editable or false if they are static
  */
  bool isEditable();

  /**
      Load the given preset.
  
      Params:
        name = preset name to load
      Returns: true for success, false if e.g. there is no preset with that name
  */
  bool loadPreset(string name);

  /**
      Renames a preset. If there is already a preset by the new_name it will be
      overwritten.
  
      Params:
        oldName = current preset name
        newName = new preset name
      Returns: true for success, false if e.g. there is no preset with old_name
  */
  bool renamePreset(string oldName, string newName);

  /**
      Save the current object settings as a preset under the given name. If there
      is already a preset by this name it will be overwritten.
  
      Params:
        name = preset name to save
      Returns: true for success, false
  */
  bool savePreset(string name);

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
  bool setMeta(string name, string tag, string value = null);
}
