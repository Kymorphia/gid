/// Module for [Stream] class
module gid.gst1.stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.caps;
import gid.gst1.object;
import gid.gst1.tag_list;
import gid.gst1.types;

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
class Stream : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_stream_get_type != &gidSymbolNotFound ? gst_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override Stream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.stream.Stream]
      Returns: New builder object
  */
  static StreamGidBuilder builder() nothrow
  {
    return new StreamGidBuilder;
  }

  /**
      Get `caps` property.
      Returns: The #GstCaps of the #GstStream.
  */
  @property gid.gst1.caps.Caps caps() nothrow
  {
    return getCaps();
  }

  /**
      Set `caps` property.
      Params:
        propval = The #GstCaps of the #GstStream.
  */
  @property void caps(gid.gst1.caps.Caps propval) nothrow
  {
    setCaps(propval);
  }

  /** */
  @property gid.gst1.types.StreamFlags streamFlags() nothrow
  {
    return getStreamFlags();
  }

  /** */
  @property void streamFlags(gid.gst1.types.StreamFlags propval) nothrow
  {
    setStreamFlags(propval);
  }

  /**
      Get `streamId` property.
      Returns: The unique identifier of the #GstStream. Can only be set at construction
        time.
  */
  @property string streamId() nothrow
  {
    return getStreamId();
  }

  /**
      Get `streamType` property.
      Returns: The #GstStreamType of the #GstStream. Can only be set at construction time.
  */
  @property gid.gst1.types.StreamType streamType() nothrow
  {
    return getStreamType();
  }

  /**
      Set `streamType` property.
      Params:
        propval = The #GstStreamType of the #GstStream. Can only be set at construction time.
  */
  @property void streamType(gid.gst1.types.StreamType propval) nothrow
  {
    setStreamType(propval);
  }

  /**
      Get `tags` property.
      Returns: The #GstTagList of the #GstStream.
  */
  @property gid.gst1.tag_list.TagList tags() nothrow
  {
    return getTags();
  }

  /**
      Set `tags` property.
      Params:
        propval = The #GstTagList of the #GstStream.
  */
  @property void tags(gid.gst1.tag_list.TagList propval) nothrow
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
  this(string streamId, gid.gst1.caps.Caps caps, gid.gst1.types.StreamType type, gid.gst1.types.StreamFlags flags) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstStream* _cretval;
      const(char)* _streamId = streamId.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gst_stream_new(_streamId, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, type, flags);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Retrieve the caps for stream, if any
      Returns: The #GstCaps for stream
  */
  gid.gst1.caps.Caps getCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_stream_get_caps(cast(GstStream*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieve the current stream flags for stream
      Returns: The #GstStreamFlags for stream
  */
  gid.gst1.types.StreamFlags getStreamFlags() nothrow
  {
    GstStreamFlags _cretval;
    _cretval = gst_stream_get_stream_flags(cast(GstStream*)this._cPtr);
    gid.gst1.types.StreamFlags _retval = cast(gid.gst1.types.StreamFlags)_cretval;
    return _retval;
  }

  /**
      Returns the stream ID of stream.
      Returns: the stream ID of stream. Only valid
        during the lifetime of stream.
  */
  string getStreamId() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_stream_get_stream_id(cast(GstStream*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieve the stream type for stream
      Returns: The #GstStreamType for stream
  */
  gid.gst1.types.StreamType getStreamType() nothrow
  {
    GstStreamType _cretval;
    _cretval = gst_stream_get_stream_type(cast(GstStream*)this._cPtr);
    gid.gst1.types.StreamType _retval = cast(gid.gst1.types.StreamType)_cretval;
    return _retval;
  }

  /**
      Retrieve the tags for stream, if any
      Returns: The #GstTagList for stream
  */
  gid.gst1.tag_list.TagList getTags() nothrow
  {
    GstTagList* _cretval;
    _cretval = gst_stream_get_tags(cast(GstStream*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Set the caps for the #GstStream
  
      Params:
        caps = a #GstCaps
  */
  void setCaps(gid.gst1.caps.Caps caps = null) nothrow
  {
    gst_stream_set_caps(cast(GstStream*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  }

  /**
      Set the flags for the stream.
  
      Params:
        flags = the flags to set on stream
  */
  void setStreamFlags(gid.gst1.types.StreamFlags flags) nothrow
  {
    gst_stream_set_stream_flags(cast(GstStream*)this._cPtr, flags);
  }

  /**
      Set the stream type of stream
  
      Params:
        streamType = the type to set on stream
  */
  void setStreamType(gid.gst1.types.StreamType streamType) nothrow
  {
    gst_stream_set_stream_type(cast(GstStream*)this._cPtr, streamType);
  }

  /**
      Set the tags for the #GstStream
  
      Params:
        tags = a #GstTagList
  */
  void setTags(gid.gst1.tag_list.TagList tags = null) nothrow
  {
    gst_stream_set_tags(cast(GstStream*)this._cPtr, tags ? cast(GstTagList*)tags._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gst1.stream.Stream]
class StreamGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `caps` property.
      Params:
        propval = The #GstCaps of the #GstStream.
      Returns: Builder instance for fluent chaining
  */
  T caps(gid.gst1.caps.Caps propval) nothrow
  {
    return setProperty("caps", propval);
  }

  /** */
  T streamFlags(gid.gst1.types.StreamFlags propval) nothrow
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
  T streamId(string propval) nothrow
  {
    return setProperty("stream-id", propval);
  }

  /**
      Set `streamType` property.
      Params:
        propval = The #GstStreamType of the #GstStream. Can only be set at construction time.
      Returns: Builder instance for fluent chaining
  */
  T streamType(gid.gst1.types.StreamType propval) nothrow
  {
    return setProperty("stream-type", propval);
  }

  /**
      Set `tags` property.
      Params:
        propval = The #GstTagList of the #GstStream.
      Returns: Builder instance for fluent chaining
  */
  T tags(gid.gst1.tag_list.TagList propval) nothrow
  {
    return setProperty("tags", propval);
  }
}

/// Fluent builder for [gid.gst1.stream.Stream]
final class StreamGidBuilder : StreamGidBuilderImpl!StreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Stream build() nothrow
  {
    return new Stream(cast(void*)createGObject(Stream._getGType), Yes.Take);
  }
}
