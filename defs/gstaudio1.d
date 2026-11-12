//!gir GstAudio-1.0
//!info description "D binding for the GstAudio library - Audio library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstaudio1/
//!info capi https://gstreamer.freedesktop.org/documentation/audio/index.html

// Map functions return a MapScope which unmaps the structure (explicit unmap or scope exit), the unmap function is
// only used by the MapScope (unmapping a MapScope structure directly would unmap it twice)
//!set record[AudioBuffer].function[map][gid-unmap] gst_audio_buffer_unmap
//!set record[AudioBuffer].function[map][gid-map-source] gstbuffer
//!set record[AudioBuffer].method[unmap][disable] 1

// Borrowed structure returns: owned by a parameter (buffer metas) or static/long-lived data (no owner)
//!set function[buffer_add_audio_clipping_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_audio_level_meta].return-value[][gid-borrow] buffer
//!set function[buffer_get_audio_downmix_meta_for_channels].return-value[][gid-borrow] buffer
//!set function[buffer_get_audio_level_meta].return-value[][gid-borrow] buffer

//# Disable callbacks with arrays with sizes not described by parameters (FIXME)
//!set callback[AudioFormatPack][disable] 1
//!set callback[AudioFormatUnpack][disable] 1

//# Unsupported callables with arrays whose sizes cannot be described by function arguments (FIXME)
//!set class[AudioRingBuffer].method[set_channel_positions][disable] 1
//!set record[AudioChannelMixer].method[samples][disable] 1
//!set record[AudioConverter].method[samples][disable] 1
//!set record[AudioQuantize].method[samples][disable] 1
//!set record[AudioResampler].method[resample][disable] 1
//!set function[buffer_add_audio_downmix_meta][disable] 1
//!set function[buffer_add_audio_meta][disable] 1
//!set function[buffer_add_dsd_plane_offset_meta][disable] 1
//!set function[dsd_convert][disable] 1

//# Set basic parameters to out
//!set callback[AudioBaseSinkCustomSlavingCallback].parameters.parameter[requested_skew][direction] out


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[AudioBuffer].field[info][writable] 0
//!set record[AudioClippingMeta].field[meta][writable] 0
//!set record[AudioDownmixMeta].field[meta][writable] 0
//!set record[AudioDownmixMeta].field[from_position][writable] 0
//!set record[AudioDownmixMeta].field[to_position][writable] 0
//!set record[AudioLevelMeta].field[meta][writable] 0
//!set record[AudioMeta].field[meta][writable] 0
//!set record[AudioMeta].field[info][writable] 0
//!set record[AudioRingBufferSpec].field[info][writable] 0
//!set record[DsdPlaneOffsetMeta].field[meta][writable] 0

//# Make read-only (no write support): Pointer fields of unknown ownership, no proper write support
//!set record[AudioFormatInfo].field[name][writable] 0
//!set record[AudioFormatInfo].field[description][writable] 0
//!set record[AudioInfo].field[finfo][writable] 0

//# Ignore: Internal/implementation-only API, not useful from D
//!set record[AudioFormatInfo].field[unpack_func][ignore] 1
//!set record[AudioFormatInfo].field[pack_func][ignore] 1

//# Ignore: Property type Gst.Fraction is a fundamental GValue type, replaced by gst.types.Fraction properties below
//!set class[AudioAggregator].property[output-buffer-duration-fraction][ignore] 1

//# Disable: Array fields with lengths from other structures (channel counts)
//!set record[AudioDownmixMeta].field[matrix][disable] 1
//!set record[AudioMeta].field[offsets][disable] 1

//# Set array field lengths from their length fields (read-only, set when mapping the buffer or adding the meta)
//!set record[AudioBuffer].field[planes].type '<array length="2" zero-terminated="0" c:type="gpointer*"><type name="gpointer" c:type="gpointer"/></array>'
//!set record[AudioBuffer].field[planes][writable] 0
//!set record[DsdPlaneOffsetMeta].field[offsets].type '<array length="1" zero-terminated="0" c:type="gsize*"><type name="gsize" c:type="gsize"/></array>'
//!set record[DsdPlaneOffsetMeta].field[offsets][writable] 0

//# Add output-buffer-duration-fraction property, using the gst.types.Fraction D value type
//!class AudioAggregator pre
import gst.types;

//!class AudioAggregator

  /**
      Get `outputBufferDurationFraction` property.
      Returns: Output block size in nanoseconds, expressed as a fraction.
  */
  @property gst.types.Fraction outputBufferDurationFraction() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gst.types.Fraction)("output-buffer-duration-fraction");
  }

  /**
      Set `outputBufferDurationFraction` property.
      Params:
        propval = Output block size in nanoseconds, expressed as a fraction.
  */
  @property void outputBufferDurationFraction(gst.types.Fraction propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gst.types.Fraction)("output-buffer-duration-fraction", propval);
  }

//!class AudioAggregatorGidBuilder

  /**
      Set `outputBufferDurationFraction` property.
      Params:
        propval = Output block size in nanoseconds, expressed as a fraction.
      Returns: Builder instance for fluent chaining
  */
  T outputBufferDurationFraction(gst.types.Fraction propval) nothrow
  {
    return setProperty("output-buffer-duration-fraction", propval);
  }
