module gstaudio.audio_src;

import gid.gid;
import gstaudio.audio_base_src;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    This is the most simple base class for audio sources that only requires
  subclasses to implement a set of simple functions:
  
  $(LIST
    * `open()` :Open the device.
    * `prepare()` :Configure the device with the specified format.
    * `read()` :Read samples from the device.
    * `reset()` :Unblock reads and flush the device.
    * `delay()` :Get the number of samples in the device but not yet read.
    * `unprepare()` :Undo operations done by prepare.
    * `close()` :Close the device.
  )
    
  All scheduling of samples and timestamps is done in this base class
  together with #GstAudioBaseSrc using a default implementation of a
  #GstAudioRingBuffer that uses threads.
*/
class AudioSrc : gstaudio.audio_base_src.AudioBaseSrc
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_src_get_type != &gidSymbolNotFound ? gst_audio_src_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
