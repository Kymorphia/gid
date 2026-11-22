/// Module for [AudioCdSrcTrack] class
module gid.gstaudio1.audio_cd_src_track;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.tag_list;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    CD track abstraction to communicate TOC entries to the base class.
    
    This structure is only for use by sub-classed in connection with
    [gid.gstaudio1.audio_cd_src.AudioCdSrc.addTrack].
    
    Applications will be informed of the available tracks via a TOC message
    on the pipeline's #GstBus instead.
*/
class AudioCdSrcTrack : StructWrap!(GstAudioCdSrcTrack)
{
  /**
      Create a `audio_cd_src_track.AudioCdSrcTrack` wrap type.
      Params:
        isAudio = Whether this is an audio track
        num = Track number in TOC (usually starts from 1, but not always)
        start = The first sector of this track (LBA)
        end = The last sector of this track (LBA)
        tags = Track-specific tags (e.g. from cd-text information), or NULL
  */
  this(bool isAudio = bool.init, uint num = uint.init, uint start = uint.init, uint end = uint.init, gid.gst1.tag_list.TagList tags = gid.gst1.tag_list.TagList.init) nothrow
  {
    this.isAudio = isAudio;
    this.num = num;
    this.start = start;
    this.end = end;
    this.tags = tags;
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
      Get `isAudio` field.
      Returns: Whether this is an audio track
  */
  @property bool isAudio() nothrow
  {
    return cast(bool)(cast(GstAudioCdSrcTrack*)this._cPtr).isAudio;
  }

  /**
      Set `isAudio` field.
      Params:
        propval = Whether this is an audio track
  */
  @property void isAudio(bool propval) nothrow
  {
    (cast(GstAudioCdSrcTrack*)this._cPtr).isAudio = propval;
  }

  /**
      Get `num` field.
      Returns: Track number in TOC (usually starts from 1, but not always)
  */
  @property uint num() nothrow
  {
    return (cast(GstAudioCdSrcTrack*)this._cPtr).num;
  }

  /**
      Set `num` field.
      Params:
        propval = Track number in TOC (usually starts from 1, but not always)
  */
  @property void num(uint propval) nothrow
  {
    (cast(GstAudioCdSrcTrack*)this._cPtr).num = propval;
  }

  /**
      Get `start` field.
      Returns: The first sector of this track (LBA)
  */
  @property uint start() nothrow
  {
    return (cast(GstAudioCdSrcTrack*)this._cPtr).start;
  }

  /**
      Set `start` field.
      Params:
        propval = The first sector of this track (LBA)
  */
  @property void start(uint propval) nothrow
  {
    (cast(GstAudioCdSrcTrack*)this._cPtr).start = propval;
  }

  /**
      Get `end` field.
      Returns: The last sector of this track (LBA)
  */
  @property uint end() nothrow
  {
    return (cast(GstAudioCdSrcTrack*)this._cPtr).end;
  }

  /**
      Set `end` field.
      Params:
        propval = The last sector of this track (LBA)
  */
  @property void end(uint propval) nothrow
  {
    (cast(GstAudioCdSrcTrack*)this._cPtr).end = propval;
  }

  private gid.gst1.tag_list.TagList _tagsRef; // Keeps borrowed field value alive

  /**
      Get `tags` field.
      Returns: Track-specific tags (e.g. from cd-text information), or NULL
  */
  @property gid.gst1.tag_list.TagList tags() nothrow
  {
    return cToD!(gid.gst1.tag_list.TagList)(cast(void*)(cast(GstAudioCdSrcTrack*)this._cPtr).tags);
  }

  /**
      Set `tags` field.
      Params:
        propval = Track-specific tags (e.g. from cd-text information), or NULL
  */
  @property void tags(gid.gst1.tag_list.TagList propval) nothrow
  {
    if (_refuseBorrowedStore("tags"))
      return;

    _tagsRef = propval;
    (cast(GstAudioCdSrcTrack*)this._cPtr).tags = propval ? cast(GstTagList*)propval._cPtr(No.Dup) : null;
  }
}
