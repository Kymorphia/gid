/// Module for [Toc] class
module gst.toc;

import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.tag_list;
import gst.toc_entry;
import gst.types;

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
    [gst.toc.Toc.appendEntry], and appending subentries to a #GstTocEntry using
    [gst.toc_entry.TocEntry.appendSubEntry].
    
    Note that root level of the TOC can contain only either editions or chapters. You
    should not mix them together at the same level. Otherwise you will get serialization
    /deserialization errors. Make sure that no one of the entries has negative start and
     stop values.
    
    Use [gst.event.Event.newToc] to create a new TOC #GstEvent, and [gst.event.Event.parseToc] to
    parse received TOC event. Use [gst.event.Event.newTocSelect] to create a new TOC select #GstEvent,
    and [gst.event.Event.parseTocSelect] to parse received TOC select event. The same rule for
    the #GstMessage: [gst.message.Message.newToc] to create new TOC #GstMessage, and
    [gst.message.Message.parseToc] to parse received TOC message.
    
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
class Toc : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_toc_get_type != &gidSymbolNotFound ? gst_toc_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Toc self()
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
  this(gst.types.TocScope scope_)
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
  void appendEntry(gst.toc_entry.TocEntry entry)
  {
    gst_toc_append_entry(cast(GstToc*)this._cPtr, entry ? cast(GstTocEntry*)entry._cPtr(Yes.Dup) : null);
  }

  /** */
  void dump()
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
  gst.toc_entry.TocEntry findEntry(string uid)
  {
    GstTocEntry* _cretval;
    const(char)* _uid = uid.toCString(No.Alloc);
    _cretval = gst_toc_find_entry(cast(const(GstToc)*)this._cPtr, _uid);
    auto _retval = _cretval ? new gst.toc_entry.TocEntry(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the list of #GstTocEntry of toc.
      Returns: A #GList of #GstTocEntry for entry
  */
  gst.toc_entry.TocEntry[] getEntries()
  {
    GList* _cretval;
    _cretval = gst_toc_get_entries(cast(const(GstToc)*)this._cPtr);
    auto _retval = gListToD!(gst.toc_entry.TocEntry, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  gst.types.TocScope getScope()
  {
    GstTocScope _cretval;
    _cretval = gst_toc_get_scope(cast(const(GstToc)*)this._cPtr);
    gst.types.TocScope _retval = cast(gst.types.TocScope)_cretval;
    return _retval;
  }

  /**
      Gets the tags for toc.
      Returns: A #GstTagList for entry
  */
  gst.tag_list.TagList getTags()
  {
    GstTagList* _cretval;
    _cretval = gst_toc_get_tags(cast(const(GstToc)*)this._cPtr);
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Merge tags into the existing tags of toc using mode.
  
      Params:
        tags = A #GstTagList or null
        mode = A #GstTagMergeMode
  */
  void mergeTags(gst.tag_list.TagList tags, gst.types.TagMergeMode mode)
  {
    gst_toc_merge_tags(cast(GstToc*)this._cPtr, tags ? cast(GstTagList*)tags._cPtr(No.Dup) : null, mode);
  }

  /**
      Set a #GstTagList with tags for the complete toc.
  
      Params:
        tags = A #GstTagList or null
  */
  void setTags(gst.tag_list.TagList tags = null)
  {
    gst_toc_set_tags(cast(GstToc*)this._cPtr, tags ? cast(GstTagList*)tags._cPtr(Yes.Dup) : null);
  }
}
