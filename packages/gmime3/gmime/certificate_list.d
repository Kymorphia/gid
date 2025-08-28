/// Module for [CertificateList] class
module gmime.certificate_list;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.certificate;
import gmime.types;
import gobject.object;

/**
    A collection of #GMimeCertificate objects.
*/
class CertificateList : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_certificate_list_get_type != &gidSymbolNotFound ? g_mime_certificate_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CertificateList self()
  {
    return this;
  }

  /**
      Creates a new #GMimeCertificateList.
      Returns: a new #GMimeCertificateList.
  */
  this()
  {
    GMimeCertificateList* _cretval;
    _cretval = g_mime_certificate_list_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a #GMimeCertificate to the #GMimeCertificateList.
  
      Params:
        cert = a #GMimeCertificate
      Returns: the index of the added #GMimeCertificate.
  */
  int add(gmime.certificate.Certificate cert)
  {
    int _retval;
    _retval = g_mime_certificate_list_add(cast(GMimeCertificateList*)this._cPtr, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Clears the list of certificates.
  */
  void clear()
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
  bool contains(gmime.certificate.Certificate cert)
  {
    bool _retval;
    _retval = g_mime_certificate_list_contains(cast(GMimeCertificateList*)this._cPtr, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the #GMimeCertificate at the specified index.
  
      Params:
        index = index of #GMimeCertificate to get
      Returns: the #GMimeCertificate at the specified
        index or null if the index is out of range.
  */
  gmime.certificate.Certificate getCertificate(int index)
  {
    GMimeCertificate* _cretval;
    _cretval = g_mime_certificate_list_get_certificate(cast(GMimeCertificateList*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.certificate.Certificate)(cast(GMimeCertificate*)_cretval, Yes.Take);
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
  int indexOf(gmime.certificate.Certificate cert)
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
  void insert(int index, gmime.certificate.Certificate cert)
  {
    g_mime_certificate_list_insert(cast(GMimeCertificateList*)this._cPtr, index, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
  }

  /**
      Gets the length of the list.
      Returns: the number of #GMimeCertificate objects in the list.
  */
  int length()
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
  bool remove(gmime.certificate.Certificate cert)
  {
    bool _retval;
    _retval = g_mime_certificate_list_remove(cast(GMimeCertificateList*)this._cPtr, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes a #GMimeCertificate from the #GMimeCertificateList at the specified
      index.
  
      Params:
        index = index of the certificate to remove
      Returns: true if a #GMimeCertificate was removed or false otherwise.
  */
  bool removeAt(int index)
  {
    bool _retval;
    _retval = g_mime_certificate_list_remove_at(cast(GMimeCertificateList*)this._cPtr, index);
    return _retval;
  }

  /**
      Sets the #GMimeCertificate at the specified index to cert.
  
      Params:
        index = index of #GMimeCertificate to set
        cert = a #GMimeCertificate
  */
  void setCertificate(int index, gmime.certificate.Certificate cert)
  {
    g_mime_certificate_list_set_certificate(cast(GMimeCertificateList*)this._cPtr, index, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
  }
}
