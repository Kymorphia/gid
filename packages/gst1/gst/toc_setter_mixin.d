/// Module for [TocSetter] interface mixin
module gst.toc_setter_mixin;

public import gst.toc_setter_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gst.c.functions;
public import gst.c.types;
public import gst.toc;
public import gst.types;

/**
    Element interface that allows setting of the TOC.
    
    Elements that support some kind of chapters or editions (or tracks like in
    the FLAC cue sheet) will implement this interface.
    
    If you just want to retrieve the TOC in your application then all you
    need to do is watch for TOC messages on your pipeline's bus (or you can
    perform TOC query). This interface is only for setting TOC data, not for
    extracting it. To set TOC from the application, find proper tocsetter element
    and set TOC using [gst.toc_setter.TocSetter.setToc].
    
    Elements implementing the #GstTocSetter interface can extend existing TOC
    by getting extend UID for that (you can use [gst.toc.Toc.findEntry] to retrieve it)
    with any TOC entries received from downstream.
*/
template TocSetterT()
{

  /**
      Return current TOC the setter uses. The TOC should not be
      modified without making it writable first.
      Returns: TOC set, or null. Unref with
            gst_toc_unref() when no longer needed
  */
  override gst.toc.Toc getToc()
  {
    GstToc* _cretval;
    _cretval = gst_toc_setter_get_toc(cast(GstTocSetter*)this._cPtr);
    auto _retval = _cretval ? new gst.toc.Toc(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Reset the internal TOC. Elements should call this from within the
      state-change handler.
  */
  override void reset()
  {
    gst_toc_setter_reset(cast(GstTocSetter*)this._cPtr);
  }

  /**
      Set the given TOC on the setter. Previously set TOC will be
      unreffed before setting a new one.
  
      Params:
        toc = a #GstToc to set.
  */
  override void setToc(gst.toc.Toc toc = null)
  {
    gst_toc_setter_set_toc(cast(GstTocSetter*)this._cPtr, toc ? cast(GstToc*)toc._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gst.toc_setter.TocSetter]
template TocSetterGidBuilderT()
{
}
