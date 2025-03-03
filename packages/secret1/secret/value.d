module secret.value;

import gid.gid;
import glib.types;
import gobject.boxed;
import secret.c.functions;
import secret.c.types;
import secret.types;

/**
 * A value containing a secret
 * A #SecretValue contains a password or other secret value.
 * Use [secret.value.ValueSecret.get] to get the actual secret data, such as a password.
 * The secret data is not necessarily null-terminated, unless the content type
 * is "text/plain".
 * Each #SecretValue has a content type. For passwords, this is `text/plain`.
 * Use [secret.value.ValueSecret.getContentType] to look at the content type.
 * #SecretValue is reference counted and immutable. The secret data is only
 * freed when all references have been released via [secret.value.ValueSecret.unref].
 */
class ValueSecret : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())secret_value_get_type != &gidSymbolNotFound ? secret_value_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Create a #SecretValue for the secret data passed in.
   * The secret data is copied into non-pageable 'secure' memory.
   * If the length is less than zero, then secret is assumed to be
   * null-terminated.
   * Params:
   *   secret = the secret data
   *   length = the length of the data
   *   contentType = the content type of the data
   * Returns: the new #SecretValue
   */
  this(string secret, ptrdiff_t length, string contentType)
  {
    SecretValue* _cretval;
    const(char)* _secret = secret.toCString(No.Alloc);
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = secret_value_new(_secret, length, _contentType);
    this(_cretval, Yes.Take);
  }

  /**
   * Create a #SecretValue for the secret data passed in.
   * The secret data is not copied, and will later be freed with the destroy
   * function.
   * If the length is less than zero, then secret is assumed to be
   * null-terminated.
   * Params:
   *   secretData = the secret data
   *   length = the length of the data
   *   contentType = the content type of the data
   *   destroy = function to call to free the secret data
   * Returns: the new #SecretValue
   */
  static secret.value.ValueSecret newFull(string secretData, ptrdiff_t length, string contentType, glib.types.DestroyNotify destroy)
  {
    extern(C) void _destroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;

    SecretValue* _cretval;
    char* _secretData = secretData.toCString(No.Alloc);
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = secret_value_new_full(_secretData, length, _contentType, _destroyCB);
    auto _retval = _cretval ? new secret.value.ValueSecret(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Get the secret data in the #SecretValue.
   * The value is not necessarily null-terminated unless it was created with
   * [secret.value.ValueSecret.new_] or a null-terminated string was passed to
   * [secret.value.ValueSecret.newFull].
   * Returns: the secret data
   */
  ubyte[] get()
  {
    const(ubyte)* _cretval;
    size_t _cretlength;
    _cretval = secret_value_get(cast(SecretValue*)cPtr, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  /**
   * Get the content type of the secret value, such as
   * `text/plain`.
   * Returns: the content type
   */
  string getContentType()
  {
    const(char)* _cretval;
    _cretval = secret_value_get_content_type(cast(SecretValue*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Get the secret data in the #SecretValue if it contains a textual
   * value.
   * The content type must be `text/plain`.
   * Returns: the content type
   */
  string getText()
  {
    const(char)* _cretval;
    _cretval = secret_value_get_text(cast(SecretValue*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Unreference a #SecretValue and steal the secret data in
   * #SecretValue as nonpageable memory.
   * Params:
   *   length = the length of the secret
   * Returns: a new password string stored in nonpageable memory
   *   which must be freed with funcpassword_free when done
   */
  string unrefToPassword(ref size_t length)
  {
    char* _cretval;
    _cretval = secret_value_unref_to_password(cast(SecretValue*)cPtr, cast(size_t*)&length);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
