/// Module for [VideoOverlayCompositionMeta] class
module gstvideo.video_overlay_composition_meta;

public import gid.basictypes;
import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_overlay_composition;

/**
    Extra buffer metadata describing image overlay data.
*/
class VideoOverlayCompositionMeta
{
  GstVideoOverlayCompositionMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstVideoOverlayCompositionMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta() nothrow
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoOverlayCompositionMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `overlay` field.
      Returns: the attached #GstVideoOverlayComposition
  */
  @property gstvideo.video_overlay_composition.VideoOverlayComposition overlay() nothrow
  {
    return cToD!(gstvideo.video_overlay_composition.VideoOverlayComposition)(cast(void*)(cast(GstVideoOverlayCompositionMeta*)this._cPtr).overlay);
  }

  /**
      Set `overlay` field.
      Params:
        propval = the attached #GstVideoOverlayComposition
  */
  @property void overlay(gstvideo.video_overlay_composition.VideoOverlayComposition propval) nothrow
  {
    cValueFree!(gstvideo.video_overlay_composition.VideoOverlayComposition)(cast(void*)(cast(GstVideoOverlayCompositionMeta*)this._cPtr).overlay);
    dToC(propval, cast(void*)&(cast(GstVideoOverlayCompositionMeta*)this._cPtr).overlay);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_overlay_composition_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
