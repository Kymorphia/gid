/// Module for [Backend] interface mixin
module gid.secret1.backend_mixin;

public import gid.core.basictypes;
public import gid.secret1.backend_iface_proxy;
public import gid.core.utils;
public import gid.gio2.async_result;
public import gid.gio2.cancellable;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.secret1.c.functions;
public import gid.secret1.c.types;
public import gid.secret1.types;

/**
    #SecretBackend represents a backend implementation of password
    storage.
*/
template BackendT()
{

  /**
      Get `flags` property.
      Returns: A set of flags describing which parts of the secret backend have
        been initialized.
  */
  @property gid.secret1.types.ServiceFlags flags() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.secret1.types.ServiceFlags)("flags");
  }


}

/// Fluent builder implementation template for [gid.secret1.backend.Backend]
template BackendGidBuilderT()
{

  /**
      Set `flags` property.
      Params:
        propval = A set of flags describing which parts of the secret backend have
          been initialized.
      Returns: Builder instance for fluent chaining
  */
  T flags(gid.secret1.types.ServiceFlags propval) nothrow
  {
    return setProperty("flags", propval);
  }
}
