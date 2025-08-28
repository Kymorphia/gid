/// Module for [OpenPGPMarker] class
module gmime.open_pgpmarker;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.types;

/**
    An OpenPGP marker for use with GMime's internal state machines used for detecting OpenPGP blocks.
*/
class OpenPGPMarker
{
  GMimeOpenPGPMarker cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gmime.open_pgpmarker.OpenPGPMarker");

    cInstance = *cast(GMimeOpenPGPMarker*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `marker` field.
      Returns: The OpenPGP marker.
  */
  @property string marker()
  {
    return cToD!(string)(cast(void*)(cast(GMimeOpenPGPMarker*)this._cPtr).marker);
  }

  /**
      Set `marker` field.
      Params:
        propval = The OpenPGP marker.
  */
  @property void marker(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GMimeOpenPGPMarker*)this._cPtr).marker);
    dToC(propval, cast(void*)&(cast(GMimeOpenPGPMarker*)this._cPtr).marker);
  }

  /**
      Get `len` field.
      Returns: The length of the OpenPGP marker.
  */
  @property size_t len()
  {
    return (cast(GMimeOpenPGPMarker*)this._cPtr).len;
  }

  /**
      Set `len` field.
      Params:
        propval = The length of the OpenPGP marker.
  */
  @property void len(size_t propval)
  {
    (cast(GMimeOpenPGPMarker*)this._cPtr).len = propval;
  }

  /**
      Get `before` field.
      Returns: The #GMimeOpenPGPState that the state machine must be in before encountering this marker.
  */
  @property gmime.types.OpenPGPState before()
  {
    return cast(gmime.types.OpenPGPState)(cast(GMimeOpenPGPMarker*)this._cPtr).before;
  }

  /**
      Set `before` field.
      Params:
        propval = The #GMimeOpenPGPState that the state machine must be in before encountering this marker.
  */
  @property void before(gmime.types.OpenPGPState propval)
  {
    (cast(GMimeOpenPGPMarker*)this._cPtr).before = cast(GMimeOpenPGPState)propval;
  }

  /**
      Get `after` field.
      Returns: The #GMimeOpenPGPState that the state machine will transition into once this marker is found.
  */
  @property gmime.types.OpenPGPState after()
  {
    return cast(gmime.types.OpenPGPState)(cast(GMimeOpenPGPMarker*)this._cPtr).after;
  }

  /**
      Set `after` field.
      Params:
        propval = The #GMimeOpenPGPState that the state machine will transition into once this marker is found.
  */
  @property void after(gmime.types.OpenPGPState propval)
  {
    (cast(GMimeOpenPGPMarker*)this._cPtr).after = cast(GMimeOpenPGPState)propval;
  }

  /**
      Get `isEndMarker` field.
      Returns: true if the marker is an end marker; otherwise, false.
  */
  @property bool isEndMarker()
  {
    return (cast(GMimeOpenPGPMarker*)this._cPtr).isEndMarker;
  }

  /**
      Set `isEndMarker` field.
      Params:
        propval = true if the marker is an end marker; otherwise, false.
  */
  @property void isEndMarker(bool propval)
  {
    (cast(GMimeOpenPGPMarker*)this._cPtr).isEndMarker = propval;
  }
}
