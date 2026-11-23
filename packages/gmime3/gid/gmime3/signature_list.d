/// Module for [SignatureList] class
module gid.gmime3.signature_list;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.signature;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A collection of #GMimeSignature objects.
*/
class SignatureList : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_mime_signature_list_get_type != &gidSymbolNotFound ? g_mime_signature_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeSignatureList";
  }

  /** Returns `this`, for use in `with` statements. */
  override SignatureList self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.signature_list.SignatureList]
      Returns: New builder object
  */
  static SignatureListGidBuilder builder() nothrow
  {
    return new SignatureListGidBuilder;
  }

  /**
      Creates a new #GMimeSignatureList.
      Returns: a new #GMimeSignatureList.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeSignatureList* _cretval;
      _cretval = g_mime_signature_list_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Adds a #GMimeSignature to the #GMimeSignatureList.
  
      Params:
        sig = a #GMimeSignature
      Returns: the index of the added #GMimeSignature.
  */
  int add(gid.gmime3.signature.Signature sig) nothrow
  {
    int _retval;
    _retval = g_mime_signature_list_add(cast(GMimeSignatureList*)this._cPtr, sig ? cast(GMimeSignature*)sig._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Clears the list of addresses.
  */
  void clear() nothrow
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
  bool contains(gid.gmime3.signature.Signature sig) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_signature_list_contains(cast(GMimeSignatureList*)this._cPtr, sig ? cast(GMimeSignature*)sig._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the #GMimeSignature at the specified index.
  
      Params:
        index = index of #GMimeSignature to get
      Returns: the #GMimeSignature at the specified
        index or null if the index is out of range.
  */
  gid.gmime3.signature.Signature getSignature(int index) nothrow
  {
    GMimeSignature* _cretval;
    _cretval = g_mime_signature_list_get_signature(cast(GMimeSignatureList*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.signature.Signature)(cast(GMimeSignature*)_cretval, No.Take);
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
  int indexOf(gid.gmime3.signature.Signature sig) nothrow
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
  void insert(int index, gid.gmime3.signature.Signature sig) nothrow
  {
    g_mime_signature_list_insert(cast(GMimeSignatureList*)this._cPtr, index, sig ? cast(GMimeSignature*)sig._cPtr(No.Dup) : null);
  }

  /**
      Gets the length of the list.
      Returns: the number of #GMimeSignature objects in the list.
  */
  int length() nothrow
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
  bool remove(gid.gmime3.signature.Signature sig) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_signature_list_remove(cast(GMimeSignatureList*)this._cPtr, sig ? cast(GMimeSignature*)sig._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes a #GMimeSignature from the #GMimeSignatureList at the specified
      index.
  
      Params:
        index = index to remove
      Returns: true if an #GMimeSignature was removed or false otherwise.
  */
  bool removeAt(int index) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_signature_list_remove_at(cast(GMimeSignatureList*)this._cPtr, index);
    return _retval;
  }

  /**
      Sets the #GMimeSignature at the specified index to sig.
  
      Params:
        index = index of #GMimeSignature to set
        sig = a #GMimeSignature
  */
  void setSignature(int index, gid.gmime3.signature.Signature sig) nothrow
  {
    g_mime_signature_list_set_signature(cast(GMimeSignatureList*)this._cPtr, index, sig ? cast(GMimeSignature*)sig._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gmime3.signature_list.SignatureList]
class SignatureListGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.signature_list.SignatureList]
final class SignatureListGidBuilder : SignatureListGidBuilderImpl!SignatureListGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SignatureList build() nothrow
  {
    return new SignatureList(cast(void*)createGObject(SignatureList._getGType), Yes.Take);
  }
}
