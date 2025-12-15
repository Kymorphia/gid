/// Module for [TocEntry] class
module gst.toc_entry;

import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.tag_list;
import gst.toc;
import gst.types;

/** */
class TocEntry : gobject.boxed.Boxed
{

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
    return cast(void function())gst_toc_entry_get_type != &gidSymbolNotFound ? gst_toc_entry_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TocEntry self()
  {
    return this;
  }

  /**
      Create new #GstTocEntry structure.
  
      Params:
        type = entry type.
        uid = unique ID (UID) in the whole TOC.
      Returns: newly allocated #GstTocEntry structure, free it with gst_toc_entry_unref().
  */
  this(gst.types.TocEntryType type, string uid)
  {
    GstTocEntry* _cretval;
    const(char)* _uid = uid.toCString(No.Alloc);
    _cretval = gst_toc_entry_new(type, _uid);
    this(_cretval, Yes.Take);
  }

  /**
      Appends the #GstTocEntry subentry to entry.
  
      Params:
        subentry = A #GstTocEntry
  */
  void appendSubEntry(gst.toc_entry.TocEntry subentry)
  {
    gst_toc_entry_append_sub_entry(cast(GstTocEntry*)this._cPtr, subentry ? cast(GstTocEntry*)subentry._cPtr(Yes.Dup) : null);
  }

  /** */
  gst.types.TocEntryType getEntryType()
  {
    GstTocEntryType _cretval;
    _cretval = gst_toc_entry_get_entry_type(cast(const(GstTocEntry)*)this._cPtr);
    gst.types.TocEntryType _retval = cast(gst.types.TocEntryType)_cretval;
    return _retval;
  }

  /**
      Get loop_type and repeat_count values from the entry and write them into
      appropriate storages. Loops are e.g. used by sampled instruments. GStreamer
      is not automatically applying the loop. The application can process this
      meta data and use it e.g. to send a seek-event to loop a section.
  
      Params:
        loopType = the storage for the loop_type
                      value, leave null if not need.
        repeatCount = the storage for the repeat_count
                         value, leave null if not need.
      Returns: true if all non-null storage pointers were filled with appropriate
        values, false otherwise.
  */
  bool getLoop(out gst.types.TocLoopType loopType, out int repeatCount)
  {
    bool _retval;
    _retval = cast(bool)gst_toc_entry_get_loop(cast(const(GstTocEntry)*)this._cPtr, &loopType, cast(int*)&repeatCount);
    return _retval;
  }

  /**
      Gets the parent #GstTocEntry of entry.
      Returns: The parent #GstTocEntry of entry
  */
  gst.toc_entry.TocEntry getParent()
  {
    GstTocEntry* _cretval;
    _cretval = gst_toc_entry_get_parent(cast(GstTocEntry*)this._cPtr);
    auto _retval = _cretval ? new gst.toc_entry.TocEntry(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get start and stop values from the entry and write them into appropriate
      storages.
  
      Params:
        start = the storage for the start value, leave
            null if not need.
        stop = the storage for the stop value, leave
            null if not need.
      Returns: true if all non-null storage pointers were filled with appropriate
        values, false otherwise.
  */
  bool getStartStopTimes(out long start, out long stop)
  {
    bool _retval;
    _retval = cast(bool)gst_toc_entry_get_start_stop_times(cast(const(GstTocEntry)*)this._cPtr, cast(long*)&start, cast(long*)&stop);
    return _retval;
  }

  /**
      Gets the sub-entries of entry.
      Returns: A #GList of #GstTocEntry of entry
  */
  gst.toc_entry.TocEntry[] getSubEntries()
  {
    GList* _cretval;
    _cretval = gst_toc_entry_get_sub_entries(cast(const(GstTocEntry)*)this._cPtr);
    auto _retval = gListToD!(gst.toc_entry.TocEntry, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the tags for entry.
      Returns: A #GstTagList for entry
  */
  gst.tag_list.TagList getTags()
  {
    GstTagList* _cretval;
    _cretval = gst_toc_entry_get_tags(cast(const(GstTocEntry)*)this._cPtr);
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the parent #GstToc of entry.
      Returns: The parent #GstToc of entry
  */
  gst.toc.Toc getToc()
  {
    GstToc* _cretval;
    _cretval = gst_toc_entry_get_toc(cast(GstTocEntry*)this._cPtr);
    auto _retval = _cretval ? new gst.toc.Toc(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the UID of entry.
      Returns: The UID of entry
  */
  string getUid()
  {
    const(char)* _cretval;
    _cretval = gst_toc_entry_get_uid(cast(const(GstTocEntry)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  bool isAlternative()
  {
    bool _retval;
    _retval = cast(bool)gst_toc_entry_is_alternative(cast(const(GstTocEntry)*)this._cPtr);
    return _retval;
  }

  /** */
  bool isSequence()
  {
    bool _retval;
    _retval = cast(bool)gst_toc_entry_is_sequence(cast(const(GstTocEntry)*)this._cPtr);
    return _retval;
  }

  /**
      Merge tags into the existing tags of entry using mode.
  
      Params:
        tags = A #GstTagList or null
        mode = A #GstTagMergeMode
  */
  void mergeTags(gst.tag_list.TagList tags, gst.types.TagMergeMode mode)
  {
    gst_toc_entry_merge_tags(cast(GstTocEntry*)this._cPtr, tags ? cast(GstTagList*)tags._cPtr(No.Dup) : null, mode);
  }

  /**
      Set loop_type and repeat_count values for the entry.
  
      Params:
        loopType = loop_type value to set.
        repeatCount = repeat_count value to set.
  */
  void setLoop(gst.types.TocLoopType loopType, int repeatCount)
  {
    gst_toc_entry_set_loop(cast(GstTocEntry*)this._cPtr, loopType, repeatCount);
  }

  /**
      Set start and stop values for the entry.
  
      Params:
        start = start value to set.
        stop = stop value to set.
  */
  void setStartStopTimes(long start, long stop)
  {
    gst_toc_entry_set_start_stop_times(cast(GstTocEntry*)this._cPtr, start, stop);
  }

  /**
      Set a #GstTagList with tags for the complete entry.
  
      Params:
        tags = A #GstTagList or null
  */
  void setTags(gst.tag_list.TagList tags = null)
  {
    gst_toc_entry_set_tags(cast(GstTocEntry*)this._cPtr, tags ? cast(GstTagList*)tags._cPtr(Yes.Dup) : null);
  }
}
