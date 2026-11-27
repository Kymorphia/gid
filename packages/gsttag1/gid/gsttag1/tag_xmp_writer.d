/// Module for [TagXmpWriter] interface
module gid.gsttag1.tag_xmp_writer;

public import gid.core.basictypes;
public import gid.gsttag1.tag_xmp_writer_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.buffer;
import gid.gst1.tag_list;
import gid.gsttag1.c.functions;
import gid.gsttag1.c.types;
import gid.gsttag1.types;

/**
    This interface is implemented by elements that are able to do XMP serialization. Examples for
    such elements are #jifmux and #qtmux.
    
    Applications can use this interface to configure which XMP schemas should be used when serializing
    tags into XMP. Schemas are represented by their names, a full list of the supported schemas can be
    obtained from [gid.gsttag1.global.tagXmpListSchemas]. By default, all schemas are used.
*/
@gidGir("TagXmpWriter", "TagXmpWriterInterface")
interface TagXmpWriter : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
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
  gid.gst1.buffer.Buffer tagListToXmpBuffer(gid.gst1.tag_list.TagList taglist, bool readOnly);
}

/// Fluent builder implementation template for [gid.gsttag1.tag_xmp_writer.TagXmpWriter]
interface TagXmpWriterGidBuilderImpl(T)
{
}
