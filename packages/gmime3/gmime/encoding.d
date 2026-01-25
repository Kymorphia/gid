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
        outbuf = an output buffer
      Returns: the number of bytes written to outbuf.
  */
  size_t flush(string inbuf, ref char[] outbuf)
  {
    size_t _retval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(char)*)inbuf.ptr;
    _retval = g_mime_encoding_flush(cast(GMimeEncoding*)&this, _inbuf, _inlen, outbuf.ptr);
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
        outbuf = an output buffer
      Returns: the number of bytes written to outbuf.
  */
  size_t step(string inbuf, ref char[] outbuf)
  {
    size_t _retval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(char)*)inbuf.ptr;
    _retval = g_mime_encoding_step(cast(GMimeEncoding*)&this, _inbuf, _inlen, outbuf.ptr);
    return _retval;
  }

  /**
      Decodes a chunk of base64 encoded data.
  
      Params:
        inbuf = input buffer
        outbuf = output buffer
        state = holds the number of bits that are stored in save
        save = leftover bits that have not yet been decoded
      Returns: the number of bytes decoded (which have been dumped in
        outbuf).
  */
  static size_t base64DecodeStep(ubyte[] inbuf, ref ubyte[] outbuf, ref int state, ref uint save)
  {
    size_t _retval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
    _retval = g_mime_encoding_base64_decode_step(_inbuf, _inlen, outbuf.ptr, cast(int*)&state, cast(uint*)&save);
    return _retval;
  }

  /**
      Base64 encodes the input stream to the output stream. Call this
      when finished encoding data with [gmime.encoding.Encoding.base64EncodeStep]
      to flush off the last little bit.
  
      Params:
        inbuf = input buffer
        outbuf = output buffer
        state = holds the number of bits that are stored in save
        save = leftover bits that have not yet been encoded
      Returns: the number of bytes encoded.
  */
  static size_t base64EncodeClose(ubyte[] inbuf, ref ubyte[] outbuf, ref int state, ref uint save)
  {
    size_t _retval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
    _retval = g_mime_encoding_base64_encode_close(_inbuf, _inlen, outbuf.ptr, cast(int*)&state, cast(uint*)&save);
    return _retval;
  }

  /**
      Base64 encodes a chunk of data. Performs an 'encode step', only
      encodes blocks of 3 characters to the output at a time, saves
      left-over state in state and save (initialise to 0 on first
      invocation).
  
      Params:
        inbuf = input buffer
        outbuf = output buffer
        state = holds the number of bits that are stored in save
        save = leftover bits that have not yet been encoded
      Returns: the number of bytes encoded.
  */
  static size_t base64EncodeStep(ubyte[] inbuf, ref ubyte[] outbuf, ref int state, ref uint save)
  {
    size_t _retval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
    _retval = g_mime_encoding_base64_encode_step(_inbuf, _inlen, outbuf.ptr, cast(int*)&state, cast(uint*)&save);
    return _retval;
  }

  /**
      Decodes a block of quoted-printable encoded data. Performs a
      'decode step' on a chunk of QP encoded data.
  
      Params:
        inbuf = input buffer
        outbuf = output buffer
        state = holds the number of bits that are stored in save
        save = leftover bits that have not yet been decoded
      Returns: the number of bytes decoded.
  */
  static size_t quotedDecodeStep(ubyte[] inbuf, ref ubyte[] outbuf, ref int state, ref uint save)
  {
    size_t _retval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
    _retval = g_mime_encoding_quoted_decode_step(_inbuf, _inlen, outbuf.ptr, cast(int*)&state, cast(uint*)&save);
    return _retval;
  }

  /**
      Quoted-printable encodes a block of text. Call this when finished
      encoding data with [gmime.encoding.Encoding.quotedEncodeStep] to flush off
      the last little bit.
  
      Params:
        inbuf = input buffer
        outbuf = output buffer
        state = holds the number of bits that are stored in save
        save = leftover bits that have not yet been encoded
      Returns: the number of bytes encoded.
  */
  static size_t quotedEncodeClose(ubyte[] inbuf, ref ubyte[] outbuf, ref int state, ref uint save)
  {
    size_t _retval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
    _retval = g_mime_encoding_quoted_encode_close(_inbuf, _inlen, outbuf.ptr, cast(int*)&state, cast(uint*)&save);
    return _retval;
  }

  /**
      Quoted-printable encodes a block of text. Performs an 'encode
      step', saves left-over state in state and save (initialise to -1 on
      first invocation).
  
      Params:
        inbuf = input buffer
        outbuf = output buffer
        state = holds the number of bits that are stored in save
        save = leftover bits that have not yet been encoded
      Returns: the number of bytes encoded.
  */
  static size_t quotedEncodeStep(ubyte[] inbuf, ref ubyte[] outbuf, ref int state, ref uint save)
  {
    size_t _retval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
    _retval = g_mime_encoding_quoted_encode_step(_inbuf, _inlen, outbuf.ptr, cast(int*)&state, cast(uint*)&save);
    return _retval;
  }

  /**
      Uudecodes a chunk of data. Performs a 'decode step' on a chunk of
      uuencoded data. Assumes the "begin mode filename" line has
      been stripped off.
  
      Params:
        inbuf = input buffer
        outbuf = output buffer
        state = holds the number of bits that are stored in save
        save = leftover bits that have not yet been decoded
      Returns: the number of bytes decoded.
  */
  static size_t uudecodeStep(ubyte[] inbuf, ref ubyte[] outbuf, ref int state, ref uint save)
  {
    size_t _retval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
    _retval = g_mime_encoding_uudecode_step(_inbuf, _inlen, outbuf.ptr, cast(int*)&state, cast(uint*)&save);
    return _retval;
  }

  /**
      Uuencodes a chunk of data. Call this when finished encoding data
      with [gmime.encoding.Encoding.uuencodeStep] to flush off the last little bit.
  
      Params:
        inbuf = input buffer
        outbuf = output buffer
        uubuf = temporary buffer of 60 bytes
        state = holds the number of bits that are stored in save
        save = leftover bits that have not yet been encoded
      Returns: the number of bytes encoded.
  */
  static size_t uuencodeClose(ubyte[] inbuf, ref ubyte[] outbuf, ref ubyte[] uubuf, ref int state, ref uint save)
  {
    size_t _retval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
    _retval = g_mime_encoding_uuencode_close(_inbuf, _inlen, outbuf.ptr, uubuf.ptr, cast(int*)&state, cast(uint*)&save);
    return _retval;
  }

  /**
      Uuencodes a chunk of data. Performs an 'encode step', only encodes
      blocks of 45 characters to the output at a time, saves left-over
      state in uubuf, state and save (initialize to 0 on first
      invocation).
  
      Params:
        inbuf = input buffer
        outbuf = output stream
        uubuf = temporary buffer of 60 bytes
        state = holds the number of bits that are stored in save
        save = leftover bits that have not yet been encoded
      Returns: the number of bytes encoded.
  */
  static size_t uuencodeStep(ubyte[] inbuf, ref ubyte[] outbuf, ref ubyte[] uubuf, ref int state, ref uint save)
  {
    size_t _retval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
    _retval = g_mime_encoding_uuencode_step(_inbuf, _inlen, outbuf.ptr, uubuf.ptr, cast(int*)&state, cast(uint*)&save);
    return _retval;
  }
}
