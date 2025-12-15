/// Module for [Caps] class
module gst.caps;

import gid.gid;
import gobject.boxed;
import gobject.value;
import gst.c.functions;
import gst.c.types;
import gst.caps_features;
import gst.mini_object;
import gst.structure;
import gst.types;

/**
    Caps (capabilities) are lightweight refcounted objects describing media types.
    They are composed of an array of #GstStructure.
    
    Caps are exposed on #GstPadTemplate to describe all possible types a
    given pad can handle. They are also stored in the #GstRegistry along with
    a description of the #GstElement.
    
    Caps are exposed on the element pads using the [gst.pad.Pad.queryCaps] pad
    function. This function describes the possible types that the pad can
    handle or produce at runtime.
    
    A #GstCaps can be constructed with the following code fragment:
    
    ``` C
      GstCaps *caps = gst_caps_new_simple ("video/x-raw",
         "format", G_TYPE_STRING, "I420",
         "framerate", GST_TYPE_FRACTION, 25, 1,
         "pixel-aspect-ratio", GST_TYPE_FRACTION, 1, 1,
         "width", G_TYPE_INT, 320,
         "height", G_TYPE_INT, 240,
         NULL);
    ```
    
    A #GstCaps is fixed when it has no fields with ranges or lists. Use
    [gst.caps.Caps.isFixed] to test for fixed caps. Fixed caps can be used in a
    caps event to notify downstream elements of the current media type.
    
    Various methods exist to work with the media types such as subtracting
    or intersecting.
    
    Be aware that until 1.20 the #GstCaps / #GstStructure serialization into string
    had limited support for nested #GstCaps / #GstStructure fields. It could only
    support one level of nesting. Using more levels would lead to unexpected
    behavior when using serialization features, such as [gst.caps.Caps.toString_] or
    [gst.global.valueSerialize] and their counterparts.
*/
class Caps : gobject.boxed.Boxed
{

