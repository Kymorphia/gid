/// Module for [Retrievable] interface
module secret.retrievable;

public import secret.retrievable_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import secret.c.functions;
import secret.c.types;
import secret.types;
import secret.value;

/**
    A read-only view of a secret item in the Secret Service.
    
    #SecretRetrievable provides a read-only view of a secret item
    stored in the Secret Service.
    
    Each item has a value, represented by a `struct@Value`, which can be
    retrieved by [secret.retrievable.Retrievable.retrieveSecret] and
    [secret.retrievable.Retrievable.retrieveSecretFinish].
*/
interface Retrievable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())secret_retrievable_get_type != &gidSymbolNotFound ? secret_retrievable_get_type() : cast(GType)0;
  }

  /**
      Get `created` property.
      Returns: The date and time (in seconds since the UNIX epoch) that this
        item was created.
  */
  @property ulong created();

  /**
      Set `created` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was created.
  */
  @property void created(ulong propval);

  /**
      Get `label` property.
      Returns: The human readable label for the item.
  */
  @property string label();

  /**
      Set `label` property.
      Params:
        propval = The human readable label for the item.
  */
  @property void label(string propval);

  /**
      Get `modified` property.
      Returns: The date and time (in seconds since the UNIX epoch) that this
        item was last modified.
  */
  @property ulong modified();

  /**
      Set `modified` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was last modified.
  */
  @property void modified(ulong propval);

  /**
      Get the attributes of this object.
      
      The attributes are a mapping of string keys to string values.
      Attributes are used to search for items. Attributes are not stored
      or transferred securely by the secret service.
      
      Do not modify the attribute returned by this method.
      Returns: a new reference
          to the attributes, which should not be modified, and
          released with [glib.hash_table.HashTable.unref]
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
  void retrieveSecret(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Complete asynchronous operation to retrieve the secret value of this object.
  
      Params:
        result = asynchronous result passed to callback
      Returns: the secret value which should be
          released with [secret.value.Value.unref], or null
      Throws: [ErrorWrap]
  */
  secret.value.Value retrieveSecretFinish(gio.async_result.AsyncResult result);

  /**
      Retrieve the secret value of this object synchronously.
      
      Each retrievable object has a single secret which might be a
      password or some other secret binary value.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        cancellable = optional cancellation object
      Returns: the secret value which should be
          released with [secret.value.Value.unref], or null
      Throws: [ErrorWrap]
  */
  secret.value.Value retrieveSecretSync(gio.cancellable.Cancellable cancellable = null);
}
