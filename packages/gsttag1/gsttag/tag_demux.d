/// Module for [TagDemux] class
module gsttag.tag_demux;

import gid.gid;
import gobject.gid_builder;
import gst.element;
import gsttag.c.functions;
import gsttag.c.types;
import gsttag.types;

/**
    Provides a base class for demuxing tags at the beginning or end of a
    stream and handles things like typefinding, querying, seeking, and
    different modes of operation (chain-based, pull_range-based, and providing
    downstream elements with random access if upstream supports that). The tag
    is stripped from the output, and all offsets are adjusted for the tag
    sizes, so that to the downstream element the stream will appear as if
    there was no tag at all. Also, once the tag has been parsed, GstTagDemux
    will try to determine the media type of the resulting stream and add a
    source pad with the appropriate caps in order to facilitate auto-plugging.
    
    ## Deriving from GstTagDemux
    
    Subclasses have to do four things:
    
     $(LIST
        * In their base init function, they must add a pad template for the sink
          pad to the element class, describing the media type they can parse in
          the caps of the pad template.
        * In their class init function, they must override
          GST_TAG_DEMUX_CLASS(demux_klass)->identify_tag with their own identify
          function.
        * In their class init function, they must override
     )
     GST_TAG_DEMUX_CLASS(demux_klass)->parse_tag with their own parse
     function.
     $(LIST
        * In their class init function, they must also set
          GST_TAG_DEMUX_CLASS(demux_klass)->min_start_size and/or
     )
     GST_TAG_DEMUX_CLASS(demux_klass)->min_end_size to the minimum size required
     for the identify function to decide whether the stream has a supported tag
     or not. A class parsing ID3v1 tags, for example, would set min_end_size to
     128 bytes.
*/
class TagDemux : gst.element.Element
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
    return cast(void function())gst_tag_demux_get_type != &gidSymbolNotFound ? gst_tag_demux_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TagDemux self()
  {
    return this;
  }

  /**
  Get builder for [gsttag.tag_demux.TagDemux]
  Returns: New builder object
  */
  static TagDemuxGidBuilder builder()
  {
    return new TagDemuxGidBuilder;
  }
}

class TagDemuxGidBuilderImpl(T) : gst.element.ElementGidBuilderImpl!T
{
}

/// Fluent builder for [gsttag.tag_demux.TagDemux]
final class TagDemuxGidBuilder : TagDemuxGidBuilderImpl!TagDemuxGidBuilder
{
  TagDemux build()
  {
    return new TagDemux(cast(void*)createGObject(TagDemux._getGType), No.Take);
  }
}
