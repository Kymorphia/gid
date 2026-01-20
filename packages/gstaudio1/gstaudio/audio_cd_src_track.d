/// Module for [AudioCdSrcTrack] class
module gstaudio.audio_cd_src_track;

import gid.gid;
import gst.tag_list;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    CD track abstraction to communicate TOC entries to the base class.
    
    This structure is only for use by sub-classed in connection with
    [gstaudio.audio_cd_src.AudioCdSrc.addTrack].
    
    Applications will be informed of the available tracks via a TOC message
    on the pipeline's #GstBus instead.
*/
class AudioCdSrcTrack
{
  GstAudioCdSrcTrack _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstaudio.audio_cd_src_track.AudioCdSrcTrack");

    _cInstance = *cast(GstAudioCdSrcTrack*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `isAudio` field.
      Returns: Whether this is an audio track
  */
  @property bool isAudio()
  {
    return cast(bool)(cast(GstAudioCdSrcTrack*)this._cPtr).isAudio;
  }

  /**
      Set `isAudio` field.
      Params:
        propval = Whether this is an audio track
  */
  @property void isAudio(bool propval)
  {
    (cast(GstAudioCdSrcTrack*)this._cPtr).isAudio = propval;
  }

  /**
      Get `num` field.
      Returns: Track number in TOC (usually starts from 1, but not always)
  */
  @property uint num()
  {
    return (cast(GstAudioCdSrcTrack*)this._cPtr).num;
  }

  /**
      Set `num` field.
      Params:
        propval = Track number in TOC (usually starts from 1, but not always)
  */
  @property void num(uint propval)
  {
    (cast(GstAudioCdSrcTrack*)this._cPtr).num = propval;
  }

  /**
      Get `start` field.
      Returns: The first sector of this track (LBA)
  */
  @property uint start()
  {
    return (cast(GstAudioCdSrcTrack*)this._cPtr).start;
  }

  /**
      Set `start` field.
      Params:
        propval = The first sector of this track (LBA)
  */
  @property void start(uint propval)
  {
    (cast(GstAudioCdSrcTrack*)this._cPtr).start = propval;
  }

  /**
      Get `end` field.
      Returns: The last sector of this track (LBA)
  */
  @property uint end()
  {
    return (cast(GstAudioCdSrcTrack*)this._cPtr).end;
  }

  /**
      Set `end` field.
      Params:
        propval = The last sector of this track (LBA)
  */
  @property void end(uint propval)
  {
    (cast(GstAudioCdSrcTrack*)this._cPtr).end = propval;
  }

  /**
      Get `tags` field.
      Returns: Track-specific tags (e.g. from cd-text information), or NULL
  */
  @property gst.tag_list.TagList tags()
  {
    return cToD!(gst.tag_list.TagList)(cast(void*)(cast(GstAudioCdSrcTrack*)this._cPtr).tags);
  }

  /**
      Set `tags` field.
      Params:
        propval = Track-specific tags (e.g. from cd-text information), or NULL
  */
  @property void tags(gst.tag_list.TagList propval)
  {
    cValueFree!(gst.tag_list.TagList)(cast(void*)(cast(GstAudioCdSrcTrack*)this._cPtr).tags);
    dToC(propval, cast(void*)&(cast(GstAudioCdSrcTrack*)this._cPtr).tags);
  }
}
