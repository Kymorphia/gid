/// Module for [NetTimeProvider] class
module gid.gstnet1.net_time_provider;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.initable;
import gid.gio2.initable_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.clock;
import gid.gst1.object;
import gid.gstnet1.c.functions;
import gid.gstnet1.c.types;
import gid.gstnet1.types;

/**
    This object exposes the time of a #GstClock on the network.
    
    A #GstNetTimeProvider is created with [gid.gstnet1.net_time_provider.NetTimeProvider.new_] which
    takes a #GstClock, an address and a port number as arguments.
    
    After creating the object, a client clock such as #GstNetClientClock can
    query the exposed clock over the network for its values.
    
    The #GstNetTimeProvider typically wraps the clock used by a #GstPipeline.
*/
class NetTimeProvider : gid.gst1.object.ObjectWrap, gid.gio2.initable.Initable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_net_time_provider_get_type != &gidSymbolNotFound ? gst_net_time_provider_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstNetTimeProvider";
  }

  /** Returns `this`, for use in `with` statements. */
  override NetTimeProvider self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstnet1.net_time_provider.NetTimeProvider]
      Returns: New builder object
  */
  static NetTimeProviderGidBuilder builder() nothrow
  {
    return new NetTimeProviderGidBuilder;
  }

  /** */
  @property bool active() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("active");
  }

  /** */
  @property void active(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("active", propval);
  }

  /** */
  @property string address() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("address");
  }

  /** */
  @property gid.gst1.clock.Clock clock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.clock.Clock)("clock");
  }

  /** */
  @property int port() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("port");
  }

  /** */
  @property int qosDscp() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("qos-dscp");
  }

  /** */
  @property void qosDscp(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("qos-dscp", propval);
  }

  mixin InitableT!();

  /**
      Allows network clients to get the current time of clock.
  
      Params:
        clock = a #GstClock to export over the network
        address = an address to bind on as a dotted quad
                    (xxx.xxx.xxx.xxx), IPv6 address, or NULL to bind to all addresses
        port = a port to bind on, or 0 to let the kernel choose
      Returns: the new #GstNetTimeProvider, or NULL on error
  */
  this(gid.gst1.clock.Clock clock, string address, int port) nothrow
  {
    GstNetTimeProvider* _cretval;
    const(char)* _address = address.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gst_net_time_provider_new(clock ? cast(GstClock*)clock._cPtr(No.Dup) : null, _address, port);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gstnet1.net_time_provider.NetTimeProvider]
class NetTimeProviderGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T, gid.gio2.initable.InitableGidBuilderImpl!T
{

  mixin InitableGidBuilderT!();

  /** */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }

  /** */
  T address(string propval) nothrow
  {
    return setProperty("address", propval);
  }

  /** */
  T clock(gid.gst1.clock.Clock propval) nothrow
  {
    return setProperty("clock", propval);
  }

  /** */
  T port(int propval) nothrow
  {
    return setProperty("port", propval);
  }

  /** */
  T qosDscp(int propval) nothrow
  {
    return setProperty("qos-dscp", propval);
  }
}

/// Fluent builder for [gid.gstnet1.net_time_provider.NetTimeProvider]
final class NetTimeProviderGidBuilder : NetTimeProviderGidBuilderImpl!NetTimeProviderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NetTimeProvider build() nothrow
  {
    return new NetTimeProvider(cast(void*)createGObject(NetTimeProvider._getGType), Yes.Take);
  }
}
