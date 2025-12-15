/// Module for [EncodingTarget] class
module gstpbutils.encoding_target;

import gid.gid;
import glib.error;
import gobject.object;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.encoding_profile;
import gstpbutils.types;

/**
    Collection of #GstEncodingProfile for a specific target or use-case.
    
    When being stored/loaded, targets come from a specific category, like
    #GST_ENCODING_CATEGORY_DEVICE.
*/
class EncodingTarget : gobject.object.ObjectWrap
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
    return cast(void function())gst_encoding_target_get_type != &gidSymbolNotFound ? gst_encoding_target_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EncodingTarget self()
  {
    return this;
  }

  /**
      Creates a new #GstEncodingTarget.
      
      The name and category can only consist of lowercase ASCII letters for the
      first character, followed by either lowercase ASCII letters, digits or
      hyphens ('-').
      
      The category *should* be one of the existing
      well-defined categories, like #GST_ENCODING_CATEGORY_DEVICE, but it
      *can* be a application or user specific category if
      needed.
  
      Params:
        name = The name of the target.
        category = The name of the category to which this target
          belongs. For example: #GST_ENCODING_CATEGORY_DEVICE.
        description = A description of #GstEncodingTarget in the
          current locale.
        profiles = A #GList of
          #GstEncodingProfile.
      Returns: The newly created #GstEncodingTarget or null if
        there was an error.
  */
  this(string name, string category, string description, gstpbutils.encoding_profile.EncodingProfile[] profiles)
  {
    GstEncodingTarget* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _category = category.toCString(No.Alloc);
    const(char)* _description = description.toCString(No.Alloc);
    auto _profiles = gListFromD!(gstpbutils.encoding_profile.EncodingProfile)(profiles);
    scope(exit) containerFree!(const(GList)*, gstpbutils.encoding_profile.EncodingProfile, GidOwnership.None)(_profiles);
    _cretval = gst_encoding_target_new(_name, _category, _description, _profiles);
    this(_cretval, Yes.Take);
  }

  /**
      Searches for the #GstEncodingTarget with the given name, loads it
      and returns it.
      
      If the category name is specified only targets from that category will be
      searched for.
  
      Params:
        name = the name of the #GstEncodingTarget to load (automatically
          converted to lower case internally as capital letters are not
          valid for target names).
        category = the name of the target category, like
          #GST_ENCODING_CATEGORY_DEVICE. Can be null
      Returns: The #GstEncodingTarget if available, else null.
      Throws: [ErrorWrap]
  */
  static gstpbutils.encoding_target.EncodingTarget load(string name, string category = null)
  {
    GstEncodingTarget* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _category = category.toCString(No.Alloc);
    GError *_err;
    _cretval = gst_encoding_target_load(_name, _category, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.encoding_target.EncodingTarget)(cast(GstEncodingTarget*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Opens the provided file and returns the contained #GstEncodingTarget.
  
      Params:
        filepath = The file location to load the #GstEncodingTarget from
      Returns: The #GstEncodingTarget contained in the file, else
        null
      Throws: [ErrorWrap]
  */
  static gstpbutils.encoding_target.EncodingTarget loadFromFile(string filepath)
  {
    GstEncodingTarget* _cretval;
    const(char)* _filepath = filepath.toCString(No.Alloc);
    GError *_err;
    _cretval = gst_encoding_target_load_from_file(_filepath, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.encoding_target.EncodingTarget)(cast(GstEncodingTarget*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds the given profile to the target. Each added profile must have
      a unique name within the profile.
      
      The target will steal a reference to the profile. If you wish to use
      the profile after calling this method, you should increase its reference
      count.
  
      Params:
        profile = the #GstEncodingProfile to add
      Returns: true if the profile was added, else false.
  */
  bool addProfile(gstpbutils.encoding_profile.EncodingProfile profile)
  {
    bool _retval;
    _retval = cast(bool)gst_encoding_target_add_profile(cast(GstEncodingTarget*)this._cPtr, profile ? cast(GstEncodingProfile*)profile._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /** */
  string getCategory()
  {
    const(char)* _cretval;
    _cretval = gst_encoding_target_get_category(cast(GstEncodingTarget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gst_encoding_target_get_description(cast(GstEncodingTarget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gst_encoding_target_get_name(cast(GstEncodingTarget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getPath()
  {
    const(char)* _cretval;
    _cretval = gst_encoding_target_get_path(cast(GstEncodingTarget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  gstpbutils.encoding_profile.EncodingProfile getProfile(string name)
  {
    GstEncodingProfile* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_encoding_target_get_profile(cast(GstEncodingTarget*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.encoding_profile.EncodingProfile)(cast(GstEncodingProfile*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gstpbutils.encoding_profile.EncodingProfile[] getProfiles()
  {
    const(GList)* _cretval;
    _cretval = gst_encoding_target_get_profiles(cast(GstEncodingTarget*)this._cPtr);
    auto _retval = gListToD!(gstpbutils.encoding_profile.EncodingProfile, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Saves the target to a default user-local directory.
      Returns: true if the target was correctly saved, else false.
      Throws: [ErrorWrap]
  */
  bool save()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gst_encoding_target_save(cast(GstEncodingTarget*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Saves the target to the provided file location.
  
      Params:
        filepath = the location to store the target at.
      Returns: true if the target was correctly saved, else false.
      Throws: [ErrorWrap]
  */
  bool saveToFile(string filepath)
  {
    bool _retval;
    const(char)* _filepath = filepath.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gst_encoding_target_save_to_file(cast(GstEncodingTarget*)this._cPtr, _filepath, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
