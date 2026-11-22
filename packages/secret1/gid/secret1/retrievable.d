/// Module for [Retrievable] interface
module gid.secret1.retrievable;

public import gid.core.basictypes;
public import gid.secret1.retrievable_iface_proxy;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.secret1.c.functions;
import gid.secret1.c.types;
import gid.secret1.types;
import gid.secret1.value;

/**
    A read-only view of a secret item in the Secret Service.
    
    #SecretRetrievable provides a read-only view of a secret item
    stored in the Secret Service.
    
    Each item has a value, represented by a [gid.secret1.value.Value], which can be
    retrieved by [gid.secret1.retrievable.Retrievable.retrieveSecret] and
    [gid.secret1.retrievable.Retrievable.retrieveSecretFinish].
*/
interface Retrievable : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())secret_retrievable_get_type != &gidSymbolNotFound ? secret_retrievable_get_type() : cast(GType)0;
  }

  /**
      Get `created` property.
      Returns: The date and time (in seconds since the UNIX epoch) that this
        item was created.
  */
  @property ulong created() nothrow;

  /**
      Set `created` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was created.
  */
  @property void created(ulong propval) nothrow;

  /**
      Get `label` property.
      Returns: The human readable label for the item.
  */
  @property string label() nothrow;

  /**
      Set `label` property.
      Params:
        propval = The human readable label for the item.
  */
  @property void label(string propval) nothrow;

  /**
      Get `modified` property.
      Returns: The date and time (in seconds since the UNIX epoch) that this
        item was last modified.
  */
  @property ulong modified() nothrow;

  /**
      Set `modified` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was last modified.
  */
  @property void modified(ulong propval) nothrow;

  /**
      Get the attributes of this object.
      
      The attributes are a mapping of string keys to string values.
      Attributes are used to search for items. Attributes are not stored
      or transferred securely by the secret service.
      
      Do not modify the attribute returned by this method.
      Returns: a new reference
          to the attributes, which should not be modified, and
          released with [gid.glib2.hash_table.HashTable.unref]
  */
  string[string] getAttributes();

  /**
      Get the created date and time of the object.
      
      The return value is the number of seconds since the unix epoch, January 1st
      1970.
      Returns: the created date and time
  */
  ulong getCreated();

  /**
      Get the label of this item.
      Returns: the label, which should be freed with `funcGLib.free`
  */
  string getLabel();

  /**
      Get the modified date and time of the object.
      
      The return value is the number of seconds since the unix epoch, January 1st
      1970.
      Returns: the modified date and time
  */
  ulong getModified();

  /**
      Retrieve the secret value of this object.
      
      Each retrievable object has a single secret which might be a
      password or some other secret binary value.
      
      This function returns immediately and completes asynchronously.
  
      Params:
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void retrieveSecret(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /**
      Complete asynchronous operation to retrieve the secret value of this object.
  
      Params:
        result = asynchronous result passed to callback
      Returns: the secret value which should be
          released with [gid.secret1.value.Value.unref], or null
      Throws: [ErrorWrap]
  */
  gid.secret1.value.Value retrieveSecretFinish(gid.gio2.async_result.AsyncResult result);

  /**
      Retrieve the secret value of this object synchronously.
      
      Each retrievable object has a single secret which might be a
      password or some other secret binary value.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        cancellable = optional cancellation object
      Returns: the secret value which should be
          released with [gid.secret1.value.Value.unref], or null
      Throws: [ErrorWrap]
  */
  gid.secret1.value.Value retrieveSecretSync(gid.gio2.cancellable.Cancellable cancellable = null);
}

/// Fluent builder implementation template for [gid.secret1.retrievable.Retrievable]
interface RetrievableGidBuilderImpl(T)
{

  /**
      Set `created` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was created.
      Returns: Builder instance for fluent chaining
  */
  T created(ulong propval) nothrow;

  /**
      Set `label` property.
      Params:
        propval = The human readable label for the item.
      Returns: Builder instance for fluent chaining
  */
  T label(string propval) nothrow;

  /**
      Set `modified` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was last modified.
      Returns: Builder instance for fluent chaining
  */
  T modified(ulong propval) nothrow;
}
