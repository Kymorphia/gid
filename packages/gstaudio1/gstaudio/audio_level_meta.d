/// Module for [AudioLevelMeta] class
module gstaudio.audio_level_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    Meta containing Audio Level Indication: https://tools.ietf.org/html/rfc6464
*/
class AudioLevelMeta
{
  GstAudioLevelMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstaudio.audio_level_meta.AudioLevelMeta");

    cInstance = *cast(GstAudioLevelMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAudioLevelMeta*)this._cPtr).meta);
  }

  /**
      Get `level` field.
      Returns: the -dBov from 0-127 (127 is silence).
  */
  @property ubyte level()
  {
    return (cast(GstAudioLevelMeta*)this._cPtr).level;
  }

  /**
      Set `level` field.
      Params:
        propval = the -dBov from 0-127 (127 is silence).
  */
  @property void level(ubyte propval)
  {
    (cast(GstAudioLevelMeta*)this._cPtr).level = propval;
  }

  /**
      Get `voiceActivity` field.
      Returns: whether the buffer contains voice activity
  */
  @property bool voiceActivity()
  {
    return (cast(GstAudioLevelMeta*)this._cPtr).voiceActivity;
  }

  /**
      Set `voiceActivity` field.
      Params:
        propval = whether the buffer contains voice activity
  */
  @property void voiceActivity(bool propval)
  {
    (cast(GstAudioLevelMeta*)this._cPtr).voiceActivity = propval;
  }

  /**
      Return the #GstMetaInfo associated with #GstAudioLevelMeta.
      Returns: a #GstMetaInfo
  */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_level_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
