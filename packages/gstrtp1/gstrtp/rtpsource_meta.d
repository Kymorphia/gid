module gstrtp.rtpsource_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.types;

/**
    Meta describing the source(s) of the buffer.
*/
class RTPSourceMeta
{
  GstRTPSourceMeta cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstRtp.RTPSourceMeta");

    cInstance = *cast(GstRTPSourceMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstRTPSourceMeta*)cPtr).meta);
  }

  @property uint ssrc()
  {
    return (cast(GstRTPSourceMeta*)cPtr).ssrc;
  }

  @property void ssrc(uint propval)
  {
    (cast(GstRTPSourceMeta*)cPtr).ssrc = propval;
  }

  @property bool ssrcValid()
  {
    return (cast(GstRTPSourceMeta*)cPtr).ssrcValid;
  }

  @property void ssrcValid(bool propval)
  {
    (cast(GstRTPSourceMeta*)cPtr).ssrcValid = propval;
  }

  @property uint csrcCount()
  {
    return (cast(GstRTPSourceMeta*)cPtr).csrcCount;
  }

  @property void csrcCount(uint propval)
  {
    (cast(GstRTPSourceMeta*)cPtr).csrcCount = propval;
  }

  /**
      Appends csrc to the list of contributing sources in meta.
    Params:
      csrc =       the csrcs to append
    Returns:     true if all elements in csrc was added, false otherwise.
  */
  bool appendCsrc(uint[] csrc)
  {
    bool _retval;
    uint _csrcCount;
    if (csrc)
      _csrcCount = cast(uint)csrc.length;

    auto _csrc = cast(const(uint)*)csrc.ptr;
    _retval = gst_rtp_source_meta_append_csrc(cast(GstRTPSourceMeta*)cPtr, _csrc, _csrcCount);
    return _retval;
  }

  /**
      Count the total number of RTP sources found in meta, both SSRC and CSRC.
    Returns:     The number of RTP sources
  */
  uint getSourceCount()
  {
    uint _retval;
    _retval = gst_rtp_source_meta_get_source_count(cast(const(GstRTPSourceMeta)*)cPtr);
    return _retval;
  }

  /**
      Sets ssrc in meta. If ssrc is null the ssrc of meta will be unset.
    Params:
      ssrc =       pointer to the SSRC
    Returns:     true on success, false otherwise.
  */
  bool setSsrc(out uint ssrc)
  {
    bool _retval;
    _retval = gst_rtp_source_meta_set_ssrc(cast(GstRTPSourceMeta*)cPtr, cast(uint*)&ssrc);
    return _retval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_rtp_source_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
