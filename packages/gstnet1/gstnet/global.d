/// Global functions for gstnet1 library
module gstnet.global;

import gid.gid;
import gio.socket;
import gio.socket_address;
import gio.socket_control_message;
import gobject.types;
import gst.buffer;
import gst.structure;
import gstnet.c.functions;
import gstnet.c.types;
import gstnet.net_address_meta;
import gstnet.net_control_message_meta;
import gstnet.types;


/**
    Attaches addr as metadata in a #GstNetAddressMeta to buffer.

    Params:
      buffer = a #GstBuffer
      addr = a GSocketAddress to connect to buffer
    Returns: a #GstNetAddressMeta connected to buffer
*/
gstnet.net_address_meta.NetAddressMeta bufferAddNetAddressMeta(gst.buffer.Buffer buffer, gio.socket_address.SocketAddress addr)
{
  GstNetAddressMeta* _cretval;
  _cretval = gst_buffer_add_net_address_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, addr ? cast(GSocketAddress*)addr._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstnet.net_address_meta.NetAddressMeta(cast(GstNetAddressMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches message as metadata in a #GstNetControlMessageMeta to buffer.

    Params:
      buffer = a #GstBuffer
      message = a GSocketControlMessage to attach to buffer
    Returns: a #GstNetControlMessageMeta connected to buffer
*/
gstnet.net_control_message_meta.NetControlMessageMeta bufferAddNetControlMessageMeta(gst.buffer.Buffer buffer, gio.socket_control_message.SocketControlMessage message)
{
  GstNetControlMessageMeta* _cretval;
  _cretval = gst_buffer_add_net_control_message_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, message ? cast(GSocketControlMessage*)message._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstnet.net_control_message_meta.NetControlMessageMeta(cast(GstNetControlMessageMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Find the #GstNetAddressMeta on buffer.

    Params:
      buffer = a #GstBuffer
    Returns: the #GstNetAddressMeta or null when there
      is no such metadata on buffer.
*/
gstnet.net_address_meta.NetAddressMeta bufferGetNetAddressMeta(gst.buffer.Buffer buffer)
{
  GstNetAddressMeta* _cretval;
  _cretval = gst_buffer_get_net_address_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstnet.net_address_meta.NetAddressMeta(cast(GstNetAddressMeta*)_cretval, No.Take) : null;
  return _retval;
}

/** */
gobject.types.GType netAddressMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_net_address_meta_api_get_type();
  return _retval;
}

/** */
gobject.types.GType netControlMessageMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_net_control_message_meta_api_get_type();
  return _retval;
}

/**
    Configures IP_TOS value of socket, i.e. sets QoS DSCP.

    Params:
      socket = Socket to configure
      qosDscp = QoS DSCP value
    Returns: TRUE if successful, FALSE in case an error occurred.
*/
bool netUtilsSetSocketTos(gio.socket.Socket socket, int qosDscp)
{
  bool _retval;
  _retval = cast(bool)gst_net_utils_set_socket_tos(socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, qosDscp);
  return _retval;
}

/**
    Deinitialize the GStreamer PTP subsystem and stop the PTP clock. If there
    are any remaining GstPtpClock instances, they won't be further synchronized
    to the PTP network clock.
*/
void ptpDeinit()
{
  gst_ptp_deinit();
}

/**
    Initialize the GStreamer PTP subsystem and create a PTP ordinary clock in
    slave-only mode for all domains on the given interfaces with the
    given clock_id.
    
    If clock_id is `GST_PTP_CLOCK_ID_NONE`, a clock id is automatically
    generated from the MAC address of the first network interface.
    
    This function is automatically called by [gstnet.ptp_clock.PtpClock.new_] with default
    parameters if it wasn't called before.

    Params:
      clockId = PTP clock id of this process' clock or `GST_PTP_CLOCK_ID_NONE`
      interfaces = network interfaces to run the clock on
    Returns: true if the GStreamer PTP clock subsystem could be initialized.
*/
bool ptpInit(ulong clockId, string[] interfaces = null)
{
  bool _retval;
  char*[] _tmpinterfaces;
  foreach (s; interfaces)
    _tmpinterfaces ~= s.toCString(No.Alloc);
  _tmpinterfaces ~= null;
  char** _interfaces = _tmpinterfaces.ptr;

  _retval = cast(bool)gst_ptp_init(clockId, _interfaces);
  return _retval;
}

/**
    Initialize the GStreamer PTP subsystem and create a PTP ordinary clock in
    slave-only mode according to the config.
    
    config is a #GstStructure with the following optional fields:
    $(LIST
      * #guint64 `clock-id`: The clock ID to use for the local clock. If the
          clock-id is not provided or `GST_PTP_CLOCK_ID_NONE` is provided, a clock
          id is automatically generated from the MAC address of the first network
          interface.
      * #GStrv `interfaces`: The interface names to listen on for PTP packets. If
          none are provided then all compatible interfaces will be used.
      * #guint `ttl`: The TTL to use for multicast packets sent out by GStreamer.
          This defaults to 1, i.e. packets will not leave the local network.
    )
      
    This function is automatically called by [gstnet.ptp_clock.PtpClock.new_] with default
    parameters if it wasn't called before.

    Params:
      config = Configuration for initializing the GStreamer PTP subsystem
    Returns: true if the GStreamer PTP clock subsystem could be initialized.
*/
bool ptpInitFull(gst.structure.Structure config)
{
  bool _retval;
  _retval = cast(bool)gst_ptp_init_full(cast(const(GstStructure)*)&config);
  return _retval;
}

/**
    Check if the GStreamer PTP clock subsystem is initialized.
    Returns: true if the GStreamer PTP clock subsystem is initialized.
*/
bool ptpIsInitialized()
{
  bool _retval;
  _retval = cast(bool)gst_ptp_is_initialized();
  return _retval;
}

/**
    Check if PTP clocks are generally supported on this system, and if previous
    initializations did not fail.
    Returns: true if PTP clocks are generally supported on this system, and
      previous initializations did not fail.
*/
bool ptpIsSupported()
{
  bool _retval;
  _retval = cast(bool)gst_ptp_is_supported();
  return _retval;
}

/**
    Installs a new statistics callback for gathering PTP statistics. See
    GstPtpStatisticsCallback for a list of statistics that are provided.

    Params:
      callback = GstPtpStatisticsCallback to call
    Returns: Id for the callback that can be passed to
      [gstnet.global.ptpStatisticsCallbackRemove]
*/
gulong ptpStatisticsCallbackAdd(gstnet.types.PtpStatisticsCallback callback)
{
  extern(C) gboolean _callbackCallback(ubyte domain, const(GstStructure)* stats, void* userData)
  {
    bool _dretval;
    auto _dlg = cast(gstnet.types.PtpStatisticsCallback*)userData;

    _dretval = (*_dlg)(domain, *cast(gst.structure.Structure*)stats);
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _callbackCB = callback ? &_callbackCallback : null;
  gulong _retval;
  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
  _retval = gst_ptp_statistics_callback_add(_callbackCB, _callback, _callbackDestroyCB);
  return _retval;
}

/**
    Removes a PTP statistics callback that was previously added with
    [gstnet.global.ptpStatisticsCallbackAdd].

    Params:
      id = Callback id to remove
*/
void ptpStatisticsCallbackRemove(gulong id)
{
  gst_ptp_statistics_callback_remove(id);
}
