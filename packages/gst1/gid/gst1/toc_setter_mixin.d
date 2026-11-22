/// Module for [TocSetter] interface mixin
module gid.gst1.toc_setter_mixin;

public import gid.core.basictypes;
public import gid.gst1.toc_setter_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gst1.c.functions;
public import gid.gst1.c.types;
public import gid.gst1.toc;
public import gid.gst1.types;

/**
    Element interface that allows setting of the TOC.
    
    Elements that support some kind of chapters or editions (or tracks like in
    the FLAC cue sheet) will implement this interface.
    
    If you just want to retrieve the TOC in your application then all you
    need to do is watch for TOC messages on your pipeline's bus (or you can
    perform TOC query). This interface is only for setting TOC data, not for
    extracting it. To set TOC from the application, find proper tocsetter element
    and set TOC using [gid.gst1.toc_setter.TocSetter.setToc].
    
    Elements implementing the #GstTocSetter interface can extend existing TOC
    by getting extend UID for that (you can use [gid.gst1.toc.Toc.findEntry] to retrieve it)
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
  override gid.gst1.toc.Toc getToc() nothrow
  {
    GstToc* _cretval;
    _cretval = gst_toc_setter_get_toc(cast(GstTocSetter*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.toc.Toc(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Reset the internal TOC. Elements should call this from within the
      state-change handler.
  */
  override void reset() nothrow
  {
    gst_toc_setter_reset(cast(GstTocSetter*)this._cPtr);
  }

  /**
      Set the given TOC on the setter. Previously set TOC will be
      unreffed before setting a new one.
  
      Params:
        toc = a #GstToc to set.
  */
  override void setToc(gid.gst1.toc.Toc toc = null) nothrow
  {
    gst_toc_setter_set_toc(cast(GstTocSetter*)this._cPtr, toc ? cast(GstToc*)toc._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gst1.toc_setter.TocSetter]
template TocSetterGidBuilderT()
{
}
