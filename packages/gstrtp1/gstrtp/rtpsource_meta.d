/// Module for [RTPSourceMeta] class
module gstrtp.rtpsource_meta;

public import gid.basictypes;
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
  GstRTPSourceMeta _cInstance;

  /**
      Create a `rtpsource_meta.RTPSourceMeta` wrap type.
      Params:
        ssrc = the SSRC
        ssrcValid = whether @ssrc is set and valid
        csrc = pointer to the CSRCs
        csrcCount = number of elements in @csrc
  */
  this(uint ssrc = uint.init, bool ssrcValid = bool.init, uint[15] csrc = (uint[15]).init, uint csrcCount = uint.init) nothrow
  {
    this.ssrc = ssrc;
    this.ssrcValid = ssrcValid;
    this.csrc = csrc;
    this.csrcCount = csrcCount;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstRTPSourceMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta() nothrow
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstRTPSourceMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `ssrc` field.
      Returns: the SSRC
  */
  @property uint ssrc() nothrow
  {
    return (cast(GstRTPSourceMeta*)this._cPtr).ssrc;
  }

  /**
      Set `ssrc` field.
      Params:
        propval = the SSRC
  */
  @property void ssrc(uint propval) nothrow
  {
    (cast(GstRTPSourceMeta*)this._cPtr).ssrc = propval;
  }

  /**
      Get `ssrcValid` field.
      Returns: whether @ssrc is set and valid
  */
  @property bool ssrcValid() nothrow
  {
    return cast(bool)(cast(GstRTPSourceMeta*)this._cPtr).ssrcValid;
  }

  /**
      Set `ssrcValid` field.
      Params:
        propval = whether @ssrc is set and valid
  */
  @property void ssrcValid(bool propval) nothrow
  {
    (cast(GstRTPSourceMeta*)this._cPtr).ssrcValid = propval;
  }

  /**
      Get `csrc` field.
      Returns: pointer to the CSRCs
  */
  @property uint[15] csrc() nothrow
  {
    return *cast(uint[15]*)&(cast(GstRTPSourceMeta*)this._cPtr).csrc;
  }

  /**
      Set `csrc` field.
      Params:
        propval = pointer to the CSRCs
  */
  @property void csrc(uint[15] propval) nothrow
  {
    (cast(GstRTPSourceMeta*)this._cPtr).csrc = *cast(uint[15]*)&propval;
  }

  /**
      Get `csrcCount` field.
      Returns: number of elements in @csrc
  */
  @property uint csrcCount() nothrow
  {
    return (cast(GstRTPSourceMeta*)this._cPtr).csrcCount;
  }

  /**
      Set `csrcCount` field.
      Params:
        propval = number of elements in @csrc
  */
  @property void csrcCount(uint propval) nothrow
  {
    (cast(GstRTPSourceMeta*)this._cPtr).csrcCount = propval;
  }

  /**
      Appends csrc to the list of contributing sources in meta.
  
      Params:
        csrc = the csrcs to append
      Returns: true if all elements in csrc was added, false otherwise.
  */
  bool appendCsrc(uint[] csrc) nothrow
  {
    bool _retval;
    uint _csrcCount;
    if (csrc)
      _csrcCount = cast(uint)csrc.length;

    auto _csrc = csrc.ptr ? cast(const(uint)*)csrc.ptr : [uint.init].ptr;
    _retval = cast(bool)gst_rtp_source_meta_append_csrc(cast(GstRTPSourceMeta*)this._cPtr, _csrc, _csrcCount);
    return _retval;
  }

  /**
      Count the total number of RTP sources found in meta, both SSRC and CSRC.
      Returns: The number of RTP sources
  */
  uint getSourceCount() nothrow
  {
    uint _retval;
    _retval = gst_rtp_source_meta_get_source_count(cast(const(GstRTPSourceMeta)*)this._cPtr);
    return _retval;
  }

  /**
      Sets ssrc in meta. If ssrc is null the ssrc of meta will be unset.
  
      Params:
        ssrc = pointer to the SSRC
      Returns: true on success, false otherwise.
  */
  bool setSsrc(out uint ssrc) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_source_meta_set_ssrc(cast(GstRTPSourceMeta*)this._cPtr, cast(uint*)&ssrc);
    return _retval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_rtp_source_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
