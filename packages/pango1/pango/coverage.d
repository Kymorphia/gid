/// Module for [Coverage] class
module pango.coverage;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    A [pango.coverage.Coverage] structure is a map from Unicode characters
    to [pango.types.CoverageLevel] values.
    
    It is often necessary in Pango to determine if a particular
    font can represent a particular character, and also how well
    it can represent that character. The [pango.coverage.Coverage] is a data
    structure that is used to represent that information. It is an
    opaque structure with no public fields.
*/
class Coverage : gobject.object.ObjectWrap
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
    return cast(void function())pango_coverage_get_type != &gidSymbolNotFound ? pango_coverage_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Coverage self()
  {
    return this;
  }

  /**
  Get builder for [pango.coverage.Coverage]
  Returns: New builder object
  */
  static CoverageGidBuilder builder()
  {
    return new CoverageGidBuilder;
  }

  /**
      Create a new [pango.coverage.Coverage]
      Returns: the newly allocated [pango.coverage.Coverage], initialized
          to [pango.types.CoverageLevel.None] with a reference count of one, which
          should be freed with [pango.coverage.Coverage.unref].
  */
  this()
  {
    PangoCoverage* _cretval;
    _cretval = pango_coverage_new();
    this(_cretval, Yes.Take);
  }

  /**
      Convert data generated from [pango.coverage.Coverage.toBytes]
      back to a [pango.coverage.Coverage].
  
      Params:
        bytes = binary data
            representing a [pango.coverage.Coverage]
      Returns: a newly allocated [pango.coverage.Coverage]
  
      Deprecated: This returns null
  */
  static pango.coverage.Coverage fromBytes(ubyte[] bytes)
  {
    PangoCoverage* _cretval;
    int _nBytes;
    if (bytes)
      _nBytes = cast(int)bytes.length;

    auto _bytes = cast(ubyte*)bytes.ptr;
    _cretval = pango_coverage_from_bytes(_bytes, _nBytes);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.coverage.Coverage)(cast(PangoCoverage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Copy an existing [pango.coverage.Coverage].
      Returns: the newly allocated [pango.coverage.Coverage],
          with a reference count of one, which should be freed with
          [pango.coverage.Coverage.unref].
  */
  pango.coverage.Coverage copy()
  {
    PangoCoverage* _cretval;
    _cretval = pango_coverage_copy(cast(PangoCoverage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.coverage.Coverage)(cast(PangoCoverage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Determine whether a particular index is covered by coverage.
  
      Params:
        index = the index to check
      Returns: the coverage level of coverage for character index_.
  */
  pango.types.CoverageLevel get(int index)
  {
    PangoCoverageLevel _cretval;
    _cretval = pango_coverage_get(cast(PangoCoverage*)this._cPtr, index);
    pango.types.CoverageLevel _retval = cast(pango.types.CoverageLevel)_cretval;
    return _retval;
  }

  /**
      Set the coverage for each index in coverage to be the max (better)
      value of the current coverage for the index and the coverage for
      the corresponding index in other.
  
      Params:
        other = another [pango.coverage.Coverage]
  
      Deprecated: This function does nothing
  */
  void max(pango.coverage.Coverage other)
  {
    pango_coverage_max(cast(PangoCoverage*)this._cPtr, other ? cast(PangoCoverage*)other._cPtr(No.Dup) : null);
  }

  /**
      Modify a particular index within coverage
  
      Params:
        index = the index to modify
        level = the new level for index_
  */
  void set(int index, pango.types.CoverageLevel level)
  {
    pango_coverage_set(cast(PangoCoverage*)this._cPtr, index, level);
  }

  /**
      Convert a [pango.coverage.Coverage] structure into a flat binary format.
  
      Params:
        bytes = location to store result (must be freed with [glib.global.gfree])
  
      Deprecated: This returns null
  */
  void toBytes(out ubyte[] bytes)
  {
    int _nBytes;
    ubyte* _bytes;
    pango_coverage_to_bytes(cast(PangoCoverage*)this._cPtr, &_bytes, &_nBytes);
    bytes.length = _nBytes;
    bytes[0 .. $] = (cast(ubyte*)_bytes)[0 .. _nBytes];
    gFree(cast(void*)_bytes);
  }
}

class CoverageGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [pango.coverage.Coverage]
final class CoverageGidBuilder : CoverageGidBuilderImpl!CoverageGidBuilder
{
  Coverage build()
  {
    return new Coverage(cast(void*)createGObject(Coverage._getGType), Yes.Take);
  }
}
