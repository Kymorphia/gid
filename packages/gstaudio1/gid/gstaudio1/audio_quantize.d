/// Module for [AudioQuantize] class
module gid.gstaudio1.audio_quantize;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/** */
class AudioQuantize : OpaqueWrap!(GstAudioQuantize*, void, void)
{

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
      Reset quant to the state is was when created, clearing any
      history it might have.
  */
  void reset() nothrow
  {
    gst_audio_quantize_reset(cast(GstAudioQuantize*)this._cPtr);
  }
}
