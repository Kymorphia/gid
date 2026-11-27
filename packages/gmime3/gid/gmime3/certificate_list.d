/// Module for [CertificateList] class
module gid.gmime3.certificate_list;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.certificate;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A collection of #GMimeCertificate objects.
*/
@gidGir("CertificateList", "CertificateListClass")
class CertificateList : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_mime_certificate_list_get_type != &gidSymbolNotFound ? g_mime_certificate_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeCertificateList";
  }

  /** Returns `this`, for use in `with` statements. */
  override CertificateList self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.certificate_list.CertificateList]
      Returns: New builder object
  */
  static CertificateListGidBuilder builder() nothrow
  {
    return new CertificateListGidBuilder;
  }

  /**
      Creates a new #GMimeCertificateList.
      Returns: a new #GMimeCertificateList.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeCertificateList* _cretval;
      _cretval = g_mime_certificate_list_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Adds a #GMimeCertificate to the #GMimeCertificateList.
  
      Params:
        cert = a #GMimeCertificate
      Returns: the index of the added #GMimeCertificate.
  */
  int add(gid.gmime3.certificate.Certificate cert) nothrow
  {
    int _retval;
    _retval = g_mime_certificate_list_add(cast(GMimeCertificateList*)this._cPtr, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Clears the list of certificates.
  */
  void clear() nothrow
  {
    g_mime_certificate_list_clear(cast(GMimeCertificateList*)this._cPtr);
  }

  /**
      Checks whether or not the specified #GMimeCertificate is contained within
      the #GMimeCertificateList.
  
      Params:
        cert = a #GMimeCertificate
      Returns: true if the specified #GMimeCertificate is contained within the
        specified #GMimeCertificateList or false otherwise.
  */
  bool contains(gid.gmime3.certificate.Certificate cert) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_certificate_list_contains(cast(GMimeCertificateList*)this._cPtr, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the #GMimeCertificate at the specified index.
  
      Params:
        index = index of #GMimeCertificate to get
      Returns: the #GMimeCertificate at the specified
        index or null if the index is out of range.
  */
  gid.gmime3.certificate.Certificate getCertificate(int index) nothrow
  {
    GMimeCertificate* _cretval;
    _cretval = g_mime_certificate_list_get_certificate(cast(GMimeCertificateList*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.certificate.Certificate)(cast(GMimeCertificate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the index of the specified #GMimeCertificate inside the
      #GMimeCertificateList.
  
      Params:
        cert = a #GMimeCertificate
      Returns: the index of the requested #GMimeCertificate within the
        #GMimeCertificateList or %-1 if it is not contained within the
        #GMimeCertificateList.
  */
  int indexOf(gid.gmime3.certificate.Certificate cert) nothrow
  {
    int _retval;
    _retval = g_mime_certificate_list_index_of(cast(GMimeCertificateList*)this._cPtr, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Inserts a #GMimeCertificate into the #GMimeCertificateList at the specified
      index.
  
      Params:
        index = index to insert at
        cert = a #GMimeCertificate
  */
  void insert(int index, gid.gmime3.certificate.Certificate cert) nothrow
  {
    g_mime_certificate_list_insert(cast(GMimeCertificateList*)this._cPtr, index, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
  }

  /**
      Gets the length of the list.
      Returns: the number of #GMimeCertificate objects in the list.
  */
  int length() nothrow
  {
    int _retval;
    _retval = g_mime_certificate_list_length(cast(GMimeCertificateList*)this._cPtr);
    return _retval;
  }

  /**
      Removes a #GMimeCertificate from the #GMimeCertificateList.
  
      Params:
        cert = a #GMimeCertificate
      Returns: true if the specified #GMimeCertificate was removed or false
        otherwise.
  */
  bool remove(gid.gmime3.certificate.Certificate cert) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_certificate_list_remove(cast(GMimeCertificateList*)this._cPtr, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes a #GMimeCertificate from the #GMimeCertificateList at the specified
      index.
  
      Params:
        index = index of the certificate to remove
      Returns: true if a #GMimeCertificate was removed or false otherwise.
  */
  bool removeAt(int index) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_certificate_list_remove_at(cast(GMimeCertificateList*)this._cPtr, index);
    return _retval;
  }

  /**
      Sets the #GMimeCertificate at the specified index to cert.
  
      Params:
        index = index of #GMimeCertificate to set
        cert = a #GMimeCertificate
  */
  void setCertificate(int index, gid.gmime3.certificate.Certificate cert) nothrow
  {
    g_mime_certificate_list_set_certificate(cast(GMimeCertificateList*)this._cPtr, index, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gmime3.certificate_list.CertificateList]
class CertificateListGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.certificate_list.CertificateList]
final class CertificateListGidBuilder : CertificateListGidBuilderImpl!CertificateListGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CertificateList build() nothrow
  {
    return new CertificateList(cast(void*)createGObject(CertificateList._getGType), Yes.Take);
  }
}
