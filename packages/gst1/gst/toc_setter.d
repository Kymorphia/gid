/// Module for [TocSetter] interface
module gst.toc_setter;

public import gst.toc_setter_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gst.c.functions;
import gst.c.types;
import gst.toc;
import gst.types;

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
interface TocSetter
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_toc_setter_get_type != &gidSymbolNotFound ? gst_toc_setter_get_type() : cast(GType)0;
  }

  /**
      Return current TOC the setter uses. The TOC should not be
      modified without making it writable first.
      Returns: TOC set, or null. Unref with
            gst_toc_unref() when no longer needed
  */
  gst.toc.Toc getToc();

  /**
      Reset the internal TOC. Elements should call this from within the
      state-change handler.
  */
  void reset();

  /**
      Set the given TOC on the setter. Previously set TOC will be
      unreffed before setting a new one.
  
      Params:
        toc = a #GstToc to set.
  */
  void setToc(gst.toc.Toc toc = null);
}

interface TocSetterGidBuilderImpl(T)
{
}
