/// Module for [Encoding] class
module gmime.encoding;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.types;

/**
    A context used for encoding or decoding data.
*/
class Encoding
{
  GMimeEncoding cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gmime.encoding.Encoding");

    cInstance = *cast(GMimeEncoding*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `encoding` field.
      Returns: the type of encoding
  */
  @property gmime.types.ContentEncoding encoding()
  {
    return cast(gmime.types.ContentEncoding)(cast(GMimeEncoding*)this._cPtr).encoding;
  }

  /**
      Set `encoding` field.
      Params:
        propval = the type of encoding
  */
  @property void encoding(gmime.types.ContentEncoding propval)
  {
    (cast(GMimeEncoding*)this._cPtr).encoding = cast(GMimeContentEncoding)propval;
  }

  /**
      Get `encode` field.
      Returns: true if encoding or false if decoding
  */
  @property bool encode()
  {
    return cast(bool)(cast(GMimeEncoding*)this._cPtr).encode;
  }

  /**
      Set `encode` field.
      Params:
        propval = true if encoding or false if decoding
  */
  @property void encode(bool propval)
  {
    (cast(GMimeEncoding*)this._cPtr).encode = propval;
  }

  /**
      Get `save` field.
      Returns: saved bytes from the previous step
  */
  @property uint save()
  {
    return (cast(GMimeEncoding*)this._cPtr).save;
  }

  /**
      Set `save` field.
      Params:
        propval = saved bytes from the previous step
  */
  @property void save(uint propval)
  {
    (cast(GMimeEncoding*)this._cPtr).save = propval;
  }

  /**
      Get `state` field.
      Returns: current encder/decoder state
  */
  @property int state()
  {
    return (cast(GMimeEncoding*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = current encder/decoder state
  */
  @property void state(int propval)
  {
    (cast(GMimeEncoding*)this._cPtr).state = propval;
  }

  /**
      Completes the incremental encode or decode of the input stream (see
      [gmime.encoding.Encoding.step] for details).
  
      Params:
        inbuf = an input buffer to encode or decode
        inlen = input buffer length
        outbuf = an output buffer
      Returns: the number of bytes written to outbuf.
  */
  size_t flush(string inbuf, size_t inlen, string outbuf)
  {
    size_t _retval;
    const(char)* _inbuf = inbuf.toCString(No.Alloc);
    char* _outbuf = outbuf.toCString(No.Alloc);
    _retval = g_mime_encoding_flush(cast(GMimeEncoding*)this._cPtr, _inbuf, inlen, _outbuf);
    return _retval;
  }

  /**
      Initializes a #GMimeEncoding state machine for decoding from
      encoding.
  
      Params:
        encoding = a #GMimeContentEncoding to use
  */
  void initDecode(gmime.types.ContentEncoding encoding)
  {
    g_mime_encoding_init_decode(cast(GMimeEncoding*)this._cPtr, encoding);
  }

  /**
      Initializes a #GMimeEncoding state machine for encoding to
      encoding.
  
      Params:
        encoding = a #GMimeContentEncoding to use
  */
  void initEncode(gmime.types.ContentEncoding encoding)
  {
    g_mime_encoding_init_encode(cast(GMimeEncoding*)this._cPtr, encoding);
  }

  /**
      Given the input length, inlen, calculate the needed output length
      to perform an encoding or decoding step.
  
      Params:
        inlen = an input length
      Returns: the maximum number of bytes needed to encode or decode a
        buffer of inlen bytes.
  */
  size_t outlen(size_t inlen)
  {
    size_t _retval;
    _retval = g_mime_encoding_outlen(cast(GMimeEncoding*)this._cPtr, inlen);
    return _retval;
  }

  /**
      Resets the state of the #GMimeEncoding.
  */
  void reset()
  {
    g_mime_encoding_reset(cast(GMimeEncoding*)this._cPtr);
  }

  /**
      Incrementally encodes or decodes (depending on state) an input
      stream by 'stepping' through a block of input at a time.
      
      You should make sure outbuf is large enough by calling
      [gmime.encoding.Encoding.outlen] to find out how large outbuf might need
      to be.
  
      Params:
        inbuf = an input buffer to encode or decode
        inlen = input buffer length
        outbuf = an output buffer
      Returns: the number of bytes written to outbuf.
  */
  size_t step(string inbuf, size_t inlen, string outbuf)
  {
    size_t _retval;
    const(char)* _inbuf = inbuf.toCString(No.Alloc);
    char* _outbuf = outbuf.toCString(No.Alloc);
    _retval = g_mime_encoding_step(cast(GMimeEncoding*)this._cPtr, _inbuf, inlen, _outbuf);
    return _retval;
  }
}
