/// Module for [VideoInfoDmaDrm] class
module gstvideo.video_info_dma_drm;

import gid.gid;
import gobject.boxed;
import gst.caps;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_info;

/**
    Information describing a DMABuf image properties. It wraps #GstVideoInfo and
    adds DRM information such as drm-fourcc and drm-modifier, required for
    negotiation and mapping.
*/
class VideoInfoDmaDrm : gobject.boxed.Boxed
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
    return cast(void function())gst_video_info_dma_drm_get_type != &gidSymbolNotFound ? gst_video_info_dma_drm_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoInfoDmaDrm self()
  {
    return this;
  }

  /**
      Get `vinfo` field.
      Returns: the associated #GstVideoInfo
  */
  @property gstvideo.video_info.VideoInfo vinfo()
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)&(cast(GstVideoInfoDmaDrm*)this._cPtr).vinfo);
  }

  /**
      Get `drmFourcc` field.
      Returns: the fourcc defined by drm
  */
  @property uint drmFourcc()
  {
    return (cast(GstVideoInfoDmaDrm*)this._cPtr).drmFourcc;
  }

  /**
      Set `drmFourcc` field.
      Params:
        propval = the fourcc defined by drm
  */
  @property void drmFourcc(uint propval)
  {
    (cast(GstVideoInfoDmaDrm*)this._cPtr).drmFourcc = propval;
  }

  /**
      Get `drmModifier` field.
      Returns: the drm modifier
  */
  @property ulong drmModifier()
  {
    return (cast(GstVideoInfoDmaDrm*)this._cPtr).drmModifier;
  }

  /**
      Set `drmModifier` field.
      Params:
        propval = the drm modifier
  */
  @property void drmModifier(ulong propval)
  {
    (cast(GstVideoInfoDmaDrm*)this._cPtr).drmModifier = propval;
  }

  /**
      Allocate a new #GstVideoInfoDmaDrm that is also initialized with
      [gstvideo.video_info_dma_drm.VideoInfoDmaDrm.init_].
      Returns: a new #GstVideoInfoDmaDrm.
        Free it with [gstvideo.video_info_dma_drm.VideoInfoDmaDrm.free].
  */
  this()
  {
    GstVideoInfoDmaDrm* _cretval;
    _cretval = gst_video_info_dma_drm_new();
    this(_cretval, Yes.Take);
  }

  /**
      Parse caps to generate a #GstVideoInfoDmaDrm. Please note that the
      caps should be a dma drm caps. The [gstvideo.global.videoIsDmaDrmCaps] can
      be used to verify it before calling this function.
  
      Params:
        caps = a #GstCaps
      Returns: A #GstVideoInfoDmaDrm,
          or null if caps couldn't be parsed.
  */
  static gstvideo.video_info_dma_drm.VideoInfoDmaDrm newFromCaps(gst.caps.Caps caps)
  {
    GstVideoInfoDmaDrm* _cretval;
    _cretval = gst_video_info_dma_drm_new_from_caps(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gstvideo.video_info_dma_drm.VideoInfoDmaDrm(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Convert the values of drm_info into a #GstCaps. Please note that the
      caps returned will be a dma drm caps which sets format field to DMA_DRM,
      and contains a new drm-format field. The value of drm-format field is
      composed of a drm fourcc and a modifier, such as NV12:0x0100000000000002.
      Returns: a new #GstCaps containing the
        info in drm_info.
  */
  gst.caps.Caps toCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_video_info_dma_drm_to_caps(cast(const(GstVideoInfoDmaDrm)*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Convert the #GstVideoInfoDmaDrm into a traditional #GstVideoInfo with
      recognized video format. For DMA kind memory, the non linear DMA format
      should be recognized as #GST_VIDEO_FORMAT_DMA_DRM. This helper function
      sets info's video format into the default value according to drm_info's
      drm_fourcc field.
  
      Params:
        info = #GstVideoInfo
      Returns: true if info is converted correctly.
  */
  bool toVideoInfo(out gstvideo.video_info.VideoInfo info)
  {
    bool _retval;
    GstVideoInfo _info;
    _retval = cast(bool)gst_video_info_dma_drm_to_video_info(cast(const(GstVideoInfoDmaDrm)*)this._cPtr, &_info);
    info = new gstvideo.video_info.VideoInfo(cast(void*)&_info, No.Take);
    return _retval;
  }

  /**
      Parse caps and update info. Please note that the caps should be
      a dma drm caps. The [gstvideo.global.videoIsDmaDrmCaps] can be used to verify
      it before calling this function.
  
      Params:
        drmInfo = #GstVideoInfoDmaDrm
        caps = a #GstCaps
      Returns: TRUE if caps could be parsed
  */
  static bool fromCaps(out gstvideo.video_info_dma_drm.VideoInfoDmaDrm drmInfo, gst.caps.Caps caps)
  {
    bool _retval;
    GstVideoInfoDmaDrm _drmInfo;
    _retval = cast(bool)gst_video_info_dma_drm_from_caps(&_drmInfo, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    drmInfo = new gstvideo.video_info_dma_drm.VideoInfoDmaDrm(cast(void*)&_drmInfo, No.Take);
    return _retval;
  }

  /**
      Fills drm_info if info's format has a valid drm format and modifier is also
      valid
  
      Params:
        drmInfo = #GstVideoInfoDmaDrm
        info = a #GstVideoInfo
        modifier = the associated modifier value.
      Returns: true if drm_info is filled correctly.
  */
  static bool fromVideoInfo(out gstvideo.video_info_dma_drm.VideoInfoDmaDrm drmInfo, gstvideo.video_info.VideoInfo info, ulong modifier)
  {
    bool _retval;
    GstVideoInfoDmaDrm _drmInfo;
    _retval = cast(bool)gst_video_info_dma_drm_from_video_info(&_drmInfo, info ? cast(const(GstVideoInfo)*)info._cPtr(No.Dup) : null, modifier);
    drmInfo = new gstvideo.video_info_dma_drm.VideoInfoDmaDrm(cast(void*)&_drmInfo, No.Take);
    return _retval;
  }

  /**
      Initialize drm_info with default values.
  
      Params:
        drmInfo = a #GstVideoInfoDmaDrm
  */
  static void init_(out gstvideo.video_info_dma_drm.VideoInfoDmaDrm drmInfo)
  {
    GstVideoInfoDmaDrm _drmInfo;
    gst_video_info_dma_drm_init(&_drmInfo);
    drmInfo = new gstvideo.video_info_dma_drm.VideoInfoDmaDrm(cast(void*)&_drmInfo, No.Take);
  }
}
