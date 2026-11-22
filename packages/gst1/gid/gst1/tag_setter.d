/// Module for [TagSetter] interface
module gid.gst1.tag_setter;

public import gid.core.basictypes;
public import gid.gst1.tag_setter_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.value;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.tag_list;
import gid.gst1.types;

/**
    Element interface that allows setting of media metadata.
    
    Elements that support changing a stream's metadata will implement this
    interface. Examples of such elements are 'vorbisenc', 'theoraenc' and
    'id3v2mux'.
    
    If you just want to retrieve metadata in your application then all you
    need to do is watch for tag messages on your pipeline's bus. This
    interface is only for setting metadata, not for extracting it. To set tags
    from the application, find tagsetter elements and set tags using e.g.
    [gid.gst1.tag_setter.TagSetter.mergeTags] or [gid.gst1.tag_setter.TagSetter.addTags]. Also consider
    setting the #GstTagMergeMode that is used for tag events that arrive at the
    tagsetter element (default mode is to keep existing tags).
    The application should do that before the element goes to [gid.gst1.types.State.Paused].
    
    Elements implementing the #GstTagSetter interface often have to merge
    any tags received from upstream and the tags set by the application via
    the interface. This can be done like this:
    
    ```c
    GstTagMergeMode merge_mode;
    const GstTagList *application_tags;
    const GstTagList *event_tags;
    GstTagSetter *tagsetter;
    GstTagList *result;
    
    tagsetter = GST_TAG_SETTER (element);
    
    merge_mode = gst_tag_setter_get_tag_merge_mode (tagsetter);
    application_tags = gst_tag_setter_get_tag_list (tagsetter);
    event_tags = (const GstTagList *) element->event_tags;
    
    GST_LOG_OBJECT (tagsetter, "merging tags, merge mode = %d", merge_mode);
    GST_LOG_OBJECT (tagsetter, "event tags: %" GST_PTR_FORMAT, event_tags);
    GST_LOG_OBJECT (tagsetter, "set   tags: %" GST_PTR_FORMAT, application_tags);
    
    result = gst_tag_list_merge (application_tags, event_tags, merge_mode);
    
    GST_LOG_OBJECT (tagsetter, "final tags: %" GST_PTR_FORMAT, result);
    ```
*/
interface TagSetter : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_tag_setter_get_type != &gidSymbolNotFound ? gst_tag_setter_get_type() : cast(GType)0;
  }

  /**
      Adds the given tag / GValue pair on the setter using the given merge mode.
  
      Params:
        mode = the mode to use
        tag = tag to set
        value = GValue to set for the tag
  */
  void addTagValue(gid.gst1.types.TagMergeMode mode, string tag, gid.gobject2.value.Value value);

  /**
      Returns the current list of tags the setter uses.  The list should not be
      modified or freed.
      
      This function is not thread-safe.
      Returns: a current snapshot of the
                 taglist used in the setter or null if none is used.
  */
  gid.gst1.tag_list.TagList getTagList();

  /**
      Queries the mode by which tags inside the setter are overwritten by tags
      from events
      Returns: the merge mode used inside the element.
  */
  gid.gst1.types.TagMergeMode getTagMergeMode();

  /**
      Merges the given list into the setter's list using the given mode.
  
      Params:
        list = a tag list to merge from
        mode = the mode to merge with
  */
  void mergeTags(gid.gst1.tag_list.TagList list, gid.gst1.types.TagMergeMode mode);

  /**
      Reset the internal taglist. Elements should call this from within the
      state-change handler.
  */
  void resetTags();

  /**
      Sets the given merge mode that is used for adding tags from events to tags
      specified by this interface. The default is #GST_TAG_MERGE_KEEP, which keeps
      the tags set with this interface and discards tags from events.
  
      Params:
        mode = The mode with which tags are added
  */
  void setTagMergeMode(gid.gst1.types.TagMergeMode mode);
}

/// Fluent builder implementation template for [gid.gst1.tag_setter.TagSetter]
interface TagSetterGidBuilderImpl(T)
{
}
