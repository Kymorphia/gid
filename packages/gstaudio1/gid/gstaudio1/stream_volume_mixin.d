/// Module for [StreamVolume] interface mixin
module gid.gstaudio1.stream_volume_mixin;

public import gid.core.basictypes;
public import gid.gstaudio1.stream_volume;
public import gid.gstaudio1.stream_volume_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gstaudio1.c.functions;
public import gid.gstaudio1.c.types;
public import gid.gstaudio1.types;

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
template StreamVolumeT()
{

  /** */
  @property bool mute() nothrow
  {
    return getMute();
  }

  /** */
  @property void mute(bool propval) nothrow
  {
    setMute(propval);
  }

  /** */
  @property double volume() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(double)("volume");
  }

  /** */
  @property void volume(double propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(double)("volume", propval);
  }


  /** */
  override bool getMute() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_stream_volume_get_mute(cast(GstStreamVolume*)this._cPtr);
    return _retval;
  }

  /** */
  override double getVolume(gid.gstaudio1.types.StreamVolumeFormat format) nothrow
  {
    double _retval;
    _retval = gst_stream_volume_get_volume(cast(GstStreamVolume*)this._cPtr, format);
    return _retval;
  }

  /** */
  override void setMute(bool mute) nothrow
  {
    gst_stream_volume_set_mute(cast(GstStreamVolume*)this._cPtr, mute);
  }

  /** */
  override void setVolume(gid.gstaudio1.types.StreamVolumeFormat format, double val) nothrow
  {
    gst_stream_volume_set_volume(cast(GstStreamVolume*)this._cPtr, format, val);
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.stream_volume.StreamVolume]
template StreamVolumeGidBuilderT()
{

  /** */
  T mute(bool propval) nothrow
  {
    return setProperty("mute", propval);
  }

  /** */
  T volume(double propval) nothrow
  {
    return setProperty("volume", propval);
  }
}
