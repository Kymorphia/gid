/// Module for [AudioChannelMixer] class
module gstaudio.audio_channel_mixer;

import gid.gid;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/** */
class AudioChannelMixer
{
  GstAudioChannelMixer* cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstaudio.audio_channel_mixer.AudioChannelMixer");

    cInstancePtr = cast(GstAudioChannelMixer*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /**
      Check if mix is in passthrough.
      
      Only N x N mix identity matrices are considered passthrough,
      this is determined by comparing the contents of the matrix
      with 0.0 and 1.0.
      
      As this is floating point comparisons, if the values have been
      generated, they should be rounded up or down by explicit
      assignment of 0.0 or 1.0 to values within a user-defined
      epsilon, this code doesn't make assumptions as to what may
      constitute an appropriate epsilon.
      Returns: true is mix is passthrough.
  */
  bool isPassthrough()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_channel_mixer_is_passthrough(cast(GstAudioChannelMixer*)this._cPtr);
    return _retval;
  }
}
