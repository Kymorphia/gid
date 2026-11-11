//!gir GstRtp-1.0
//!info description "D binding for the GstRtp library - RTP library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstrtp1/
//!info capi https://gstreamer.freedesktop.org/documentation/rtplib/index.html

// Map functions return a MapScope which unmaps the structure (explicit unmap or scope exit), the unmap function is
// only used by the MapScope (unmapping a MapScope structure directly would unmap it twice)
//!set record[RTPBuffer].function[map][gid-unmap] gst_rtp_buffer_unmap
//!set record[RTPBuffer].function[map][gid-map-source] buffer
//!set record[RTPBuffer].method[unmap][disable] 1
//!set record[RTCPBuffer].function[map].parameters.parameter[rtcp][direction] out
//!set record[RTCPBuffer].function[map].parameters.parameter[rtcp][caller-allocates] 1
//!set record[RTCPBuffer].function[map][gid-unmap] gst_rtcp_buffer_unmap
//!set record[RTCPBuffer].function[map][gid-map-source] buffer
//!set record[RTCPBuffer].method[unmap][disable] 1

// Borrowed structure returns: owned by a parameter (buffer metas) or static/long-lived data (no owner)
//!set function[buffer_get_rtp_source_meta].return-value[][gid-borrow] buffer
//!set record[RTPPayloadInfo].function[for_name].return-value[][gid-borrow] static
//!set record[RTPPayloadInfo].function[for_pt].return-value[][gid-borrow] static

//# ssrc parameter appears to be an input uint pointer for some unknown reason, mark it unsupported
//!set function[buffer_add_rtp_source_meta][disable] 1

