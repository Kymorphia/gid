/// Module for [SignatureList] class
module gmime.signature_list;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.signature;
import gmime.types;
import gobject.object;

/**
    A collection of #GMimeSignature objects.
*/
class SignatureList : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_signature_list_get_type != &gidSymbolNotFound ? g_mime_signature_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SignatureList self()
  {
    return this;
  }

  /**
      Creates a new #GMimeSignatureList.
      Returns: a new #GMimeSignatureList.
  */
  this()
  {
    GMimeSignatureList* _cretval;
    _cretval = g_mime_signature_list_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a #GMimeSignature to the #GMimeSignatureList.
  
      Params:
        sig = a #GMimeSignature
      Returns: the index of the added #GMimeSignature.
  */
  int add(gmime.signature.Signature sig)
  {
    int _retval;
    _retval = g_mime_signature_list_add(cast(GMimeSignatureList*)this._cPtr, sig ? cast(GMimeSignature*)sig._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Clears the list of addresses.
  */
  void clear()
  {
    g_mime_signature_list_clear(cast(GMimeSignatureList*)this._cPtr);
  }

  /**
      Checks whether or not the specified #GMimeSignature is contained within
      the #GMimeSignatureList.
  
      Params:
        sig = a #GMimeSignature
      Returns: true if the specified #GMimeSignature is contained within the
        specified #GMimeSignatureList or false otherwise.
  */
  bool contains(gmime.signature.Signature sig)
  {
    bool _retval;
    _retval = g_mime_signature_list_contains(cast(GMimeSignatureList*)this._cPtr, sig ? cast(GMimeSignature*)sig._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the #GMimeSignature at the specified index.
  
      Params:
        index = index of #GMimeSignature to get
      Returns: the #GMimeSignature at the specified
        index or null if the index is out of range.
  */
  gmime.signature.Signature getSignature(int index)
  {
    GMimeSignature* _cretval;
    _cretval = g_mime_signature_list_get_signature(cast(GMimeSignatureList*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.signature.Signature)(cast(GMimeSignature*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the index of the specified #GMimeSignature inside the
      #GMimeSignatureList.
  
      Params:
        sig = a #GMimeSignature
      Returns: the index of the requested #GMimeSignature within the
        #GMimeSignatureList or %-1 if it is not contained within the
        #GMimeSignatureList.
  */
  int indexOf(gmime.signature.Signature sig)
  {
    int _retval;
    _retval = g_mime_signature_list_index_of(cast(GMimeSignatureList*)this._cPtr, sig ? cast(GMimeSignature*)sig._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Inserts a #GMimeSignature into the #GMimeSignatureList at the specified
      index.
  
      Params:
        index = index to insert at
        sig = a #GMimeSignature
  */
  void insert(int index, gmime.signature.Signature sig)
  {
    g_mime_signature_list_insert(cast(GMimeSignatureList*)this._cPtr, index, sig ? cast(GMimeSignature*)sig._cPtr(No.Dup) : null);
  }

  /**
      Gets the length of the list.
      Returns: the number of #GMimeSignature objects in the list.
  */
  int length()
  {
    int _retval;
    _retval = g_mime_signature_list_length(cast(GMimeSignatureList*)this._cPtr);
    return _retval;
  }

  /**
      Removes a #GMimeSignature from the #GMimeSignatureList.
  
      Params:
        sig = a #GMimeSignature
      Returns: true if the specified #GMimeSignature was removed or false
        otherwise.
  */
  bool remove(gmime.signature.Signature sig)
  {
    bool _retval;
    _retval = g_mime_signature_list_remove(cast(GMimeSignatureList*)this._cPtr, sig ? cast(GMimeSignature*)sig._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes a #GMimeSignature from the #GMimeSignatureList at the specified
      index.
  
      Params:
        index = index to remove
      Returns: true if an #GMimeSignature was removed or false otherwise.
  */
  bool removeAt(int index)
  {
    bool _retval;
    _retval = g_mime_signature_list_remove_at(cast(GMimeSignatureList*)this._cPtr, index);
    return _retval;
  }

  /**
      Sets the #GMimeSignature at the specified index to sig.
  
      Params:
        index = index of #GMimeSignature to set
        sig = a #GMimeSignature
  */
  void setSignature(int index, gmime.signature.Signature sig)
  {
    g_mime_signature_list_set_signature(cast(GMimeSignatureList*)this._cPtr, index, sig ? cast(GMimeSignature*)sig._cPtr(No.Dup) : null);
  }
}
