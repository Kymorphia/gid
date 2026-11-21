/// Module for [VideoOverlayCompositionMeta] class
module gid.gstvideo1.video_overlay_composition_meta;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_overlay_composition;

/**
    Extra buffer metadata describing image overlay data.
*/
class VideoOverlayCompositionMeta : StructWrap!(GstVideoOverlayCompositionMeta)
{
  /**
      Create a `video_overlay_composition_meta.VideoOverlayCompositionMeta` wrap type.
      Params:
        overlay = the attached #GstVideoOverlayComposition
  */
  this(gid.gstvideo1.video_overlay_composition.VideoOverlayComposition overlay = gid.gstvideo1.video_overlay_composition.VideoOverlayComposition.init) nothrow
  {
    this.overlay = overlay;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gid.gst1.meta.Meta meta() nothrow
  {
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstVideoOverlayCompositionMeta*)this._cPtr).meta, this);
  }

  private gid.gstvideo1.video_overlay_composition.VideoOverlayComposition _overlayRef; // Keeps borrowed field value alive

  /**
      Get `overlay` field.
      Returns: the attached #GstVideoOverlayComposition
  */
  @property gid.gstvideo1.video_overlay_composition.VideoOverlayComposition overlay() nothrow
  {
    return cToD!(gid.gstvideo1.video_overlay_composition.VideoOverlayComposition)(cast(void*)(cast(GstVideoOverlayCompositionMeta*)this._cPtr).overlay);
  }

  /**
      Set `overlay` field.
      Params:
        propval = the attached #GstVideoOverlayComposition
  */
  @property void overlay(gid.gstvideo1.video_overlay_composition.VideoOverlayComposition propval) nothrow
  {
    if (_refuseBorrowedStore("overlay"))
      return;

    _overlayRef = propval;
    (cast(GstVideoOverlayCompositionMeta*)this._cPtr).overlay = propval ? cast(GstVideoOverlayComposition*)propval._cPtr(No.Dup) : null;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_overlay_composition_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
