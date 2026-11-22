/// Module for [StreamVolume] interface
module gid.gstaudio1.stream_volume;

public import gid.core.basictypes;
public import gid.gstaudio1.stream_volume_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    This interface is implemented by elements that provide a stream volume. Examples for
    such elements are #volume and #playbin.
    
    Applications can use this interface to get or set the current stream volume. For this
    the "volume" #GObject property can be used or the helper functions [gid.gstaudio1.stream_volume.StreamVolume.setVolume]
    and [gid.gstaudio1.stream_volume.StreamVolume.getVolume]. This volume is always a linear factor, i.e. 0.0 is muted
    1.0 is 100%. For showing the volume in a GUI it might make sense to convert it to
    a different format by using [gid.gstaudio1.stream_volume.StreamVolume.convertVolume]. Volume sliders should usually
    use a cubic volume.
    
    Separate from the volume the stream can also be muted by the "mute" #GObject property or
    [gid.gstaudio1.stream_volume.StreamVolume.setMute] and [gid.gstaudio1.stream_volume.StreamVolume.getMute].
    
    Elements that provide some kind of stream volume should implement the "volume" and
    "mute" #GObject properties and handle setting and getting of them properly.
    The volume property is defined to be a linear volume factor.
*/
interface StreamVolume : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_stream_volume_get_type != &gidSymbolNotFound ? gst_stream_volume_get_type() : cast(GType)0;
  }

  /** */
  @property bool mute() nothrow;

  /** */
  @property void mute(bool propval) nothrow;

  /** */
  @property double volume() nothrow;

  /** */
  @property void volume(double propval) nothrow;

  /** */
  static double convertVolume(gid.gstaudio1.types.StreamVolumeFormat from, gid.gstaudio1.types.StreamVolumeFormat to, double val) nothrow
  {
    double _retval;
    _retval = gst_stream_volume_convert_volume(from, to, val);
    return _retval;
  }

  /** */
  bool getMute();

  /** */
  double getVolume(gid.gstaudio1.types.StreamVolumeFormat format);

  /** */
  void setMute(bool mute);

  /** */
  void setVolume(gid.gstaudio1.types.StreamVolumeFormat format, double val);
}

/// Fluent builder implementation template for [gid.gstaudio1.stream_volume.StreamVolume]
interface StreamVolumeGidBuilderImpl(T)
{

  /** */
  T mute(bool propval) nothrow;

  /** */
  T volume(double propval) nothrow;
}
