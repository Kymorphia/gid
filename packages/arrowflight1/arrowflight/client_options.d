/// Module for [ClientOptions] class
module arrowflight.client_options;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class ClientOptions : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_client_options_get_type != &gidSymbolNotFound ? gaflight_client_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ClientOptions self()
  {
    return this;
  }

  /**
      Get `certificateChain` property.
      Returns: The client certificate to use if using Mutual TLS.
  */
  @property string certificateChain()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("certificate-chain");
  }

  /**
      Set `certificateChain` property.
      Params:
        propval = The client certificate to use if using Mutual TLS.
  */
  @property void certificateChain(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("certificate-chain", propval);
  }

  /**
      Get `disableServerVerification` property.
      Returns: Whether use TLS without validating the server certificate. Use
        with caution.
  */
  @property bool disableServerVerification()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("disable-server-verification");
  }

  /**
      Set `disableServerVerification` property.
      Params:
        propval = Whether use TLS without validating the server certificate. Use
          with caution.
  */
  @property void disableServerVerification(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("disable-server-verification", propval);
  }

  /**
      Get `overrideHostName` property.
      Returns: Override the host name checked by TLS. Use with caution.
  */
  @property string overrideHostName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("override-host-name");
  }

  /**
      Set `overrideHostName` property.
      Params:
        propval = Override the host name checked by TLS. Use with caution.
  */
  @property void overrideHostName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("override-host-name", propval);
  }

  /**
      Get `privateKey` property.
      Returns: The private key associated with the client certificate for Mutual
        TLS.
  */
  @property string privateKey()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("private-key");
  }

  /**
      Set `privateKey` property.
      Params:
        propval = The private key associated with the client certificate for Mutual
          TLS.
  */
  @property void privateKey(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("private-key", propval);
  }

  /**
      Get `tlsRootCertificates` property.
      Returns: Root certificates to use for validating server certificates.
  */
  @property string tlsRootCertificates()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("tls-root-certificates");
  }

  /**
      Set `tlsRootCertificates` property.
      Params:
        propval = Root certificates to use for validating server certificates.
  */
  @property void tlsRootCertificates(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("tls-root-certificates", propval);
  }

  /**
      Get `writeSizeLimitBytes` property.
      Returns: A soft limit on the number of bytes to write in a single batch
        when sending Arrow data to a server.
        
        Used to help limit server memory consumption. Only enabled if
        positive. When enabled, @GARROW_ERROR_IO may be yielded.
  */
  @property long writeSizeLimitBytes()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("write-size-limit-bytes");
  }

  /**
      Set `writeSizeLimitBytes` property.
      Params:
        propval = A soft limit on the number of bytes to write in a single batch
          when sending Arrow data to a server.
          
          Used to help limit server memory consumption. Only enabled if
          positive. When enabled, @GARROW_ERROR_IO may be yielded.
  */
  @property void writeSizeLimitBytes(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("write-size-limit-bytes", propval);
  }

  /** */
  this()
  {
    GAFlightClientOptions* _cretval;
    _cretval = gaflight_client_options_new();
    this(_cretval, Yes.Take);
  }
}
