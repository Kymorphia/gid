//!gir GstAudio-1.0
//!info description "D binding for the GstAudio library - Audio library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstaudio1/
//!info capi https://gstreamer.freedesktop.org/documentation/audio/index.html

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

//# Disable: Internal/implementation-only API, not useful from D
//!set record[AudioFormatInfo].field[unpack_func][ignore] 1
//!set record[AudioFormatInfo].field[pack_func][ignore] 1

//# Disable: Uses unsupported GValue fundamental types (Fraction, ValueArray, ValueList) (FIXME)
//!set class[AudioAggregator].property[output-buffer-duration-fraction][disable] 1
