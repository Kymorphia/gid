/// Module for [Stream] class
module gst.stream;

import gid.gid;
import gobject.gid_builder;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.object;
import gst.tag_list;
import gst.types;

/**
    A high-level object representing a single stream. It might be backed, or
    not, by an actual flow of data in a pipeline (#GstPad).
    
    A #GstStream does not care about data changes (such as decoding, encoding,
    parsing,...) as long as the underlying data flow corresponds to the same
    high-level flow (ex: a certain audio track).
    
    A #GstStream contains all the information pertinent to a stream, such as
    stream-id, tags, caps, type, ...
    
    Elements can subclass a #GstStream for internal usage (to contain information
    pertinent to streams of data).
*/
class Stream : gst.object.ObjectWrap
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
    return cast(void function())gst_stream_get_type != &gidSymbolNotFound ? gst_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Stream self()
  {
    return this;
  }

  /**
      Get builder for [gst.stream.Stream]
      Returns: New builder object
  */
  static StreamGidBuilder builder()
  {
    return new StreamGidBuilder;
  }

  /**
      Get `caps` property.
      Returns: The #GstCaps of the #GstStream.
  */
  @property gst.caps.Caps caps()
  {
    return getCaps();
  }

  /**
      Set `caps` property.
      Params:
        propval = The #GstCaps of the #GstStream.
  */
  @property void caps(gst.caps.Caps propval)
  {
    setCaps(propval);
  }

  /** */
  @property gst.types.StreamFlags streamFlags()
  {
    return getStreamFlags();
  }

  /** */
  @property void streamFlags(gst.types.StreamFlags propval)
  {
    setStreamFlags(propval);
  }

  /**
      Get `streamId` property.
      Returns: The unique identifier of the #GstStream. Can only be set at construction
        time.
  */
  @property string streamId()
  {
    return getStreamId();
  }

  /**
      Get `streamType` property.
      Returns: The #GstStreamType of the #GstStream. Can only be set at construction time.
  */
  @property gst.types.StreamType streamType()
  {
    return getStreamType();
  }

  /**
      Set `streamType` property.
      Params:
        propval = The #GstStreamType of the #GstStream. Can only be set at construction time.
  */
  @property void streamType(gst.types.StreamType propval)
  {
    setStreamType(propval);
  }

  /**
      Get `tags` property.
      Returns: The #GstTagList of the #GstStream.
  */
  @property gst.tag_list.TagList tags()
  {
    return getTags();
  }

  /**
      Set `tags` property.
      Params:
        propval = The #GstTagList of the #GstStream.
  */
  @property void tags(gst.tag_list.TagList propval)
  {
    setTags(propval);
  }

  /**
      Create a new #GstStream for the given stream_id, caps, type
      and flags
  
      Params:
        streamId = the id for the new stream. If null,
          a new one will be automatically generated
        caps = the #GstCaps of the stream
        type = the #GstStreamType of the stream
        flags = the #GstStreamFlags of the stream
      Returns: The new #GstStream
  */
  this(string streamId, gst.caps.Caps caps, gst.types.StreamType type, gst.types.StreamFlags flags)
  {
    GstStream* _cretval;
    const(char)* _streamId = streamId.toCString(No.Alloc);
    _cretval = gst_stream_new(_streamId, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, type, flags);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieve the caps for stream, if any
      Returns: The #GstCaps for stream
  */
  gst.caps.Caps getCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_stream_get_caps(cast(GstStream*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieve the current stream flags for stream
      Returns: The #GstStreamFlags for stream
  */
  gst.types.StreamFlags getStreamFlags()
  {
    GstStreamFlags _cretval;
    _cretval = gst_stream_get_stream_flags(cast(GstStream*)this._cPtr);
    gst.types.StreamFlags _retval = cast(gst.types.StreamFlags)_cretval;
    return _retval;
  }

  /**
      Returns the stream ID of stream.
      Returns: the stream ID of stream. Only valid
        during the lifetime of stream.
  */
  string getStreamId()
  {
    const(char)* _cretval;
    _cretval = gst_stream_get_stream_id(cast(GstStream*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieve the stream type for stream
      Returns: The #GstStreamType for stream
  */
  gst.types.StreamType getStreamType()
  {
    GstStreamType _cretval;
    _cretval = gst_stream_get_stream_type(cast(GstStream*)this._cPtr);
    gst.types.StreamType _retval = cast(gst.types.StreamType)_cretval;
    return _retval;
  }

  /**
      Retrieve the tags for stream, if any
      Returns: The #GstTagList for stream
  */
  gst.tag_list.TagList getTags()
  {
    GstTagList* _cretval;
    _cretval = gst_stream_get_tags(cast(GstStream*)this._cPtr);
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Set the caps for the #GstStream
  
      Params:
        caps = a #GstCaps
  */
  void setCaps(gst.caps.Caps caps = null)
  {
    gst_stream_set_caps(cast(GstStream*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  }

  /**
      Set the flags for the stream.
  
      Params:
        flags = the flags to set on stream
  */
  void setStreamFlags(gst.types.StreamFlags flags)
  {
    gst_stream_set_stream_flags(cast(GstStream*)this._cPtr, flags);
  }

  /**
      Set the stream type of stream
  
      Params:
        streamType = the type to set on stream
  */
  void setStreamType(gst.types.StreamType streamType)
  {
    gst_stream_set_stream_type(cast(GstStream*)this._cPtr, streamType);
  }

  /**
      Set the tags for the #GstStream
  
      Params:
        tags = a #GstTagList
  */
  void setTags(gst.tag_list.TagList tags = null)
  {
    gst_stream_set_tags(cast(GstStream*)this._cPtr, tags ? cast(GstTagList*)tags._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gst.stream.Stream]
class StreamGidBuilderImpl(T) : gst.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `caps` property.
      Params:
        propval = The #GstCaps of the #GstStream.
      Returns: Builder instance for fluent chaining
  */
  T caps(gst.caps.Caps propval)
  {
    return setProperty("caps", propval);
  }

  /** */
  T streamFlags(gst.types.StreamFlags propval)
  {
    return setProperty("stream-flags", propval);
  }

  /**
      Set `streamId` property.
      Params:
        propval = The unique identifier of the #GstStream. Can only be set at construction
          time.
      Returns: Builder instance for fluent chaining
  */
  T streamId(string propval)
  {
    return setProperty("stream-id", propval);
  }

  /**
      Set `streamType` property.
      Params:
        propval = The #GstStreamType of the #GstStream. Can only be set at construction time.
      Returns: Builder instance for fluent chaining
  */
  T streamType(gst.types.StreamType propval)
  {
    return setProperty("stream-type", propval);
  }

  /**
      Set `tags` property.
      Params:
        propval = The #GstTagList of the #GstStream.
      Returns: Builder instance for fluent chaining
  */
  T tags(gst.tag_list.TagList propval)
  {
    return setProperty("tags", propval);
  }
}

/// Fluent builder for [gst.stream.Stream]
final class StreamGidBuilder : StreamGidBuilderImpl!StreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Stream build()
  {
    return new Stream(cast(void*)createGObject(Stream._getGType), Yes.Take);
  }
}
