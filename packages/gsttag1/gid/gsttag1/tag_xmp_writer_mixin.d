/// Module for [TagXmpWriter] interface mixin
module gid.gsttag1.tag_xmp_writer_mixin;

public import gid.core.basictypes;
public import gid.gsttag1.tag_xmp_writer_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gst1.buffer;
public import gid.gst1.tag_list;
public import gid.gsttag1.c.functions;
public import gid.gsttag1.c.types;
public import gid.gsttag1.types;

/**
    This interface is implemented by elements that are able to do XMP serialization. Examples for
    such elements are #jifmux and #qtmux.
    
    Applications can use this interface to configure which XMP schemas should be used when serializing
    tags into XMP. Schemas are represented by their names, a full list of the supported schemas can be
    obtained from [gid.gsttag1.global.tagXmpListSchemas]. By default, all schemas are used.
*/
template TagXmpWriterT()
{

  /**
      Adds all available XMP schemas to the configuration. Meaning that
      all will be used.
  */
  override void addAllSchemas() nothrow
  {
    gst_tag_xmp_writer_add_all_schemas(cast(GstTagXmpWriter*)this._cPtr);
  }

  /**
      Adds schema to the list schemas
  
      Params:
        schema = the schema to be added
  */
  override void addSchema(string schema) nothrow
  {
    const(char)* _schema = schema.toCString!(No.Malloc, No.Nullable);
    gst_tag_xmp_writer_add_schema(cast(GstTagXmpWriter*)this._cPtr, _schema);
  }

  /**
      Checks if schema is going to be used
  
      Params:
        schema = the schema to test
      Returns: true if it is going to be used
  */
  override bool hasSchema(string schema) nothrow
  {
    bool _retval;
    const(char)* _schema = schema.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_tag_xmp_writer_has_schema(cast(GstTagXmpWriter*)this._cPtr, _schema);
    return _retval;
  }

  /**
      Removes all schemas from the list of schemas to use. Meaning that no
      XMP will be generated.
  */
  override void removeAllSchemas() nothrow
  {
    gst_tag_xmp_writer_remove_all_schemas(cast(GstTagXmpWriter*)this._cPtr);
  }

  /**
      Removes a schema from the list of schemas to use. Nothing is done if
      the schema wasn't in the list
  
      Params:
        schema = the schema to remove
  */
  override void removeSchema(string schema) nothrow
  {
    const(char)* _schema = schema.toCString!(No.Malloc, No.Nullable);
    gst_tag_xmp_writer_remove_schema(cast(GstTagXmpWriter*)this._cPtr, _schema);
  }

  /** */
  override gid.gst1.buffer.Buffer tagListToXmpBuffer(gid.gst1.tag_list.TagList taglist, bool readOnly) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_tag_xmp_writer_tag_list_to_xmp_buffer(cast(GstTagXmpWriter*)this._cPtr, taglist ? cast(const(GstTagList)*)taglist._cPtr(No.Dup) : null, readOnly);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gsttag1.tag_xmp_writer.TagXmpWriter]
template TagXmpWriterGidBuilderT()
{
}
