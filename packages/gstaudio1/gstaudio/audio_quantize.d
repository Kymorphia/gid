/// Module for [AudioQuantize] class
module gstaudio.audio_quantize;

public import gid.basictypes;
import gid.gid;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

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
