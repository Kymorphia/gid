/// Module for [Encoding] struct
module gmime.encoding;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.types;

/**
    A context used for encoding or decoding data.
*/
struct Encoding
{
  /**
      the type of encoding
  */
  ContentEncoding encoding;

  /**
      a temporary buffer needed when uuencoding data
  */
  ubyte[60] uubuf;

  /**
      true if encoding or false if decoding
  */
  gboolean encode;

  /**
      saved bytes from the previous step
  */
  uint save;

  /**
      current encder/decoder state
  */
  int state;

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
    _retval = g_mime_encoding_flush(cast(GMimeEncoding*)&this, _inbuf, inlen, _outbuf);
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
    g_mime_encoding_init_decode(cast(GMimeEncoding*)&this, encoding);
  }

  /**
      Initializes a #GMimeEncoding state machine for encoding to
      encoding.
  
      Params:
        encoding = a #GMimeContentEncoding to use
  */
  void initEncode(gmime.types.ContentEncoding encoding)
  {
    g_mime_encoding_init_encode(cast(GMimeEncoding*)&this, encoding);
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
    _retval = g_mime_encoding_outlen(cast(GMimeEncoding*)&this, inlen);
    return _retval;
  }

  /**
      Resets the state of the #GMimeEncoding.
  */
  void reset()
  {
    g_mime_encoding_reset(cast(GMimeEncoding*)&this);
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
    _retval = g_mime_encoding_step(cast(GMimeEncoding*)&this, _inbuf, inlen, _outbuf);
    return _retval;
  }
}
