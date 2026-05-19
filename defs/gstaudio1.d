//!gir GstAudio-1.0
//!info description "D binding for the GstAudio library - Audio library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstaudio1/
//!info capi https://gstreamer.freedesktop.org/documentation/audio/index.html

//# Ignore callbacks which aren't introspectable (array sizes aren't described by parameters)
//!set callback[AudioFormatPack][ignore] 1
//!set callback[AudioFormatUnpack][ignore] 1

//# Unsupported callables with arrays whose sizes cannot be described by function arguments (FIXME)
//!set class[AudioRingBuffer].method[set_channel_positions][unsupported] 1
//!set record[AudioChannelMixer].method[samples][unsupported] 1
//!set record[AudioConverter].method[samples][unsupported] 1
//!set record[AudioQuantize].method[samples][unsupported] 1
//!set record[AudioResampler].method[resample][unsupported] 1
//!set function[buffer_add_audio_downmix_meta][unsupported] 1
//!set function[buffer_add_audio_meta][unsupported] 1
//!set function[buffer_add_dsd_plane_offset_meta][unsupported] 1
//!set function[dsd_convert][unsupported] 1

//# Set basic parameters to out
//!set callback[AudioBaseSinkCustomSlavingCallback].parameters.parameter[requested_skew][direction] out