//# Set basic parameters to out
//!set record[RTCPPacket].method[sdes_copy_entry].parameters.parameter[type][direction] out
//!set record[RTCPPacket].method[sdes_get_entry].parameters.parameter[type][direction] out
//!set record[RTCPPacket].method[xr_get_dlrr_block].parameters.parameter[ssrc][direction] out
//!set record[RTCPPacket].method[xr_get_dlrr_block].parameters.parameter[last_rr][direction] out
//!set record[RTCPPacket].method[xr_get_dlrr_block].parameters.parameter[delay][direction] out
//!set record[RTCPPacket].method[xr_get_prt_by_seq].parameters.parameter[receipt_time][direction] out
//!set record[RTCPPacket].method[xr_get_prt_info].parameters.parameter[ssrc][direction] out
//!set record[RTCPPacket].method[xr_get_prt_info].parameters.parameter[thinning][direction] out
//!set record[RTCPPacket].method[xr_get_prt_info].parameters.parameter[begin_seq][direction] out
//!set record[RTCPPacket].method[xr_get_prt_info].parameters.parameter[end_seq][direction] out
//!set record[RTCPPacket].method[xr_get_rle_info].parameters.parameter[ssrc][direction] out
//!set record[RTCPPacket].method[xr_get_rle_info].parameters.parameter[thinning][direction] out
//!set record[RTCPPacket].method[xr_get_rle_info].parameters.parameter[begin_seq][direction] out
//!set record[RTCPPacket].method[xr_get_rle_info].parameters.parameter[end_seq][direction] out
//!set record[RTCPPacket].method[xr_get_rle_info].parameters.parameter[chunk_count][direction] out
//!set record[RTCPPacket].method[xr_get_rle_nth_chunk].parameters.parameter[chunk][direction] out
//!set record[RTCPPacket].method[xr_get_rrt].parameters.parameter[timestamp][direction] out
//!set record[RTCPPacket].method[xr_get_summary_info].parameters.parameter[ssrc][direction] out
//!set record[RTCPPacket].method[xr_get_summary_info].parameters.parameter[begin_seq][direction] out
//!set record[RTCPPacket].method[xr_get_summary_info].parameters.parameter[end_seq][direction] out
//!set record[RTCPPacket].method[xr_get_summary_jitter].parameters.parameter[min_jitter][direction] out
//!set record[RTCPPacket].method[xr_get_summary_jitter].parameters.parameter[max_jitter][direction] out
//!set record[RTCPPacket].method[xr_get_summary_jitter].parameters.parameter[mean_jitter][direction] out
//!set record[RTCPPacket].method[xr_get_summary_jitter].parameters.parameter[dev_jitter][direction] out
//!set record[RTCPPacket].method[xr_get_summary_pkt].parameters.parameter[lost_packets][direction] out
//!set record[RTCPPacket].method[xr_get_summary_pkt].parameters.parameter[dup_packets][direction] out
//!set record[RTCPPacket].method[xr_get_summary_ttl].parameters.parameter[is_ipv4][direction] out
//!set record[RTCPPacket].method[xr_get_summary_ttl].parameters.parameter[min_ttl][direction] out
//!set record[RTCPPacket].method[xr_get_summary_ttl].parameters.parameter[max_ttl][direction] out
//!set record[RTCPPacket].method[xr_get_summary_ttl].parameters.parameter[mean_ttl][direction] out
//!set record[RTCPPacket].method[xr_get_summary_ttl].parameters.parameter[dev_ttl][direction] out
//!set record[RTCPPacket].method[xr_get_voip_burst_metrics].parameters.parameter[burst_density][direction] out
//!set record[RTCPPacket].method[xr_get_voip_burst_metrics].parameters.parameter[gap_density][direction] out
//!set record[RTCPPacket].method[xr_get_voip_burst_metrics].parameters.parameter[burst_duration][direction] out
//!set record[RTCPPacket].method[xr_get_voip_burst_metrics].parameters.parameter[gap_duration][direction] out
//!set record[RTCPPacket].method[xr_get_voip_configuration_params].parameters.parameter[gmin][direction] out
//!set record[RTCPPacket].method[xr_get_voip_configuration_params].parameters.parameter[rx_config][direction] out
//!set record[RTCPPacket].method[xr_get_voip_delay_metrics].parameters.parameter[roundtrip_delay][direction] out
//!set record[RTCPPacket].method[xr_get_voip_delay_metrics].parameters.parameter[end_system_delay][direction] out
//!set record[RTCPPacket].method[xr_get_voip_jitter_buffer_params].parameters.parameter[jb_nominal][direction] out
//!set record[RTCPPacket].method[xr_get_voip_jitter_buffer_params].parameters.parameter[jb_maximum][direction] out
//!set record[RTCPPacket].method[xr_get_voip_jitter_buffer_params].parameters.parameter[jb_abs_max][direction] out
//!set record[RTCPPacket].method[xr_get_voip_metrics_ssrc].parameters.parameter[ssrc][direction] out
//!set record[RTCPPacket].method[xr_get_voip_packet_metrics].parameters.parameter[loss_rate][direction] out
//!set record[RTCPPacket].method[xr_get_voip_packet_metrics].parameters.parameter[discard_rate][direction] out
//!set record[RTCPPacket].method[xr_get_voip_quality_metrics].parameters.parameter[r_factor][direction] out
//!set record[RTCPPacket].method[xr_get_voip_quality_metrics].parameters.parameter[ext_r_factor][direction] out
//!set record[RTCPPacket].method[xr_get_voip_quality_metrics].parameters.parameter[mos_lq][direction] out
//!set record[RTCPPacket].method[xr_get_voip_quality_metrics].parameters.parameter[mos_cq][direction] out
//!set record[RTCPPacket].method[xr_get_voip_signal_metrics].parameters.parameter[signal_level][direction] out
//!set record[RTCPPacket].method[xr_get_voip_signal_metrics].parameters.parameter[noise_level][direction] out
//!set record[RTCPPacket].method[xr_get_voip_signal_metrics].parameters.parameter[rerl][direction] out
//!set record[RTCPPacket].method[xr_get_voip_signal_metrics].parameters.parameter[gmin][direction] out
//!set record[RTPSourceMeta].method[set_ssrc].parameters.parameter[ssrc][direction] out


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[RTCPPacket].field[rtcp][writable] 0
//!set record[RTPSourceMeta].field[meta][writable] 0

//# Ignore: Untyped raw pointer fields (gpointer user/private data), not useful from D
//!set record[RTPBuffer].field[data][ignore] 1

//# Disable: Uses unsupported GValue fundamental types (Fraction, ValueArray, ValueList) (FIXME)
//!set class[RTPBaseDepayload].property[extensions][disable] 1
//!set class[RTPBasePayload].property[extensions][disable] 1
