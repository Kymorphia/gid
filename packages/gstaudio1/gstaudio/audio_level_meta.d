/// Module for [AudioLevelMeta] class
module gstaudio.audio_level_meta;

public import gid.basictypes;
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
  GstAudioLevelMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstAudioLevelMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAudioLevelMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `level` field.
      Returns: the -dBov from 0-127 (127 is silence).
  */
  @property ubyte level() nothrow
  {
    return (cast(GstAudioLevelMeta*)this._cPtr).level;
  }

  /**
      Set `level` field.
      Params:
        propval = the -dBov from 0-127 (127 is silence).
  */
  @property void level(ubyte propval) nothrow
  {
    (cast(GstAudioLevelMeta*)this._cPtr).level = propval;
  }

  /**
      Get `voiceActivity` field.
      Returns: whether the buffer contains voice activity
  */
  @property bool voiceActivity() nothrow
  {
    return cast(bool)(cast(GstAudioLevelMeta*)this._cPtr).voiceActivity;
  }

  /**
      Set `voiceActivity` field.
      Params:
        propval = whether the buffer contains voice activity
  */
  @property void voiceActivity(bool propval) nothrow
  {
    (cast(GstAudioLevelMeta*)this._cPtr).voiceActivity = propval;
  }

  /**
      Return the #GstMetaInfo associated with #GstAudioLevelMeta.
      Returns: a #GstMetaInfo
  */
  static gst.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_level_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
