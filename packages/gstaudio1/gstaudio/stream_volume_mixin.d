/// Module for [StreamVolume] interface mixin
module gstaudio.stream_volume_mixin;

public import gstaudio.stream_volume_iface_proxy;
public import gid.gid;
public import gobject.object;
public import gstaudio.c.functions;
public import gstaudio.c.types;
public import gstaudio.types;

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
template StreamVolumeT()
{

  /** */
  @property bool mute()
  {
    return getMute();
  }

  /** */
  @property void mute(bool propval)
  {
    return setMute(propval);
  }

  /** */
  @property double volume()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("volume");
  }

  /** */
  @property void volume(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("volume", propval);
  }


  /** */
  override bool getMute()
  {
    bool _retval;
    _retval = cast(bool)gst_stream_volume_get_mute(cast(GstStreamVolume*)this._cPtr);
    return _retval;
  }

  /** */
  override double getVolume(gstaudio.types.StreamVolumeFormat format)
  {
    double _retval;
    _retval = gst_stream_volume_get_volume(cast(GstStreamVolume*)this._cPtr, format);
    return _retval;
  }

  /** */
  override void setMute(bool mute)
  {
    gst_stream_volume_set_mute(cast(GstStreamVolume*)this._cPtr, mute);
  }

  /** */
  override void setVolume(gstaudio.types.StreamVolumeFormat format, double val)
  {
    gst_stream_volume_set_volume(cast(GstStreamVolume*)this._cPtr, format, val);
  }
}
