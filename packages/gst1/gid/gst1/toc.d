/// Module for [Toc] class
module gid.gst1.toc;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.tag_list;
import gid.gst1.toc_entry;
import gid.gst1.types;

/**
    #GstToc functions are used to create/free #GstToc and #GstTocEntry structures.
    Also they are used to convert #GstToc into #GstStructure and vice versa.
    
    #GstToc lets you to inform other elements in pipeline or application that playing
    source has some kind of table of contents (TOC). These may be chapters, editions,
    angles or other types. For example: DVD chapters, Matroska chapters or cue sheet
    TOC. Such TOC will be useful for applications to display instead of just a
    playlist.
    
    Using TOC is very easy. Firstly, create #GstToc structure which represents root
    contents of the source. You can also attach TOC-specific tags to it. Then fill
    it with #GstTocEntry entries by appending them to the #GstToc using
    [gid.gst1.toc.Toc.appendEntry], and appending subentries to a #GstTocEntry using
    [gid.gst1.toc_entry.TocEntry.appendSubEntry].
    
    Note that root level of the TOC can contain only either editions or chapters. You
    should not mix them together at the same level. Otherwise you will get serialization
    /deserialization errors. Make sure that no one of the entries has negative start and
     stop values.
    
    Use [gid.gst1.event.Event.newToc] to create a new TOC #GstEvent, and [gid.gst1.event.Event.parseToc] to
    parse received TOC event. Use [gid.gst1.event.Event.newTocSelect] to create a new TOC select #GstEvent,
    and [gid.gst1.event.Event.parseTocSelect] to parse received TOC select event. The same rule for
    the #GstMessage: [gid.gst1.message.Message.newToc] to create new TOC #GstMessage, and
    [gid.gst1.message.Message.parseToc] to parse received TOC message.
    
    TOCs can have global scope or current scope. Global scope TOCs contain
    all entries that can possibly be selected using a toc select event, and
    are what an application is usually interested in. TOCs with current scope
    only contain the parts of the TOC relevant to the currently selected/playing
    stream; the current scope TOC is used by downstream elements such as muxers
    to write correct TOC entries when transcoding files, for example. When
    playing a DVD, the global TOC would contain a hierarchy of all titles,
    chapters and angles, for example, while the current TOC would only contain
    the chapters for the currently playing title if playback of a specific
    title was requested.
    
    Applications and plugins should not rely on TOCs having a certain kind of
    structure, but should allow for different alternatives. For example, a
    simple CUE sheet embedded in a file may be presented as a flat list of
    track entries, or could have a top-level edition node (or some other
    alternative type entry) with track entries underneath that node; or even
    multiple top-level edition nodes (or some other alternative type entries)
    each with track entries underneath, in case the source file has extracted
    a track listing from different sources).
*/
@gidGir("Toc")
class Toc : gid.gobject2.boxed.BoxedWrap!(gst_toc_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Toc self() nothrow
  {
    return this;
  }

  /**
      Create a new #GstToc structure.
  
      Params:
        scope_ = scope of this TOC
      Returns: newly allocated #GstToc structure, free it
            with gst_toc_unref().
  */
  this(gid.gst1.types.TocScope scope_) nothrow
  {
    GstToc* _cretval;
    _cretval = gst_toc_new(scope_);
    this(_cretval, Yes.Take);
  }

  /**
      Appends the #GstTocEntry entry to toc.
  
      Params:
        entry = A #GstTocEntry
  */
  void appendEntry(gid.gst1.toc_entry.TocEntry entry) nothrow
  {
    gst_toc_append_entry(cast(GstToc*)this._cPtr, entry ? cast(GstTocEntry*)entry._cPtr(Yes.Dup) : null);
  }

  /** */
  void dump() nothrow
  {
    gst_toc_dump(cast(GstToc*)this._cPtr);
  }

  /**
      Find #GstTocEntry with given uid in the toc.
  
      Params:
        uid = UID to find #GstTocEntry with.
      Returns: #GstTocEntry with specified
        uid from the toc, or null if not found.
  */
  gid.gst1.toc_entry.TocEntry findEntry(string uid) nothrow
  {
    GstTocEntry* _cretval;
    const(char)* _uid = uid.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_toc_find_entry(cast(const(GstToc)*)this._cPtr, _uid);
    auto _retval = _cretval ? new gid.gst1.toc_entry.TocEntry(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the list of #GstTocEntry of toc.
      Returns: A #GList of #GstTocEntry for entry
  */
  gid.gst1.toc_entry.TocEntry[] getEntries() nothrow
  {
    GList* _cretval;
    _cretval = gst_toc_get_entries(cast(const(GstToc)*)this._cPtr);
    auto _retval = gListToD!(gid.gst1.toc_entry.TocEntry, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  gid.gst1.types.TocScope getScope() nothrow
  {
    GstTocScope _cretval;
    _cretval = gst_toc_get_scope(cast(const(GstToc)*)this._cPtr);
    gid.gst1.types.TocScope _retval = cast(gid.gst1.types.TocScope)_cretval;
    return _retval;
  }

  /**
      Gets the tags for toc.
      Returns: A #GstTagList for entry
  */
  gid.gst1.tag_list.TagList getTags() nothrow
  {
    GstTagList* _cretval;
    _cretval = gst_toc_get_tags(cast(const(GstToc)*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.tag_list.TagList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Merge tags into the existing tags of toc using mode.
  
      Params:
        tags = A #GstTagList or null
        mode = A #GstTagMergeMode
  */
  void mergeTags(gid.gst1.tag_list.TagList tags, gid.gst1.types.TagMergeMode mode) nothrow
  {
    gst_toc_merge_tags(cast(GstToc*)this._cPtr, tags ? cast(GstTagList*)tags._cPtr(No.Dup) : null, mode);
  }

  /**
      Set a #GstTagList with tags for the complete toc.
  
      Params:
        tags = A #GstTagList or null
  */
  void setTags(gid.gst1.tag_list.TagList tags = null) nothrow
  {
    gst_toc_set_tags(cast(GstToc*)this._cPtr, tags ? cast(GstTagList*)tags._cPtr(Yes.Dup) : null);
  }
}