  /**
      Create a `caps.Caps` boxed type.
  */
  this()
  {
    super(gMalloc(GstCaps.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_caps_get_type != &gidSymbolNotFound ? gst_caps_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Caps self()
  {
    return this;
  }

  /**
      Get `miniObject` field.
      Returns: the parent type
  */
  @property gst.mini_object.MiniObject miniObject()
  {
    return cToD!(gst.mini_object.MiniObject)(cast(void*)&(cast(GstCaps*)this._cPtr).miniObject);
  }

  /**
      Creates a new #GstCaps that indicates that it is compatible with
      any media format.
      Returns: the new #GstCaps
  */
  static gst.caps.Caps newAny()
  {
    GstCaps* _cretval;
    _cretval = gst_caps_new_any();
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstCaps that is empty.  That is, the returned
      #GstCaps contains no media formats.
      The #GstCaps is guaranteed to be writable.
      Returns: the new #GstCaps
  */
  static gst.caps.Caps newEmpty()
  {
    GstCaps* _cretval;
    _cretval = gst_caps_new_empty();
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstCaps that contains one #GstStructure with name
      media_type.
  
      Params:
        mediaType = the media type of the structure
      Returns: the new #GstCaps
  */
  static gst.caps.Caps newEmptySimple(string mediaType)
  {
    GstCaps* _cretval;
    const(char)* _mediaType = mediaType.toCString(No.Alloc);
    _cretval = gst_caps_new_empty_simple(_mediaType);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Appends the structures contained in caps2 to caps1. The structures in
      caps2 are not copied -- they are transferred to caps1, and then caps2 is
      freed. If either caps is ANY, the resulting caps will be ANY.
  
      Params:
        caps2 = the #GstCaps to append
  */
  void append(gst.caps.Caps caps2)
  {
    gst_caps_append(cast(GstCaps*)this._cPtr, caps2 ? cast(GstCaps*)caps2._cPtr(Yes.Dup) : null);
  }

  /**
      Appends structure to caps.  The structure is not copied; caps
      becomes the owner of structure.
  
      Params:
        structure = the #GstStructure to append
  */
  void appendStructure(gst.structure.Structure structure)
  {
    gst_caps_append_structure(cast(GstCaps*)this._cPtr, structure ? cast(GstStructure*)structure._cPtr(Yes.Dup) : null);
  }

  /**
      Appends structure with features to caps.  The structure is not copied; caps
      becomes the owner of structure.
  
      Params:
        structure = the #GstStructure to append
        features = the #GstCapsFeatures to append
  */
  void appendStructureFull(gst.structure.Structure structure, gst.caps_features.CapsFeatures features = null)
  {
    gst_caps_append_structure_full(cast(GstCaps*)this._cPtr, structure ? cast(GstStructure*)structure._cPtr(Yes.Dup) : null, features ? cast(GstCapsFeatures*)features._cPtr(Yes.Dup) : null);
  }

  /**
      Tries intersecting caps1 and caps2 and reports whether the result would not
      be empty
  
      Params:
        caps2 = a #GstCaps to intersect
      Returns: true if intersection would be not empty
  */
  bool canIntersect(gst.caps.Caps caps2)
  {
    bool _retval;
    _retval = cast(bool)gst_caps_can_intersect(cast(const(GstCaps)*)this._cPtr, caps2 ? cast(const(GstCaps)*)caps2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Creates a new #GstCaps as a copy of the old caps. The new caps will have a
      refcount of 1, owned by the caller. The structures are copied as well.
      
      Note that this function is the semantic equivalent of a gst_caps_ref()
      followed by a gst_caps_make_writable(). If you only want to hold on to a
      reference to the data, you should use gst_caps_ref().
      Returns: the new #GstCaps
  */
  gst.caps.Caps copy()
  {
    GstCaps* _cretval;
    _cretval = gst_caps_copy(cast(const(GstCaps)*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstCaps and appends a copy of the nth structure
      contained in caps.
  
      Params:
        nth = the nth structure to copy
      Returns: the new #GstCaps
  */
  gst.caps.Caps copyNth(uint nth)
  {
    GstCaps* _cretval;
    _cretval = gst_caps_copy_nth(cast(const(GstCaps)*)this._cPtr, nth);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Calls the provided function once for each structure and caps feature in the
      #GstCaps. In contrast to [gst.caps.Caps.foreach_], the function may modify the
      structure and features. In contrast to [gst.caps.Caps.mapInPlace], the structure
      and features are removed from the caps if false is returned from the
      function. The caps must be mutable.
  
      Params:
        func = a function to call for each field
  */
  void filterAndMapInPlace(gst.types.CapsFilterMapFunc func)
  {
    extern(C) gboolean _funcCallback(GstCapsFeatures* features, GstStructure* structure, void* userData)
    {
      auto _dlg = cast(gst.types.CapsFilterMapFunc*)userData;

      gboolean _retval = (*_dlg)(features ? new gst.caps_features.CapsFeatures(cast(void*)features, No.Take) : null, structure ? new gst.structure.Structure(cast(void*)structure, No.Take) : null);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gst_caps_filter_and_map_in_place(cast(GstCaps*)this._cPtr, _funcCB, _func);
  }

  /**
      Modifies the given caps into a representation with only fixed
      values. First the caps will be truncated and then the first structure will be
      fixated with [gst.structure.Structure.fixate].
      
      This function takes ownership of caps and will call gst_caps_make_writable()
      on it so you must not use caps afterwards unless you keep an additional
      reference to it with gst_caps_ref().
      
      Note that it is not guaranteed that the returned caps have exactly one
      structure. If caps are empty caps then the returned caps will be
      the empty too and contain no structure at all.
      
      Calling this function with ANY caps is not allowed.
      Returns: the fixated caps
  */
  gst.caps.Caps fixate()
  {
    GstCaps* _cretval;
    _cretval = gst_caps_fixate(cast(GstCaps*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Calls the provided function once for each structure and caps feature in the
      #GstCaps. The function must not modify the fields.
      Also see [gst.caps.Caps.mapInPlace] and [gst.caps.Caps.filterAndMapInPlace].
  
      Params:
        func = a function to call for each field
      Returns: true if the supplied function returns true for each call,
        false otherwise.
  */
  bool foreach_(gst.types.CapsForeachFunc func)
  {
    extern(C) gboolean _funcCallback(GstCapsFeatures* features, GstStructure* structure, void* userData)
    {
      auto _dlg = cast(gst.types.CapsForeachFunc*)userData;

      gboolean _retval = (*_dlg)(features ? new gst.caps_features.CapsFeatures(cast(void*)features, No.Take) : null, structure ? new gst.structure.Structure(cast(void*)structure, No.Take) : null);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gst_caps_foreach(cast(const(GstCaps)*)this._cPtr, _funcCB, _func);
    return _retval;
  }

  /**
      Finds the features in caps at index, and returns it.
      
      WARNING: This function takes a `const GstCaps *`, but returns a
      non-const `GstCapsFeatures *`.  This is for programming convenience --
      the caller should be aware that features inside a constant
      #GstCaps should not be modified. However, if you know the caps
      are writable, either because you have just copied them or made
      them writable with gst_caps_make_writable(), you may modify the
      features returned in the usual way, e.g. with functions like
      [gst.caps_features.CapsFeatures.add].
  
      Params:
        index = the index of the structure
      Returns: a pointer to the #GstCapsFeatures
            corresponding to index
  */
  gst.caps_features.CapsFeatures getFeatures(uint index)
  {
    GstCapsFeatures* _cretval;
    _cretval = gst_caps_get_features(cast(const(GstCaps)*)this._cPtr, index);
    auto _retval = _cretval ? new gst.caps_features.CapsFeatures(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the number of structures contained in caps.
      Returns: the number of structures that caps contains
  */
  uint getSize()
  {
    uint _retval;
    _retval = gst_caps_get_size(cast(const(GstCaps)*)this._cPtr);
    return _retval;
  }

  /**
      Finds the structure in caps at index, and returns it.
      
      WARNING: This function takes a `const GstCaps *`, but returns a
      non-const `GstStructure *`.  This is for programming convenience --
      the caller should be aware that structures inside a constant
      #GstCaps should not be modified. However, if you know the caps
      are writable, either because you have just copied them or made
      them writable with gst_caps_make_writable(), you may modify the
      structure returned in the usual way, e.g. with functions like
      [gst.structure.Structure.set].
  
      Params:
        index = the index of the structure
      Returns: a pointer to the #GstStructure corresponding
            to index
  */
  gst.structure.Structure getStructure(uint index)
  {
    GstStructure* _cretval;
    _cretval = gst_caps_get_structure(cast(const(GstCaps)*)this._cPtr, index);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstCaps that contains all the formats that are common
      to both caps1 and caps2. Defaults to [gst.types.CapsIntersectMode.ZigZag] mode.
  
      Params:
        caps2 = a #GstCaps to intersect
      Returns: the new #GstCaps
  */
  gst.caps.Caps intersect(gst.caps.Caps caps2)
  {
    GstCaps* _cretval;
    _cretval = gst_caps_intersect(cast(GstCaps*)this._cPtr, caps2 ? cast(GstCaps*)caps2._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstCaps that contains all the formats that are common
      to both caps1 and caps2, the order is defined by the #GstCapsIntersectMode
      used.
  
      Params:
        caps2 = a #GstCaps to intersect
        mode = The intersection algorithm/mode to use
      Returns: the new #GstCaps
  */
  gst.caps.Caps intersectFull(gst.caps.Caps caps2, gst.types.CapsIntersectMode mode)
  {
    GstCaps* _cretval;
    _cretval = gst_caps_intersect_full(cast(GstCaps*)this._cPtr, caps2 ? cast(GstCaps*)caps2._cPtr(No.Dup) : null, mode);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      A given #GstCaps structure is always compatible with another if
      every media format that is in the first is also contained in the
      second.  That is, caps1 is a subset of caps2.
  
      Params:
        caps2 = the #GstCaps to test
      Returns: true if caps1 is a subset of caps2.
  */
  bool isAlwaysCompatible(gst.caps.Caps caps2)
  {
    bool _retval;
    _retval = cast(bool)gst_caps_is_always_compatible(cast(const(GstCaps)*)this._cPtr, caps2 ? cast(const(GstCaps)*)caps2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Determines if caps represents any media format.
      Returns: true if caps represents any format.
  */
  bool isAny()
  {
    bool _retval;
    _retval = cast(bool)gst_caps_is_any(cast(const(GstCaps)*)this._cPtr);
    return _retval;
  }

  /**
      Determines if caps represents no media formats.
      Returns: true if caps represents no formats.
  */
  bool isEmpty()
  {
    bool _retval;
    _retval = cast(bool)gst_caps_is_empty(cast(const(GstCaps)*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the given caps represent the same set of caps.
  
      Params:
        caps2 = another #GstCaps
      Returns: true if both caps are equal.
  */
  bool isEqual(gst.caps.Caps caps2)
  {
    bool _retval;
    _retval = cast(bool)gst_caps_is_equal(cast(const(GstCaps)*)this._cPtr, caps2 ? cast(const(GstCaps)*)caps2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Tests if two #GstCaps are equal.  This function only works on fixed
      #GstCaps.
  
      Params:
        caps2 = the #GstCaps to test
      Returns: true if the arguments represent the same format
  */
  bool isEqualFixed(gst.caps.Caps caps2)
  {
    bool _retval;
    _retval = cast(bool)gst_caps_is_equal_fixed(cast(const(GstCaps)*)this._cPtr, caps2 ? cast(const(GstCaps)*)caps2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Fixed #GstCaps describe exactly one format, that is, they have exactly
      one structure, and each field in the structure describes a fixed type.
      Examples of non-fixed types are GST_TYPE_INT_RANGE and GST_TYPE_LIST.
      Returns: true if caps is fixed
  */
  bool isFixed()
  {
    bool _retval;
    _retval = cast(bool)gst_caps_is_fixed(cast(const(GstCaps)*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the given caps are exactly the same set of caps.
  
      Params:
        caps2 = another #GstCaps
      Returns: true if both caps are strictly equal.
  */
  bool isStrictlyEqual(gst.caps.Caps caps2)
  {
    bool _retval;
    _retval = cast(bool)gst_caps_is_strictly_equal(cast(const(GstCaps)*)this._cPtr, caps2 ? cast(const(GstCaps)*)caps2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if all caps represented by subset are also represented by superset.
  
      Params:
        superset = a potentially greater #GstCaps
      Returns: true if subset is a subset of superset
  */
  bool isSubset(gst.caps.Caps superset)
  {
    bool _retval;
    _retval = cast(bool)gst_caps_is_subset(cast(const(GstCaps)*)this._cPtr, superset ? cast(const(GstCaps)*)superset._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if structure is a subset of caps. See [gst.caps.Caps.isSubset]
      for more information.
  
      Params:
        structure = a potential #GstStructure subset of caps
      Returns: true if structure is a subset of caps
  */
  bool isSubsetStructure(gst.structure.Structure structure)
  {
    bool _retval;
    _retval = cast(bool)gst_caps_is_subset_structure(cast(const(GstCaps)*)this._cPtr, structure ? cast(const(GstStructure)*)structure._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if structure is a subset of caps. See [gst.caps.Caps.isSubset]
      for more information.
  
      Params:
        structure = a potential #GstStructure subset of caps
        features = a #GstCapsFeatures for structure
      Returns: true if structure is a subset of caps
  */
  bool isSubsetStructureFull(gst.structure.Structure structure, gst.caps_features.CapsFeatures features = null)
  {
    bool _retval;
    _retval = cast(bool)gst_caps_is_subset_structure_full(cast(const(GstCaps)*)this._cPtr, structure ? cast(const(GstStructure)*)structure._cPtr(No.Dup) : null, features ? cast(const(GstCapsFeatures)*)features._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calls the provided function once for each structure and caps feature in the
      #GstCaps. In contrast to [gst.caps.Caps.foreach_], the function may modify but not
      delete the structures and features. The caps must be mutable.
  
      Params:
        func = a function to call for each field
      Returns: true if the supplied function returns true for each call,
        false otherwise.
  */
  bool mapInPlace(gst.types.CapsMapFunc func)
  {
    extern(C) gboolean _funcCallback(GstCapsFeatures* features, GstStructure* structure, void* userData)
    {
      auto _dlg = cast(gst.types.CapsMapFunc*)userData;

      gboolean _retval = (*_dlg)(features ? new gst.caps_features.CapsFeatures(cast(void*)features, No.Take) : null, structure ? new gst.structure.Structure(cast(void*)structure, No.Take) : null);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gst_caps_map_in_place(cast(GstCaps*)this._cPtr, _funcCB, _func);
    return _retval;
  }

  /**
      Appends the structures contained in caps2 to caps1 if they are not yet
      expressed by caps1. The structures in caps2 are not copied -- they are
      transferred to a writable copy of caps1, and then caps2 is freed.
      If either caps is ANY, the resulting caps will be ANY.
  
      Params:
        caps2 = the #GstCaps to merge in
      Returns: the merged caps.
  */
  gst.caps.Caps merge(gst.caps.Caps caps2)
  {
    GstCaps* _cretval;
    _cretval = gst_caps_merge(cast(GstCaps*)this._cPtr, caps2 ? cast(GstCaps*)caps2._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Appends structure to caps if it is not already expressed by caps.
  
      Params:
        structure = the #GstStructure to merge
      Returns: the merged caps.
  */
  gst.caps.Caps mergeStructure(gst.structure.Structure structure)
  {
    GstCaps* _cretval;
    _cretval = gst_caps_merge_structure(cast(GstCaps*)this._cPtr, structure ? cast(GstStructure*)structure._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Appends structure with features to caps if its not already expressed by caps.
  
      Params:
        structure = the #GstStructure to merge
        features = the #GstCapsFeatures to merge
      Returns: the merged caps.
  */
  gst.caps.Caps mergeStructureFull(gst.structure.Structure structure, gst.caps_features.CapsFeatures features = null)
  {
    GstCaps* _cretval;
    _cretval = gst_caps_merge_structure_full(cast(GstCaps*)this._cPtr, structure ? cast(GstStructure*)structure._cPtr(Yes.Dup) : null, features ? cast(GstCapsFeatures*)features._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a #GstCaps that represents the same set of formats as
      caps, but contains no lists.  Each list is expanded into separate
      #GstStructure.
      
      This function takes ownership of caps and will call gst_caps_make_writable()
      on it so you must not use caps afterwards unless you keep an additional
      reference to it with gst_caps_ref().
      Returns: the normalized #GstCaps
  */
  gst.caps.Caps normalize()
  {
    GstCaps* _cretval;
    _cretval = gst_caps_normalize(cast(GstCaps*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Removes the structure with the given index from the list of structures
      contained in caps.
  
      Params:
        idx = Index of the structure to remove
  */
  void removeStructure(uint idx)
  {
    gst_caps_remove_structure(cast(GstCaps*)this._cPtr, idx);
  }

  /**
      Converts caps to a string representation.  This string representation can be
      converted back to a #GstCaps by [gst.caps.Caps.fromString].
      
      This prints the caps in human readable form.
      
      This version of the caps serialization function introduces support for nested
      structures and caps but the resulting strings won't be parsable with
      GStreamer prior to 1.20 unless #GST_SERIALIZE_FLAG_BACKWARD_COMPAT is passed
      as flag.
  
      Params:
        flags = a #GstSerializeFlags
      Returns: a newly allocated string representing caps.
  */
  string serialize(gst.types.SerializeFlags flags)
  {
    char* _cretval;
    _cretval = gst_caps_serialize(cast(const(GstCaps)*)this._cPtr, flags);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Sets the features for the structure at index.
  
      Params:
        index = the index of the structure
        features = the #GstCapsFeatures to set
  */
  void setFeatures(uint index, gst.caps_features.CapsFeatures features = null)
  {
    gst_caps_set_features(cast(GstCaps*)this._cPtr, index, features ? cast(GstCapsFeatures*)features._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the features for all the structures of caps.
  
      Params:
        features = the #GstCapsFeatures to set
  */
  void setFeaturesSimple(gst.caps_features.CapsFeatures features = null)
  {
    gst_caps_set_features_simple(cast(GstCaps*)this._cPtr, features ? cast(GstCapsFeatures*)features._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the given field on all structures of caps to the given value.
      This is a convenience function for calling [gst.structure.Structure.setValue] on
      all structures of caps.
  
      Params:
        field = name of the field to set
        value = value to set the field to
  */
  void setValue(string field, gobject.value.Value value)
  {
    const(char)* _field = field.toCString(No.Alloc);
    gst_caps_set_value(cast(GstCaps*)this._cPtr, _field, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Converts the given caps into a representation that represents the
      same set of formats, but in a simpler form.  Component structures that are
      identical are merged.  Component structures that have values that can be
      merged are also merged.
      
      This function takes ownership of caps and will call gst_caps_make_writable()
      on it if necessary, so you must not use caps afterwards unless you keep an
      additional reference to it with gst_caps_ref().
      
      This method does not preserve the original order of caps.
      Returns: The simplified caps.
  */
  gst.caps.Caps simplify()
  {
    GstCaps* _cretval;
    _cretval = gst_caps_simplify(cast(GstCaps*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the structure with the given index from the list of structures
      contained in caps. The caller becomes the owner of the returned structure.
  
      Params:
        index = Index of the structure to retrieve
      Returns: a pointer to the #GstStructure
            corresponding to index.
  */
  gst.structure.Structure stealStructure(uint index)
  {
    GstStructure* _cretval;
    _cretval = gst_caps_steal_structure(cast(GstCaps*)this._cPtr, index);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Subtracts the subtrahend from the minuend.
      > This function does not work reliably if optional properties for caps
      > are included on one caps and omitted on the other.
  
      Params:
        subtrahend = #GstCaps to subtract
      Returns: the resulting caps
  */
  gst.caps.Caps subtract(gst.caps.Caps subtrahend)
  {
    GstCaps* _cretval;
    _cretval = gst_caps_subtract(cast(GstCaps*)this._cPtr, subtrahend ? cast(GstCaps*)subtrahend._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Converts caps to a string representation.  This string representation
      can be converted back to a #GstCaps by [gst.caps.Caps.fromString].
      
      For debugging purposes its easier to do something like this:
      
      ``` C
      GST_LOG ("caps are %" GST_PTR_FORMAT, caps);
      ```
      
      This prints the caps in human readable form.
      
      The implementation of serialization up to 1.20 would lead to unexpected results
      when there were nested #GstCaps / #GstStructure deeper than one level.
      Returns: a newly allocated string representing caps.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gst_caps_to_string(cast(const(GstCaps)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Discards all but the first structure from caps. Useful when
      fixating.
      
      This function takes ownership of caps and will call gst_caps_make_writable()
      on it if necessary, so you must not use caps afterwards unless you keep an
      additional reference to it with gst_caps_ref().
      
      Note that it is not guaranteed that the returned caps have exactly one
      structure. If caps is any or empty caps then the returned caps will be
      the same and contain no structure at all.
      Returns: truncated caps
  */
  gst.caps.Caps truncate()
  {
    GstCaps* _cretval;
    _cretval = gst_caps_truncate(cast(GstCaps*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Converts caps from a string representation.
      
      The implementation of serialization up to 1.20 would lead to unexpected results
      when there were nested #GstCaps / #GstStructure deeper than one level.
  
      Params:
        string_ = a string to convert to #GstCaps
      Returns: a newly allocated #GstCaps
  */
  static gst.caps.Caps fromString(string string_)
  {
    GstCaps* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gst_caps_from_string(_string_);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
