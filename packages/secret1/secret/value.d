/// Module for [Value] class
module secret.value;

import gid.gid;
import glib.types;
import gobject.boxed;
import secret.c.functions;
import secret.c.types;
import secret.types;

/**
    A value containing a secret
    
    A #SecretValue contains a password or other secret value.
    
    Use [secret.value.Value.get] to get the actual secret data, such as a password.
    The secret data is not necessarily null-terminated, unless the content type
    is "text/plain".
    
    Each #SecretValue has a content type. For passwords, this is `text/plain`.
    Use [secret.value.Value.getContentType] to look at the content type.
    
    #SecretValue is reference counted and immutable. The secret data is only
    freed when all references have been released via [secret.value.Value.unref].
*/
class Value : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())secret_value_get_type != &gidSymbolNotFound ? secret_value_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Value self()
  {
    return this;
  }

  /**
      Create a #SecretValue for the secret data passed in.
      
      The secret data is copied into non-pageable 'secure' memory.
      
      If the length is less than zero, then secret is assumed to be
      null-terminated.
  
      Params:
        secret = the secret data
        contentType = the content type of the data
      Returns: the new #SecretValue
  */
  this(string secret, string contentType)
  {
    SecretValue* _cretval;
    ptrdiff_t _length;
    if (secret)
      _length = cast(ptrdiff_t)secret.length;

    auto _secret = cast(const(char)*)secret.ptr;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = secret_value_new(_secret, _length, _contentType);
    this(_cretval, Yes.Take);
  }

  /**
      Create a #SecretValue for the secret data passed in.
      
      The secret data is not copied, and will later be freed with the destroy
      function.
      
      If the length is less than zero, then secret is assumed to be
      null-terminated.
  
      Params:
        secretData = the secret data
        contentType = the content type of the data
        destroy = function to call to free the secret data
      Returns: the new #SecretValue
  */
  static secret.value.Value newFull(string secretData, string contentType, glib.types.DestroyNotify destroy)
  {
    extern(C) void _destroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;
    SecretValue* _cretval;
    ptrdiff_t _length;
    if (secretData)
      _length = cast(ptrdiff_t)secretData.length;

    auto _secretData = cast(char*)secretData.ptr;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = secret_value_new_full(_secretData, _length, _contentType, _destroyCB);
    auto _retval = _cretval ? new secret.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the secret data in the #SecretValue.
      
      The value is not necessarily null-terminated unless it was created with
      [secret.value.Value.new_] or a null-terminated string was passed to
      [secret.value.Value.newFull].
      Returns: the secret data
  */
  ubyte[] get()
  {
    const(ubyte)* _cretval;
    size_t _cretlength;
    _cretval = secret_value_get(cast(SecretValue*)this._cPtr, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Get the content type of the secret value, such as
      `text/plain`.
      Returns: the content type
  */
  string getContentType()
  {
    const(char)* _cretval;
    _cretval = secret_value_get_content_type(cast(SecretValue*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the secret data in the #SecretValue if it contains a textual
      value.
      
      The content type must be `text/plain`.
      Returns: the content type
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = secret_value_get_text(cast(SecretValue*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Unreference a #SecretValue and steal the secret data in
      #SecretValue as nonpageable memory.
  
      Params:
        length = the length of the secret
      Returns: a new password string stored in nonpageable memory
          which must be freed with `funcpassword_free` when done
  */
  string unrefToPassword(ref size_t length)
  {
    char* _cretval;
    _cretval = secret_value_unref_to_password(cast(SecretValue*)this._cPtr, cast(size_t*)&length);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
