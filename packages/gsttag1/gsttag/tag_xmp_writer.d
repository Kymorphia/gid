/// Module for [TagXmpWriter] interface
module gsttag.tag_xmp_writer;

public import gsttag.tag_xmp_writer_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gst.buffer;
import gst.tag_list;
import gsttag.c.functions;
import gsttag.c.types;
import gsttag.types;

/**
    This interface is implemented by elements that are able to do XMP serialization. Examples for
    such elements are #jifmux and #qtmux.
    
    Applications can use this interface to configure which XMP schemas should be used when serializing
    tags into XMP. Schemas are represented by their names, a full list of the supported schemas can be
    obtained from [gsttag.global.tagXmpListSchemas]. By default, all schemas are used.
*/
interface TagXmpWriter
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_tag_xmp_writer_get_type != &gidSymbolNotFound ? gst_tag_xmp_writer_get_type() : cast(GType)0;
  }

  /**
      Adds all available XMP schemas to the configuration. Meaning that
      all will be used.
  */
  void addAllSchemas();

  /**
      Adds schema to the list schemas
  
      Params:
        schema = the schema to be added
  */
  void addSchema(string schema);

  /**
      Checks if schema is going to be used
  
      Params:
        schema = the schema to test
      Returns: true if it is going to be used
  */
  bool hasSchema(string schema);

  /**
      Removes all schemas from the list of schemas to use. Meaning that no
      XMP will be generated.
  */
  void removeAllSchemas();

  /**
      Removes a schema from the list of schemas to use. Nothing is done if
      the schema wasn't in the list
  
      Params:
        schema = the schema to remove
  */
  void removeSchema(string schema);

  /** */
  gst.buffer.Buffer tagListToXmpBuffer(gst.tag_list.TagList taglist, bool readOnly);
}

interface TagXmpWriterGidBuilderImpl(T)
{
}
