/// Module for [TagList] class
module gst.tag_list;

import gid.gid;
import glib.date;
import gobject.boxed;
import gobject.value;
import gst.c.functions;
import gst.c.types;
import gst.date_time;
import gst.mini_object;
import gst.sample;
import gst.types;

/**
    List of tags and values used to describe media metadata.
    
    Strings in structures must be ASCII or UTF-8 encoded. Other encodings are
    not allowed. Strings must not be empty or null.
*/
class TagList : gobject.boxed.Boxed
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
    return cast(void function())gst_tag_list_get_type != &gidSymbolNotFound ? gst_tag_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TagList self()
  {
    return this;
  }

  /**
      Get `miniObject` field.
      Returns: the parent type
  */
  @property gst.mini_object.MiniObject miniObject()
  {
    return cToD!(gst.mini_object.MiniObject)(cast(void*)&(cast(GstTagList*)this._cPtr).miniObject);
  }

  /**
      Creates a new empty GstTagList.
      
      Free-function: gst_tag_list_unref
      Returns: An empty tag list
  */
  static gst.tag_list.TagList newEmpty()
  {
    GstTagList* _cretval;
    _cretval = gst_tag_list_new_empty();
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Deserializes a tag list.
  
      Params:
        str = a string created with [gst.tag_list.TagList.toString_]
      Returns: a new #GstTagList, or null in case of an
        error.
  */
  static gst.tag_list.TagList newFromString(string str)
  {
    GstTagList* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gst_tag_list_new_from_string(_str);
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets the GValue for a given tag using the specified mode.
  
      Params:
        mode = the mode to use
        tag = tag
        value = GValue for this tag
  */
  void addValue(gst.types.TagMergeMode mode, string tag, gobject.value.Value value)
  {
    const(char)* _tag = tag.toCString(No.Alloc);
    gst_tag_list_add_value(cast(GstTagList*)this._cPtr, mode, _tag, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Creates a new #GstTagList as a copy of the old taglist. The new taglist
      will have a refcount of 1, owned by the caller, and will be writable as
      a result.
      
      Note that this function is the semantic equivalent of a gst_tag_list_ref()
      followed by a gst_tag_list_make_writable(). If you only want to hold on to a
      reference to the data, you should use gst_tag_list_ref().
      
      When you are finished with the taglist, call gst_tag_list_unref() on it.
      Returns: the new #GstTagList
  */
  gst.tag_list.TagList copy()
  {
    GstTagList* _cretval;
    _cretval = gst_tag_list_copy(cast(const(GstTagList)*)this._cPtr);
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Calls the given function for each tag inside the tag list. Note that if there
      is no tag, the function won't be called at all.
  
      Params:
        func = function to be called for each tag
  */
  void foreach_(gst.types.TagForeachFunc func)
  {
    extern(C) void _funcCallback(const(GstTagList)* list, const(char)* tag, void* userData)
    {
      auto _dlg = cast(gst.types.TagForeachFunc*)userData;
      string _tag = tag.fromCString(No.Free);

      (*_dlg)(list ? new gst.tag_list.TagList(cast(void*)list, No.Take) : null, _tag);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gst_tag_list_foreach(cast(const(GstTagList)*)this._cPtr, _funcCB, _func);
  }

  /**
      Copies the contents for the given tag into the value, merging multiple values
      into one if multiple values are associated with the tag.
  
      Params:
        tag = tag to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getBoolean(string tag, out bool value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    gboolean _value;
    _retval = cast(bool)gst_tag_list_get_boolean(cast(const(GstTagList)*)this._cPtr, _tag, &_value);
    value = cast(bool)_value;
    return _retval;
  }

  /**
      Gets the value that is at the given index for the given tag in the given
      list.
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getBooleanIndex(string tag, uint index, out bool value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    gboolean _value;
    _retval = cast(bool)gst_tag_list_get_boolean_index(cast(const(GstTagList)*)this._cPtr, _tag, index, &_value);
    value = cast(bool)_value;
    return _retval;
  }

  /**
      Copies the first date for the given tag in the taglist into the variable
      pointed to by value. Free the date with [glib.date.Date.free] when it is no longer
      needed.
      
      Free-function: g_date_free
  
      Params:
        tag = tag to read out
        value = address of a GDate pointer
              variable to store the result into
      Returns: true, if a date was copied, false if the tag didn't exist in the
                     given list or if it was null.
  */
  bool getDate(string tag, out glib.date.Date value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    GDate* _value;
    _retval = cast(bool)gst_tag_list_get_date(cast(const(GstTagList)*)this._cPtr, _tag, &_value);
    value = *cast(Date*)_value;
    return _retval;
  }

  /**
      Gets the date that is at the given index for the given tag in the given
      list and copies it into the variable pointed to by value. Free the date
      with [glib.date.Date.free] when it is no longer needed.
      
      Free-function: g_date_free
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list or if it was null.
  */
  bool getDateIndex(string tag, uint index, out glib.date.Date value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    GDate* _value;
    _retval = cast(bool)gst_tag_list_get_date_index(cast(const(GstTagList)*)this._cPtr, _tag, index, &_value);
    value = *cast(Date*)_value;
    return _retval;
  }

  /**
      Copies the first datetime for the given tag in the taglist into the variable
      pointed to by value. Unref the date with [gst.date_time.DateTime.unref] when
      it is no longer needed.
      
      Free-function: gst_date_time_unref
  
      Params:
        tag = tag to read out
        value = address of a #GstDateTime
              pointer variable to store the result into
      Returns: true, if a datetime was copied, false if the tag didn't exist in
                     the given list or if it was null.
  */
  bool getDateTime(string tag, out gst.date_time.DateTime value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    GstDateTime* _value;
    _retval = cast(bool)gst_tag_list_get_date_time(cast(const(GstTagList)*)this._cPtr, _tag, &_value);
    value = new gst.date_time.DateTime(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /**
      Gets the datetime that is at the given index for the given tag in the given
      list and copies it into the variable pointed to by value. Unref the datetime
      with [gst.date_time.DateTime.unref] when it is no longer needed.
      
      Free-function: gst_date_time_unref
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list or if it was null.
  */
  bool getDateTimeIndex(string tag, uint index, out gst.date_time.DateTime value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    GstDateTime* _value;
    _retval = cast(bool)gst_tag_list_get_date_time_index(cast(const(GstTagList)*)this._cPtr, _tag, index, &_value);
    value = new gst.date_time.DateTime(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /**
      Copies the contents for the given tag into the value, merging multiple values
      into one if multiple values are associated with the tag.
  
      Params:
        tag = tag to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getDouble(string tag, out double value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_double(cast(const(GstTagList)*)this._cPtr, _tag, cast(double*)&value);
    return _retval;
  }

  /**
      Gets the value that is at the given index for the given tag in the given
      list.
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getDoubleIndex(string tag, uint index, out double value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_double_index(cast(const(GstTagList)*)this._cPtr, _tag, index, cast(double*)&value);
    return _retval;
  }

  /**
      Copies the contents for the given tag into the value, merging multiple values
      into one if multiple values are associated with the tag.
  
      Params:
        tag = tag to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getFloat(string tag, out float value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_float(cast(const(GstTagList)*)this._cPtr, _tag, cast(float*)&value);
    return _retval;
  }

  /**
      Gets the value that is at the given index for the given tag in the given
      list.
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getFloatIndex(string tag, uint index, out float value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_float_index(cast(const(GstTagList)*)this._cPtr, _tag, index, cast(float*)&value);
    return _retval;
  }

  /**
      Copies the contents for the given tag into the value, merging multiple values
      into one if multiple values are associated with the tag.
  
      Params:
        tag = tag to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getInt(string tag, out int value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_int(cast(const(GstTagList)*)this._cPtr, _tag, cast(int*)&value);
    return _retval;
  }

  /**
      Copies the contents for the given tag into the value, merging multiple values
      into one if multiple values are associated with the tag.
  
      Params:
        tag = tag to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getInt64(string tag, out long value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_int64(cast(const(GstTagList)*)this._cPtr, _tag, cast(long*)&value);
    return _retval;
  }

  /**
      Gets the value that is at the given index for the given tag in the given
      list.
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getInt64Index(string tag, uint index, out long value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_int64_index(cast(const(GstTagList)*)this._cPtr, _tag, index, cast(long*)&value);
    return _retval;
  }

  /**
      Gets the value that is at the given index for the given tag in the given
      list.
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getIntIndex(string tag, uint index, out int value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_int_index(cast(const(GstTagList)*)this._cPtr, _tag, index, cast(int*)&value);
    return _retval;
  }

  /**
      Copies the contents for the given tag into the value, merging multiple values
      into one if multiple values are associated with the tag.
  
      Params:
        tag = tag to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getPointer(string tag, out void* value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_pointer(cast(const(GstTagList)*)this._cPtr, _tag, cast(void**)&value);
    return _retval;
  }

  /**
      Gets the value that is at the given index for the given tag in the given
      list.
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getPointerIndex(string tag, uint index, out void* value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_pointer_index(cast(const(GstTagList)*)this._cPtr, _tag, index, cast(void**)&value);
    return _retval;
  }

  /**
      Copies the first sample for the given tag in the taglist into the variable
      pointed to by sample. Free the sample with gst_sample_unref() when it is
      no longer needed. You can retrieve the buffer from the sample using
      [gst.sample.Sample.getBuffer] and the associated caps (if any) with
      [gst.sample.Sample.getCaps].
      
      Free-function: gst_sample_unref
  
      Params:
        tag = tag to read out
        sample = address of a GstSample
              pointer variable to store the result into
      Returns: true, if a sample was returned, false if the tag didn't exist in
                     the given list or if it was null.
  */
  bool getSample(string tag, out gst.sample.Sample sample)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    GstSample* _sample;
    _retval = cast(bool)gst_tag_list_get_sample(cast(const(GstTagList)*)this._cPtr, _tag, &_sample);
    sample = new gst.sample.Sample(cast(void*)_sample, Yes.Take);
    return _retval;
  }

  /**
      Gets the sample that is at the given index for the given tag in the given
      list and copies it into the variable pointed to by sample. Free the sample
      with gst_sample_unref() when it is no longer needed. You can retrieve the
      buffer from the sample using [gst.sample.Sample.getBuffer] and the associated
      caps (if any) with [gst.sample.Sample.getCaps].
      
      Free-function: gst_sample_unref
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        sample = address of a GstSample
              pointer variable to store the result into
      Returns: true, if a sample was copied, false if the tag didn't exist in the
                     given list or if it was null.
  */
  bool getSampleIndex(string tag, uint index, out gst.sample.Sample sample)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    GstSample* _sample;
    _retval = cast(bool)gst_tag_list_get_sample_index(cast(const(GstTagList)*)this._cPtr, _tag, index, &_sample);
    sample = new gst.sample.Sample(cast(void*)_sample, Yes.Take);
    return _retval;
  }

  /**
      Gets the scope of list.
      Returns: The scope of list
  */
  gst.types.TagScope getScope()
  {
    GstTagScope _cretval;
    _cretval = gst_tag_list_get_scope(cast(const(GstTagList)*)this._cPtr);
    gst.types.TagScope _retval = cast(gst.types.TagScope)_cretval;
    return _retval;
  }

  /**
      Copies the contents for the given tag into the value, possibly merging
      multiple values into one if multiple values are associated with the tag.
      
      Use gst_tag_list_get_string_index (list, tag, 0, value) if you want
      to retrieve the first string associated with this tag unmodified.
      
      The resulting string in value will be in UTF-8 encoding and should be
      freed by the caller using g_free when no longer needed. The
      returned string is also guaranteed to be non-null and non-empty.
      
      Free-function: g_free
  
      Params:
        tag = tag to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getString(string tag, out string value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    char* _value;
    _retval = cast(bool)gst_tag_list_get_string(cast(const(GstTagList)*)this._cPtr, _tag, &_value);
    value = _value.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the value that is at the given index for the given tag in the given
      list.
      
      The resulting string in value will be in UTF-8 encoding and should be
      freed by the caller using g_free when no longer needed. The
      returned string is also guaranteed to be non-null and non-empty.
      
      Free-function: g_free
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getStringIndex(string tag, uint index, out string value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    char* _value;
    _retval = cast(bool)gst_tag_list_get_string_index(cast(const(GstTagList)*)this._cPtr, _tag, index, &_value);
    value = _value.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Checks how many value are stored in this tag list for the given tag.
  
      Params:
        tag = the tag to query
      Returns: The number of tags stored
  */
  uint getTagSize(string tag)
  {
    uint _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = gst_tag_list_get_tag_size(cast(const(GstTagList)*)this._cPtr, _tag);
    return _retval;
  }

  /**
      Copies the contents for the given tag into the value, merging multiple values
      into one if multiple values are associated with the tag.
  
      Params:
        tag = tag to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getUint(string tag, out uint value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_uint(cast(const(GstTagList)*)this._cPtr, _tag, cast(uint*)&value);
    return _retval;
  }

  /**
      Copies the contents for the given tag into the value, merging multiple values
      into one if multiple values are associated with the tag.
  
      Params:
        tag = tag to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getUint64(string tag, out ulong value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_uint64(cast(const(GstTagList)*)this._cPtr, _tag, cast(ulong*)&value);
    return _retval;
  }

  /**
      Gets the value that is at the given index for the given tag in the given
      list.
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getUint64Index(string tag, uint index, out ulong value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_uint64_index(cast(const(GstTagList)*)this._cPtr, _tag, index, cast(ulong*)&value);
    return _retval;
  }

  /**
      Gets the value that is at the given index for the given tag in the given
      list.
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was copied, false if the tag didn't exist in the
                     given list.
  */
  bool getUintIndex(string tag, uint index, out uint value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_get_uint_index(cast(const(GstTagList)*)this._cPtr, _tag, index, cast(uint*)&value);
    return _retval;
  }

  /**
      Gets the value that is at the given index for the given tag in the given
      list.
  
      Params:
        tag = tag to read out
        index = number of entry to read out
      Returns: The GValue for the specified
                 entry or null if the tag wasn't available or the tag
                 doesn't have as many entries
  */
  gobject.value.Value getValueIndex(string tag, uint index)
  {
    const(GValue)* _cretval;
    const(char)* _tag = tag.toCString(No.Alloc);
    _cretval = gst_tag_list_get_value_index(cast(const(GstTagList)*)this._cPtr, _tag, index);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Inserts the tags of the from list into the first list using the given mode.
  
      Params:
        from = list to merge from
        mode = the mode to use
  */
  void insert(gst.tag_list.TagList from, gst.types.TagMergeMode mode)
  {
    gst_tag_list_insert(cast(GstTagList*)this._cPtr, from ? cast(const(GstTagList)*)from._cPtr(No.Dup) : null, mode);
  }

  /**
      Checks if the given taglist is empty.
      Returns: true if the taglist is empty, otherwise false.
  */
  bool isEmpty()
  {
    bool _retval;
    _retval = cast(bool)gst_tag_list_is_empty(cast(const(GstTagList)*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the two given taglists are equal.
  
      Params:
        list2 = a #GstTagList.
      Returns: true if the taglists are equal, otherwise false
  */
  bool isEqual(gst.tag_list.TagList list2)
  {
    bool _retval;
    _retval = cast(bool)gst_tag_list_is_equal(cast(const(GstTagList)*)this._cPtr, list2 ? cast(const(GstTagList)*)list2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Merges the two given lists into a new list. If one of the lists is null, a
      copy of the other is returned. If both lists are null, null is returned.
      
      Free-function: gst_tag_list_unref
  
      Params:
        list2 = second list to merge
        mode = the mode to use
      Returns: the new list
  */
  gst.tag_list.TagList merge(gst.tag_list.TagList list2, gst.types.TagMergeMode mode)
  {
    GstTagList* _cretval;
    _cretval = gst_tag_list_merge(cast(const(GstTagList)*)this._cPtr, list2 ? cast(const(GstTagList)*)list2._cPtr(No.Dup) : null, mode);
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the number of tags in list.
      Returns: The number of tags in list.
  */
  int nTags()
  {
    int _retval;
    _retval = gst_tag_list_n_tags(cast(const(GstTagList)*)this._cPtr);
    return _retval;
  }

  /**
      Get the name of the tag in list at index.
  
      Params:
        index = the index
      Returns: The name of the tag at index.
  */
  string nthTagName(uint index)
  {
    const(char)* _cretval;
    _cretval = gst_tag_list_nth_tag_name(cast(const(GstTagList)*)this._cPtr, index);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Peeks at the value that is at the given index for the given tag in the given
      list.
      
      The resulting string in value will be in UTF-8 encoding and doesn't need
      to be freed by the caller. The returned string is also guaranteed to
      be non-null and non-empty.
  
      Params:
        tag = tag to read out
        index = number of entry to read out
        value = location for the result
      Returns: true, if a value was set, false if the tag didn't exist in the
                     given list.
  */
  bool peekStringIndex(string tag, uint index, out string value)
  {
    bool _retval;
    const(char)* _tag = tag.toCString(No.Alloc);
    char* _value;
    _retval = cast(bool)gst_tag_list_peek_string_index(cast(const(GstTagList)*)this._cPtr, _tag, index, &_value);
    value = _value.fromCString(No.Free);
    return _retval;
  }

  /**
      Removes the given tag from the taglist.
  
      Params:
        tag = tag to remove
  */
  void removeTag(string tag)
  {
    const(char)* _tag = tag.toCString(No.Alloc);
    gst_tag_list_remove_tag(cast(GstTagList*)this._cPtr, _tag);
  }

  /**
      Sets the scope of list to scope. By default the scope
      of a taglist is stream scope.
  
      Params:
        scope_ = new scope for list
  */
  void setScope(gst.types.TagScope scope_)
  {
    gst_tag_list_set_scope(cast(GstTagList*)this._cPtr, scope_);
  }

  /**
      Serializes a tag list to a string.
      Returns: a newly-allocated string.
            The string must be freed with [glib.global.gfree] when no longer
            needed.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gst_tag_list_to_string(cast(const(GstTagList)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Copies the contents for the given tag into the value,
      merging multiple values into one if multiple values are associated
      with the tag.
      You must [gobject.value.Value.unset] the value after use.
  
      Params:
        dest = uninitialized #GValue to copy into
        list = list to get the tag from
        tag = tag to read out
      Returns: true, if a value was copied, false if the tag didn't exist in the
                 given list.
  */
  static bool copyValue(out gobject.value.Value dest, gst.tag_list.TagList list, string tag)
  {
    bool _retval;
    GValue _dest;
    const(char)* _tag = tag.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_list_copy_value(&_dest, list ? cast(const(GstTagList)*)list._cPtr(No.Dup) : null, _tag);
    dest = new gobject.value.Value(cast(void*)&_dest, No.Take);
    return _retval;
  }
}
