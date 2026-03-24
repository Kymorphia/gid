/// Module for [StreamVolume] interface
module gstaudio.stream_volume;

public import gstaudio.stream_volume_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    This interface is implemented by elements that provide a stream volume. Examples for
    such elements are #volume and #playbin.
    
    Applications can use this interface to get or set the current stream volume. For this
    the "volume" #GObject property can be used or the helper functions [gstaudio.stream_volume.StreamVolume.setVolume]
    and [gstaudio.stream_volume.StreamVolume.getVolume]. This volume is always a linear factor, i.e. 0.0 is muted
    1.0 is 100%. For showing the volume in a GUI it might make sense to convert it to
    a different format by using [gstaudio.stream_volume.StreamVolume.convertVolume]. Volume sliders should usually
    use a cubic volume.
    
    Separate from the volume the stream can also be muted by the "mute" #GObject property or
    [gstaudio.stream_volume.StreamVolume.setMute] and [gstaudio.stream_volume.StreamVolume.getMute].
    
    Elements that provide some kind of stream volume should implement the "volume" and
    "mute" #GObject properties and handle setting and getting of them properly.
    The volume property is defined to be a linear volume factor.
*/
interface StreamVolume
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_stream_volume_get_type != &gidSymbolNotFound ? gst_stream_volume_get_type() : cast(GType)0;
  }

  /** */
  @property bool mute();

  /** */
  @property void mute(bool propval);

  /** */
  @property double volume();

  /** */
  @property void volume(double propval);

  /** */
  static double convertVolume(gstaudio.types.StreamVolumeFormat from, gstaudio.types.StreamVolumeFormat to, double val)
  {
    double _retval;
    _retval = gst_stream_volume_convert_volume(from, to, val);
    return _retval;
  }

  /** */
  bool getMute();

  /** */
  double getVolume(gstaudio.types.StreamVolumeFormat format);

  /** */
  void setMute(bool mute);

  /** */
  void setVolume(gstaudio.types.StreamVolumeFormat format, double val);
}

interface StreamVolumeGidBuilderImpl(T)
{

  /** */
  T mute(bool propval);

  /** */
  T volume(double propval);
}
