/// Module for [FilterYenc] class
module gmime.filter_yenc;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter for yEncoding or yDecoding a stream.
*/
class FilterYenc : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_yenc_get_type != &gidSymbolNotFound ? g_mime_filter_yenc_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterYenc self()
  {
    return this;
  }

  /**
      Creates a new yEnc filter.
  
      Params:
        encode = encode vs decode
      Returns: a new yEnc filter.
  */
  this(bool encode)
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_yenc_new(encode);
    this(_cretval, Yes.Take);
  }

  /**
      Get the computed crc or (guint32) -1 on fail.
      Returns: the computed crc or (guint32) -1 on fail.
  */
  uint getCrc()
  {
    uint _retval;
    _retval = g_mime_filter_yenc_get_crc(cast(GMimeFilterYenc*)this._cPtr);
    return _retval;
  }

  /**
      Get the computed part crc or (guint32) -1 on fail.
      Returns: the computed part crc or (guint32) -1 on fail.
  */
  uint getPcrc()
  {
    uint _retval;
    _retval = g_mime_filter_yenc_get_pcrc(cast(GMimeFilterYenc*)this._cPtr);
    return _retval;
  }

  /**
      Sets the current crc32 value on the yEnc filter yenc to crc.
  
      Params:
        crc = crc32
  */
  void setCrc(uint crc)
  {
    g_mime_filter_yenc_set_crc(cast(GMimeFilterYenc*)this._cPtr, crc);
  }

  /**
      Sets the current state of the yencoder/ydecoder
  
      Params:
        state = encode/decode state
  */
  void setState(int state)
  {
    g_mime_filter_yenc_set_state(cast(GMimeFilterYenc*)this._cPtr, state);
  }
}
