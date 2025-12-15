/// Module for [AncillaryMeta] class
module gstvideo.ancillary_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    #GstMeta for carrying SMPTE-291M Ancillary data. Note that all the ADF fields
       (@DID to @checksum) are 10bit values with parity/non-parity high-bits set.
*/
class AncillaryMeta
{
  GstAncillaryMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.ancillary_meta.AncillaryMeta");

    cInstance = *cast(GstAncillaryMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `meta` field.
      Returns: Parent #GstMeta
  */
  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAncillaryMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `field` field.
      Returns: The field where the ancillary data is located
  */
  @property gstvideo.types.AncillaryMetaField field()
  {
    return cast(gstvideo.types.AncillaryMetaField)(cast(GstAncillaryMeta*)this._cPtr).field;
  }

  /**
      Set `field` field.
      Params:
        propval = The field where the ancillary data is located
  */
  @property void field(gstvideo.types.AncillaryMetaField propval)
  {
    (cast(GstAncillaryMeta*)this._cPtr).field = cast(GstAncillaryMetaField)propval;
  }

  /**
      Get `cNotYChannel` field.
      Returns: Which channel (luminance or chrominance) the ancillary
         data is located. 0 if content is SD or stored in the luminance channel
         (default). 1 if HD and stored in the chrominance channel.
  */
  @property bool cNotYChannel()
  {
    return cast(bool)(cast(GstAncillaryMeta*)this._cPtr).cNotYChannel;
  }

  /**
      Set `cNotYChannel` field.
      Params:
        propval = Which channel (luminance or chrominance) the ancillary
           data is located. 0 if content is SD or stored in the luminance channel
           (default). 1 if HD and stored in the chrominance channel.
  */
  @property void cNotYChannel(bool propval)
  {
    (cast(GstAncillaryMeta*)this._cPtr).cNotYChannel = propval;
  }

  /**
      Get `line` field.
      Returns: The line on which the ancillary data is located (max 11bit). There
         are two special values: 0x7ff if no line is specified (default), 0x7fe
         to specify the ancillary data is on any valid line before active video
  */
  @property ushort line()
  {
    return (cast(GstAncillaryMeta*)this._cPtr).line;
  }

  /**
      Set `line` field.
      Params:
        propval = The line on which the ancillary data is located (max 11bit). There
           are two special values: 0x7ff if no line is specified (default), 0x7fe
           to specify the ancillary data is on any valid line before active video
  */
  @property void line(ushort propval)
  {
    (cast(GstAncillaryMeta*)this._cPtr).line = propval;
  }

  /**
      Get `offset` field.
      Returns: The location of the ancillary data packet in a SDI raster relative
         to the start of active video (max 12bits). A value of 0 means the ADF of
         the ancillary packet starts immediately following SAV. There are 3
         special values: 0xfff: No specified location (default), 0xffe: within
         HANC data space, 0xffd: within the ancillary data space located between
         SAV and EAV
  */
  @property ushort offset()
  {
    return (cast(GstAncillaryMeta*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = The location of the ancillary data packet in a SDI raster relative
           to the start of active video (max 12bits). A value of 0 means the ADF of
           the ancillary packet starts immediately following SAV. There are 3
           special values: 0xfff: No specified location (default), 0xffe: within
           HANC data space, 0xffd: within the ancillary data space located between
           SAV and EAV
  */
  @property void offset(ushort propval)
  {
    (cast(GstAncillaryMeta*)this._cPtr).offset = propval;
  }

  /**
      Get `DID` field.
      Returns: Data Identified
  */
  @property ushort DID()
  {
    return (cast(GstAncillaryMeta*)this._cPtr).DID;
  }

  /**
      Set `DID` field.
      Params:
        propval = Data Identified
  */
  @property void DID(ushort propval)
  {
    (cast(GstAncillaryMeta*)this._cPtr).DID = propval;
  }

  /**
      Get `SDIDBlockNumber` field.
      Returns: Secondary Data identification (if type 2) or Data block
         number (if type 1)
  */
  @property ushort SDIDBlockNumber()
  {
    return (cast(GstAncillaryMeta*)this._cPtr).SDIDBlockNumber;
  }

  /**
      Set `SDIDBlockNumber` field.
      Params:
        propval = Secondary Data identification (if type 2) or Data block
           number (if type 1)
  */
  @property void SDIDBlockNumber(ushort propval)
  {
    (cast(GstAncillaryMeta*)this._cPtr).SDIDBlockNumber = propval;
  }

  /**
      Get `dataCount` field.
      Returns: The amount of user data
  */
  @property ushort dataCount()
  {
    return (cast(GstAncillaryMeta*)this._cPtr).dataCount;
  }

  /**
      Set `dataCount` field.
      Params:
        propval = The amount of user data
  */
  @property void dataCount(ushort propval)
  {
    (cast(GstAncillaryMeta*)this._cPtr).dataCount = propval;
  }

  /**
      Get `checksum` field.
      Returns: The checksum of the ADF
  */
  @property ushort checksum()
  {
    return (cast(GstAncillaryMeta*)this._cPtr).checksum;
  }

  /**
      Set `checksum` field.
      Params:
        propval = The checksum of the ADF
  */
  @property void checksum(ushort propval)
  {
    (cast(GstAncillaryMeta*)this._cPtr).checksum = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_ancillary_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval, No.Take) : null;
    return _retval;
  }
}
