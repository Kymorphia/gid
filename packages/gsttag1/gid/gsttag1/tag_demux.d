/// Module for [TagDemux] class
module gid.gsttag1.tag_demux;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.element;
import gid.gst1.tag_list;
import gid.gsttag1.c.functions;
import gid.gsttag1.c.types;
import gid.gsttag1.types;

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
    
     * In their base init function, they must add a pad template for the sink
       pad to the element class, describing the media type they can parse in
       the caps of the pad template.
     * In their class init function, they must override
       GST_TAG_DEMUX_CLASS(demux_klass)->identify_tag with their own identify
       function.
     * In their class init function, they must override
     GST_TAG_DEMUX_CLASS(demux_klass)->parse_tag with their own parse
     function.
     * In their class init function, they must also set
       GST_TAG_DEMUX_CLASS(demux_klass)->min_start_size and/or
     GST_TAG_DEMUX_CLASS(demux_klass)->min_end_size to the minimum size required
     for the identify function to decide whether the stream has a supported tag
     or not. A class parsing ID3v1 tags, for example, would set min_end_size to
     128 bytes.
*/
@gidGir("TagDemux", "TagDemuxClass")
class TagDemux : gid.gst1.element.Element
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_tag_demux_get_type != &gidSymbolNotFound ? gst_tag_demux_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstTagDemux";
  }

  /** Returns `this`, for use in `with` statements. */
  override TagDemux self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gsttag1.tag_demux.TagDemux]
      Returns: New builder object
  */
  static TagDemuxGidBuilder builder() nothrow
  {
    return new TagDemuxGidBuilder;
  }

  /**
      merge start and end tags. Subclasses may want to override this
      vfunc to allow prioritising of start or end tag according to user
      preference.  Note that both start_tags and end_tags may be NULL. By default
      start tags are preferred over end tags.
  
      Params:
        startTags = 
        endTags = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMergeTags` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.tag_list.TagList vfuncMergeTags(gid.gst1.tag_list.TagList startTags, gid.gst1.tag_list.TagList endTags)
  {
    auto _klass = cast(GstTagDemuxClass*)_vfuncClass;
    if (!_klass.mergeTags)
      return typeof(return).init;

    GstTagList* _cretval;
    _cretval = _klass.mergeTags(cast(GstTagDemux*)this._cPtr, startTags ? cast(const(GstTagList)*)startTags._cPtr(No.Dup) : null, endTags ? cast(const(GstTagList)*)endTags._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from TagDemux
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gsttag1.tag_demux.TagDemux), T.stringof ~ " is not derived from gid.gsttag1.tag_demux.TagDemux");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMergeTags", true)[0]) == gid.gsttag1.tag_demux.TagDemux))
      _installVfunc(klass, "merge_tags");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstTagDemuxClass*)klass;

    switch (vfunc)
    {
      case "merge_tags":
      {
        static extern(C) GstTagList* _vfuncMergeTagsTramp(GstTagDemux* demux, const(GstTagList)* startTags, const(GstTagList)* endTags) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gsttag1.tag_demux.TagDemux)(cast(void*)demux);
          if (!_obj)
          {
            auto _klass = cast(GstTagDemuxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)demux);
            if (_klass.mergeTags)
              return (cast(typeof(&_vfuncMergeTagsTramp))_klass.mergeTags)(demux, startTags, endTags);
            return typeof(return).init;
          }

          gid.gst1.tag_list.TagList _dretval;

          try
          {
            _dretval = _obj.vfuncMergeTags(startTags ? new gid.gst1.tag_list.TagList(cast(void*)startTags, No.Take) : null, endTags ? new gid.gst1.tag_list.TagList(cast(void*)endTags, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gsttag1.tag_demux.TagDemux.vfuncMergeTags");
          }
          auto _retval = _dretval ? cast(GstTagList*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.mergeTags = cast(typeof(_klass.mergeTags))&_vfuncMergeTagsTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gsttag1.tag_demux.TagDemux]
class TagDemuxGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gsttag1.tag_demux.TagDemux]
final class TagDemuxGidBuilder : TagDemuxGidBuilderImpl!TagDemuxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TagDemux build() nothrow
  {
    return new TagDemux(cast(void*)createGObject(TagDemux._getGType), Yes.Take);
  }
}
