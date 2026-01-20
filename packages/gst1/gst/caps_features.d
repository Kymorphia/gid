/// Module for [CapsFeatures] class
module gst.caps_features;

import gid.gid;
import glib.types;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    #GstCapsFeatures can optionally be set on a #GstCaps to add requirements
    for additional features for a specific #GstStructure. Caps structures with
    the same name but with a non-equal set of caps features are not compatible.
    If a pad supports multiple sets of features it has to add multiple equal
    structures with different feature sets to the caps.
    
    Empty #GstCapsFeatures are equivalent with the #GstCapsFeatures that only
    contain #GST_CAPS_FEATURE_MEMORY_SYSTEM_MEMORY. ANY #GstCapsFeatures as
    created by [gst.caps_features.CapsFeatures.newAny] are equal to any other #GstCapsFeatures
    and can be used to specify that any #GstCapsFeatures would be supported, e.g.
    for elements that don't touch buffer memory. #GstCaps with ANY #GstCapsFeatures
    are considered non-fixed and during negotiation some #GstCapsFeatures have
    to be selected.
    
    Examples for caps features would be the requirement of a specific #GstMemory
    types or the requirement of having a specific #GstMeta on the buffer. Features
    are given as a string of the format `memory:GstMemoryTypeName` or
    `meta:GstMetaAPIName`.
*/
class CapsFeatures : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_caps_features_get_type != &gidSymbolNotFound ? gst_caps_features_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CapsFeatures self()
  {
    return this;
  }

  /**
      Creates a new, ANY #GstCapsFeatures. This will be equal
      to any other #GstCapsFeatures but caps with these are
      unfixed.
      Returns: a new, ANY #GstCapsFeatures
  */
  static gst.caps_features.CapsFeatures newAny()
  {
    GstCapsFeatures* _cretval;
    _cretval = gst_caps_features_new_any();
    auto _retval = _cretval ? new gst.caps_features.CapsFeatures(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new, empty #GstCapsFeatures.
      Returns: a new, empty #GstCapsFeatures
  */
  static gst.caps_features.CapsFeatures newEmpty()
  {
    GstCapsFeatures* _cretval;
    _cretval = gst_caps_features_new_empty();
    auto _retval = _cretval ? new gst.caps_features.CapsFeatures(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstCapsFeatures with a single feature.
  
      Params:
        feature = The feature
      Returns: a new #GstCapsFeatures
  */
  static gst.caps_features.CapsFeatures newSingle(string feature)
  {
    GstCapsFeatures* _cretval;
    const(char)* _feature = feature.toCString(No.Alloc);
    _cretval = gst_caps_features_new_single(_feature);
    auto _retval = _cretval ? new gst.caps_features.CapsFeatures(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Adds feature to features.
  
      Params:
        feature = a feature.
  */
  void add(string feature)
  {
    const(char)* _feature = feature.toCString(No.Alloc);
    gst_caps_features_add(cast(GstCapsFeatures*)this._cPtr, _feature);
  }

  /**
      Adds feature to features.
  
      Params:
        feature = a feature.
  */
  void addId(glib.types.Quark feature)
  {
    gst_caps_features_add_id(cast(GstCapsFeatures*)this._cPtr, feature);
  }

  /**
      Checks if features contains feature.
  
      Params:
        feature = a feature
      Returns: true if features contains feature.
  */
  bool contains(string feature)
  {
    bool _retval;
    const(char)* _feature = feature.toCString(No.Alloc);
    _retval = cast(bool)gst_caps_features_contains(cast(const(GstCapsFeatures)*)this._cPtr, _feature);
    return _retval;
  }

  /**
      Checks if features contains feature.
  
      Params:
        feature = a feature
      Returns: true if features contains feature.
  */
  bool containsId(glib.types.Quark feature)
  {
    bool _retval;
    _retval = cast(bool)gst_caps_features_contains_id(cast(const(GstCapsFeatures)*)this._cPtr, feature);
    return _retval;
  }

  /**
      Duplicates a #GstCapsFeatures and all its values.
      Returns: a new #GstCapsFeatures.
  */
  gst.caps_features.CapsFeatures copy()
  {
    GstCapsFeatures* _cretval;
    _cretval = gst_caps_features_copy(cast(const(GstCapsFeatures)*)this._cPtr);
    auto _retval = _cretval ? new gst.caps_features.CapsFeatures(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the `i`-th feature of features.
  
      Params:
        i = index of the feature
      Returns: The `i`-th feature of features.
  */
  string getNth(uint i)
  {
    const(char)* _cretval;
    _cretval = gst_caps_features_get_nth(cast(const(GstCapsFeatures)*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the `i`-th feature of features.
  
      Params:
        i = index of the feature
      Returns: The `i`-th feature of features.
  */
  glib.types.Quark getNthId(uint i)
  {
    glib.types.Quark _retval;
    _retval = gst_caps_features_get_nth_id(cast(const(GstCapsFeatures)*)this._cPtr, i);
    return _retval;
  }

  /**
      Returns the number of features in features.
      Returns: The number of features in features.
  */
  uint getSize()
  {
    uint _retval;
    _retval = gst_caps_features_get_size(cast(const(GstCapsFeatures)*)this._cPtr);
    return _retval;
  }

  /**
      Checks if features is `GST_CAPS_FEATURES_ANY`.
      Returns: true if features is `GST_CAPS_FEATURES_ANY`.
  */
  bool isAny()
  {
    bool _retval;
    _retval = cast(bool)gst_caps_features_is_any(cast(const(GstCapsFeatures)*)this._cPtr);
    return _retval;
  }

  /**
      Checks if features1 and features2 are equal.
  
      Params:
        features2 = a #GstCapsFeatures.
      Returns: true if features1 and features2 are equal.
  */
  bool isEqual(gst.caps_features.CapsFeatures features2)
  {
    bool _retval;
    _retval = cast(bool)gst_caps_features_is_equal(cast(const(GstCapsFeatures)*)this._cPtr, features2 ? cast(const(GstCapsFeatures)*)features2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes feature from features.
  
      Params:
        feature = a feature.
  */
  void remove(string feature)
  {
    const(char)* _feature = feature.toCString(No.Alloc);
    gst_caps_features_remove(cast(GstCapsFeatures*)this._cPtr, _feature);
  }

  /**
      Removes feature from features.
  
      Params:
        feature = a feature.
  */
  void removeId(glib.types.Quark feature)
  {
    gst_caps_features_remove_id(cast(GstCapsFeatures*)this._cPtr, feature);
  }

  /**
      Converts features to a human-readable string representation.
      
      For debugging purposes its easier to do something like this:
      
      ``` C
      GST_LOG ("features is %" GST_PTR_FORMAT, features);
      ```
      
      This prints the features in human readable form.
      Returns: a pointer to string allocated by [glib.global.gmalloc].
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gst_caps_features_to_string(cast(const(GstCapsFeatures)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Creates a #GstCapsFeatures from a string representation.
  
      Params:
        features = a string representation of a #GstCapsFeatures.
      Returns: a new #GstCapsFeatures or
            null when the string could not be parsed.
  */
  static gst.caps_features.CapsFeatures fromString(string features)
  {
    GstCapsFeatures* _cretval;
    const(char)* _features = features.toCString(No.Alloc);
    _cretval = gst_caps_features_from_string(_features);
    auto _retval = _cretval ? new gst.caps_features.CapsFeatures(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
