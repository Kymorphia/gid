/// Module for [Backend] interface mixin
module secret.backend_mixin;

public import secret.backend_iface_proxy;
public import gid.gid;
public import gio.async_result;
public import gio.cancellable;
public import gio.types;
public import glib.error;
public import gobject.gid_builder;
public import gobject.object;
public import secret.c.functions;
public import secret.c.types;
public import secret.types;

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
  @property secret.types.ServiceFlags flags()
  {
    return gobject.object.ObjectWrap.getProperty!(secret.types.ServiceFlags)("flags");
  }


}

template BackendGidBuilderT()
{

  /**
      Set `flags` property.
      Params:
        propval = A set of flags describing which parts of the secret backend have
          been initialized.
      Returns: Builder instance for fluent chaining
  */
  T flags(secret.types.ServiceFlags propval)
  {
    return setProperty("flags", propval);
  }
}
