/// Module for [TagXmpWriter] interface mixin
module gsttag.tag_xmp_writer_mixin;

public import gsttag.tag_xmp_writer_iface_proxy;
public import gid.gid;
public import gst.buffer;
public import gst.tag_list;
public import gsttag.c.functions;
public import gsttag.c.types;
public import gsttag.types;

/**
    This interface is implemented by elements that are able to do XMP serialization. Examples for
    such elements are #jifmux and #qtmux.
    
    Applications can use this interface to configure which XMP schemas should be used when serializing
    tags into XMP. Schemas are represented by their names, a full list of the supported schemas can be
    obtained from [gsttag.global.tagXmpListSchemas]. By default, all schemas are used.
*/
template TagXmpWriterT()
{

  /**
      Adds all available XMP schemas to the configuration. Meaning that
      all will be used.
  */
  override void addAllSchemas()
  {
    gst_tag_xmp_writer_add_all_schemas(cast(GstTagXmpWriter*)this._cPtr);
  }

  /**
      Adds schema to the list schemas
  
      Params:
        schema = the schema to be added
  */
  override void addSchema(string schema)
  {
    const(char)* _schema = schema.toCString(No.Alloc);
    gst_tag_xmp_writer_add_schema(cast(GstTagXmpWriter*)this._cPtr, _schema);
  }

  /**
      Checks if schema is going to be used
  
      Params:
        schema = the schema to test
      Returns: true if it is going to be used
  */
  override bool hasSchema(string schema)
  {
    bool _retval;
    const(char)* _schema = schema.toCString(No.Alloc);
    _retval = cast(bool)gst_tag_xmp_writer_has_schema(cast(GstTagXmpWriter*)this._cPtr, _schema);
    return _retval;
  }

  /**
      Removes all schemas from the list of schemas to use. Meaning that no
      XMP will be generated.
  */
  override void removeAllSchemas()
  {
    gst_tag_xmp_writer_remove_all_schemas(cast(GstTagXmpWriter*)this._cPtr);
  }

  /**
      Removes a schema from the list of schemas to use. Nothing is done if
      the schema wasn't in the list
  
      Params:
        schema = the schema to remove
  */
  override void removeSchema(string schema)
  {
    const(char)* _schema = schema.toCString(No.Alloc);
    gst_tag_xmp_writer_remove_schema(cast(GstTagXmpWriter*)this._cPtr, _schema);
  }

  /** */
  override gst.buffer.Buffer tagListToXmpBuffer(gst.tag_list.TagList taglist, bool readOnly)
  {
    GstBuffer* _cretval;
    _cretval = gst_tag_xmp_writer_tag_list_to_xmp_buffer(cast(GstTagXmpWriter*)this._cPtr, taglist ? cast(const(GstTagList)*)taglist._cPtr(No.Dup) : null, readOnly);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
